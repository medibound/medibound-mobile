import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/device_profiles/components/layouts/whole/whole_widget.dart';
import '/pages/device_profiles/components/subblock/subblock_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'component_widget.dart' show ComponentWidget;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ComponentModel extends FlutterFlowModel<ComponentWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for WHOLE component.
  late WholeModel wholeModel1;
  // Model for WHOLE component.
  late WholeModel wholeModel2;

  @override
  void initState(BuildContext context) {
    wholeModel1 = createModel(context, () => WholeModel());
    wholeModel2 = createModel(context, () => WholeModel());
  }

  @override
  void dispose() {
    wholeModel1.dispose();
    wholeModel2.dispose();
  }
}
