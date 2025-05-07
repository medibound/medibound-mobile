import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/utils/auth_header/auth_header_widget.dart';
import '/utils/date_picker/date_picker_widget.dart';
import '/utils/dropdown/component_profile_tile/component_profile_tile_widget.dart';
import '/utils/dropdown/option_dropdown/option_dropdown_widget.dart';
import '/utils/empty/empty_widget.dart';
import '/utils/loading/loading_widget.dart';
import 'dart:math';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'invite_page_model.dart';
export 'invite_page_model.dart';

class InvitePageWidget extends StatefulWidget {
  const InvitePageWidget({
    super.key,
    required this.patientId,
    required this.orgId,
  });

  final String? patientId;
  final String? orgId;

  static String routeName = 'InvitePage';
  static String routePath = '/invite';
  static void maybeSetRouteName(String? updatedRouteName) =>
      routeName = updatedRouteName ?? routeName;
  static void maybeSetRoutePath(String? updatedRoutePath) =>
      routePath = updatedRoutePath ?? routePath;

  @override
  State<InvitePageWidget> createState() => _InvitePageWidgetState();
}

class _InvitePageWidgetState extends State<InvitePageWidget>
    with TickerProviderStateMixin {
  late InvitePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InvitePageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if ((widget!.patientId != null && widget!.patientId != '') &&
          (widget!.orgId != null && widget!.orgId != '')) {
        _model.organization = await queryOrganizationsRecordOnce(
          queryBuilder: (organizationsRecord) => organizationsRecord.where(
            'profile.uid',
            isEqualTo: widget!.orgId,
          ),
          limit: 1,
        );
        if (_model.organization != null && (_model.organization)!.isNotEmpty) {
          _model.patient = await queryPatientsRecordOnce(
            parent: _model.organization?.firstOrNull?.reference,
            queryBuilder: (patientsRecord) => patientsRecord.where(
              'uid',
              isEqualTo: widget!.patientId,
            ),
            limit: 1,
          );
          if (_model.patient != null && (_model.patient)!.isNotEmpty) {
            if (_model.patient?.firstOrNull?.status == 'invited') {
              _model.userConfirm = await queryUsersRecordOnce(
                queryBuilder: (usersRecord) => usersRecord.where(
                  'email',
                  isEqualTo: _model.patient?.firstOrNull?.email,
                ),
                limit: 1,
              );
              if (!(_model.userConfirm != null &&
                  (_model.userConfirm)!.isNotEmpty)) {
                _model.loading = false;
                safeSetState(() {});
              } else {
                _model.failed = true;
                safeSetState(() {});
                await showDialog(
                  context: context,
                  builder: (alertDialogContext) {
                    return AlertDialog(
                      title: Text('4'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(alertDialogContext),
                          child: Text('Ok'),
                        ),
                      ],
                    );
                  },
                );
              }
            } else {
              _model.failed = true;
              safeSetState(() {});
              await showDialog(
                context: context,
                builder: (alertDialogContext) {
                  return AlertDialog(
                    title: Text('3'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(alertDialogContext),
                        child: Text('Ok'),
                      ),
                    ],
                  );
                },
              );
            }
          } else {
            _model.failed = true;
            safeSetState(() {});
            await showDialog(
              context: context,
              builder: (alertDialogContext) {
                return AlertDialog(
                  title: Text('2'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(alertDialogContext),
                      child: Text('Ok'),
                    ),
                  ],
                );
              },
            );
          }
        } else {
          _model.failed = true;
          safeSetState(() {});
          await showDialog(
            context: context,
            builder: (alertDialogContext) {
              return AlertDialog(
                title: Text('1'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(alertDialogContext),
                    child: Text('Ok'),
                  ),
                ],
              );
            },
          );
        }
      } else {
        _model.failed = true;
        safeSetState(() {});
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return AlertDialog(
              title: Text('0'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(alertDialogContext),
                  child: Text('Ok'),
                ),
              ],
            );
          },
        );
      }
    });

    _model.firstNameTextController ??= TextEditingController();
    _model.firstNameFocusNode ??= FocusNode();
    _model.firstNameFocusNode!.addListener(() => safeSetState(() {}));
    _model.lastNameTextController ??= TextEditingController();
    _model.lastNameFocusNode ??= FocusNode();
    _model.lastNameFocusNode!.addListener(() => safeSetState(() {}));
    _model.passwordTextController ??= TextEditingController();
    _model.passwordFocusNode ??= FocusNode();
    _model.passwordFocusNode!.addListener(() => safeSetState(() {}));
    _model.confirmPasswordTextController ??= TextEditingController();
    _model.confirmPasswordFocusNode ??= FocusNode();
    _model.confirmPasswordFocusNode!.addListener(() => safeSetState(() {}));
    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 870.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 640.0.ms,
            begin: Offset(10.0, 10.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: Stack(
          children: [
            Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      FlutterFlowTheme.of(context).customColor2,
                      FlutterFlowTheme.of(context).primaryBackground
                    ],
                    stops: [0.0, 1.0],
                    begin: AlignmentDirectional(-1.0, -1.0),
                    end: AlignmentDirectional(1.0, 1.0),
                  ),
                ),
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Builder(
                  builder: (context) {
                    if (_model.failed) {
                      return Container(
                        constraints: BoxConstraints(
                          maxWidth: 440.0,
                        ),
                        decoration: BoxDecoration(),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 20.0, 0.0),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Icon(
                                    Icons.error_sharp,
                                    color: FlutterFlowTheme.of(context).error,
                                    size: 48.0,
                                  ),
                                ),
                                Text(
                                  'Invalid Link or Already a Registered User',
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .headlineMedium
                                      .override(
                                        font: GoogleFonts.rubik(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .headlineMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
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
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 4.0, 0.0, 24.0),
                                  child: Text(
                                    'Download the Medibound App to create or manage your accont as well as what organizations have access to your medical records',
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          font: GoogleFonts.rubik(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontStyle,
                                          ),
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Builder(
                                    builder: (context) {
                                      if (false) {
                                        return wrapWithModel(
                                          model: _model.emptyModel,
                                          updateCallback: () =>
                                              safeSetState(() {}),
                                          child: EmptyWidget(),
                                        );
                                      } else {
                                        return FFButtonWidget(
                                          onPressed: () {
                                            print('Button pressed ...');
                                          },
                                          text: 'Download Our App',
                                          options: FFButtonOptions(
                                            height: 42.5,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 16.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
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
                                                BorderRadius.circular(10.0),
                                            hoverColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryBackground,
                                            hoverTextColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondary,
                                            hoverElevation: 0.0,
                                          ),
                                        );
                                      }
                                    },
                                  ),
                                ),
                              ].divide(SizedBox(height: 10.0)),
                            ),
                          ),
                        ),
                      );
                    } else if (_model.loading) {
                      return wrapWithModel(
                        model: _model.loadingModel,
                        updateCallback: () => safeSetState(() {}),
                        child: LoadingWidget(),
                      );
                    } else {
                      return Container(
                        decoration: BoxDecoration(),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              constraints: BoxConstraints(
                                maxWidth: 440.0,
                              ),
                              decoration: BoxDecoration(),
                              child: Container(
                                height: 450.0,
                                child: PageView(
                                  physics: const NeverScrollableScrollPhysics(),
                                  controller: _model.pageViewController ??=
                                      PageController(initialPage: 0),
                                  scrollDirection: Axis.horizontal,
                                  children: [
                                    Form(
                                      key: _model.formKey2,
                                      autovalidateMode:
                                          AutovalidateMode.disabled,
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20.0, 0.0, 20.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Complete Your Profile',
                                              textAlign: TextAlign.start,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineMedium
                                                      .override(
                                                        font: GoogleFonts.rubik(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .headlineMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .headlineMedium
                                                                  .fontStyle,
                                                        ),
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineMedium
                                                                .fontStyle,
                                                      ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 4.0, 0.0, 24.0),
                                              child: Text(
                                                'Let\'s get started by filling out the form below.',
                                                textAlign: TextAlign.start,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          font:
                                                              GoogleFonts.rubik(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontStyle,
                                                          ),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontStyle,
                                                        ),
                                              ),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Flexible(
                                                  flex: 1,
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 10.0,
                                                                0.0, 0.0),
                                                    child: TextFormField(
                                                      controller: _model
                                                          .firstNameTextController,
                                                      focusNode: _model
                                                          .firstNameFocusNode,
                                                      autofocus: false,
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        isDense: true,
                                                        labelText: 'First Name',
                                                        labelStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .rubik(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                  shadows: [
                                                                    Shadow(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .customColor1,
                                                                      offset: Offset(
                                                                          0.0,
                                                                          2.0),
                                                                      blurRadius:
                                                                          40.0,
                                                                    )
                                                                  ],
                                                                  lineHeight:
                                                                      1.0,
                                                                ),
                                                        alignLabelWithHint:
                                                            false,
                                                        hintText: 'Marty',
                                                        hintStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .rubik(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontStyle,
                                                                  lineHeight:
                                                                      1.0,
                                                                ),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0x00000000),
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                        ),
                                                        errorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                        ),
                                                        focusedErrorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                        ),
                                                        filled: true,
                                                        fillColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        contentPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    20.0,
                                                                    19.0,
                                                                    20.0,
                                                                    19.0),
                                                        hoverColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .customColor1,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .rubik(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                                lineHeight: 1.0,
                                                              ),
                                                      keyboardType:
                                                          TextInputType.name,
                                                      cursorColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      validator: _model
                                                          .firstNameTextControllerValidator
                                                          .asValidator(context),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 10.0,
                                                                0.0, 0.0),
                                                    child: TextFormField(
                                                      controller: _model
                                                          .lastNameTextController,
                                                      focusNode: _model
                                                          .lastNameFocusNode,
                                                      autofocus: false,
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        isDense: true,
                                                        labelText: 'Last Name',
                                                        labelStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .rubik(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                  shadows: [
                                                                    Shadow(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .customColor1,
                                                                      offset: Offset(
                                                                          0.0,
                                                                          2.0),
                                                                      blurRadius:
                                                                          40.0,
                                                                    )
                                                                  ],
                                                                  lineHeight:
                                                                      1.0,
                                                                ),
                                                        alignLabelWithHint:
                                                            false,
                                                        hintText: 'McFly',
                                                        hintStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .rubik(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontStyle,
                                                                  lineHeight:
                                                                      1.0,
                                                                ),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0x00000000),
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                        ),
                                                        errorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                        ),
                                                        focusedErrorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                        ),
                                                        filled: true,
                                                        fillColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        contentPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    20.0,
                                                                    19.0,
                                                                    20.0,
                                                                    19.0),
                                                        hoverColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .customColor1,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .rubik(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                                lineHeight: 1.0,
                                                              ),
                                                      keyboardType:
                                                          TextInputType.name,
                                                      cursorColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      validator: _model
                                                          .lastNameTextControllerValidator
                                                          .asValidator(context),
                                                    ),
                                                  ),
                                                ),
                                              ].divide(SizedBox(width: 15.0)),
                                            ),
                                            wrapWithModel(
                                              model: _model.birthDateModel,
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: DatePickerWidget(
                                                label: 'Birth Date',
                                              ),
                                            ),
                                            wrapWithModel(
                                              model: _model.optionDropdownModel,
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: OptionDropdownWidget(
                                                width: 400.0,
                                                label: 'Gender',
                                                optionsList:
                                                    FFAppState().Genders,
                                                onSelected:
                                                    (optionSelected) async {},
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 20.0, 0.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: FFButtonWidget(
                                                      onPressed: () async {
                                                        if (_model.formKey2
                                                                    .currentState ==
                                                                null ||
                                                            !_model.formKey2
                                                                .currentState!
                                                                .validate()) {
                                                          return;
                                                        }
                                                        if (_model
                                                                .birthDateModel
                                                                .datePicked ==
                                                            null) {
                                                          return;
                                                        }
                                                        await _model
                                                            .pageViewController
                                                            ?.nextPage(
                                                          duration: Duration(
                                                              milliseconds:
                                                                  300),
                                                          curve: Curves.ease,
                                                        );
                                                      },
                                                      text: 'Next',
                                                      options: FFButtonOptions(
                                                        height: 42.5,
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    0.0,
                                                                    16.0,
                                                                    0.0),
                                                        iconPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .rubik(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .fontStyle,
                                                                  ),
                                                                  fontSize:
                                                                      14.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontStyle,
                                                                ),
                                                        elevation: 0.0,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                        hoverColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryBackground,
                                                        hoverTextColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                        hoverElevation: 0.0,
                                                      ),
                                                    ),
                                                  ),
                                                ].divide(SizedBox(width: 10.0)),
                                              ),
                                            ),
                                          ].divide(SizedBox(height: 10.0)),
                                        ),
                                      ),
                                    ),
                                    Form(
                                      key: _model.formKey1,
                                      autovalidateMode:
                                          AutovalidateMode.disabled,
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20.0, 0.0, 20.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Secure Your Account',
                                              textAlign: TextAlign.start,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineMedium
                                                      .override(
                                                        font: GoogleFonts.rubik(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .headlineMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .headlineMedium
                                                                  .fontStyle,
                                                        ),
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineMedium
                                                                .fontStyle,
                                                      ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 4.0, 0.0, 24.0),
                                              child: Text(
                                                'Let\'s get started by filling out the form below.',
                                                textAlign: TextAlign.start,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          font:
                                                              GoogleFonts.rubik(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontStyle,
                                                          ),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontStyle,
                                                        ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 10.0, 0.0, 0.0),
                                              child: TextFormField(
                                                controller: _model
                                                    .passwordTextController,
                                                focusNode:
                                                    _model.passwordFocusNode,
                                                autofocus: false,
                                                obscureText:
                                                    !_model.passwordVisibility,
                                                decoration: InputDecoration(
                                                  isDense: true,
                                                  labelText: 'Password',
                                                  labelStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts.rubik(
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                        shadows: [
                                                          Shadow(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .customColor1,
                                                            offset: Offset(
                                                                0.0, 2.0),
                                                            blurRadius: 40.0,
                                                          )
                                                        ],
                                                        lineHeight: 1.0,
                                                      ),
                                                  alignLabelWithHint: false,
                                                  hintText: '\$Delorean123',
                                                  hintStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .labelMedium
                                                      .override(
                                                        font: GoogleFonts.rubik(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontStyle,
                                                        ),
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .fontStyle,
                                                        lineHeight: 1.0,
                                                      ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                  filled: true,
                                                  fillColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .alternate,
                                                  contentPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(20.0, 19.0,
                                                              20.0, 19.0),
                                                  hoverColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .customColor1,
                                                  suffixIcon: InkWell(
                                                    onTap: () => safeSetState(
                                                      () => _model
                                                              .passwordVisibility =
                                                          !_model
                                                              .passwordVisibility,
                                                    ),
                                                    focusNode: FocusNode(
                                                        skipTraversal: true),
                                                    child: Icon(
                                                      _model.passwordVisibility
                                                          ? Icons
                                                              .visibility_outlined
                                                          : Icons
                                                              .visibility_off_outlined,
                                                      size: 14.0,
                                                    ),
                                                  ),
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          font:
                                                              GoogleFonts.rubik(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                          lineHeight: 1.0,
                                                        ),
                                                cursorColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                validator: _model
                                                    .passwordTextControllerValidator
                                                    .asValidator(context),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 10.0, 0.0, 0.0),
                                              child: TextFormField(
                                                controller: _model
                                                    .confirmPasswordTextController,
                                                focusNode: _model
                                                    .confirmPasswordFocusNode,
                                                autofocus: false,
                                                obscureText: !_model
                                                    .confirmPasswordVisibility,
                                                decoration: InputDecoration(
                                                  isDense: true,
                                                  labelText: 'Confirm Password',
                                                  labelStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts.rubik(
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                        shadows: [
                                                          Shadow(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .customColor1,
                                                            offset: Offset(
                                                                0.0, 2.0),
                                                            blurRadius: 40.0,
                                                          )
                                                        ],
                                                        lineHeight: 1.0,
                                                      ),
                                                  alignLabelWithHint: false,
                                                  hintText:
                                                      '\$Delorean123 (Again)',
                                                  hintStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .labelMedium
                                                      .override(
                                                        font: GoogleFonts.rubik(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontStyle,
                                                        ),
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .fontStyle,
                                                        lineHeight: 1.0,
                                                      ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                  filled: true,
                                                  fillColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .alternate,
                                                  contentPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(20.0, 19.0,
                                                              20.0, 19.0),
                                                  hoverColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .customColor1,
                                                  suffixIcon: InkWell(
                                                    onTap: () => safeSetState(
                                                      () => _model
                                                              .confirmPasswordVisibility =
                                                          !_model
                                                              .confirmPasswordVisibility,
                                                    ),
                                                    focusNode: FocusNode(
                                                        skipTraversal: true),
                                                    child: Icon(
                                                      _model.confirmPasswordVisibility
                                                          ? Icons
                                                              .visibility_outlined
                                                          : Icons
                                                              .visibility_off_outlined,
                                                      size: 14.0,
                                                    ),
                                                  ),
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          font:
                                                              GoogleFonts.rubik(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                          lineHeight: 1.0,
                                                        ),
                                                cursorColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                validator: _model
                                                    .confirmPasswordTextControllerValidator
                                                    .asValidator(context),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 20.0, 0.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: FFButtonWidget(
                                                      onPressed: () async {
                                                        await _model
                                                            .pageViewController
                                                            ?.previousPage(
                                                          duration: Duration(
                                                              milliseconds:
                                                                  300),
                                                          curve: Curves.ease,
                                                        );
                                                      },
                                                      text: 'Back',
                                                      options: FFButtonOptions(
                                                        height: 40.0,
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    0.0,
                                                                    16.0,
                                                                    0.0),
                                                        iconPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        color:
                                                            Color(0x00E0E3E7),
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .rubik(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondary,
                                                                  fontSize:
                                                                      14.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontStyle,
                                                                ),
                                                        elevation: 0.0,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                        hoverColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryBackground,
                                                        hoverTextColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                        hoverElevation: 0.0,
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: FFButtonWidget(
                                                      onPressed: () async {
                                                        if (_model.formKey1
                                                                    .currentState ==
                                                                null ||
                                                            !_model.formKey1
                                                                .currentState!
                                                                .validate()) {
                                                          return;
                                                        }
                                                        await _model
                                                            .pageViewController
                                                            ?.nextPage(
                                                          duration: Duration(
                                                              milliseconds:
                                                                  300),
                                                          curve: Curves.ease,
                                                        );
                                                      },
                                                      text: 'Next',
                                                      options: FFButtonOptions(
                                                        height: 42.5,
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    0.0,
                                                                    16.0,
                                                                    0.0),
                                                        iconPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .rubik(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .fontStyle,
                                                                  ),
                                                                  fontSize:
                                                                      14.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontStyle,
                                                                ),
                                                        elevation: 0.0,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                        hoverColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryBackground,
                                                        hoverTextColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                        hoverElevation: 0.0,
                                                      ),
                                                    ),
                                                  ),
                                                ].divide(SizedBox(width: 10.0)),
                                              ),
                                            ),
                                          ].divide(SizedBox(height: 10.0)),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20.0, 0.0, 20.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Connect Your Records',
                                            textAlign: TextAlign.start,
                                            style: FlutterFlowTheme.of(context)
                                                .headlineMedium
                                                .override(
                                                  font: GoogleFonts.rubik(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .headlineMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .headlineMedium
                                                            .fontStyle,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .headlineMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .headlineMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 4.0, 0.0, 24.0),
                                            child: Text(
                                              'Sync your medical records with your EHR for sharing',
                                              textAlign: TextAlign.start,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        font: GoogleFonts.rubik(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontStyle,
                                                        ),
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .fontStyle,
                                                      ),
                                            ),
                                          ),
                                          Builder(
                                            builder: (context) {
                                              final integrations = FFAppState()
                                                  .IntegrationProfiles
                                                  .toList();

                                              return ListView.builder(
                                                padding: EdgeInsets.zero,
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                itemCount: integrations.length,
                                                itemBuilder: (context,
                                                    integrationsIndex) {
                                                  final integrationsItem =
                                                      integrations[
                                                          integrationsIndex];
                                                  return Container(
                                                    decoration: BoxDecoration(),
                                                    child:
                                                        ComponentProfileTileWidget(
                                                      key: Key(
                                                          'Keyiso_${integrationsIndex}_of_${integrations.length}'),
                                                      display: integrationsItem
                                                          .displayName,
                                                      subtitle: 'Provider',
                                                      photoUrl: integrationsItem
                                                          .photoUrl,
                                                      height: 50.0,
                                                      widget: () =>
                                                          EmptyWidget(),
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                          wrapWithModel(
                                            model: _model
                                                .componentProfileTileModel2,
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child: ComponentProfileTileWidget(
                                              display: 'Other Provider',
                                              subtitle:
                                                  'Over 30+ EHRs Supported',
                                              photoUrl: '',
                                              height: 50.0,
                                              iconFromText: 'hospital',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                              widget: () => EmptyWidget(),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 20.0, 0.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: FFButtonWidget(
                                                    onPressed: () async {
                                                      await _model
                                                          .pageViewController
                                                          ?.previousPage(
                                                        duration: Duration(
                                                            milliseconds: 300),
                                                        curve: Curves.ease,
                                                      );
                                                    },
                                                    text: 'Back',
                                                    options: FFButtonOptions(
                                                      height: 40.0,
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16.0,
                                                                  0.0,
                                                                  16.0,
                                                                  0.0),
                                                      iconPadding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      color: Color(0x00E0E3E7),
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .rubik(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontStyle,
                                                                ),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary,
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .fontStyle,
                                                              ),
                                                      elevation: 0.0,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                      hoverColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryBackground,
                                                      hoverTextColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondary,
                                                      hoverElevation: 0.0,
                                                    ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: FFButtonWidget(
                                                    onPressed: () async {
                                                      await _model
                                                          .pageViewController
                                                          ?.nextPage(
                                                        duration: Duration(
                                                            milliseconds: 300),
                                                        curve: Curves.ease,
                                                      );
                                                    },
                                                    text: 'Next',
                                                    options: FFButtonOptions(
                                                      height: 42.5,
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16.0,
                                                                  0.0,
                                                                  16.0,
                                                                  0.0),
                                                      iconPadding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .rubik(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontStyle,
                                                                ),
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .fontStyle,
                                                              ),
                                                      elevation: 0.0,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                      hoverColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryBackground,
                                                      hoverTextColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondary,
                                                      hoverElevation: 0.0,
                                                    ),
                                                  ),
                                                ),
                                              ].divide(SizedBox(width: 10.0)),
                                            ),
                                          ),
                                        ].divide(SizedBox(height: 10.0)),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20.0, 0.0, 20.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 20.0, 0.0, 0.0),
                                            child: Text(
                                              'Consent Agreement',
                                              textAlign: TextAlign.start,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineMedium
                                                      .override(
                                                        font: GoogleFonts.rubik(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .headlineMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .headlineMedium
                                                                  .fontStyle,
                                                        ),
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineMedium
                                                                .fontStyle,
                                                      ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 4.0, 0.0, 24.0),
                                            child: Text(
                                              'Read the following information regarding how your data will be shared with',
                                              textAlign: TextAlign.start,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        font: GoogleFonts.rubik(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontStyle,
                                                        ),
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .fontStyle,
                                                      ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              height: 100.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.all(10.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Expanded(
                                                      child:
                                                          SingleChildScrollView(
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            RichText(
                                                              textScaler:
                                                                  MediaQuery.of(
                                                                          context)
                                                                      .textScaler,
                                                              text: TextSpan(
                                                                children: [
                                                                  TextSpan(
                                                                    text:
                                                                        'Last update: 08/19/2024\n\nThis “Privacy Policy” explains how we collect, use, protect, and treat the personal information and user data of people using https://www.massivebio.com website and its affiliate websites (“Website”),and services provided there, Synergy-AI Clinical Trial Finder and Cancer Quiz mobile applications (“Mobile Apps”), Clinical Trial Matching, Virtual Tumor Board, Clinical Network, Drug Utilization Optimizer (“DUO“) , Real World Data and other online and off-line applications (“Platforms”), including cancer patients (“you” / “your”), your oncologists, referring physicians, primary investigators and clinic staff, expert oncologists who evaluate your case history and identify options for treatment or clinical trials. From now on, collectively, Website, Mobile Apps, and Platforms are noted as “Solutions”\n\nThe Solutions is operated by Massive Bio (“Company”, “we”, “us” or “our”). Massive Bio is a data analytics firm that provides a medical second opinion and clinical trial matching by evaluating a cancer patient’s existing clinical information, leveraging our proprietary artificial intelligence platform, and providing consulting services to patient’s oncologists by identifying and explaining treatment options that best fit the patient’s medical profile, treatment objectives, and resources (collectively, the “Services”).\n\nThis Privacy Policy covers only information and data collected or processed through the Solutions and not any other information or data collected or processed by third parties who provide products and services in connection with our Solutions, and Services such as health plan administrators, patient assistance administrators (“Service Providers”), or to third-party web pages, or websites, solutions, products, or services to which we link that do not display this Privacy Policy. We are not responsible for the content or privacy practices of other websites, solutions, or online or mobile services. Each user signifies the data practices described in this Privacy Policy and our Terms of Use by using the Solutions.\n\nWe have revised our Privacy Policy to comply with the GDPR, HIPAA, PIPEDA, Data Protection Act, LGPD and local, state, provincial, territorial, and national legislations where the company conducts an activity informing individuals whose personal information, we process on why we need it, how it is used, what their rights are, who the information is disclosed to and what safeguarding measures are in place to protect their data.\n\nTHE COMPANY IS NOT A MEDICAL PROVIDER, NOR IS IT A “COVERED ENTITY” SUBJECT TO STATE OR FEDERAL LAWS GOVERNING THE PRIVACY OF MEDICAL RECORDS OR INFORMATION, INCLUDING THE HEALTH INSURANCE PORTABILITY AND ACCOUNTABILITY ACT OF 1996, COMMONLY REFERRED TO AS “HIPAA”.\n\nI. INFORMATION WE COLLECT\n\n1. Personally identifiable information\n\nOur Solutions and our Service Providers only collect personally identifiable information (“PII”, also referred to as personal data or personal information in some jurisdictions) for our purposes as set out in the next section II. THE CATEGORIES OF PII WE COLLECT FOR OUR PURPOSES AND THE APPLICABLE LEGAL BASIS FOR OUR DATA PROCESSING. Collection of PII occurs if you register for an appointment on the Solutions, subscribe to a newsletter, tweet to us, or use other features and resources on the Solutions. You may visit our Site anonymously, but that may prevent you from accessing certain features or Services or Solutions.\nA. Your patient profile\nB. Health provider profiles\nC. Service Provider profiles\n\nMedical Information Released to Company:\n\nThrough EMR platforms APIs\nThrough the EMR platform, online pages shared by you\nThrough EMR platform online pages accessed by Company’s corporate accounts with your authorization to see your PII\nThrough emails, SMS, any chat application, Whatsapp or other means of communication channels\n2. Protected Health Information and Sensitive Personal Information\n\nWe will collect and store sensitive personal information and data about you.\n\n3. Non-Personally Identifiable Information\n\nOur Website, Solutions, and Service Providers may also collect non-personally identifiable (anonymous) information (“Non-PII”) from visitors, including cancer patients, health care providers, staff, clinical staff, oncology experts, data analysts, and health plan administrators. Non personally identifiable information is any information that cannot be directly or indirectly associated with you.\n\n4. Cookies\n\n“Cookies” are short computer codes known as cookies, web beacons, and other technologies that collect and store both PII and Non-PII when you visit our Solutions, or share Website content or solutions through a social media account. The following are examples of information we or third-party service providers collect with cookies:\n\nCookies that may uniquely identify your browser session and the other website, solutions\nyou have visited\nBrowser type and operating system\nHardware settings\nDate and time of visit\nWebsite pages you visited\nWeb page that referred you to Company\nWeb pages your visit after leaving the website\n5. Social Media\n\nWe may collect information through our presence on social media and networking platforms. You may use social networks or other online services to sign into the Solutions. When you do so, information from those services may be made available to us. By associating a social network account with the Solutions, we may collect your PII, such as your username and email address.\n\n6. Patient Representatives\n\nA patient can give written, verbal or SMS authorization for a person (for example, a solicitor or relative) to make an application on their behalf. We may withhold access if it is of the view that the patient authorizing the access has not understood the meaning of the authorization. The authorization is only good for 90 days and requires a recording.\n\nNext of kin\n\nDespite the widespread use of the phrase ‘next of kin,’ this is not defined, nor does it have formal legal status. A next of kin cannot give or withhold their consent to sharing information on a patient’s behalf. A next of kin had no right of access to medical records.\n\nCourt Representatives\n\nA person appointed by the court to manage the affairs of a patient who is incapable of managing her experiences may make an application. Access may be denied where the General Practitioner opinion thinks that the patient underwent relevant examinations or investigations to expect the information would not be disclosed to the applicant.\n\n7. Information about You from Other Sources\n\nWe collect personal information about you on the Solutions, and from other sources, including data from your oncologists, oncology practice staff, clinical staff, health claims administrators, and patient benefits organizations. We may combine all information we collect about you to provide Services to you, including data analysis for identifying testing and treatment options and, when de-identified, for our research efforts and to improve our Services and Solutions.\n\nII. THE CATEGORIES OF PII WE COLLECT FOR OUR PURPOSES AND THE APPLICABLE LEGAL BASIS FOR OUR DATA PROCESSING\n\n1. Depending on where you live, how you interact with us, and how we may interact with certain Service Providers, we may collect personal information (PII) about you as set out in the ‘personal information’ column below. You will also find below the purpose of the processing and (for the EEA, UK, Canada, and other countries) the legal basis we rely on for each type of PII that we process about you\n\nPersonal information\n\nPurpose(s)\n\nLegal basis (EEA / UK / Canada / Other Countries)\n\nPatient profile data, such as:\n\nFirst and last name\nHome address\nHome telephone number\nCancer diagnosis\nHealth insurance account numbers\nMedical history\nCancer screenings\nCancer history and treatments\nPathology reports\nYour diagnostic images\nYour clinical information and data\nWe use your patient profile data to:\n\n(i) communicate with you and your oncologist about our Services;\n\n(ii) register you as a patient;\n\n(iii) collect data for patient profile;\n\n(iv) interpretation of genetic profiling data to provide a range of treatment options for difficult or complex cases;\n\n(v) determine patient eligibility for assistance programs for certain out-of-pocket health care costs;\n\n(vi) submitting requests to your health insurer for reimbursement purposes; and\n\n(viii) provide: (a) the Services; (b) guidance and recommendations regarding an array of treatment options ranging from standards of care to experimental treatments; (c) clinical data to support the use of off-label medications; (d) range of various clinical trials appropriate for and convenient to you; and (e) consulting and remote access to bioinformatics and molecular expertise to support your patient presentations at tumor boards.\n\nNecessary for the purpose of our legitimate interests to provide access to the Solutions, provide the Services, maintain an adequate profile administration; and\n\nInsofar it regards health related data: Consent, both as the legal basis (article 6 (UK) GDPR) and as the exemption to process special category data (article 9 (UK) GDPR). Relevant national rules and regulations.\n\nIn compliance with the regulations of the European Economic Area (EEA) and Canada, and as outlined in sections 10 and 11 of the Terms and Conditions , we ensure adherence to applicable laws governing data processing and privacy protection.\n\nHealth provider data, such as:\n\nOncologist first and last name\nOncologist email address\nOncologist employer\nOncologist address\nOncologist telephone number\nOncologist’s notes\nWe use health provider data to:\n\n(i) communicate with health provider;\n\n(ii) register you as health care provider staff, expert oncologist, or practice administrators that assist or support patients.\n\nNecessary for the purpose of our legitimate interests to interact with health providers, to register and to provide the Services to patients.\n\nService Provider Data, such as:\n\nService Provider first and last name\nService Provider email address\nService Provider employer\nService Provider address\nService Provider telephone number\nService Provider work product\nWe use Service Provider data to:\n\n(i) communicate with (potential) Service Provider;\n\n(ii) assess and accept of a (potential) Services Provider;\n\n(iii) conclude and execute an agreement with the Service Provider.\n\nNecessary for the purpose of our legitimate interests to effectively manage our relationships with Service Providers, to interact with (potential) Service Providers.\n\nCookies\n\nPlease see our cookie notice.\n\nPlease see our cookie notice.\n\nSocial media data, such as: username, email address.\n\nFor providing access to your patent profile via your other (social media) profile(s) / account(s).\n\nNecessary for the legitimate interest of offering you multiple options to access out Solutions and use other (social media) accounts to sign into our Services and Solutions.\n\nPlease be aware that:\n\nLoss, misuse, modification, or unauthorized access of your PII, including in particular Sensitive Personal Information can adversely affect your privacy or welfare depending on the level of sensitivity and nature of the information\nYou may refuse to provide your protected health information to Solutions, but you and your health care providers will not be able to use our Services.\nWe do not use cookies that store your Sensitive Personal Information or profile you based on your Sensitive Personal Information.\n2. SMS/MMS Mobile Messaging\n\nWe respect your privacy. We will only use your PII to transmit your mobile messages and respond to you if necessary. This includes, but is not limited to, sharing PII with platform providers, phone companies, and other vendors who assist us in the delivery of mobile messages.\n\nWE DO NOT SELL, RENT, LOAN, TRADE, LEASE, OR OTHERWISE TRANSFER FOR PROFIT ANY PHONE NUMBERS OR CUSTOMER INFORMATION COLLECTED THROUGH THE WEBSITE OR THE SOLUTIONS TO ANY THIRD PARTY.\n\nNonetheless, we always reserve the right to disclose any information as necessary to satisfy any law, regulation, or governmental request, avoid liability, avoid liability, or protect our rights or property (see Section III of this Privacy Notice) in accordance with applicable data protection laws. When you complete forms online or otherwise provide us PII connected to the Services, you agree to provide accurate, complete, and true PII. You agree not to use a false or misleading name or a name that you are not authorized to use. Suppose, in our sole discretion; we believe that any such information is untrue, inaccurate, or incomplete, or you have opted into the program for an ulterior purpose. In that case, we may refuse you access to the program and pursue any appropriate legal remedies.\n\nWe, Service Providers and any third-party agency acting on our behalf may communicate with you and record calls or any communication at such number(s) by phone call, voice message, internet-to-phone message, SMS text message, interactive voice recordings using auto-dial systems, or prerecorded artificial or voice messages (“Communications”) regarding orders, delivery updates, requests for transactional feedback, and other informational purposes.\n\nStandard message, data, voice, or other rates may apply from your landline, mobile service, or wireless device carrier for communications you receive.\n\nYou may also call 1-844-627-7246 to get help at any time.\n\nYou may send any of the following messages in response to an SMS text message to opt-out of receiving further SMS text messages from Company: Stop” or “Unsubscribe.” After sending one of these messages, you might receive one final SMS text message as confirmation of your optout request.\n\nAdditional terms and conditions may be provided to you in the future (e.g., as part of an opt-in confirmation text message), and such terms and conditions will supplement and not replace these\nterms.\n\nYou further represent and warrant that you are the subscriber for the phone number(s) provided, and you possess the phone(s) associated with such number(s). You agree to notify us if your phone number(s) changes or you no longer possess the phone(s) associated with such number(s).\n\nBY PROVIDING YOUR TELEPHONE OR CELL PHONE INFORMATION, YOU KNOWINGLY AND VOLUNTARILY AGREE TO INDEMNIFY, DEFEND, AND COMPANY, ITS PARENTS, SUBSIDIARIES, AFFILIATES, PREDECESSORS, SUCCESSORS, AND ASSIGNS, AND EACH OF THEIR RESPECTIVE OFFICERS, DIRECTORS, EMPLOYEES, AND AGENTS, HARMLESS FROM AND AGAINST ANY AND ALL LOSSES, COMPLAINTS, DEMANDS, CLAIMS, CAUSES OF ACTION, LIABILITIES, COSTS, JUDGMENTS, DAMAGES, FINES, PENALTIES, COMPENSATION, ATTORNEY’S FEES, AND EXPENSES OF ANY KIND, INCLUDING ANY AND ALL TYPES OF INJURIES OR DAMAGES SUFFERED BY YOU, WHICH ARISE AS A RESULT OF (OR ARE RELATED TO) THE COMMUNICATIONS. YOU KNOWINGLY AND VOLUNTARILY AGREE NOT TO USE OR CAUSE ANY LAWSUIT, COMPLAINT, CLAIM, OR CHARGE TO BE FILED ON YOUR BEHALF AGAINST COMPANY OR ITS VENDORS TO CONCERNING ANY SUCH DAMAGES.\n\nWireless carriers are not responsible for delayed or undelivered messages, which may occur due to factors outside carriers’ control.\n\n3. Links to Other Websites\n\nThe Website includes links (the “Linked Sites”) to other websites. In providing access to these Linked Sites, the Company is by no means endorsing the products or services on these Linked Sites. The Company is not responsible for the privacy practices or the content of the Linked Sites at this moment. It, at this moment, expressly disclaims all responsibility and liability associated with the use of the Linked Sites. We recommend that you review the privacy statements posted on those sites to understand their procedures for using and disclosing personal information.\n\nIII. WHEN DO WE SHARE INFORMATION?\n\n1. Service Providers\n\nThe Website includes links (the “Linked Sites”) to other websites. In providing access to these Linked Sites, the Company is by no means endorsing the products or services on these Linked Sites. The Company is not responsible for the privacy practices or the content of the Linked Sites at this moment. It, at this moment, expressly disclaims all responsibility and liability associated with the use of the Linked Sites. We recommend that you review the privacy statements posted on those sites to understand their procedures for using and disclosing personal information.\n\n2. Legal Requirements\n\nUnder certain circumstances, to comply with laws, regulations, judicial or other government subpoenas, warrants, or orders, we may disclose your personal information to respond to any government or regulatory request.\n\nWe may transfer PII to other third parties if we receive your permission or we are required to do so by law, or we have a good faith belief that such disclosure is necessary to comply with a current judicial proceeding, a court order, a legal process served on the Company or to resolve any potential fraud or perceived irregularity in any audits of the accuracy of any documentation or information submitted to the Company by you or on your behalf, as deemed appropriate by the Company.\n\nWe take precautions to safeguard your personal information against loss, theft and misuse and unauthorized access, disclosure, alteration, and destruction through the use of appropriate technical and organizational measures including encryption technologies for data in transit and data at rest. Your personal information may be stored and processed in your region or another country where the Company and their service providers maintain servers and facilities. We take steps, including through contracts (such as the EU Commission approved Standard Contractual Clauses), to ensure that the information continues to be protected wherever it is located, in a manner consistent with the standards of protection required under applicable law.\n\n3. Transfers of Business Assets\n\nSuppose the Company goes through a transaction, such as a merger, being acquired by another entity, bankruptcy, or selling all or a portion of its assets. In that case, your PII may be part of the business assets transferred. We cannot assure that you will be notified in advance of the transfer, if any, of your PII in connection with any such transition or transfer.\n\n4. Protection of Company and Others\n\nWe reserve the right to access, read, preserve, and disclose any information that we reasonably believe is necessary to comply with law or court order; enforce or apply our conditions of use and other agreements; or protect the rights, property, or safety of our Company, employees, users, or others. This includes exchanging information with other companies and organizations for fraud protection and data breach risk reduction.\n\n5. Aggregate or Anonymous Information\n\nWe may share your PII and user data in aggregate or anonymously: to improve our Services, communicate with Service Providers and other third parties, and in our annual report and marketing materials.\n\n6. With Consent\n\nExcept as set forth above, you will be notified when PII may need to be shared with third parties and will be able to prevent the sharing of this information.\n\n7. How we use Non-Personally Identifiable Information (Non-PII)\n\nWe also use Non-PII to monitor and improve our Services and Website quality to tour Services and Website quality, data research and statistical purposes. We use Non-Personally Identifiable Information in consulting Services to other users, for research, and to share, lease, or sell our data and analysis to patient assistance programs, clinical laboratories, cancer screening providers, pharmaceutical manufacturers, and oncologists for improvement of their professional services, screening, and treatment products, and to educate the public about the Services we provide\n\nIV. HOW DO WE MANAGE CHILDREN’S DATA?\n\nChildren of 16 years or over\n\nSubject to local laws, if a mentally competent child is 16 years or over, they are entitled to request or refuse access to their records. If any other individual requests access to these Company, should first check with the patient that he or she is happy for them to be released.\n\nChildren Under 16 Years\n\nUnless otherwise provided by local laws, individuals with parental responsibility for an under 16-year-old will have a right to request access to those medical records. A person with parental responsibility is either:\n\nthe birth mother, or\nthe birth father (if married to the mother at the time of child’s birth, or subsequently) or,\nan individual parental responsibility by a court.\nSuppose the appropriate health professional considers that a child patient is Gillick competent (i.e., has sufficient maturity and understanding to make decisions about disclosure of their records). The child should be asked for their consent before disclosure is given to someone with parental responsibility.\n\nIf the child is not Gillick competent and there is more than one person with parental responsibility, each may independently exercise their right of access. Technically, if a child lives with, for example, its mother and the father apply for access to the child’s records, there is no “obligation” to inform the mother. However, this may not be possible in practical terms, and both parents should be aware of access requests unless there is a good reason not to do so. In all circumstances, good practice dictates that a Gillick competent child should be encouraged to involve parents or other legal guardians in any treatment/disclosure decisions.\n\nV. HOW WE PROTECT AND RETAIN YOUR INFORMATION\n\nWe take security measures to protect against unauthorized access to or unauthorized alteration, disclosure, or data destruction. These include secure socket layers, firewalls and encryption, internal reviews of our data collection, storage and processing practices, security measures, and physical security measures to guard against unauthorized system access. However, because the internet and mobile web are inherently insecure, no information system is 100% secure, and even the most secure system can be compromised; we cannot guarantee security. Suppose we retain PII on our systems or the cloud. In that case, we restrict access to PII to employees, contractors, and agents who need to know that information to operate, develop, or improve our website, solutions, and services. If they fail to meet these obligations, these individuals are bound by confidentiality obligations and may be subject to discipline, including termination.\n\nWe do not keep your PII any longer than necessary for the processing purposes. We retain your personal information for as long as necessary to provide the Services and fulfil the transactions you have requested, or for other essential purposes such as complying with our legal obligations, maintaining business and financial records, resolving disputes, maintaining security, detecting, and preventing fraud and abuse, and enforcing our agreements. Where no specific legal requirement exists, Massive Bio will retain the data for no longer than ten (10) years, unless a shorter period is justified. This period is subject to regular review and may be adjusted to comply with changes in national laws and GDPR guidance. Massive Bio will also ensure that all data subjects are informed about their rights regarding their personal data, including the right to access, rectification, and erasure as per GDPR regulations. We delete and destroy individual records of PII and all Non-PII according to the Schedule below.\n\nPatient profile data\tRetention Period\nEight years after collection.\nHealth provider data\tTwo years after the end of the relationship.\nService Provider data\tTwo years after the end of the relationship.\nCookies\tPlease see our Cookie Notice\nSocial Media data\tEight years after collection.\nWe may retain your PII for the establishment, exercise or defense of legal claims. Also, we may retain your PII to make it available to the supervisory authority, investigative authority, courts, or other governmental body for the period specified by the law.\n\nWe have robust information security policies and procedures in place to protect personal information from unauthorized access, alteration, disclosure, or destruction and have several layers of security measures, including: SSL, access controls, password policy, encryptions, pseudonymization, practices, restriction, IT, authentication, VPN, firewalls, token management\n\nVI. HOW TO CONTROL AND CORRECT YOUR INFORMATION\n\nThe Solutions uses cookies which collect user data as disclosed in Section I and Section II, as set out in our Cookie Notice. You may accept or decline cookies. Most browsers automatically accept cookies. You may elect not to provide users with our Service Providers or providers by following the opt-out procedures set forth below, but you may not be able to access some of our Services.\n\n1. Correcting Your Personal Information\n\nTo gain access to the personal information you collected online and keep it accurate, complete, and current, or to request deletion, you may contact us at compliance@massivebio.com. In some cases, where we are required to retain information by law or regulation to continue to manage a service you have requested, to ensure that we honor your preferences, or for other necessary business purposes, we may not be able to delete certain personal information about you.\n\n2. Control: Your Choices\n\nYou have several options to control how your data is shared and used after you have provided it.\n\nYou choose:\n\nTo store or discard the records you provide to us, and the reports returned to you based on the results of your documents.\nClinical Trials Matching report(s) you view or opt-in to view.\nWhen and with whom do you share your information, including your caregivers, family members, approved family members, health care professionals, or others outside our Services.\nTo delete your Massive Bio Clinical Trial Matching account and data at any time.\nEveryone has the rights below by applying to Company;\na) Learning whether PII is processed or not,\nb) If PII has been processed, requesting information about it,\nc) The purpose of processing PII and whether the purpose of learning uses them,\nd) To know the third parties to whom PII is transferred in the country or abroad,\ne) To want to correction of their data in case of incomplete or incorrect processing of PII,\nf) Deletion or destruction of PII within the framework of the applicable laws,\ng) To request notification of the transactions made under subparagraphs (d) and (e) to third parties to whom PII has been transferred,\nh) Object to the emergence of a result against the person himself by analyzing the processed data exclusively through automated systems,\ni) Request the compensation of the damage in case of loss due to unlawful processing of PII.\n3. Accountability for Onward Transfers\n\nWe will not disclose your PII to unaffiliated third parties without first receiving your permission unless it is required by national security or law enforcement authorities. In cases of onward transfer to third parties of data of EU individuals, we are liable for appropriate onward transfers of PII to third parties.\n\n4. Enforcement\n\nOur company adheres to EU-U.S. Data Privacy Framework Principles, which provides reliable mechanisms for personal data transfers from the European Union, United Kingdom, and Switzerland to the United States. We have self-certified our commitment to these principles, ensuring data protection consistent with EU, UK, and Swiss law. In case of any conflict, our adherence to EU-U.S. Data Privacy Framework Principles takes precedence.\n\nMassive Bio complies with the EU-U.S. Data Privacy Framework (EU-U.S. DPF) and the UK Extension to the EU-U.S. DPF, and the Swiss-U.S. Data Privacy Framework (Swiss-U.S. DPF) as set forth by the U.S. Department of Commerce. Massive Bio, has certified to the U.S. Department of Commerce that it adheres to the EU-U.S. Data Privacy Framework Principles (EU-U.S. DPF Principles) with regard to the processing of personal data received from the European Union and the United Kingdom in reliance on the EU-U.S. DPF and the UK Extension to the EU-U.S. DPF. Massive Bio, has certified to the U.S. Department of Commerce that it adheres to the Swiss-U.S. Data Privacy Framework Principles (Swiss-U.S. DPF Principles) with\nregard to the processing of personal data received from Switzerland in reliance on the Swiss-U.S. DPF. If there is any conflict between the terms in this privacy policy and the EU-U.S. DPF Principles and/or the Swiss-U.S. DPF Principles, the Principles shall govern. To learn more about the Data Privacy Framework (DPF) program, and to view our certification, please visit https://www.dataprivacyframework.gov/\n\nFor any inquiries or complaints you can connect with us;\n\nIn compliance with the EU-U.S. DPF and the UK Extension to the EU-U.S. DPF and the SwissU.S. DPF, Massive Bio commits to resolve DPF Principles-related complaints about our collection and use of your personal information. EU and UK individuals and Swiss individuals with inquiries or complaints regarding our handling of personal data received in reliance on the EU-U.S. DPF and the UK Extension to the EU-U.S. DPF, and the Swiss-U.S. DPF should first\ncontact Massive Bio at:\n\nYou can exercise the rights above by sending an email to: compliance@massivebio.com\n\nContact information of the Data Protection Officer: Cagatay M. Culcuoglu, cculcuoglu@massivebio.com\n\nIn compliance with the EU-U.S. DPF and the UK Extension to the EU-U.S. DPF and the SwissU.S. DPF, Massive Bio commits to cooperate and comply respectively with the advice of the panel established by the EU data protection authorities (DPAs) and the UK Information Commissioner’s Office (ICO) and the Swiss Federal Data Protection and Information Commissioner (FDPIC) with regard to unresolved complaints concerning our handling of personal data received in reliance on the EU-U.S. DPF and the UK Extension to the EU-U.S. DPF and the Swiss-U.S. DPF.\n\n5. Learn More about Cookies, Web Beacons, and Other Technologies\n\nTo learn more about cookies, including how to refuse cookies on your computer by adjusting web browser settings, follow these links:\n\nAll About Cookies: https://allaboutcookies.org/what-is-a-cookie\nGoogle: www.google.com/analytics/learn/privacy.html\nGoogle Chrome: https://support.google.com/chrome/?hl=en#topic=9845306\nMicrosoft Internet Explorer: www.microsoft.com/info/cookies.html\nMozilla Firefox: http://support.mozilla.com/en-US/kb/Options+window+-+Privacy+panel\nFlash: www.macromedia.com/support/documentation/en/flashplayer/help/settings_manager.html\n6. Limitation of Liability\n\nYOU UNDERSTAND AND AGREE THAT ANY DISPUTE RELATING TO THE SOLUTIONS OR YOUR USE OF THE SOLUTIONS, INCLUDING BUT NOT LIMITED TO A DISPUTE OVER PRIVACY, IS SUBJECT TO THE TERMS AND CONDITIONS OF THIS PRIVACY POLICY AND THE COMPANY’S TERMS OF USE (INCLUDING ANY INDEMNIFICATION AND LIMITATIONS ON DAMAGES CONTAINED THEREIN). A LINK TO THESE TERMS OF USE CAN BE FOUND AT THE BOTTOM OF THE HOME PAGE OF THE WEBSITE AND LINKS EMBEDDED IN VARIOUS SECTIONS IN SOLUTIONS.\n\n7. Unavailability of Solution or Services\n\nThe Company reserves the right to alter, suspend or discontinue the Solutions or Services for any reason without notice or cause. The Solutions or Services may be temporarily unavailable due to computer equipment maintenance or malfunction.\n\nVI. AGREEMENT: CHANGES TO THIS PRIVACY POLICY\n\nUsing the Solutions or Services, you acknowledge that you have read the data practices described in this Privacy Policy. You agree that your visit and any dispute over privacy are subject to our Terms of Use, including, without limitation, provisions regarding limitations on Company liability and application of the laws of the State of Delaware. The Company may periodically update this Privacy Policy in response to new technologies, changes in applicable laws, or for any other reason in the Company’s sole discretion. If we decide to change this Privacy Policy, we will post those changes here so you will always know what information we gather, how we might use it, and whether we will disclose it to anyone. Please review this Privacy Policy periodically to stay informed of any changes. You can tell when this Privacy Policy was modified by looking at the “Last Updated” legend at the top of the page.\n\nVII. LOCAL PROVISIONS\n\n1. Local provisions: California\n\nIf you are a California resident, the following applies in addition to the remainder of this Privacy Policy:\n\nYour California Privacy Rights. Under California Civil Code Section 1798.83, California residents who have an established business relationship with us have the right to request that we provide specific information regarding disclosing their personal information to third parties for their direct marketing purposes during the immediately preceding calendar year. You may send your request for such information to compliance@massivebio.com. Requests shall only be accepted via this email address. We are not responsible for requests made over the telephone or any other means.\nCalifornia Online Personal Privacy Act Disclosures\nWhen you visit our Solutions, our Service Providers may drop a cookie on your browser to remember your preferences and collect analytical data about your visit. The Solutions does not employ technology to track you across multiple Solutions, or override the privacy settings in your web browser or Services.\nOur Service Providers do not track Website visitors across multiple Websites or override the privacy settings in your web browser. If you access our social media sites from the Website or the Solutions, be aware that the social media platforms may track you across multiple Websites and disregard the privacy settings in your web browsers.\n2. Local provisions: European Union\n\nIf you are based in the European Union, the following applies in addition to the remainder of this Privacy Policy:\n\nGDPR means Regulation 2016/679 of the European Parliament and of the Council of 27 April 2016 on the protection of natural persons with regard to the processing of personal data and on the free movement of such data, and repealing Directive 95/46/EC.\nThe use of ‘PII’ in this Privacy Policy has the meaning of ‘personal data’ under the GDPR.\nIf we share your personal data with our group companies or third parties located outside the European Economic Area, we take steps to ensure that appropriate safeguards are in place to guarantee the continued protection of your personal data, particularly by signing the Standard Contractual Clauses adopted by the European Commission (article 46(2)(c) GDPR). You can find more information about the Standard Contractual Clauses here.\nBelow, we set out your data protection rights under the GDPR in more detail and give information on how you can exercise them. Most of these rights are not absolute and are subject to exemptions in the law. We will respond to your exercise of right request within one month but have the right to extend this period in certain circumstances. If we extend the response period, we will let you know within one month from your request. If your request is clearly unfounded or excessive, we reserve the right to charge a reasonable fee or refuse to comply with it in such circumstances.\nAccess your personal data. You are entitled to ask us if we are processing your personal data and, if we are, you can request access to your personal data. This enables you to receive a copy of the personal data we hold about you.\nRequest the transfer of your personal data. We will provide to you or a third party you have chosen, your personal data in a structured, commonly used, machine-readable format. Please note, this right applies to the personal data you have provided to us and only if we use your personal data on the basis of consent or where we used your personal data to perform a contract with you.\nRequest erasure (deletion) of your personal data. You are entitled to ask us to delete or remove personal data in certain circumstances. There are certain exceptions where we may refuse a request for erasure, for example, where the personal data is required for compliance with law or in connection with legal claims. When we need to rely on an exemption, we will inform you about this.\nRequest correction or updating of your personal data. This enables you to have any incomplete or inaccurate data we hold about you corrected.\nRequest the restriction of our processing of your personal data in some situations. If you request this, we can continue to store your personal data but are restricted from processing it while the restriction is in place.\nObject to our processing of your personal data where we are relying on legitimate interest. You also have a right to object where we are processing your personal data for the purposes of direct marketing or profiling. You can object at any time and we shall stop processing the information you have objected to, unless we can show compelling legitimate grounds to continue that processing.\nWithdraw your consent. Where you have provided your consent to our processing of your personal data you can withdraw your consent at any time. If you do withdraw consent, it will not affect the lawfulness of what we have done with your personal data before you withdrew consent.\nLodge a complaint at a supervisory authority. We will do our best to resolve any complaint. However, if you feel we have not resolved your complaint, you have a right to lodge a complaint with a supervisory authority in the country where you live, where you work or where an alleged infringement of the applicable data protection law took place. A list of EU supervisory authorities and their contact details is available here.\n3. Local provisions: Canada\n\nIf you are based in Canada, the following applies in addition to the remainder of this Privacy Policy:\n\nPIPEDA means the Personal Information Protection and Electronic Documents Act, which governs the collection, use, and disclosure of personal information in Canada, except for personal health information as defined under that Act. The use of ‘PII’ in this Privacy Policy has the meaning of ‘personal information’ under PIPEDA, except for “personal health information”.\n\nThe information we collect is generally considered to be “personal health information,” which is exempted under PIPEDA. Personal health information is governed by applicable provincial or territorial law. We are committed to adhering to the requirements under the law that apply to the personal health information we have collected about you.\n\nThe following terms apply in respect of any personal information we may collect, use, or disclose that is not considered personal health information: If we share your personal information with our group companies or third parties located outside of Canada, we take steps to ensure that appropriate safeguards are in place to guarantee the continued protection of your personal information, particularly by signing agreements that include privacy clauses and protections. You can find more information about these safeguards by contacting us at the address provided below. Below, we set out your privacy rights under PIPEDA in more detail and give information on how you can exercise them. Most of these rights are not absolute and are subject to exemptions in the law.\n\nWe will respond to your requests within a reasonable time frame. If your request is complex, we may extend this period but will inform you accordingly. Access your personal information. You are entitled to ask us if we are processing your personal information and, if we are, you can request access to your personal information. This enables you to receive a copy of the personal information we hold about you. Request the transfer of your personal information. We will provide to you or a third party you have chosen, your personal information in a commonly used, machine-readable format. Please note, this right applies to the personal information you have provided to us and only if we use your personal information on the basis of consent or where we used your personal information to perform a contract with you. Request erasure (deletion) of your personal information. You are entitled to ask us to delete or remove personal information in certain circumstances.\n\nThere are certain exceptions where we may refuse a request for erasure, for example, where the personal information is required for compliance with law or in connection with legal claims. When we need to rely on an exemption, we will inform you about this. Request correction or updating of your personal information. This enables you to have any incomplete or inaccurate data we hold about you corrected. Request the restriction of our processing of your personal information in some situations. If you request this, we can continue to store your personal information but are restricted from processing it while the restriction is in place. Object to our processing of your personal information where we are relying on legitimate interests. You also have a right to object where we are processing your personal information for the purposes of direct marketing or profiling. You can object at any time and we shall stop processing the information you have objected to, unless we can demonstrate compelling legitimate grounds to continue that processing. Withdraw your consent.\n\nWhere you have provided your consent to our processing of your personal information, you can withdraw your consent at any time. If you do withdraw consent, it will not affect the lawfulness of what we have done with your personal information before you withdrew consent. Lodge a complaint with the Office of the Privacy Commissioner of Canada. We will do our best to resolve any complaint. However, if you feel we have not resolved your complaint, you have a right to lodge a complaint with the Office of the Privacy Commissioner of Canada. Contact details are available on their website.\n\nIf you exercise the rights above and there is any question about who you are, we may require you to provide information from which we can satisfy ourselves as to your identity.\nYou can exercise the rights above by sending an email to:compliance@massivebio.com\nContact information of the Data Protection Officer:\nCagatay M. Culcuoglu\nGeneral Manager\ncculcuoglu@massivebio.com\n+1 646 9408559\nOne Park Place 621 NW 53rd Street, Suite 125 Boca Raton, Florida 33487',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.rubik(
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                  )
                                                                ],
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .rubik(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Theme(
                                                data: ThemeData(
                                                  checkboxTheme:
                                                      CheckboxThemeData(
                                                    visualDensity:
                                                        VisualDensity.compact,
                                                    materialTapTargetSize:
                                                        MaterialTapTargetSize
                                                            .shrinkWrap,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4.0),
                                                    ),
                                                  ),
                                                  unselectedWidgetColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .alternate,
                                                ),
                                                child: Checkbox(
                                                  value: _model
                                                      .checkboxValue ??= false,
                                                  onChanged: (newValue) async {
                                                    safeSetState(() =>
                                                        _model.checkboxValue =
                                                            newValue!);
                                                  },
                                                  side: BorderSide(
                                                    width: 2,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                  ),
                                                  activeColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                  checkColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .info,
                                                ),
                                              ),
                                              Text(
                                                'I\'ve read the following Terms & Conditions',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          font:
                                                              GoogleFonts.rubik(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 20.0, 0.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: FFButtonWidget(
                                                    onPressed: () async {
                                                      await _model
                                                          .pageViewController
                                                          ?.previousPage(
                                                        duration: Duration(
                                                            milliseconds: 300),
                                                        curve: Curves.ease,
                                                      );
                                                    },
                                                    text: 'Back',
                                                    options: FFButtonOptions(
                                                      height: 40.0,
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16.0,
                                                                  0.0,
                                                                  16.0,
                                                                  0.0),
                                                      iconPadding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      color: Color(0x00E0E3E7),
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .rubik(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontStyle,
                                                                ),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary,
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .fontStyle,
                                                              ),
                                                      elevation: 0.0,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                      hoverColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryBackground,
                                                      hoverTextColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondary,
                                                      hoverElevation: 0.0,
                                                    ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: FFButtonWidget(
                                                    onPressed: !_model
                                                            .checkboxValue!
                                                        ? null
                                                        : () async {
                                                            await _model
                                                                .patient!
                                                                .firstOrNull!
                                                                .reference
                                                                .update(
                                                                    createPatientsRecordData(
                                                              status: 'linked',
                                                            ));
                                                            await _model
                                                                .pageViewController
                                                                ?.animateToPage(
                                                              4,
                                                              duration: Duration(
                                                                  milliseconds:
                                                                      500),
                                                              curve:
                                                                  Curves.ease,
                                                            );
                                                          },
                                                    text:
                                                        'Accept & Create Account',
                                                    options: FFButtonOptions(
                                                      height: 42.5,
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16.0,
                                                                  0.0,
                                                                  16.0,
                                                                  0.0),
                                                      iconPadding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondary,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .rubik(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontStyle,
                                                                ),
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .fontStyle,
                                                              ),
                                                      elevation: 0.0,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                      disabledColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                      disabledTextColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                    ),
                                                  ),
                                                ),
                                              ].divide(SizedBox(width: 10.0)),
                                            ),
                                          ),
                                        ].divide(SizedBox(height: 10.0)),
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(),
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20.0, 0.0, 20.0, 0.0),
                                        child: SingleChildScrollView(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Icon(
                                                  Icons.check_circle,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondary,
                                                  size: 48.0,
                                                ),
                                              ),
                                              Text(
                                                'Link Successful',
                                                textAlign: TextAlign.center,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineMedium
                                                        .override(
                                                          font:
                                                              GoogleFonts.rubik(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineMedium
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineMedium
                                                                    .fontStyle,
                                                          ),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .headlineMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .headlineMedium
                                                                  .fontStyle,
                                                        ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 4.0, 0.0, 24.0),
                                                child: Text(
                                                  'Download the Medibound App to create or manage your accont as well as what organizations have access to your medical records',
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelMedium
                                                      .override(
                                                        font: GoogleFonts.rubik(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontStyle,
                                                        ),
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .fontStyle,
                                                      ),
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Builder(
                                                  builder: (context) {
                                                    if (false) {
                                                      return FFButtonWidget(
                                                        onPressed: () {
                                                          print(
                                                              'Button pressed ...');
                                                        },
                                                        text:
                                                            'Create An Account',
                                                        options:
                                                            FFButtonOptions(
                                                          height: 42.5,
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      16.0,
                                                                      0.0,
                                                                      16.0,
                                                                      0.0),
                                                          iconPadding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .alternate,
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .rubik(
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .fontStyle,
                                                                    ),
                                                                    fontSize:
                                                                        14.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .fontStyle,
                                                                  ),
                                                          elevation: 0.0,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                          hoverColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primaryBackground,
                                                          hoverTextColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .secondary,
                                                          hoverElevation: 0.0,
                                                        ),
                                                      );
                                                    } else {
                                                      return FFButtonWidget(
                                                        onPressed: () {
                                                          print(
                                                              'Button pressed ...');
                                                        },
                                                        text:
                                                            'Download Our App',
                                                        options:
                                                            FFButtonOptions(
                                                          height: 42.5,
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      16.0,
                                                                      0.0,
                                                                      16.0,
                                                                      0.0),
                                                          iconPadding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .alternate,
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .rubik(
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .fontStyle,
                                                                    ),
                                                                    fontSize:
                                                                        14.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .fontStyle,
                                                                  ),
                                                          elevation: 0.0,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                          hoverColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primaryBackground,
                                                          hoverTextColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .secondary,
                                                          hoverElevation: 0.0,
                                                        ),
                                                      );
                                                    }
                                                  },
                                                ),
                                              ),
                                            ].divide(SizedBox(height: 10.0)),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                  },
                ),
              ).animateOnPageLoad(
                  animationsMap['containerOnPageLoadAnimation']!),
            ),
            wrapWithModel(
              model: _model.authHeaderModel,
              updateCallback: () => safeSetState(() {}),
              child: AuthHeaderWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
