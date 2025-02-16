// Automatic FlutterFlow imports
import '/backend/backend.dart';
import "package:medibound_portal_hdztzw/backend/backend.dart"
    as medibound_portal_hdztzw_backend;
import "package:medibound_portal_hdztzw/backend/schema/structs/index.dart"
    as medibound_portal_hdztzw_data_schema;
import '/backend/schema/structs/index.dart';
import "package:medibound_portal_hdztzw/backend/schema/structs/index.dart"
    as medibound_portal_hdztzw_data_schema;
import "package:medibound_portal_hdztzw/backend/schema/enums/enums.dart"
    as medibound_portal_hdztzw_enums;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter/services.dart';

Future fixDeviceOrientationUp() async {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
