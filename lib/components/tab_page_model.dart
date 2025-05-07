import '/flutter_flow/flutter_flow_util.dart';
import '/utils/navigation/tab_bar/tab_bar_widget.dart';
import 'tab_page_widget.dart' show TabPageWidget;
import 'package:flutter/material.dart';

class TabPageModel extends FlutterFlowModel<TabPageWidget> {
  ///  State fields for stateful widgets in this component.

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
