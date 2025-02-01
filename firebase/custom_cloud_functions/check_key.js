const functions = require("firebase-functions");
const admin = require("firebase-admin");
const { KeyManagementServiceClient } = require("@google-cloud/kms");

// Google Cloud KMS setup
const projectId = "medibound-portal-hdztzw";
const locationId = "global";
const keyRingId = "medibound-keyring";
const keyId = "device-encryption-key";

// Initialize the KMS client
const client = new KeyManagementServiceClient();
const keyName = client.cryptoKeyPath(projectId, locationId, keyRingId, keyId);

// Function to decrypt (unwrap) the AES key
async function unwrapKey(wrappedKey) {
  try {
    // Decrypt the wrapped key using Google KMS
    const [result] = await client.decrypt({
      name: keyName,
      ciphertext: Buffer.from(wrappedKey, "base64"),
    });

    // Return the decrypted key as a Base64 string
    const decryptedKey = result.plaintext.toString("base64");

    return decryptedKey;
  } catch (error) {
    console.error("Error decrypting key:", error);
    throw new functions.https.HttpsError("internal", "Key decryption failed");
  }
}

// Cloud Function to expose the unwrapping service
exports.checkKey = functions
  .region("us-central1")
  .runWith({
    memory: "128MB",
  })
  .https.onCall(async (data, context) => {
    const key = data.key;
    if (!context.auth.uid) {
      throw new functions.https.HttpsError(
        "unauthenticated",
        "User must be authenticated",
      );
    }

    const publicWrappedKey = data.publicWrappedKey;
    if (!publicWrappedKey) {
      throw new functions.https.HttpsError(
        "invalid-argument",
        "Public Wrapped key is required",
      );
    }

    const privateWrappedKey = data.privateWrappedKey;
    if (!privateWrappedKey) {
      throw new functions.https.HttpsError(
        "invalid-argument",
        "Private Wrapped key is required",
      );
    }

    try {
      const publicRawKey = await unwrapKey(publicWrappedKey);
      const privateRawKey = await unwrapKey(privateWrappedKey);

      console.log("Valid:", publicRawKey == key);
      console.log("Key 1:", key);
      console.log("Key 2:", publicRawKey); // Be cautious with logging keys in production
      if (publicRawKey == key) {
        return privateRawKey.toString();
      } else {
        return "";
      }
    } catch (error) {
      throw new functions.https.HttpsError(
        "internal",
        "Failed to unwrap device key",
      );
    }
  });
