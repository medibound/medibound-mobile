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

import 'dart:convert';

import 'package:flutter_blue_plus/flutter_blue_plus.dart';

Future<bool> writeDeviceCommand(
    BluetoothDeviceStruct device, String command) async {
  // Add your function code here!
  BluetoothCharacteristic characteristic = new BluetoothCharacteristic(
      remoteId: DeviceIdentifier(device.id),
      serviceUuid: Guid('1840'),
      characteristicUuid: Guid('2a3f'));

  await characteristic.write(utf8.encode(command));

  return true;
}
