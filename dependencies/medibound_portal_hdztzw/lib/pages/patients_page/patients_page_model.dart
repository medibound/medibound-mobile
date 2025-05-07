import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/custom_cloud_functions/custom_cloud_function_response_manager.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/patients/add_patient/add_patient_widget.dart';
import '/pages/patients/confirm_patients/confirm_patients_widget.dart';
import '/utils/dialog_box/dialog_box_widget.dart';
import '/utils/status_token/status_token_widget.dart';
import 'dart:math';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter_animate/flutter_animate.dart';
import 'patients_page_widget.dart' show PatientsPageWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PatientsPageModel extends FlutterFlowModel<PatientsPageWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Custom Action - pickCSVAndExtractEmails] action in Button widget.
  List<String>? emails;
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController =
      FlutterFlowDataTableController<PatientsRecord>();
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  OrganizationsRecord? orgRef;
  // Stores action output result for [Cloud Function - sendPatientInviteEmail] action in Button widget.
  SendPatientInviteEmailCloudFunctionCallResponse? emailOutput;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  OrganizationsRecord? orgRef2;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    paginatedDataTableController.dispose();
  }
}
