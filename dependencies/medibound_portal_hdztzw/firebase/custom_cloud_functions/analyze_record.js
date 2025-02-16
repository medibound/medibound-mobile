const functions = require('firebase-functions');
const admin = require('firebase-admin');
// To avoid deployment errors, do not call admin.initializeApp() in your code



exports.analyzeRecord = functions.region('us-central1').
	runWith({
		memory: '128MB'
  }).https.onCall(
  (data, context) => {
		const data = data.data;
    // Write your code below!



    // Write your code above!
		return {};
  }
);