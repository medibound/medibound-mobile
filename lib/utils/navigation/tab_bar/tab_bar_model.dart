import '/flutter_flow/flutter_flow_util.dart';
import '/utils/navigation/tab_bar_tile/tab_bar_tile_widget.dart';
import 'tab_bar_widget.dart' show TabBarWidget;
import 'package:flutter/material.dart';

class TabBarModel extends FlutterFlowModel<TabBarWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for TabBarTile component.
  late TabBarTileModel tabBarTileModel1;
  // Model for TabBarTile component.
  late TabBarTileModel tabBarTileModel2;
  // Model for TabBarTile component.
  late TabBarTileModel tabBarTileModel3;
  // Model for TabBarTile component.
  late TabBarTileModel tabBarTileModel4;
  // Model for TabBarTile component.
  late TabBarTileModel tabBarTileModel5;

  @override
  void initState(BuildContext context) {
    tabBarTileModel1 = createModel(context, () => TabBarTileModel());
    tabBarTileModel2 = createModel(context, () => TabBarTileModel());
    tabBarTileModel3 = createModel(context, () => TabBarTileModel());
    tabBarTileModel4 = createModel(context, () => TabBarTileModel());
    tabBarTileModel5 = createModel(context, () => TabBarTileModel());
  }

  @override
  void dispose() {
    tabBarTileModel1.dispose();
    tabBarTileModel2.dispose();
    tabBarTileModel3.dispose();
    tabBarTileModel4.dispose();
    tabBarTileModel5.dispose();
  }
}
