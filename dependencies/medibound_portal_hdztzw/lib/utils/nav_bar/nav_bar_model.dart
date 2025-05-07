import '/auth/firebase_auth/auth_util.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/utils/creator_logo/creator_logo_widget.dart';
import '/utils/menu_tile/menu_tile_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'nav_bar_widget.dart' show NavBarWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NavBarModel extends FlutterFlowModel<NavBarWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for CreatorLogo component.
  late CreatorLogoModel creatorLogoModel;
  // Models for MenuTile dynamic component.
  late FlutterFlowDynamicModels<MenuTileModel> menuTileModels;

  @override
  void initState(BuildContext context) {
    creatorLogoModel = createModel(context, () => CreatorLogoModel());
    menuTileModels = FlutterFlowDynamicModels(() => MenuTileModel());
  }

  @override
  void dispose() {
    creatorLogoModel.dispose();
    menuTileModels.dispose();
  }
}
