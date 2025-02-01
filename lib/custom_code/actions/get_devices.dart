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

Future<List<BluetoothDeviceStruct>> getDevices(
    Future Function(BluetoothDeviceStruct device)? onCallback) async {
  final List<BluetoothDeviceStruct> devices = [];

  final subscription = FlutterBluePlus.onScanResults.listen(
    (results) {
      // If there are any scan results

      if (results.isNotEmpty) {
        // Grab the most recent scan result
        final ScanResult r = results.last;
        final String remoteId = r.device.remoteId.str;
        final String deviceName = r.advertisementData.advName;

        final List<int>? manufacturerBytes =
            r.advertisementData.manufacturerData[0x4D42];

        // Convert to string if not null, otherwise use empty string or fallback
        final String deviceId = manufacturerBytes != null
            ? String.fromCharCodes(manufacturerBytes)
            : '';

        final bool alreadyExists = devices.any((d) => d.id == remoteId);
        if (!alreadyExists && deviceId != '') {
          // Create the struct only if the device is new
          final newDevice = BluetoothDeviceStruct(
            name: deviceName,
            id: remoteId,
            deviceId: deviceId,
          );

          // Add the new device to the list
          devices.add(newDevice);

          // If a callback is passed, invoke it with the new device
          if (onCallback != null) {
            onCallback(newDevice);
          }

          // Optional debug print
          print('$remoteId: "$deviceName" found!');
        }
      }
    },
    onError: (e) => print('Scan error: $e'),
  );

  // cleanup: cancel subscription when scanning stops
  FlutterBluePlus.cancelWhenScanComplete(subscription);

  // Wait for Bluetooth enabled & permission granted
  // In your real app you should use `FlutterBluePlus.adapterState.listen` to handle all states
  await FlutterBluePlus.adapterState
      .where((val) => val == BluetoothAdapterState.on)
      .first;

  // Start scanning w/ timeout
  // Optional: use `stopScan()` as an alternative to timeout
  await FlutterBluePlus.startScan(timeout: Duration(seconds: 5), withServices: [
    Guid("180A")
  ], withMsd: [
    MsdFilter(
      0x4D42,
    )
  ]);

  await FlutterBluePlus.isScanning.where((val) => val == false).first;
  // Add your function code here!
  return devices;
}
