import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'coded_value_dropdown_widget.dart' show CodedValueDropdownWidget;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CodedValueDropdownModel
    extends FlutterFlowModel<CodedValueDropdownWidget> {
  ///  Local state fields for this component.

  CodedValueStruct? item;
  void updateItemStruct(Function(CodedValueStruct) updateFn) {
    updateFn(item ??= CodedValueStruct());
  }

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
