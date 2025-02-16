import '/flutter_flow/flutter_flow_util.dart';
import 'package:medibound_portal_hdztzw/flutter_flow/flutter_flow_util.dart'
    as medibound_portal_hdztzw_util
    show wrapWithModel, createModel, FlutterFlowDynamicModels;
import 'package:medibound_portal_hdztzw/pages/device_profiles/record/header/header_widget.dart'
    as medibound_portal_hdztzw;
import 'package:medibound_portal_hdztzw/utils/empty/empty_widget.dart'
    as medibound_portal_hdztzw;
import 'record_widget.dart' show RecordWidget;
import 'package:flutter/material.dart';

class RecordModel extends FlutterFlowModel<RecordWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for Empty component.
  late medibound_portal_hdztzw.EmptyModel emptyModel;
  // Model for Header component.
  late medibound_portal_hdztzw.HeaderModel headerModel;

  @override
  void initState(BuildContext context) {
    emptyModel = medibound_portal_hdztzw_util.createModel(
        context, () => medibound_portal_hdztzw.EmptyModel());
    headerModel = medibound_portal_hdztzw_util.createModel(
        context, () => medibound_portal_hdztzw.HeaderModel());
  }

  @override
  void dispose() {
    emptyModel.dispose();
    headerModel.dispose();
  }
}
