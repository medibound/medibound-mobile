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

Future navigate(
  BuildContext context,
  RouteStruct route,
  bool? disableUrl,
  Future Function()? componentUpdateCallback,
) async {
  if (disableUrl == null || !disableUrl) {
    await updateBrowserUrlPath(route);
  }

  FFAppState().update(() => FFAppState().currentRoute = route);

  if (componentUpdateCallback != null) {
    await componentUpdateCallback();
  }
}
