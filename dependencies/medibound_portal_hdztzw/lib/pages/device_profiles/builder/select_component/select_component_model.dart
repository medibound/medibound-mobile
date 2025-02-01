import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/device_profiles/components/component/component_widget.dart';
import '/utils/dropdown/option_dropdown/option_dropdown_widget.dart';
import '/utils/empty_list/empty_list_widget.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'select_component_widget.dart' show SelectComponentWidget;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SelectComponentModel extends FlutterFlowModel<SelectComponentWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for VariableSelectedForComp.
  late OptionDropdownModel variableSelectedForCompModel;
  // State field(s) for Size widget.
  FormFieldController<List<String>>? sizeValueController;
  String? get sizeValue => sizeValueController?.value?.firstOrNull;
  set sizeValue(String? val) =>
      sizeValueController?.value = val != null ? [val] : [];
  // Model for EmptyList component.
  late EmptyListModel emptyListModel;

  @override
  void initState(BuildContext context) {
    variableSelectedForCompModel =
        createModel(context, () => OptionDropdownModel());
    emptyListModel = createModel(context, () => EmptyListModel());
  }

  @override
  void dispose() {
    variableSelectedForCompModel.dispose();
    emptyListModel.dispose();
  }
}
