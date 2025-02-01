import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/utils/dropdown/option_dropdown/option_dropdown_widget.dart';
import '/utils/image_picker/image_picker_widget.dart';
import 'dart:ui';
import 'create_organization_widget.dart' show CreateOrganizationWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreateOrganizationModel
    extends FlutterFlowModel<CreateOrganizationWidget> {
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
  // Model for ImagePicker component.
  late ImagePickerModel imagePickerModel;
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // State field(s) for OrganizationName widget.
  FocusNode? organizationNameFocusNode;
  TextEditingController? organizationNameTextController;
  String? Function(BuildContext, String?)?
      organizationNameTextControllerValidator;
  String? _organizationNameTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Organization Name is required';
    }

    return null;
  }

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

  // Model for OrganizationCategory.
  late OptionDropdownModel organizationCategoryModel;
  // State field(s) for Address widget.
  FocusNode? addressFocusNode;
  TextEditingController? addressTextController;
  String? Function(BuildContext, String?)? addressTextControllerValidator;
  String? _addressTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Organization Address is required';
    }

    return null;
  }

  // State field(s) for SupportEmail widget.
  FocusNode? supportEmailFocusNode;
  TextEditingController? supportEmailTextController;
  String? Function(BuildContext, String?)? supportEmailTextControllerValidator;
  String? _supportEmailTextControllerValidator(
      BuildContext context, String? val) {
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

  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  OrganizationsRecord? organization;

  @override
  void initState(BuildContext context) {
    imagePickerModel = createModel(context, () => ImagePickerModel());
    organizationNameTextControllerValidator =
        _organizationNameTextControllerValidator;
    websiteTextControllerValidator = _websiteTextControllerValidator;
    organizationCategoryModel =
        createModel(context, () => OptionDropdownModel());
    addressTextControllerValidator = _addressTextControllerValidator;
    supportEmailTextControllerValidator = _supportEmailTextControllerValidator;
    privacyPolicyTextControllerValidator =
        _privacyPolicyTextControllerValidator;
  }

  @override
  void dispose() {
    imagePickerModel.dispose();
    organizationNameFocusNode?.dispose();
    organizationNameTextController?.dispose();

    websiteFocusNode?.dispose();
    websiteTextController?.dispose();

    organizationCategoryModel.dispose();
    addressFocusNode?.dispose();
    addressTextController?.dispose();

    supportEmailFocusNode?.dispose();
    supportEmailTextController?.dispose();

    privacyPolicyFocusNode?.dispose();
    privacyPolicyTextController?.dispose();
  }
}
