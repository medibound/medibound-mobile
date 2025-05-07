import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'create_agent_widget.dart' show CreateAgentWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreateAgentModel extends FlutterFlowModel<CreateAgentWidget> {
  ///  Local state fields for this component.

  List<VariableStruct> variableList = [];
  void addToVariableList(VariableStruct item) => variableList.add(item);
  void removeFromVariableList(VariableStruct item) => variableList.remove(item);
  void removeAtIndexFromVariableList(int index) => variableList.removeAt(index);
  void insertAtIndexInVariableList(int index, VariableStruct item) =>
      variableList.insert(index, item);
  void updateVariableListAtIndex(
          int index, Function(VariableStruct) updateFn) =>
      variableList[index] = updateFn(variableList[index]);

  double windowWidth = 660.0;

  double? windowHeight = 600.0;

  OrganizationsRecord? selectedOrganization;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // State field(s) for AgentName widget.
  FocusNode? agentNameFocusNode;
  TextEditingController? agentNameTextController;
  String? Function(BuildContext, String?)? agentNameTextControllerValidator;
  String? _agentNameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Device Name is required';
    }

    return null;
  }

  // State field(s) for Description widget.
  FocusNode? descriptionFocusNode;
  TextEditingController? descriptionTextController;
  String? Function(BuildContext, String?)? descriptionTextControllerValidator;
  String? _descriptionTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Description is required';
    }

    return null;
  }

  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  AgentsRecord? agentTemp;

  @override
  void initState(BuildContext context) {
    agentNameTextControllerValidator = _agentNameTextControllerValidator;
    descriptionTextControllerValidator = _descriptionTextControllerValidator;
  }

  @override
  void dispose() {
    agentNameFocusNode?.dispose();
    agentNameTextController?.dispose();

    descriptionFocusNode?.dispose();
    descriptionTextController?.dispose();
  }
}
