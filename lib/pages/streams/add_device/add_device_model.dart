import '/backend/backend.dart';
import '/backend/custom_cloud_functions/custom_cloud_function_response_manager.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/utils/device_tile/device_tile_widget.dart';
import "package:medibound_portal_hdztzw/backend/backend.dart"
    as medibound_portal_hdztzw_backend;
import 'add_device_widget.dart' show AddDeviceWidget;
import 'package:medibound_portal_hdztzw/flutter_flow/flutter_flow_util.dart'
    as medibound_portal_hdztzw_util
    show wrapWithModel, createModel, FlutterFlowDynamicModels;
import 'package:medibound_portal_hdztzw/utils/dropdown/component_profile_tile/component_profile_tile_widget.dart'
    as medibound_portal_hdztzw;
import 'package:medibound_portal_hdztzw/utils/loading/loading_widget.dart'
    as medibound_portal_hdztzw;
import 'package:flutter/material.dart';

class AddDeviceModel extends FlutterFlowModel<AddDeviceWidget> {
  ///  Local state fields for this component.

  bool connectionLoading = false;

  BluetoothDeviceStruct? bTDeviceSelected;
  void updateBTDeviceSelectedStruct(Function(BluetoothDeviceStruct) updateFn) {
    updateFn(bTDeviceSelected ??= BluetoothDeviceStruct());
  }

  List<BluetoothDeviceStruct> btDevicesAvailable = [];
  void addToBtDevicesAvailable(BluetoothDeviceStruct item) =>
      btDevicesAvailable.add(item);
  void removeFromBtDevicesAvailable(BluetoothDeviceStruct item) =>
      btDevicesAvailable.remove(item);
  void removeAtIndexFromBtDevicesAvailable(int index) =>
      btDevicesAvailable.removeAt(index);
  void insertAtIndexInBtDevicesAvailable(
          int index, BluetoothDeviceStruct item) =>
      btDevicesAvailable.insert(index, item);
  void updateBtDevicesAvailableAtIndex(
          int index, Function(BluetoothDeviceStruct) updateFn) =>
      btDevicesAvailable[index] = updateFn(btDevicesAvailable[index]);

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in addDevice widget.
  List<medibound_portal_hdztzw_backend.DeviceRecord>? deviceSearch;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Models for DeviceTile dynamic component.
  late FlutterFlowDynamicModels<DeviceTileModel> deviceTileModels;
  // Model for ComponentProfileTile component.
  late medibound_portal_hdztzw.ComponentProfileTileModel
      componentProfileTileModel1;
  var barcodeId = '';
  // Stores action output result for [Backend Call - Read Document] action in ComponentProfileTile widget.
  medibound_portal_hdztzw_backend.DeviceRecord? deviceSelected;
  // Stores action output result for [Cloud Function - checkKey] action in ComponentProfileTile widget.
  CheckKeyCloudFunctionCallResponse? validationKey;
  // Model for ComponentProfileTile component.
  late medibound_portal_hdztzw.ComponentProfileTileModel
      componentProfileTileModel2;
  // Model for Loading component.
  late medibound_portal_hdztzw.LoadingModel loadingModel1;
  // Model for Loading component.
  late medibound_portal_hdztzw.LoadingModel loadingModel2;

  @override
  void initState(BuildContext context) {
    deviceTileModels = FlutterFlowDynamicModels(() => DeviceTileModel());
    componentProfileTileModel1 = medibound_portal_hdztzw_util.createModel(
        context, () => medibound_portal_hdztzw.ComponentProfileTileModel());
    componentProfileTileModel2 = medibound_portal_hdztzw_util.createModel(
        context, () => medibound_portal_hdztzw.ComponentProfileTileModel());
    loadingModel1 = medibound_portal_hdztzw_util.createModel(
        context, () => medibound_portal_hdztzw.LoadingModel());
    loadingModel2 = medibound_portal_hdztzw_util.createModel(
        context, () => medibound_portal_hdztzw.LoadingModel());
  }

  @override
  void dispose() {
    deviceTileModels.dispose();
    componentProfileTileModel1.dispose();
    componentProfileTileModel2.dispose();
    loadingModel1.dispose();
    loadingModel2.dispose();
  }
}
