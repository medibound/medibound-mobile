import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  List<BluetoothDeviceStruct> _ConnectedDevices = [];
  List<BluetoothDeviceStruct> get ConnectedDevices => _ConnectedDevices;
  set ConnectedDevices(List<BluetoothDeviceStruct> value) {
    _ConnectedDevices = value;
  }

  void addToConnectedDevices(BluetoothDeviceStruct value) {
    ConnectedDevices.add(value);
  }

  void removeFromConnectedDevices(BluetoothDeviceStruct value) {
    ConnectedDevices.remove(value);
  }

  void removeAtIndexFromConnectedDevices(int index) {
    ConnectedDevices.removeAt(index);
  }

  void updateConnectedDevicesAtIndex(
    int index,
    BluetoothDeviceStruct Function(BluetoothDeviceStruct) updateFn,
  ) {
    ConnectedDevices[index] = updateFn(_ConnectedDevices[index]);
  }

  void insertAtIndexInConnectedDevices(int index, BluetoothDeviceStruct value) {
    ConnectedDevices.insert(index, value);
  }
}
