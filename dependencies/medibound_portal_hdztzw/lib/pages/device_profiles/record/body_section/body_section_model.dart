import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/device_profiles/components/component/component_widget.dart';
import '/utils/empty_list/empty_list_widget.dart';
import 'dart:ui';
import 'body_section_widget.dart' show BodySectionWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BodySectionModel extends FlutterFlowModel<BodySectionWidget> {
  ///  Local state fields for this component.

  BodySectionStruct? section;
  void updateSectionStruct(Function(BodySectionStruct) updateFn) {
    updateFn(section ??= BodySectionStruct());
  }

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
