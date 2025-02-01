import '/flutter_flow/flutter_flow_util.dart';
import 'recover_account_page_widget.dart' show RecoverAccountPageWidget;
import 'package:flutter/material.dart';

class RecoverAccountPageModel
    extends FlutterFlowModel<RecoverAccountPageWidget> {
  ///  State fields for stateful widgets in this page.

  final shortcutsFocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for Email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  String? _emailTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Email Address is required';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Has to be a valid email address.';
    }
    return null;
  }

  @override
  void initState(BuildContext context) {
    shortcutsFocusNode.requestFocus();
    emailTextControllerValidator = _emailTextControllerValidator;
  }

  @override
  void dispose() {
    emailFocusNode?.dispose();
    emailTextController?.dispose();
  }
}
