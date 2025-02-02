const admin = require("firebase-admin/app");
admin.initializeApp();

const checkKey = require("./check_key.js");
exports.checkKey = checkKey.checkKey;
const getKey = require("./get_key.js");
exports.getKey = getKey.getKey;
