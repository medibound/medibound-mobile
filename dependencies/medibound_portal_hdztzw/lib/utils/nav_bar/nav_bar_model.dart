import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/utils/creator_logo/creator_logo_widget.dart';
import '/utils/menu_tile/menu_tile_widget.dart';
import 'dart:ui';
import 'nav_bar_widget.dart' show NavBarWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NavBarModel extends FlutterFlowModel<NavBarWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for CreatorLogo component.
  late CreatorLogoModel creatorLogoModel;
  // Model for MenuTile component.
  late MenuTileModel menuTileModel1;
  // Model for MenuTile component.
  late MenuTileModel menuTileModel2;
  // Model for MenuTile component.
  late MenuTileModel menuTileModel3;
  // Model for MenuTile component.
  late MenuTileModel menuTileModel4;
  // Model for MenuTile component.
  late MenuTileModel menuTileModel5;
  // Model for MenuTile component.
  late MenuTileModel menuTileModel6;
  // Model for MenuTile component.
  late MenuTileModel menuTileModel7;
  // Model for MenuTile component.
  late MenuTileModel menuTileModel8;

  @override
  void initState(BuildContext context) {
    creatorLogoModel = createModel(context, () => CreatorLogoModel());
    menuTileModel1 = createModel(context, () => MenuTileModel());
    menuTileModel2 = createModel(context, () => MenuTileModel());
    menuTileModel3 = createModel(context, () => MenuTileModel());
    menuTileModel4 = createModel(context, () => MenuTileModel());
    menuTileModel5 = createModel(context, () => MenuTileModel());
    menuTileModel6 = createModel(context, () => MenuTileModel());
    menuTileModel7 = createModel(context, () => MenuTileModel());
    menuTileModel8 = createModel(context, () => MenuTileModel());
  }

  @override
  void dispose() {
    creatorLogoModel.dispose();
    menuTileModel1.dispose();
    menuTileModel2.dispose();
    menuTileModel3.dispose();
    menuTileModel4.dispose();
    menuTileModel5.dispose();
    menuTileModel6.dispose();
    menuTileModel7.dispose();
    menuTileModel8.dispose();
  }
}
