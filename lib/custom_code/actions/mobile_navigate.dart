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

import 'package:medibound_portal_hdztzw/custom_code/actions/index.dart';

Future mobileNavigate(
  BuildContext context,
  medibound_portal_hdztzw_data_schema.RouteStruct route,
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
