import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/device_profiles/record/record/record_widget.dart';
import 'record_viewer_widget.dart' show RecordViewerWidget;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RecordViewerModel extends FlutterFlowModel<RecordViewerWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for Record component.
  late RecordModel recordModel;

  @override
  void initState(BuildContext context) {
    recordModel = createModel(context, () => RecordModel());
  }

  @override
  void dispose() {
    recordModel.dispose();
  }
}
