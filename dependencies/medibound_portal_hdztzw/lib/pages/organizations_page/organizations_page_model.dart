import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/organization/create_organization/create_organization_widget.dart';
import '/pages/organization/tiles/organization_tile/organization_tile_widget.dart';
import '/utils/dialog_box/dialog_box_widget.dart';
import '/utils/doc_guide_block/doc_guide_block_widget.dart';
import '/utils/empty_list/empty_list_widget.dart';
import 'dart:math';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'organizations_page_widget.dart' show OrganizationsPageWidget;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OrganizationsPageModel extends FlutterFlowModel<OrganizationsPageWidget> {
  ///  State fields for stateful widgets in this component.

  // Models for OrganizationTile dynamic component.
  late FlutterFlowDynamicModels<OrganizationTileModel> organizationTileModels;
  // Model for DocGuideBlock component.
  late DocGuideBlockModel docGuideBlockModel;
  // Model for EmptyList component.
  late EmptyListModel emptyListModel;

  @override
  void initState(BuildContext context) {
    organizationTileModels =
        FlutterFlowDynamicModels(() => OrganizationTileModel());
    docGuideBlockModel = createModel(context, () => DocGuideBlockModel());
    emptyListModel = createModel(context, () => EmptyListModel());
  }

  @override
  void dispose() {
    organizationTileModels.dispose();
    docGuideBlockModel.dispose();
    emptyListModel.dispose();
  }
}
