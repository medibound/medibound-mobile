const admin = require("firebase-admin/app");
admin.initializeApp();

const checkKey = require("./check_key.js");
exports.checkKey = checkKey.checkKey;
