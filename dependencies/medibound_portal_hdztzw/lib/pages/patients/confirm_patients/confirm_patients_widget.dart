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
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:collection/collection.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'confirm_patients_model.dart';
export 'confirm_patients_model.dart';

class ConfirmPatientsWidget extends StatefulWidget {
  const ConfirmPatientsWidget({
    super.key,
    required this.emails,
    required this.organization,
  });

  final List<String>? emails;
  final OrganizationsRecord? organization;

  @override
  State<ConfirmPatientsWidget> createState() => _ConfirmPatientsWidgetState();
}

class _ConfirmPatientsWidgetState extends State<ConfirmPatientsWidget> {
  late ConfirmPatientsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ConfirmPatientsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Stack(
      children: [
        Form(
          key: _model.formKey,
          autovalidateMode: AutovalidateMode.disabled,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Wrap(
                spacing: 0.0,
                runSpacing: 0.0,
                alignment: WrapAlignment.start,
                crossAxisAlignment: WrapCrossAlignment.start,
                direction: Axis.vertical,
                runAlignment: WrapAlignment.start,
                verticalDirection: VerticalDirection.down,
                clipBehavior: Clip.none,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                    child: Text(
                      'Bulk Patients Add',
                      textAlign: TextAlign.start,
                      style: FlutterFlowTheme.of(context).labelMedium.override(
                            font: GoogleFonts.rubik(
                              fontWeight: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .fontStyle,
                            ),
                            color: FlutterFlowTheme.of(context).secondary,
                            letterSpacing: 0.0,
                            fontWeight: FlutterFlowTheme.of(context)
                                .labelMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .fontStyle,
                          ),
                    ),
                  ),
                  Text(
                    'Confirm Patients',
                    textAlign: TextAlign.start,
                    style: FlutterFlowTheme.of(context).headlineMedium.override(
                          font: GoogleFonts.rubik(
                            fontWeight: FlutterFlowTheme.of(context)
                                .headlineMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .headlineMedium
                                .fontStyle,
                          ),
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .headlineMedium
                              .fontWeight,
                          fontStyle: FlutterFlowTheme.of(context)
                              .headlineMedium
                              .fontStyle,
                        ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 24.0),
                    child: Text(
                      'Send them an email to join',
                      textAlign: TextAlign.start,
                      style: FlutterFlowTheme.of(context).labelMedium.override(
                            font: GoogleFonts.rubik(
                              fontWeight: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .fontStyle,
                            ),
                            letterSpacing: 0.0,
                            fontWeight: FlutterFlowTheme.of(context)
                                .labelMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .fontStyle,
                          ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Container(
                  height: 200.0,
                  child: Builder(
                    builder: (context) {
                      final patientsConfirm = widget!.emails!.toList();

                      return FlutterFlowDataTable<String>(
                        controller: _model.paginatedDataTableController,
                        data: patientsConfirm,
                        columnsBuilder: (onSortChanged) => [
                          DataColumn2(
                            label: DefaultTextStyle.merge(
                              softWrap: true,
                              child: Text(
                                'Email',
                                style: FlutterFlowTheme.of(context)
                                    .labelLarge
                                    .override(
                                      font: GoogleFonts.rubik(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .labelLarge
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .labelLarge
                                            .fontStyle,
                                      ),
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .fontStyle,
                                    ),
                              ),
                            ),
                          ),
                          DataColumn2(
                            label: DefaultTextStyle.merge(
                              softWrap: true,
                              child: Text(
                                'Account Status',
                                style: FlutterFlowTheme.of(context)
                                    .labelLarge
                                    .override(
                                      font: GoogleFonts.rubik(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .labelLarge
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .labelLarge
                                            .fontStyle,
                                      ),
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .fontStyle,
                                    ),
                              ),
                            ),
                          ),
                        ],
                        dataRowBuilder: (patientsConfirmItem,
                                patientsConfirmIndex,
                                selected,
                                onSelectChanged) =>
                            DataRow(
                          color: MaterialStateProperty.all(
                            patientsConfirmIndex % 2 == 0
                                ? FlutterFlowTheme.of(context).alternate
                                : FlutterFlowTheme.of(context).customColor1,
                          ),
                          cells: [
                            Text(
                              patientsConfirmItem,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.rubik(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            ),
                            StreamBuilder<List<UsersRecord>>(
                              stream: queryUsersRecord(
                                queryBuilder: (usersRecord) =>
                                    usersRecord.where(
                                  'email',
                                  isEqualTo: patientsConfirmItem,
                                ),
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 25.0,
                                      height: 25.0,
                                      child: SpinKitPulse(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        size: 25.0,
                                      ),
                                    ),
                                  );
                                }
                                List<UsersRecord> containerUsersRecordList =
                                    snapshot.data!;

                                return Container(
                                  decoration: BoxDecoration(),
                                  child: StatusTokenWidget(
                                    key: Key(
                                        'Keyywl_${patientsConfirmIndex}_of_${patientsConfirm.length}'),
                                    status: FFAppState()
                                        .RegistrationStatus
                                        .where((e) =>
                                            e.code ==
                                            ((containerUsersRecordList
                                                        .isNotEmpty) ==
                                                    true
                                                ? 'registered'
                                                : 'unregistered'))
                                        .toList()
                                        .firstOrNull,
                                  ),
                                );
                              },
                            ),
                          ].map((c) => DataCell(c)).toList(),
                        ),
                        paginated: true,
                        selectable: false,
                        hidePaginator: false,
                        showFirstLastButtons: true,
                        headingRowHeight: 56.0,
                        dataRowHeight: 48.0,
                        columnSpacing: 20.0,
                        headingRowColor: FlutterFlowTheme.of(context).alternate,
                        borderRadius: BorderRadius.circular(8.0),
                        addHorizontalDivider: true,
                        addTopAndBottomDivider: false,
                        hideDefaultHorizontalDivider: true,
                        horizontalDividerColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        horizontalDividerThickness: 0.0,
                        addVerticalDivider: false,
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          await actions.eachString(
                            (stringParam) async {
                              _model.emailCheck = await queryPatientsRecordOnce(
                                parent: widget!.organization?.reference,
                                queryBuilder: (patientsRecord) =>
                                    patientsRecord.where(
                                  'email',
                                  isEqualTo: stringParam,
                                ),
                              );
                              if ((_model.emailCheck != null &&
                                      (_model.emailCheck)!.isNotEmpty) ==
                                  false) {
                                var patientsRecordReference =
                                    PatientsRecord.createDoc(
                                        widget!.organization!.reference);
                                await patientsRecordReference.set({
                                  ...createPatientsRecordData(
                                    email: stringParam,
                                    status: 'invited',
                                  ),
                                  ...mapToFirestore(
                                    {
                                      'last_resend':
                                          FieldValue.serverTimestamp(),
                                    },
                                  ),
                                });
                                _model.patientDoc =
                                    PatientsRecord.getDocumentFromData({
                                  ...createPatientsRecordData(
                                    email: stringParam,
                                    status: 'invited',
                                  ),
                                  ...mapToFirestore(
                                    {
                                      'last_resend': DateTime.now(),
                                    },
                                  ),
                                }, patientsRecordReference);

                                await _model.patientDoc!.reference
                                    .update(createPatientsRecordData(
                                  uid: _model.patientDoc?.reference.id,
                                ));
                                try {
                                  final result = await FirebaseFunctions
                                          .instanceFor(region: 'us-central1')
                                      .httpsCallable('sendPatientInviteEmail')
                                      .call({
                                    "orgName": widget!
                                        .organization!.profile.displayName,
                                    "orgId": widget!.organization!.profile.uid,
                                    "patientId": _model.patientDoc!.uid,
                                    "email": _model.patientDoc!.email,
                                  });
                                  _model.outputEmail2 =
                                      SendPatientInviteEmailCloudFunctionCallResponse(
                                    succeeded: true,
                                  );
                                } on FirebaseFunctionsException catch (error) {
                                  _model.outputEmail2 =
                                      SendPatientInviteEmailCloudFunctionCallResponse(
                                    errorCode: error.code,
                                    succeeded: false,
                                  );
                                }
                              }
                            },
                            widget!.emails!.toList(),
                          );
                          Navigator.pop(context);

                          safeSetState(() {});
                        },
                        text: 'Invite All Patients',
                        options: FFButtonOptions(
                          height: 42.5,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).secondary,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    font: GoogleFonts.rubik(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                    color: Colors.white,
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                          elevation: 0.0,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ].divide(SizedBox(width: 10.0)),
                ),
              ),
            ].divide(SizedBox(height: 10.0)),
          ),
        ),
      ],
    );
  }
}
