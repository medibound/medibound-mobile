import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/device_profiles/create_device_profile/create_device_profile_widget.dart';
import '/utils/doc_guide_block/doc_guide_block_widget.dart';
import '/utils/empty_list/empty_list_widget.dart';
import '/utils/loading/loading_widget.dart';
import '/utils/nav_bar/nav_bar_widget.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'device_profiles_page_widget.dart' show DeviceProfilesPageWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DeviceProfilesPageModel
    extends FlutterFlowModel<DeviceProfilesPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for NavBar component.
  late NavBarModel navBarModel;
  // Model for EmptyList component.
  late EmptyListModel emptyListModel;
  // Model for DocGuideBlock component.
  late DocGuideBlockModel docGuideBlockModel;

  @override
  void initState(BuildContext context) {
    navBarModel = createModel(context, () => NavBarModel());
    emptyListModel = createModel(context, () => EmptyListModel());
    docGuideBlockModel = createModel(context, () => DocGuideBlockModel());
  }

  @override
  void dispose() {
    navBarModel.dispose();
    emptyListModel.dispose();
    docGuideBlockModel.dispose();
  }
}
