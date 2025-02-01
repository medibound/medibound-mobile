import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/utils/dropdown/option_dropdown/option_dropdown_widget.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'create_device_variable_widget.dart' show CreateDeviceVariableWidget;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreateDeviceVariableModel
    extends FlutterFlowModel<CreateDeviceVariableWidget> {
  ///  Local state fields for this component.

  DeviceVariableStruct? variablePreset;
  void updateVariablePresetStruct(Function(DeviceVariableStruct) updateFn) {
    updateFn(variablePreset ??= DeviceVariableStruct());
  }

  ///  State fields for stateful widgets in this component.

  final formKey2 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // State field(s) for VariableName widget.
  FocusNode? variableNameFocusNode;
  TextEditingController? variableNameTextController;
  String? Function(BuildContext, String?)? variableNameTextControllerValidator;
  String? _variableNameTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Device Name is required';
    }

    return null;
  }

  // Model for VariableType.
  late OptionDropdownModel variableTypeModel;
  // State field(s) for IsList widget.
  bool? isListValue;
  // Model for PresetIntegration.
  late OptionDropdownModel presetIntegrationModel;
  // State field(s) for IsRanged widget.
  bool? isRangedValue;
  // State field(s) for LowerBound widget.
  FocusNode? lowerBoundFocusNode;
  TextEditingController? lowerBoundTextController;
  String? Function(BuildContext, String?)? lowerBoundTextControllerValidator;
  // State field(s) for UpperBound widget.
  FocusNode? upperBoundFocusNode;
  TextEditingController? upperBoundTextController;
  String? Function(BuildContext, String?)? upperBoundTextControllerValidator;
  // Model for Unit.
  late OptionDropdownModel unitModel;

  @override
  void initState(BuildContext context) {
    variableNameTextControllerValidator = _variableNameTextControllerValidator;
    variableTypeModel = createModel(context, () => OptionDropdownModel());
    presetIntegrationModel = createModel(context, () => OptionDropdownModel());
    unitModel = createModel(context, () => OptionDropdownModel());
  }

  @override
  void dispose() {
    variableNameFocusNode?.dispose();
    variableNameTextController?.dispose();

    variableTypeModel.dispose();
    presetIntegrationModel.dispose();
    lowerBoundFocusNode?.dispose();
    lowerBoundTextController?.dispose();

    upperBoundFocusNode?.dispose();
    upperBoundTextController?.dispose();

    unitModel.dispose();
  }
}
