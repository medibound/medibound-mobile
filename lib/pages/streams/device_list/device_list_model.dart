import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/utils/device_tile/device_tile_widget.dart';
import "package:medibound_portal_hdztzw/backend/backend.dart"
    as medibound_portal_hdztzw_backend;
import 'device_list_widget.dart' show DeviceListWidget;
import 'package:flutter/material.dart';

class DeviceListModel extends FlutterFlowModel<DeviceListWidget> {
  ///  Local state fields for this component.

  List<BluetoothDeviceStruct> scannedDevicesLive = [];
  void addToScannedDevicesLive(BluetoothDeviceStruct item) =>
      scannedDevicesLive.add(item);
  void removeFromScannedDevicesLive(BluetoothDeviceStruct item) =>
      scannedDevicesLive.remove(item);
  void removeAtIndexFromScannedDevicesLive(int index) =>
      scannedDevicesLive.removeAt(index);
  void insertAtIndexInScannedDevicesLive(
          int index, BluetoothDeviceStruct item) =>
      scannedDevicesLive.insert(index, item);
  void updateScannedDevicesLiveAtIndex(
          int index, Function(BluetoothDeviceStruct) updateFn) =>
      scannedDevicesLive[index] = updateFn(scannedDevicesLive[index]);

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Custom Action - getConnectedDevices] action in deviceList widget.
  List<BluetoothDeviceStruct>? connectedDevicesTemp;
  // Stores action output result for [Firestore Query - Query a collection] action in deviceList widget.
  List<medibound_portal_hdztzw_backend.DeviceRecord>? deviceConnectedFound;
  // Stores action output result for [Custom Action - confirmKey] action in deviceList widget.
  String? confirmKeyOutput;
  // Stores action output result for [Custom Action - connectDevice] action in deviceList widget.
  bool? connection;
  // State field(s) for Search widget.
  FocusNode? searchFocusNode;
  TextEditingController? searchTextController;
  String? Function(BuildContext, String?)? searchTextControllerValidator;
  // Models for DeviceTile dynamic component.
  late FlutterFlowDynamicModels<DeviceTileModel> deviceTileModels;

  @override
  void initState(BuildContext context) {
    deviceTileModels = FlutterFlowDynamicModels(() => DeviceTileModel());
  }

  @override
  void dispose() {
    searchFocusNode?.dispose();
    searchTextController?.dispose();

    deviceTileModels.dispose();
  }
}
