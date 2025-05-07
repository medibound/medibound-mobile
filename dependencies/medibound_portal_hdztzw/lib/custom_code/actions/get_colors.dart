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

import 'package:medibound_ui/medibound_ui.dart';

Future<void> getColors() async {
  List<CodedValueStruct> colorList = mBColors
      .map((e) => CodedValueStruct(
          display: e.display,
          description: e.description,
          code: e.code,
          color: e.color))
      .toList();

  FFAppState().Colors = colorList;

  FFAppState().update(() {});
}
