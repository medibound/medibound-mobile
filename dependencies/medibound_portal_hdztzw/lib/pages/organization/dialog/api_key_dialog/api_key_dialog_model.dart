import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'api_key_dialog_widget.dart' show ApiKeyDialogWidget;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ApiKeyDialogModel extends FlutterFlowModel<ApiKeyDialogWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for SecretKey widget.
  FocusNode? secretKeyFocusNode;
  TextEditingController? secretKeyTextController;
  late bool secretKeyVisibility;
  String? Function(BuildContext, String?)? secretKeyTextControllerValidator;

  @override
  void initState(BuildContext context) {
    secretKeyVisibility = false;
  }

  @override
  void dispose() {
    secretKeyFocusNode?.dispose();
    secretKeyTextController?.dispose();
  }
}
