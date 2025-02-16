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

import '/auth/firebase_auth/auth_util.dart';

Future<String> confirmKey(BluetoothDeviceStruct device) async {
  // Add your function code here!
  List<medibound_portal_hdztzw_backend.DeviceRecord>? verifySearchDevice;

  verifySearchDevice =
      await medibound_portal_hdztzw_backend.queryDeviceRecordOnce(
    queryBuilder: (deviceRecord) => deviceRecord
        .where(
          'owner',
          isEqualTo: currentUserReference,
        )
        .where(
          'storedId',
          isEqualTo: device?.id,
        ),
    limit: 1,
  );
  if (((verifySearchDevice).isNotEmpty) == true) {
    return verifySearchDevice.firstOrNull!.storedKey;
  }

  return 'NO_AUTH';
}
