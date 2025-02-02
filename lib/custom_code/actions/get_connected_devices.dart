// Automatic FlutterFlow imports
import '/backend/backend.dart';
import "package:medibound_portal_hdztzw/backend/backend.dart"
    as medibound_portal_hdztzw_backend;
import 'package:medibound_portal_hdztzw/backend/schema/structs/index.dart'
    as medibound_portal_hdztzw_data_schema;
import '/backend/schema/structs/index.dart';
import '/actions/actions.dart' as action_blocks;
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

import 'package:flutter_blue_plus/flutter_blue_plus.dart';

Future<List<BluetoothDeviceStruct>> getConnectedDevices(
    Future Function(BluetoothDeviceStruct device)? onCallback) async {
  // Add your function code here!
  List<BluetoothDevice> devicesConnected = FlutterBluePlus.connectedDevices;
  List<BluetoothDeviceStruct> devices = [];
  for (var d in devicesConnected) {
    devices.add(BluetoothDeviceStruct(
      name: d.advName,
      id: d.remoteId.str,
    ));
    if (onCallback != null) {
      onCallback(BluetoothDeviceStruct(
        name: d.advName,
        id: d.remoteId.str,
      ));
    }
  }
  return devices;
}
