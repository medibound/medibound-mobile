import '/flutter_flow/flutter_flow_util.dart';
import '/utils/navigation/tab_bar/tab_bar_widget.dart';
import 'you_page_widget.dart' show YouPageWidget;
import 'package:flutter/material.dart';

class YouPageModel extends FlutterFlowModel<YouPageWidget> {
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
