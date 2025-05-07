import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/utils/container_empty/container_empty_widget.dart';
import '/utils/container_loading/container_loading_widget.dart';
import '/utils/empty_list/empty_list_widget.dart';
import 'dart:math';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'select_component_widget.dart' show SelectComponentWidget;
import 'package:expandable/expandable.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SelectComponentModel extends FlutterFlowModel<SelectComponentWidget> {
  ///  Local state fields for this component.

  VariableStruct? selectedVariable;
  void updateSelectedVariableStruct(Function(VariableStruct) updateFn) {
    updateFn(selectedVariable ??= VariableStruct());
  }

  CodedValueStruct? selectedTicker;
  void updateSelectedTickerStruct(Function(CodedValueStruct) updateFn) {
    updateFn(selectedTicker ??= CodedValueStruct());
  }

  Color? selectedColor;

  CodedValueStruct? selectedGraphSize;
  void updateSelectedGraphSizeStruct(Function(CodedValueStruct) updateFn) {
    updateFn(selectedGraphSize ??= CodedValueStruct());
  }

  CodedValueStruct? selectedTimeWindow;
  void updateSelectedTimeWindowStruct(Function(CodedValueStruct) updateFn) {
    updateFn(selectedTimeWindow ??= CodedValueStruct());
  }

  ///  State fields for stateful widgets in this component.

  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    expandableExpandableController.dispose();
  }
}
