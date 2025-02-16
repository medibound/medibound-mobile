import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/utils/dropdown/option_dropdown_list/option_dropdown_list_widget.dart';
import 'dart:ui';
import 'option_dropdown_widget.dart' show OptionDropdownWidget;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OptionDropdownModel extends FlutterFlowModel<OptionDropdownWidget> {
  ///  Local state fields for this component.

  CodedValueStruct? option;
  void updateOptionStruct(Function(CodedValueStruct) updateFn) {
    updateFn(option ??= CodedValueStruct());
  }

  ///  State fields for stateful widgets in this component.

  // State field(s) for Dropdown widget.
  FocusNode? dropdownFocusNode;
  TextEditingController? dropdownTextController;
  String? Function(BuildContext, String?)? dropdownTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    dropdownFocusNode?.dispose();
    dropdownTextController?.dispose();
  }
}
