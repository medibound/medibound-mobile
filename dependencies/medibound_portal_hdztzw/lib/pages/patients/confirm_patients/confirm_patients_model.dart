import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/custom_cloud_functions/custom_cloud_function_response_manager.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/utils/status_token/status_token_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'confirm_patients_widget.dart' show ConfirmPatientsWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:collection/collection.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ConfirmPatientsModel extends FlutterFlowModel<ConfirmPatientsWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController = FlutterFlowDataTableController<String>();
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<PatientsRecord>? emailCheck;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  PatientsRecord? patientDoc;
  // Stores action output result for [Cloud Function - sendPatientInviteEmail] action in Button widget.
  SendPatientInviteEmailCloudFunctionCallResponse? outputEmail2;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    paginatedDataTableController.dispose();
  }
}
