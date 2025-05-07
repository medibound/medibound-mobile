import '/flutter_flow/flutter_flow_util.dart';
import '/pages/records/record_list_item/record_list_item_widget.dart';
import 'overview_page_widget.dart' show OverviewPageWidget;
import 'package:medibound_portal_hdztzw/flutter_flow/flutter_flow_util.dart'
    as medibound_portal_hdztzw_util
    show wrapWithModel, createModel, FlutterFlowDynamicModels;
import 'package:medibound_portal_hdztzw/utils/empty_list/empty_list_widget.dart'
    as medibound_portal_hdztzw;
import 'package:medibound_portal_hdztzw/utils/icon_token/icon_token_widget.dart'
    as medibound_portal_hdztzw;
import 'package:flutter/material.dart';

class OverviewPageModel extends FlutterFlowModel<OverviewPageWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for IconToken component.
  late medibound_portal_hdztzw.IconTokenModel iconTokenModel;
  // Model for RecordListItem component.
  late RecordListItemModel recordListItemModel;
  // Model for EmptyList component.
  late medibound_portal_hdztzw.EmptyListModel emptyListModel1;
  // Model for EmptyList component.
  late medibound_portal_hdztzw.EmptyListModel emptyListModel2;

  @override
  void initState(BuildContext context) {
    iconTokenModel = medibound_portal_hdztzw_util.createModel(
        context, () => medibound_portal_hdztzw.IconTokenModel());
    recordListItemModel = createModel(context, () => RecordListItemModel());
    emptyListModel1 = medibound_portal_hdztzw_util.createModel(
        context, () => medibound_portal_hdztzw.EmptyListModel());
    emptyListModel2 = medibound_portal_hdztzw_util.createModel(
        context, () => medibound_portal_hdztzw.EmptyListModel());
  }

  @override
  void dispose() {
    iconTokenModel.dispose();
    recordListItemModel.dispose();
    emptyListModel1.dispose();
    emptyListModel2.dispose();
  }
}
