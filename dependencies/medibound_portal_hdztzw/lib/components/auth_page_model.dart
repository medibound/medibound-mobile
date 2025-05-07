import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/utils/auth_header/auth_header_widget.dart';
import 'dart:ui';
import 'auth_page_widget.dart' show AuthPageWidget;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AuthPageModel extends FlutterFlowModel<AuthPageWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for AuthHeader component.
  late AuthHeaderModel authHeaderModel;

  @override
  void initState(BuildContext context) {
    authHeaderModel = createModel(context, () => AuthHeaderModel());
  }

  @override
  void dispose() {
    authHeaderModel.dispose();
  }
}
