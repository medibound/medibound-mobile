import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import 'device_secret_dialog_widget.dart' show DeviceSecretDialogWidget;
import 'package:barcode_widget/barcode_widget.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DeviceSecretDialogModel
    extends FlutterFlowModel<DeviceSecretDialogWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // State field(s) for DeviceId widget.
  FocusNode? deviceIdFocusNode;
  TextEditingController? deviceIdTextController;
  String? Function(BuildContext, String?)? deviceIdTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    deviceIdFocusNode?.dispose();
    deviceIdTextController?.dispose();
  }
}
