// Automatic FlutterFlow imports
import '/backend/backend.dart';
import "package:medibound_portal_hdztzw/backend/backend.dart"
    as medibound_portal_hdztzw_backend;
import 'package:medibound_portal_hdztzw/backend/schema/structs/index.dart'
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

import 'package:flutter_blue_plus/flutter_blue_plus.dart';

Future initDeviceEvents() async {
  // Add your function code here!
  final BluetoothEvents events = BluetoothEvents();

  events.onConnectionStateChanged.listen((event) async {
    final List<BluetoothDeviceStruct> devices;

    if (FFAppState().ConnectedDevices != []) {
      devices = FFAppState().ConnectedDevices;

      if (event.connectionState == BluetoothConnectionState.connected) {
      } else {}
    } else {
      devices = await getConnectedDevices(null);
    }

    if (event.connectionState == BluetoothConnectionState.connected) {
      List<BluetoothService> services = await event.device.discoverServices();
    }

    FFAppState().update(() => FFAppState().ConnectedDevices = (devices ?? []));
  });
}
