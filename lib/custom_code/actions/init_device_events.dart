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

import 'dart:convert';

import 'package:flutter_blue_plus/flutter_blue_plus.dart';

Future initDeviceEvents() async {
  final BluetoothEvents events = BluetoothEvents();

  events.onConnectionStateChanged.listen((event) async {
    final List<BluetoothDeviceStruct> devices =
        FFAppState().ConnectedDevices ?? [];

    if (event.connectionState == BluetoothConnectionState.connected) {
      String key = await confirmKey(BluetoothDeviceStruct(
        name: event.device.advName,
        id: event.device.remoteId.str,
      ));

      if (key == "NO_AUTH") {
        await event.device.disconnect();
      } else {
        // Add device if connected
        devices.add(BluetoothDeviceStruct(
          name: event.device.advName,
          id: event.device.remoteId.str,
        ));
        // Discover services and characteristics
        List<BluetoothService> services = await event.device.discoverServices();
        for (var service in services) {
          //Medical Data
          if (service.uuid.str == "1840") {
            for (var characteristic in service.characteristics) {
              //Status
              if (characteristic.uuid.str == "2a3f") {
                for (var i = 0; i < devices.length; i++) {
                  if (devices[i].id == event.device.remoteId.str) {
                    devices[i].status =
                        String.fromCharCodes(await characteristic.read());
                    break; // Exit the loop once the device is found and updated
                  }
                }
                if (characteristic.isNotifying) {
                  await characteristic.setNotifyValue(true);
                }
              }
            }
          }
          //
        }
      }
    } else {
      // Remove device if disconnected
      devices.removeWhere((device) => device.id == event.device.remoteId.str);
    }

    FFAppState().update(() => FFAppState().ConnectedDevices = devices);
  });

  events.onCharacteristicReceived.listen((event) async {
    //Get Device Index
    final List<BluetoothDeviceStruct> devices =
        FFAppState().ConnectedDevices ?? [];
    int index = -1;
    for (var i = 0; i < devices.length; i++) {
      if (devices[i].id == event.device.remoteId.str) {
        index = i;
        break; // Exit the loop once the device is found and updated
      }
    }

    if (index != -1) {
      //Status
      if (event.characteristic.uuid.str == "2a3f") {
        String value = String.fromCharCodes(event.value);

        if (value == "WAITING") {
          String key = await confirmKey(devices[index]);
          if (key != "NO_AUTH") {
            print('already authenticated');
            await event.characteristic.write(utf8.encode(key));
          }
        }

        devices[index].status = value;
        FFAppState().update(
            () => FFAppState().ConnectedDevices[index] = devices[index]);
      }
    }
  });
}
