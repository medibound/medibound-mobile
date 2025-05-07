import '/flutter_flow/flutter_flow_util.dart';
import 'mobile_auth_page_widget.dart' show MobileAuthPageWidget;
import 'package:medibound_portal_hdztzw/flutter_flow/flutter_flow_util.dart'
    as medibound_portal_hdztzw_util
    show wrapWithModel, createModel, FlutterFlowDynamicModels;
import 'package:medibound_portal_hdztzw/utils/logo/logo_widget.dart'
    as medibound_portal_hdztzw;
import 'package:flutter/material.dart';

class MobileAuthPageModel extends FlutterFlowModel<MobileAuthPageWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for Logo component.
  late medibound_portal_hdztzw.LogoModel logoModel;

  @override
  void initState(BuildContext context) {
    logoModel = medibound_portal_hdztzw_util.createModel(
        context, () => medibound_portal_hdztzw.LogoModel());
  }

  @override
  void dispose() {
    logoModel.dispose();
  }
}
