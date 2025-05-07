const functions = require("firebase-functions");
const admin = require("firebase-admin");
admin.initializeApp();

exports.onUserDeleted = functions.region("us-central1").auth.user().onDelete(async (user) => {
  let firestore = admin.firestore();
  let userRef = firestore.doc('users/' + user.uid);
  await firestore.collection("messages").where("owner", "==", userRef).get().then(async (querySnapshot) => {
    for (var doc of querySnapshot.docs) {
            await doc.ref.collection("message").get().then(async (q) => {
        for (var d of q.docs) {
          console.log(`Deleting document ${d.id} from collection message`);
          await d.ref.delete();
        };
      });

    };
  });
  await firestore.collection("records").where("owner", "==", userRef).get().then(async (querySnapshot) => {
    for (var doc of querySnapshot.docs) {
            await doc.ref.collection("datapoints").get().then(async (q) => {
        for (var d of q.docs) {
          console.log(`Deleting document ${d.id} from collection datapoints`);
          await d.ref.delete();
        };
      });

    };
  });
  await firestore.collection("users").doc(user.uid).delete();
  await firestore.collection("organizations").where("owner", "==", userRef).get().then(async (querySnapshot) => {
    for (var doc of querySnapshot.docs) {
            console.log(`Deleting document ${doc.id} from collection organizations`);
      await doc.ref.delete();

    };
  });
  await firestore.collection("messages").where("members", "array-contains", userRef).get().then(async (querySnapshot) => {
    for (var doc of querySnapshot.docs) {
            console.log(`Deleting document ${doc.id} from collection messages`);
      await doc.ref.delete();

    };
  });
  await firestore.collection("records").where("owner", "==", userRef).get().then(async (querySnapshot) => {
    for (var doc of querySnapshot.docs) {
            console.log(`Deleting document ${doc.id} from collection records`);
      await doc.ref.delete();

    };
  });
});
