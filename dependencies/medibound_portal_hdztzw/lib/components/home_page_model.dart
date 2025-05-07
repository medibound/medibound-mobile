import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/utils/nav_bar/nav_bar_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'home_page_widget.dart' show HomePageWidget;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  Local state fields for this component.

  List<OrganizationsRecord> emptyOrganizations = [];
  void addToEmptyOrganizations(OrganizationsRecord item) =>
      emptyOrganizations.add(item);
  void removeFromEmptyOrganizations(OrganizationsRecord item) =>
      emptyOrganizations.remove(item);
  void removeAtIndexFromEmptyOrganizations(int index) =>
      emptyOrganizations.removeAt(index);
  void insertAtIndexInEmptyOrganizations(int index, OrganizationsRecord item) =>
      emptyOrganizations.insert(index, item);
  void updateEmptyOrganizationsAtIndex(
          int index, Function(OrganizationsRecord) updateFn) =>
      emptyOrganizations[index] = updateFn(emptyOrganizations[index]);

  ///  State fields for stateful widgets in this component.

  // Model for NavBar component.
  late NavBarModel navBarModel;

  @override
  void initState(BuildContext context) {
    navBarModel = createModel(context, () => NavBarModel());
  }

  @override
  void dispose() {
    navBarModel.dispose();
  }
}
