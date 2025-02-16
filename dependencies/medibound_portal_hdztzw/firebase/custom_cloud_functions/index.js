const admin = require("firebase-admin/app");
admin.initializeApp();
    
const createDeviceKey = require('./create_device_key.js');
exports.createDeviceKey = createDeviceKey.createDeviceKey;
const unwrapDeviceKey = require('./unwrap_device_key.js');
exports.unwrapDeviceKey = unwrapDeviceKey.unwrapDeviceKey;
const analyzeRecord = require('./analyze_record.js');
exports.analyzeRecord = analyzeRecord.analyzeRecord;