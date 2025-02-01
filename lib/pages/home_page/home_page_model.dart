import '/flutter_flow/flutter_flow_util.dart';
import '/utils/navigation/tab_bar/tab_bar_widget.dart';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:medibound_portal_hdztzw/flutter_flow/flutter_flow_util.dart'
    as medibound_portal_hdztzw_util
    show wrapWithModel, createModel, FlutterFlowDynamicModels;
import 'package:medibound_portal_hdztzw/utils/empty_list/empty_list_widget.dart'
    as medibound_portal_hdztzw;
import 'package:medibound_portal_hdztzw/utils/icon_token/icon_token_widget.dart'
    as medibound_portal_hdztzw;
import 'package:flutter/material.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for IconToken component.
  late medibound_portal_hdztzw.IconTokenModel iconTokenModel;
  // Model for EmptyList component.
  late medibound_portal_hdztzw.EmptyListModel emptyListModel1;
  // Model for EmptyList component.
  late medibound_portal_hdztzw.EmptyListModel emptyListModel2;
  // Model for EmptyList component.
  late medibound_portal_hdztzw.EmptyListModel emptyListModel3;
  // Model for TabBar component.
  late TabBarModel tabBarModel;

  @override
  void initState(BuildContext context) {
    iconTokenModel = medibound_portal_hdztzw_util.createModel(
        context, () => medibound_portal_hdztzw.IconTokenModel());
    emptyListModel1 = medibound_portal_hdztzw_util.createModel(
        context, () => medibound_portal_hdztzw.EmptyListModel());
    emptyListModel2 = medibound_portal_hdztzw_util.createModel(
        context, () => medibound_portal_hdztzw.EmptyListModel());
    emptyListModel3 = medibound_portal_hdztzw_util.createModel(
        context, () => medibound_portal_hdztzw.EmptyListModel());
    tabBarModel = createModel(context, () => TabBarModel());
  }

  @override
  void dispose() {
    iconTokenModel.dispose();
    emptyListModel1.dispose();
    emptyListModel2.dispose();
    emptyListModel3.dispose();
    tabBarModel.dispose();
  }
}
