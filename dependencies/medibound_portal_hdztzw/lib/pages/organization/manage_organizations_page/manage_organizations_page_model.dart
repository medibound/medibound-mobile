import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/organization/dialog/api_key_dialog/api_key_dialog_widget.dart';
import '/pages/organization/dialog/pricing_plans_dialog/pricing_plans_dialog_widget.dart';
import '/utils/desc_token/desc_token_widget.dart';
import '/utils/dialog_box/dialog_box_widget.dart';
import '/utils/empty_list/empty_list_widget.dart';
import '/utils/loading/loading_widget.dart';
import 'dart:math';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'manage_organizations_page_widget.dart'
    show ManageOrganizationsPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ManageOrganizationsPageModel
    extends FlutterFlowModel<ManageOrganizationsPageWidget> {
  ///  Local state fields for this component.

  bool loading = true;

  OrganizationsRecord? organization;

  CodedValueStruct? organizationType;
  void updateOrganizationTypeStruct(Function(CodedValueStruct) updateFn) {
    updateFn(organizationType ??= CodedValueStruct());
  }

  ///  State fields for stateful widgets in this component.

  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  // Model for DescToken component.
  late DescTokenModel descTokenModel1;
  // Model for DescToken component.
  late DescTokenModel descTokenModel2;
  // Model for DescToken component.
  late DescTokenModel descTokenModel3;
  // Model for DescToken component.
  late DescTokenModel descTokenModel4;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // State field(s) for SecretKey widget.
  FocusNode? secretKeyFocusNode;
  TextEditingController? secretKeyTextController;
  String? Function(BuildContext, String?)? secretKeyTextControllerValidator;
  // Stores action output result for [Backend Call - API (refreshApiKey)] action in Button widget.
  ApiCallResponse? keyOutput;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  OrganizationsRecord? newOrganizationCopy;
  // Stores action output result for [Backend Call - API (refreshApiKey)] action in Button widget.
  ApiCallResponse? keyOutputCopy2;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  OrganizationsRecord? newOrganization;
  // State field(s) for Website widget.
  FocusNode? websiteFocusNode;
  TextEditingController? websiteTextController;
  String? Function(BuildContext, String?)? websiteTextControllerValidator;
  String? _websiteTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Website is required';
    }

    if (!RegExp(kTextValidatorWebsiteRegex).hasMatch(val)) {
      return 'Has to be a valid website.';
    }
    return null;
  }

  // State field(s) for Address widget.
  FocusNode? addressFocusNode;
  TextEditingController? addressTextController;
  String? Function(BuildContext, String?)? addressTextControllerValidator;
  String? _addressTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Address is required';
    }

    return null;
  }

  // State field(s) for Email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  String? _emailTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Support Email is required';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Has to be a valid email address.';
    }
    return null;
  }

  // State field(s) for PrivacyPolicy widget.
  FocusNode? privacyPolicyFocusNode;
  TextEditingController? privacyPolicyTextController;
  String? Function(BuildContext, String?)? privacyPolicyTextControllerValidator;
  String? _privacyPolicyTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Privacy Policy is required';
    }

    if (!RegExp(kTextValidatorWebsiteRegex).hasMatch(val)) {
      return 'Has to be a valid website.';
    }
    return null;
  }

  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  OrganizationsRecord? newOrganization2;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController6;
  String? Function(BuildContext, String?)? textController6Validator;
  String? _textController6Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'marty@mcfly.com is required';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Has to be a valid email address.';
    }
    return null;
  }

  // Stores action output result for [Firestore Query - Query a collection] action in IconButton widget.
  List<RolesRecord>? usersWithEmail;
  // Model for Loading component.
  late LoadingModel loadingModel;

  @override
  void initState(BuildContext context) {
    descTokenModel1 = createModel(context, () => DescTokenModel());
    descTokenModel2 = createModel(context, () => DescTokenModel());
    descTokenModel3 = createModel(context, () => DescTokenModel());
    descTokenModel4 = createModel(context, () => DescTokenModel());
    websiteTextControllerValidator = _websiteTextControllerValidator;
    addressTextControllerValidator = _addressTextControllerValidator;
    emailTextControllerValidator = _emailTextControllerValidator;
    privacyPolicyTextControllerValidator =
        _privacyPolicyTextControllerValidator;
    textController6Validator = _textController6Validator;
    loadingModel = createModel(context, () => LoadingModel());
  }

  @override
  void dispose() {
    descTokenModel1.dispose();
    descTokenModel2.dispose();
    descTokenModel3.dispose();
    descTokenModel4.dispose();
    tabBarController?.dispose();
    secretKeyFocusNode?.dispose();
    secretKeyTextController?.dispose();

    websiteFocusNode?.dispose();
    websiteTextController?.dispose();

    addressFocusNode?.dispose();
    addressTextController?.dispose();

    emailFocusNode?.dispose();
    emailTextController?.dispose();

    privacyPolicyFocusNode?.dispose();
    privacyPolicyTextController?.dispose();

    textFieldFocusNode?.dispose();
    textController6?.dispose();

    loadingModel.dispose();
  }
}
