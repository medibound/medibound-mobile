import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/custom_cloud_functions/custom_cloud_function_response_manager.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/device_profiles/builder/record_viewer/record_viewer_widget.dart';
import '/pages/devices/device_secret_dialog/device_secret_dialog_widget.dart';
import '/utils/desc_token/desc_token_widget.dart';
import '/utils/dialog_box/dialog_box_widget.dart';
import '/utils/doc_guide_block/doc_guide_block_widget.dart';
import '/utils/dropdown/component_profile_tile/component_profile_tile_widget.dart';
import '/utils/empty/empty_widget.dart';
import '/utils/empty_list/empty_list_widget.dart';
import '/utils/nav_bar/nav_bar_widget.dart';
import 'dart:math';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'manage_device_profiles_page_widget.dart'
    show ManageDeviceProfilesPageWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ManageDeviceProfilesPageModel
    extends FlutterFlowModel<ManageDeviceProfilesPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for NavBar component.
  late NavBarModel navBarModel;
  // Model for DescToken component.
  late DescTokenModel descTokenModel1;
  // Model for DescToken component.
  late DescTokenModel descTokenModel2;
  // Model for DescToken component.
  late DescTokenModel descTokenModel3;
  // Model for DescToken component.
  late DescTokenModel descTokenModel4;
  // Model for DescToken component.
  late DescTokenModel descTokenModel5;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  DeviceRecord? device;
  // Stores action output result for [Cloud Function - createDeviceKey] action in Button widget.
  CreateDeviceKeyCloudFunctionCallResponse? keyOutput;
  // Model for DocGuideBlock component.
  late DocGuideBlockModel docGuideBlockModel;

  @override
  void initState(BuildContext context) {
    navBarModel = createModel(context, () => NavBarModel());
    descTokenModel1 = createModel(context, () => DescTokenModel());
    descTokenModel2 = createModel(context, () => DescTokenModel());
    descTokenModel3 = createModel(context, () => DescTokenModel());
    descTokenModel4 = createModel(context, () => DescTokenModel());
    descTokenModel5 = createModel(context, () => DescTokenModel());
    docGuideBlockModel = createModel(context, () => DocGuideBlockModel());
  }

  @override
  void dispose() {
    navBarModel.dispose();
    descTokenModel1.dispose();
    descTokenModel2.dispose();
    descTokenModel3.dispose();
    descTokenModel4.dispose();
    descTokenModel5.dispose();
    docGuideBlockModel.dispose();
  }
}
