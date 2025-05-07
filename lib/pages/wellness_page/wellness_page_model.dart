import '/flutter_flow/flutter_flow_util.dart';
import 'package:medibound_portal_hdztzw/flutter_flow/flutter_flow_util.dart'
    as medibound_portal_hdztzw_util
    show wrapWithModel, createModel, FlutterFlowDynamicModels;
import 'package:medibound_portal_hdztzw/utils/empty_list/empty_list_widget.dart'
    as medibound_portal_hdztzw;
import 'wellness_page_widget.dart' show WellnessPageWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class WellnessPageModel extends FlutterFlowModel<WellnessPageWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for EmptyList component.
  late medibound_portal_hdztzw.EmptyListModel emptyListModel;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController;

  @override
  void initState(BuildContext context) {
    emptyListModel = medibound_portal_hdztzw_util.createModel(
        context, () => medibound_portal_hdztzw.EmptyListModel());
  }

  @override
  void dispose() {
    emptyListModel.dispose();
    expandableExpandableController.dispose();
  }
}
