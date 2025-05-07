import '/flutter_flow/flutter_flow_util.dart';
import '/utils/device_tile/device_tile_widget.dart';
import 'streams_page_widget.dart' show StreamsPageWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class StreamsPageModel extends FlutterFlowModel<StreamsPageWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Search widget.
  FocusNode? searchFocusNode;
  TextEditingController? searchTextController;
  String? Function(BuildContext, String?)? searchTextControllerValidator;
  // State field(s) for Devices widget.
  late ExpandableController devicesExpandableController;

  // Models for DeviceTile dynamic component.
  late FlutterFlowDynamicModels<DeviceTileModel> deviceTileModels;
  // State field(s) for Apps widget.
  late ExpandableController appsExpandableController;

  @override
  void initState(BuildContext context) {
    deviceTileModels = FlutterFlowDynamicModels(() => DeviceTileModel());
  }

  @override
  void dispose() {
    searchFocusNode?.dispose();
    searchTextController?.dispose();

    devicesExpandableController.dispose();
    deviceTileModels.dispose();
    appsExpandableController.dispose();
  }
}
