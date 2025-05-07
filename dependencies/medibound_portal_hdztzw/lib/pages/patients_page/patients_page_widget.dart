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
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'patients_page_model.dart';
export 'patients_page_model.dart';

class PatientsPageWidget extends StatefulWidget {
  const PatientsPageWidget({
    super.key,
    required this.organizations,
  });

  final List<OrganizationsRecord>? organizations;

  @override
  State<PatientsPageWidget> createState() => _PatientsPageWidgetState();
}

class _PatientsPageWidgetState extends State<PatientsPageWidget>
    with TickerProviderStateMixin {
  late PatientsPageModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PatientsPageModel());

    animationsMap.addAll({
      'paginatedDataTableOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 150.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
    });

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

    return Container(
      decoration: BoxDecoration(),
      child: Container(
        decoration: BoxDecoration(),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                decoration: BoxDecoration(),
                alignment: AlignmentDirectional(0.0, -1.0),
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Patient Suite',
                              textAlign: TextAlign.start,
                              style: FlutterFlowTheme.of(context)
                                  .headlineMedium
                                  .override(
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
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(),
                              ),
                            ),
                            if (FFAppState().selectedOrganization.uid != null &&
                                FFAppState().selectedOrganization.uid != '')
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Builder(
                                    builder: (context) => FFButtonWidget(
                                      onPressed: () async {
                                        await showDialog(
                                          context: context,
                                          builder: (dialogContext) {
                                            return Dialog(
                                              elevation: 0,
                                              insetPadding: EdgeInsets.zero,
                                              backgroundColor:
                                                  Colors.transparent,
                                              alignment:
                                                  AlignmentDirectional(0.0, 0.0)
                                                      .resolve(
                                                          Directionality.of(
                                                              context)),
                                              child: Container(
                                                height: 350.0,
                                                width: 500.0,
                                                child: DialogBoxWidget(
                                                  widget: () =>
                                                      AddPatientWidget(
                                                    organization: widget!
                                                        .organizations!
                                                        .where((e) =>
                                                            e.reference.id ==
                                                            FFAppState()
                                                                .selectedOrganization
                                                                .uid)
                                                        .toList()
                                                        .firstOrNull!,
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                      text: 'Add Patient',
                                      icon: Icon(
                                        Icons.add_rounded,
                                        size: 16.0,
                                      ),
                                      options: FFButtonOptions(
                                        height: 42.5,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              font: GoogleFonts.rubik(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontStyle,
                                              ),
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .fontStyle,
                                            ),
                                        elevation: 0.0,
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        hoverColor: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        hoverTextColor:
                                            FlutterFlowTheme.of(context)
                                                .secondary,
                                        hoverElevation: 0.0,
                                      ),
                                    ),
                                  ),
                                  Builder(
                                    builder: (context) => FFButtonWidget(
                                      onPressed: () async {
                                        _model.emails = await actions
                                            .pickCSVAndExtractEmails();
                                        if (_model.emails != null &&
                                            (_model.emails)!.isNotEmpty) {
                                          await showDialog(
                                            context: context,
                                            builder: (dialogContext) {
                                              return Dialog(
                                                elevation: 0,
                                                insetPadding: EdgeInsets.zero,
                                                backgroundColor:
                                                    Colors.transparent,
                                                alignment: AlignmentDirectional(
                                                        0.0, 0.0)
                                                    .resolve(Directionality.of(
                                                        context)),
                                                child: Container(
                                                  height: 600.0,
                                                  width: 900.0,
                                                  child: DialogBoxWidget(
                                                    widget: () =>
                                                        ConfirmPatientsWidget(
                                                      emails: _model.emails!,
                                                      organization: widget!
                                                          .organizations!
                                                          .where((e) =>
                                                              e.reference.id ==
                                                              FFAppState()
                                                                  .selectedOrganization
                                                                  .uid)
                                                          .toList()
                                                          .firstOrNull!,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        }

                                        safeSetState(() {});
                                      },
                                      text: 'Upload CSV',
                                      icon: Icon(
                                        Icons.upload_rounded,
                                        size: 16.0,
                                      ),
                                      options: FFButtonOptions(
                                        height: 42.5,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .secondary,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              font: GoogleFonts.rubik(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontStyle,
                                              ),
                                              color: Colors.white,
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .fontStyle,
                                              lineHeight: 1.0,
                                            ),
                                        elevation: 0.0,
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                    ),
                                  ),
                                ].divide(SizedBox(width: 10.0)),
                              ),
                          ].divide(SizedBox(width: 10.0)),
                        ),
                      ].divide(SizedBox(height: 20.0)),
                    ),
                  ),
                ),
              ),
              if (FFAppState().selectedOrganization.uid != null &&
                  FFAppState().selectedOrganization.uid != '')
                StreamBuilder<List<PatientsRecord>>(
                  stream: queryPatientsRecord(
                    parent: widget!.organizations
                        ?.where((e) =>
                            e.reference.id ==
                            FFAppState().selectedOrganization.uid)
                        .toList()
                        ?.firstOrNull
                        ?.reference,
                  ),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 25.0,
                          height: 25.0,
                          child: SpinKitPulse(
                            color: FlutterFlowTheme.of(context).primary,
                            size: 25.0,
                          ),
                        ),
                      );
                    }
                    List<PatientsRecord> containerPatientsRecordList =
                        snapshot.data!;

                    return Container(
                      decoration: BoxDecoration(),
                      child: Visibility(
                        visible: FFAppState().selectedOrganization != null,
                        child: Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Builder(
                            builder: (context) {
                              final list = containerPatientsRecordList.toList();

                              return FlutterFlowDataTable<PatientsRecord>(
                                controller: _model.paginatedDataTableController,
                                data: list,
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
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .labelLarge
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelLarge
                                                        .fontStyle,
                                              ),
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .labelLarge
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
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
                                        'Last Name',
                                        style: FlutterFlowTheme.of(context)
                                            .labelLarge
                                            .override(
                                              font: GoogleFonts.rubik(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .labelLarge
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelLarge
                                                        .fontStyle,
                                              ),
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .labelLarge
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
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
                                        'First Name',
                                        style: FlutterFlowTheme.of(context)
                                            .labelLarge
                                            .override(
                                              font: GoogleFonts.rubik(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .labelLarge
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelLarge
                                                        .fontStyle,
                                              ),
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .labelLarge
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
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
                                        'Gender',
                                        style: FlutterFlowTheme.of(context)
                                            .labelLarge
                                            .override(
                                              font: GoogleFonts.rubik(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .labelLarge
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelLarge
                                                        .fontStyle,
                                              ),
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .labelLarge
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
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
                                        'Status',
                                        style: FlutterFlowTheme.of(context)
                                            .labelLarge
                                            .override(
                                              font: GoogleFonts.rubik(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .labelLarge
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelLarge
                                                        .fontStyle,
                                              ),
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .labelLarge
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
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
                                        'Action',
                                        style: FlutterFlowTheme.of(context)
                                            .labelLarge
                                            .override(
                                              font: GoogleFonts.rubik(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .labelLarge
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelLarge
                                                        .fontStyle,
                                              ),
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .labelLarge
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelLarge
                                                      .fontStyle,
                                            ),
                                      ),
                                    ),
                                  ),
                                ],
                                dataRowBuilder: (listItem, listIndex, selected,
                                        onSelectChanged) =>
                                    DataRow(
                                  color: MaterialStateProperty.all(
                                    listIndex % 2 == 0
                                        ? FlutterFlowTheme.of(context).alternate
                                        : FlutterFlowTheme.of(context)
                                            .customColor1,
                                  ),
                                  cells: [
                                    AutoSizeText(
                                      listItem.email.maybeHandleOverflow(
                                        maxChars: 15,
                                        replacement: '…',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.rubik(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                    Container(),
                                    Container(),
                                    Container(),
                                    StatusTokenWidget(
                                      key: Key(
                                          'Keyg6m_${listIndex}_of_${list.length}'),
                                      status: FFAppState()
                                          .PatientStatus
                                          .where(
                                              (e) => e.code == listItem.status)
                                          .toList()
                                          .firstOrNull,
                                    ),
                                    Builder(
                                      builder: (context) {
                                        if (listItem.status == 'invited') {
                                          return Container(
                                            decoration: BoxDecoration(),
                                            child: AnimatedOpacity(
                                              opacity: () {
                                                if (listItem.lastResend ==
                                                    null) {
                                                  return 0.5;
                                                } else if (listItem.lastResend!
                                                        .secondsSinceEpoch >
                                                    (getCurrentTimestamp
                                                            .secondsSinceEpoch -
                                                        15)) {
                                                  return 0.5;
                                                } else {
                                                  return 1.0;
                                                }
                                              }(),
                                              duration: 300.0.ms,
                                              curve: Curves.easeInOut,
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                  _model.orgRef =
                                                      await OrganizationsRecord
                                                          .getDocumentOnce(listItem
                                                              .parentReference);
                                                  if (listItem.lastResend!
                                                          .secondsSinceEpoch <
                                                      (getCurrentTimestamp
                                                              .secondsSinceEpoch -
                                                          15)) {
                                                    try {
                                                      final result =
                                                          await FirebaseFunctions
                                                                  .instanceFor(
                                                                      region:
                                                                          'us-central1')
                                                              .httpsCallable(
                                                                  'sendPatientInviteEmail')
                                                              .call({
                                                        "orgName": _model
                                                            .orgRef!
                                                            .profile
                                                            .displayName,
                                                        "orgId": _model.orgRef!
                                                            .profile.uid,
                                                        "patientId":
                                                            listItem.uid,
                                                        "email": listItem.email,
                                                      });
                                                      _model.emailOutput =
                                                          SendPatientInviteEmailCloudFunctionCallResponse(
                                                        succeeded: true,
                                                      );
                                                    } on FirebaseFunctionsException catch (error) {
                                                      _model.emailOutput =
                                                          SendPatientInviteEmailCloudFunctionCallResponse(
                                                        errorCode: error.code,
                                                        succeeded: false,
                                                      );
                                                    }

                                                    await listItem.reference
                                                        .update({
                                                      ...mapToFirestore(
                                                        {
                                                          'last_resend': FieldValue
                                                              .serverTimestamp(),
                                                        },
                                                      ),
                                                    });
                                                  }

                                                  safeSetState(() {});
                                                },
                                                text: 'Resend Invite',
                                                icon: Icon(
                                                  Icons.send_rounded,
                                                  size: 16.0,
                                                ),
                                                options: FFButtonOptions(
                                                  height: 40.0,
                                                  padding: EdgeInsets.all(0.0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: Color(0x00E0E3E7),
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .titleSmall
                                                      .override(
                                                        font: GoogleFonts.rubik(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .fontStyle,
                                                      ),
                                                  elevation: 0.0,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          2.0),
                                                  hoverTextColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondary,
                                                  hoverElevation: 0.0,
                                                ),
                                              ),
                                            ),
                                          );
                                        } else {
                                          return Container(
                                            decoration: BoxDecoration(),
                                            child: AnimatedOpacity(
                                              opacity: () {
                                                if (listItem.lastResend ==
                                                    null) {
                                                  return 0.5;
                                                } else if (listItem.lastResend!
                                                        .secondsSinceEpoch >
                                                    (getCurrentTimestamp
                                                            .secondsSinceEpoch -
                                                        15)) {
                                                  return 0.5;
                                                } else {
                                                  return 1.0;
                                                }
                                              }(),
                                              duration: 300.0.ms,
                                              curve: Curves.easeInOut,
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                  _model.orgRef2 =
                                                      await OrganizationsRecord
                                                          .getDocumentOnce(listItem
                                                              .parentReference);

                                                  safeSetState(() {});
                                                },
                                                text: 'Acesss Record',
                                                icon: Icon(
                                                  FFIcons.kpersonrecord,
                                                  size: 16.0,
                                                ),
                                                options: FFButtonOptions(
                                                  height: 40.0,
                                                  padding: EdgeInsets.all(0.0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: Color(0x00E0E3E7),
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .titleSmall
                                                      .override(
                                                        font: GoogleFonts.rubik(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .fontStyle,
                                                      ),
                                                  elevation: 0.0,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          2.0),
                                                  hoverElevation: 0.0,
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                      },
                                    ),
                                  ].map((c) => DataCell(c)).toList(),
                                ),
                                paginated: true,
                                selectable: false,
                                hidePaginator: false,
                                showFirstLastButtons: true,
                                height: 400.0,
                                headingRowHeight: 56.0,
                                dataRowHeight: 48.0,
                                columnSpacing: 20.0,
                                headingRowColor:
                                    FlutterFlowTheme.of(context).alternate,
                                borderRadius: BorderRadius.circular(10.0),
                                addHorizontalDivider: true,
                                addTopAndBottomDivider: false,
                                hideDefaultHorizontalDivider: true,
                                horizontalDividerColor:
                                    FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                horizontalDividerThickness: 0.0,
                                addVerticalDivider: false,
                              ).animateOnPageLoad(animationsMap[
                                  'paginatedDataTableOnPageLoadAnimation']!);
                            },
                          ),
                        ),
                      ),
                    );
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}
