const admin = require("firebase-admin/app");
admin.initializeApp();
    
const catchMeCors = require('./catch_me_cors.js');
exports.catchMeCors = catchMeCors.catchMeCors;