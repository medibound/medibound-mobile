import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/device_profiles/components/charts/column/column_widget.dart';
import '/pages/device_profiles/components/layouts/hsplit/hsplit_widget.dart';
import '/pages/device_profiles/components/subblocks/value_trend/value_trend_widget.dart';
import 'graph_column_widget.dart' show GraphColumnWidget;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class GraphColumnModel extends FlutterFlowModel<GraphColumnWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for HSPLIT component.
  late HsplitModel hsplitModel;

  @override
  void initState(BuildContext context) {
    hsplitModel = createModel(context, () => HsplitModel());
  }

  @override
  void dispose() {
    hsplitModel.dispose();
  }
}
