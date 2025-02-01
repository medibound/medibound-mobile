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

Future<bool> connectDevice(
  BluetoothDeviceStruct bTDevice,
  Future Function(BluetoothDeviceStruct device)? onDisconnectCallback,
  Future Function(String status, BluetoothDeviceStruct device)?
      onStatusUpdateCallback,
) async {
  BluetoothDevice device = BluetoothDevice.fromId(bTDevice.id);

  var subscription =
      device.connectionState.listen((BluetoothConnectionState state) async {
    if (state == BluetoothConnectionState.disconnected) {
      // 1. typically, start a periodic timer that tries to
      //    reconnect, or just call connect() again right now
      // 2. you must always re-discover services after disconnection!
      if (onDisconnectCallback != null) {
        onDisconnectCallback(bTDevice);
      }
      print(
          "${device.disconnectReason?.code} ${device.disconnectReason?.description}");
    }
  });

  device.cancelWhenDisconnected(subscription, delayed: true, next: true);

// Connect to the device
  await device.connect(autoConnect: true, mtu: null);

  await device.connectionState
      .where((val) => val == BluetoothConnectionState.connected)
      .first;

  /*services.forEach((service) {
    if (service?.uuid.str == "1840") {


    }
  });*/

  return device.isConnected;

  // Add your function code here!
}
