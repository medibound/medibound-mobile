import '/flutter_flow/flutter_flow_util.dart';
import '/utils/navigation/tab_bar/tab_bar_widget.dart';
import "package:medibound_portal_hdztzw/backend/backend.dart"
    as medibound_portal_hdztzw_backend;
import 'streams_page_widget.dart' show StreamsPageWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class StreamsPageModel extends FlutterFlowModel<StreamsPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in StreamsPage widget.
  List<medibound_portal_hdztzw_backend.DeviceRecord>? devices;
  // State field(s) for Devices widget.
  late ExpandableController devicesExpandableController;

  // State field(s) for Apps widget.
  late ExpandableController appsExpandableController;

  // Model for TabBar component.
  late TabBarModel tabBarModel;

  @override
  void initState(BuildContext context) {
    tabBarModel = createModel(context, () => TabBarModel());
  }

  @override
  void dispose() {
    devicesExpandableController.dispose();
    appsExpandableController.dispose();
    tabBarModel.dispose();
  }
}
