import '/flutter_flow/flutter_flow_util.dart';
import "package:medibound_portal_hdztzw/backend/backend.dart"
    as medibound_portal_hdztzw_backend;
import "package:medibound_portal_hdztzw/backend/schema/structs/index.dart"
    as medibound_portal_hdztzw_data_schema;
import 'manage_device_widget.dart' show ManageDeviceWidget;
import 'package:medibound_portal_hdztzw/flutter_flow/flutter_flow_util.dart'
    as medibound_portal_hdztzw_util
    show wrapWithModel, createModel, FlutterFlowDynamicModels;
import 'package:medibound_portal_hdztzw/utils/desc_token/desc_token_widget.dart'
    as medibound_portal_hdztzw;
import 'package:medibound_portal_hdztzw/utils/dropdown/component_profile_tile/component_profile_tile_widget.dart'
    as medibound_portal_hdztzw;
import 'package:flutter/material.dart';

class ManageDeviceModel extends FlutterFlowModel<ManageDeviceWidget> {
  ///  Local state fields for this component.

  List<medibound_portal_hdztzw_data_schema.DeviceVariableStruct> recordData =
      [];
  void addToRecordData(
          medibound_portal_hdztzw_data_schema.DeviceVariableStruct item) =>
      recordData.add(item);
  void removeFromRecordData(
          medibound_portal_hdztzw_data_schema.DeviceVariableStruct item) =>
      recordData.remove(item);
  void removeAtIndexFromRecordData(int index) => recordData.removeAt(index);
  void insertAtIndexInRecordData(int index,
          medibound_portal_hdztzw_data_schema.DeviceVariableStruct item) =>
      recordData.insert(index, item);
  void updateRecordDataAtIndex(
          int index,
          Function(medibound_portal_hdztzw_data_schema.DeviceVariableStruct)
              updateFn) =>
      recordData[index] = updateFn(recordData[index]);

  ///  State fields for stateful widgets in this component.

  // Model for ComponentProfileTile component.
  late medibound_portal_hdztzw.ComponentProfileTileModel
      componentProfileTileModel1;
  // Model for ComponentProfileTile component.
  late medibound_portal_hdztzw.ComponentProfileTileModel
      componentProfileTileModel2;
  // Model for DescToken component.
  late medibound_portal_hdztzw.DescTokenModel descTokenModel;
  // Stores action output result for [Custom Action - createRecord] action in Button widget.
  DocumentReference? recordRef;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  medibound_portal_hdztzw_backend.RecordsRecord? recordOutput;

  @override
  void initState(BuildContext context) {
    componentProfileTileModel1 = medibound_portal_hdztzw_util.createModel(
        context, () => medibound_portal_hdztzw.ComponentProfileTileModel());
    componentProfileTileModel2 = medibound_portal_hdztzw_util.createModel(
        context, () => medibound_portal_hdztzw.ComponentProfileTileModel());
    descTokenModel = medibound_portal_hdztzw_util.createModel(
        context, () => medibound_portal_hdztzw.DescTokenModel());
  }

  @override
  void dispose() {
    componentProfileTileModel1.dispose();
    componentProfileTileModel2.dispose();
    descTokenModel.dispose();
  }
}
