import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/custom_cloud_functions/custom_cloud_function_response_manager.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/device_profiles/builder/record_viewer/record_viewer_widget.dart';
import '/pages/devices/device_secret_dialog/device_secret_dialog_widget.dart';
import '/utils/desc_token/desc_token_widget.dart';
import '/utils/dialog_box/dialog_box_widget.dart';
import '/utils/doc_guide_block/doc_guide_block_widget.dart';
import '/utils/dropdown/component_profile_tile/component_profile_tile_widget.dart';
import '/utils/empty_list/empty_list_widget.dart';
import '/utils/loading/loading_widget.dart';
import '/utils/status_token/status_token_widget.dart';
import 'dart:math';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'manage_device_profiles_widget.dart' show ManageDeviceProfilesWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:collection/collection.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ManageDeviceProfilesModel
    extends FlutterFlowModel<ManageDeviceProfilesWidget> {
  ///  Local state fields for this component.

  bool loading = true;

  DeviceProfilesRecord? deviceProfile;

  CodedValueStruct? deviceType;
  void updateDeviceTypeStruct(Function(CodedValueStruct) updateFn) {
    updateFn(deviceType ??= CodedValueStruct());
  }

  OrganizationsRecord? ownerOrganization;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Firestore Query - Query a collection] action in manageDeviceProfiles widget.
  List<DeviceProfilesRecord>? deviceProfiles;
  // Model for DescToken component.
  late DescTokenModel descTokenModel1;
  // Model for DescToken component.
  late DescTokenModel descTokenModel2;
  // Model for DescToken component.
  late DescTokenModel descTokenModel3;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // Stores action output result for [Cloud Function - createDeviceKey] action in Button widget.
  CreateDeviceKeyCloudFunctionCallResponse? secretKey;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  DeviceRecord? device;
  // Stores action output result for [Backend Call - API (getSecretKey)] action in ComponentProfileTile widget.
  ApiCallResponse? secretKeyOutput;
  // Model for DocGuideBlock component.
  late DocGuideBlockModel docGuideBlockModel;
  // Model for recordViewer component.
  late RecordViewerModel recordViewerModel;
  // Stores action output result for [Backend Call - Read Document] action in RegulatoryTimelineWidget widget.
  DeviceProfilesRecord? deviceProfileUpdated;
  // State field(s) for Description widget.
  FocusNode? descriptionFocusNode;
  TextEditingController? descriptionTextController;
  String? Function(BuildContext, String?)? descriptionTextControllerValidator;
  String? _descriptionTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'description is required';
    }

    return null;
  }

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  String? _textController2Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'manual_path is required';
    }

    if (!RegExp(kTextValidatorWebsiteRegex).hasMatch(val)) {
      return 'Has to be a valid website.';
    }
    return null;
  }

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  String? _textController3Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'unique_device_identifier is required';
    }

    return null;
  }

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController4;
  String? Function(BuildContext, String?)? textController4Validator;
  String? _textController4Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'model_number is required';
    }

    return null;
  }

  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  DeviceProfilesRecord? newDeviceProfile;
  // Model for Loading component.
  late LoadingModel loadingModel;

  @override
  void initState(BuildContext context) {
    descTokenModel1 = createModel(context, () => DescTokenModel());
    descTokenModel2 = createModel(context, () => DescTokenModel());
    descTokenModel3 = createModel(context, () => DescTokenModel());
    docGuideBlockModel = createModel(context, () => DocGuideBlockModel());
    recordViewerModel = createModel(context, () => RecordViewerModel());
    descriptionTextControllerValidator = _descriptionTextControllerValidator;
    textController2Validator = _textController2Validator;
    textController3Validator = _textController3Validator;
    textController4Validator = _textController4Validator;
    loadingModel = createModel(context, () => LoadingModel());
  }

  @override
  void dispose() {
    descTokenModel1.dispose();
    descTokenModel2.dispose();
    descTokenModel3.dispose();
    tabBarController?.dispose();
    docGuideBlockModel.dispose();
    recordViewerModel.dispose();
    descriptionFocusNode?.dispose();
    descriptionTextController?.dispose();

    textFieldFocusNode1?.dispose();
    textController2?.dispose();

    textFieldFocusNode2?.dispose();
    textController3?.dispose();

    textFieldFocusNode3?.dispose();
    textController4?.dispose();

    loadingModel.dispose();
  }
}
