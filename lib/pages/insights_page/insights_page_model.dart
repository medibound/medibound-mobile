import '/flutter_flow/flutter_flow_util.dart';
import '/utils/navigation/tab_bar/tab_bar_widget.dart';
import 'insights_page_widget.dart' show InsightsPageWidget;
import 'package:flutter/material.dart';

class InsightsPageModel extends FlutterFlowModel<InsightsPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for TabBar component.
  late TabBarModel tabBarModel;

  @override
  void initState(BuildContext context) {
    tabBarModel = createModel(context, () => TabBarModel());
  }

  @override
  void dispose() {
    tabBarModel.dispose();
  }
}
