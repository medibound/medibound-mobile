import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/device_profiles/create_device_profile/create_device_profile_widget.dart';
import '/utils/doc_guide_block/doc_guide_block_widget.dart';
import '/utils/empty_list/empty_list_widget.dart';
import '/utils/loading/loading_widget.dart';
import 'dart:math';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'device_studio_page_widget.dart' show DeviceStudioPageWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DeviceStudioPageModel extends FlutterFlowModel<DeviceStudioPageWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for EmptyList component.
  late EmptyListModel emptyListModel;
  // Model for DocGuideBlock component.
  late DocGuideBlockModel docGuideBlockModel;
  // State field(s) for CheckboxListTile widget.
  bool? checkboxListTileValue;

  @override
  void initState(BuildContext context) {
    emptyListModel = createModel(context, () => EmptyListModel());
    docGuideBlockModel = createModel(context, () => DocGuideBlockModel());
  }

  @override
  void dispose() {
    emptyListModel.dispose();
    docGuideBlockModel.dispose();
  }
}
