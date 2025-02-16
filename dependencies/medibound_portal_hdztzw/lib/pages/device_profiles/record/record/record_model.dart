import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/device_profiles/record/body_section/body_section_widget.dart';
import '/pages/device_profiles/record/header/header_widget.dart';
import '/utils/empty/empty_widget.dart';
import 'dart:ui';
import 'record_widget.dart' show RecordWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RecordModel extends FlutterFlowModel<RecordWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for Empty component.
  late EmptyModel emptyModel;
  // Model for Header component.
  late HeaderModel headerModel;

  @override
  void initState(BuildContext context) {
    emptyModel = createModel(context, () => EmptyModel());
    headerModel = createModel(context, () => HeaderModel());
  }

  @override
  void dispose() {
    emptyModel.dispose();
    headerModel.dispose();
  }
}
