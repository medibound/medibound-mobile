import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/device_profiles/builder/body_builder/body_builder_widget.dart';
import '/pages/device_profiles/builder/header_builder/header_builder_widget.dart';
import '/pages/device_profiles/builder/record_viewer/record_viewer_widget.dart';
import '/pages/device_profiles/builder/select_component/select_component_widget.dart';
import '/pages/device_profiles/variables/create_device_variable/create_device_variable_widget.dart';
import '/utils/dropdown/option_dropdown/option_dropdown_widget.dart';
import '/utils/dropdown/profile_dropdown/profile_dropdown_widget.dart';
import '/utils/variable_list_tile/variable_list_tile_widget.dart';
import 'dart:ui';
import 'create_device_profile_widget.dart' show CreateDeviceProfileWidget;
import 'package:styled_divider/styled_divider.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreateDeviceProfileModel
    extends FlutterFlowModel<CreateDeviceProfileWidget> {
  ///  Local state fields for this component.

  List<DeviceVariableStruct> variableList = [];
  void addToVariableList(DeviceVariableStruct item) => variableList.add(item);
  void removeFromVariableList(DeviceVariableStruct item) =>
      variableList.remove(item);
  void removeAtIndexFromVariableList(int index) => variableList.removeAt(index);
  void insertAtIndexInVariableList(int index, DeviceVariableStruct item) =>
      variableList.insert(index, item);
  void updateVariableListAtIndex(
          int index, Function(DeviceVariableStruct) updateFn) =>
      variableList[index] = updateFn(variableList[index]);

  double windowWidth = 660.0;

  double? windowHeight = 600.0;

  ///  State fields for stateful widgets in this component.

  final formKey5 = GlobalKey<FormState>();
  final formKey3 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  final formKey4 = GlobalKey<FormState>();
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // State field(s) for DeviceName widget.
  FocusNode? deviceNameFocusNode;
  TextEditingController? deviceNameTextController;
  String? Function(BuildContext, String?)? deviceNameTextControllerValidator;
  String? _deviceNameTextControllerValidator(
      BuildContext context, String? val) {
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

  // Model for ProfileDropdown component.
  late ProfileDropdownModel profileDropdownModel;
  // Model for Type.
  late OptionDropdownModel typeModel;
  // State field(s) for ManualLink widget.
  FocusNode? manualLinkFocusNode;
  TextEditingController? manualLinkTextController;
  String? Function(BuildContext, String?)? manualLinkTextControllerValidator;
  String? _manualLinkTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Manual Link is required';
    }

    if (!RegExp(kTextValidatorWebsiteRegex).hasMatch(val)) {
      return 'Has to be a valid website.';
    }
    return null;
  }

  // State field(s) for ModelNumber widget.
  FocusNode? modelNumberFocusNode;
  TextEditingController? modelNumberTextController;
  String? Function(BuildContext, String?)? modelNumberTextControllerValidator;
  String? _modelNumberTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Model Number is required';
    }

    return null;
  }

  // State field(s) for UDI widget.
  FocusNode? udiFocusNode;
  TextEditingController? udiTextController;
  String? Function(BuildContext, String?)? udiTextControllerValidator;
  String? _udiTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Composite Unique Device Identifier is required';
    }

    return null;
  }

  // Model for Mode.
  late OptionDropdownModel modeModel;
  // Model for TransferType.
  late OptionDropdownModel transferTypeModel;
  // Model for headerBuilder component.
  late HeaderBuilderModel headerBuilderModel;
  // Model for bodyBuilder component.
  late BodyBuilderModel bodyBuilderModel;
  // Model for selectComponent component.
  late SelectComponentModel selectComponentModel;
  // Model for recordViewer component.
  late RecordViewerModel recordViewerModel;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  OrganizationsRecord? organization;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  RecordTemplateRecord? recordTemp;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  DeviceProfilesRecord? deviceProfile;

  @override
  void initState(BuildContext context) {
    deviceNameTextControllerValidator = _deviceNameTextControllerValidator;
    descriptionTextControllerValidator = _descriptionTextControllerValidator;
    profileDropdownModel = createModel(context, () => ProfileDropdownModel());
    typeModel = createModel(context, () => OptionDropdownModel());
    manualLinkTextControllerValidator = _manualLinkTextControllerValidator;
    modelNumberTextControllerValidator = _modelNumberTextControllerValidator;
    udiTextControllerValidator = _udiTextControllerValidator;
    modeModel = createModel(context, () => OptionDropdownModel());
    transferTypeModel = createModel(context, () => OptionDropdownModel());
    headerBuilderModel = createModel(context, () => HeaderBuilderModel());
    bodyBuilderModel = createModel(context, () => BodyBuilderModel());
    selectComponentModel = createModel(context, () => SelectComponentModel());
    recordViewerModel = createModel(context, () => RecordViewerModel());
    profileDropdownModel.textControllerValidator = _formTextFieldValidator5;
  }

  @override
  void dispose() {
    deviceNameFocusNode?.dispose();
    deviceNameTextController?.dispose();

    descriptionFocusNode?.dispose();
    descriptionTextController?.dispose();

    profileDropdownModel.dispose();
    typeModel.dispose();
    manualLinkFocusNode?.dispose();
    manualLinkTextController?.dispose();

    modelNumberFocusNode?.dispose();
    modelNumberTextController?.dispose();

    udiFocusNode?.dispose();
    udiTextController?.dispose();

    modeModel.dispose();
    transferTypeModel.dispose();
    headerBuilderModel.dispose();
    bodyBuilderModel.dispose();
    selectComponentModel.dispose();
    recordViewerModel.dispose();
  }

  /// Additional helper methods.

  String? _formTextFieldValidator5(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'label is required';
    }

    return null;
  }
}
