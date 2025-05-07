const admin = require("firebase-admin/app");
admin.initializeApp();
    
const createDeviceKey = require('./create_device_key.js');
exports.createDeviceKey = createDeviceKey.createDeviceKey;
const unwrapDeviceKey = require('./unwrap_device_key.js');
exports.unwrapDeviceKey = unwrapDeviceKey.unwrapDeviceKey;
const sendPatientInviteEmail = require('./send_patient_invite_email.js');
exports.sendPatientInviteEmail = sendPatientInviteEmail.sendPatientInviteEmail;