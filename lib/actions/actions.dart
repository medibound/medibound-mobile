import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import "package:medibound_portal_hdztzw/backend/backend.dart"
    as medibound_portal_hdztzw_backend;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

Future<String> confirmKey(
  BuildContext context, {
  required BluetoothDeviceStruct? device,
}) async {
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
  if (((verifySearchDevice).isNotEmpty) ==
      true) {
    return verifySearchDevice.firstOrNull!.storedKey;
  }

  return 'NO_AUTH';
}
