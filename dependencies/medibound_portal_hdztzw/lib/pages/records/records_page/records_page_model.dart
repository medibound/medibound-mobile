import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/device_profiles/record/record_sample/record_sample_widget.dart';
import 'records_page_widget.dart' show RecordsPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RecordsPageModel extends FlutterFlowModel<RecordsPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for RecordSample component.
  late RecordSampleModel recordSampleModel;

  @override
  void initState(BuildContext context) {
    recordSampleModel = createModel(context, () => RecordSampleModel());
  }

  @override
  void dispose() {
    recordSampleModel.dispose();
  }
}
