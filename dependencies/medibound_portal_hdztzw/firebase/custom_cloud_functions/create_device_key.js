const functions = require('firebase-functions');
const admin = require('firebase-admin');
const { KeyManagementServiceClient } = require('@google-cloud/kms');
const crypto = require('crypto');

// Google Cloud KMS setup
const projectId = 'medibound-portal-hdztzw';
const locationId = 'global';
const keyRingId = 'medibound-keyring';
const keyId = 'device-encryption-key';

// Initialize the KMS client
const client = new KeyManagementServiceClient();
const keyName = client.cryptoKeyPath(projectId, locationId, keyRingId, keyId);

// AES-256 key generation function
async function generateAndWrapKey() {
  // 1. Generate a 256-bit (32-byte) AES key
  const aesKey = crypto.randomBytes(32);

  // 2. Encrypt (wrap) the key with KMS
  const [result] = await client.encrypt({
    name: keyName,
    plaintext: aesKey.toString('base64'),
  });

  return {
    wrappedKey: result.ciphertext.toString('base64'), // Encrypted key
    rawKey: aesKey.toString('base64'),                // Never expose this!
  };
}

exports.createDeviceKey = functions.region('us-central1').runWith({
		memory: '128MB'
  }).https.onCall(
  async (data, context) => {
    if (!context.auth.uid) {
      return;
    }

    const privateKeyInfo = await generateAndWrapKey();
    const publicKeyInfo = await generateAndWrapKey();


    return {
      "privateWrappedKey": privateKeyInfo.wrappedKey,
      "privateRawKey": privateKeyInfo.rawKey,
      "publicWrappedKey": publicKeyInfo.wrappedKey,
      "publicRawKey": publicKeyInfo.rawKey,
    };

  }
);