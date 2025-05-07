import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/utils/auth_header/auth_header_widget.dart';
import '/utils/date_picker/date_picker_widget.dart';
import '/utils/dropdown/component_profile_tile/component_profile_tile_widget.dart';
import '/utils/dropdown/option_dropdown/option_dropdown_widget.dart';
import '/utils/empty/empty_widget.dart';
import '/utils/loading/loading_widget.dart';
import 'dart:math';
import 'dart:ui';
import 'invite_page_widget.dart' show InvitePageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class InvitePageModel extends FlutterFlowModel<InvitePageWidget> {
  ///  Local state fields for this page.

  String? uploadedProfilePicture;

  bool loading = true;

  bool failed = false;

  IntegrationStruct? userIntegration;
  void updateUserIntegrationStruct(Function(IntegrationStruct) updateFn) {
    updateFn(userIntegration ??= IntegrationStruct());
  }

  ///  State fields for stateful widgets in this page.

  final formKey2 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  // Stores action output result for [Firestore Query - Query a collection] action in InvitePage widget.
  List<OrganizationsRecord>? organization;
  // Stores action output result for [Firestore Query - Query a collection] action in InvitePage widget.
  List<PatientsRecord>? patient;
  // Stores action output result for [Firestore Query - Query a collection] action in InvitePage widget.
  List<UsersRecord>? userConfirm;
  // Model for Empty component.
  late EmptyModel emptyModel;
  // Model for Loading component.
  late LoadingModel loadingModel;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // State field(s) for FirstName widget.
  FocusNode? firstNameFocusNode;
  TextEditingController? firstNameTextController;
  String? Function(BuildContext, String?)? firstNameTextControllerValidator;
  String? _firstNameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'First Name is required';
    }

    return null;
  }

  // State field(s) for LastName widget.
  FocusNode? lastNameFocusNode;
  TextEditingController? lastNameTextController;
  String? Function(BuildContext, String?)? lastNameTextControllerValidator;
  String? _lastNameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Last Name is required';
    }

    return null;
  }

  // Model for BirthDate.
  late DatePickerModel birthDateModel;
  // Model for OptionDropdown component.
  late OptionDropdownModel optionDropdownModel;
  // State field(s) for Password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordTextController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordTextControllerValidator;
  String? _passwordTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Password is required';
    }

    return null;
  }

  // State field(s) for ConfirmPassword widget.
  FocusNode? confirmPasswordFocusNode;
  TextEditingController? confirmPasswordTextController;
  late bool confirmPasswordVisibility;
  String? Function(BuildContext, String?)?
      confirmPasswordTextControllerValidator;
  String? _confirmPasswordTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Confirm Password is required';
    }

    return null;
  }

  // Model for ComponentProfileTile component.
  late ComponentProfileTileModel componentProfileTileModel2;
  // State field(s) for Checkbox widget.
  bool? checkboxValue;
  // Model for AuthHeader component.
  late AuthHeaderModel authHeaderModel;

  @override
  void initState(BuildContext context) {
    emptyModel = createModel(context, () => EmptyModel());
    loadingModel = createModel(context, () => LoadingModel());
    firstNameTextControllerValidator = _firstNameTextControllerValidator;
    lastNameTextControllerValidator = _lastNameTextControllerValidator;
    birthDateModel = createModel(context, () => DatePickerModel());
    optionDropdownModel = createModel(context, () => OptionDropdownModel());
    passwordVisibility = false;
    passwordTextControllerValidator = _passwordTextControllerValidator;
    confirmPasswordVisibility = false;
    confirmPasswordTextControllerValidator =
        _confirmPasswordTextControllerValidator;
    componentProfileTileModel2 =
        createModel(context, () => ComponentProfileTileModel());
    authHeaderModel = createModel(context, () => AuthHeaderModel());
  }

  @override
  void dispose() {
    emptyModel.dispose();
    loadingModel.dispose();
    firstNameFocusNode?.dispose();
    firstNameTextController?.dispose();

    lastNameFocusNode?.dispose();
    lastNameTextController?.dispose();

    birthDateModel.dispose();
    optionDropdownModel.dispose();
    passwordFocusNode?.dispose();
    passwordTextController?.dispose();

    confirmPasswordFocusNode?.dispose();
    confirmPasswordTextController?.dispose();

    componentProfileTileModel2.dispose();
    authHeaderModel.dispose();
  }
}
