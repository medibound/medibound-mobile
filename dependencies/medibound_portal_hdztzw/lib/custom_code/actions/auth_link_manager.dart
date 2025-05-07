// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:firebase_auth/firebase_auth.dart';

Future<bool> authLinkManager(
  String oobCode,
  String mode,
  String? password,
) async {
  // Add your function code here!
  if (mode == 'resetPassword') {
    try {
      await FirebaseAuth.instance.confirmPasswordReset(
        code: oobCode,
        newPassword: password!,
      );
      print("Password has been reset successfully!");
      return true;
    } catch (e) {
      print("Error resetting password: $e");
      return false;
    }
  } else if (mode == "verifyEmail") {
    try {
      await FirebaseAuth.instance.applyActionCode(oobCode);
      print("Emailed has been verified successfully!");
      return true;
    } catch (e) {
      print("Error verifying email: $e");
      return false;
    }
  } else {
    return false;
  }
}
