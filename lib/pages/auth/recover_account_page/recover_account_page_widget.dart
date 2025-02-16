import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'recover_account_page_model.dart';
export 'recover_account_page_model.dart';

class RecoverAccountPageWidget extends StatefulWidget {
  const RecoverAccountPageWidget({
    super.key,
    this.email,
  });

  final String? email;

  @override
  State<RecoverAccountPageWidget> createState() =>
      _RecoverAccountPageWidgetState();
}

class _RecoverAccountPageWidgetState extends State<RecoverAccountPageWidget>
    with TickerProviderStateMixin {
  late RecoverAccountPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RecoverAccountPageModel());

    _model.emailTextController ??= TextEditingController(text: widget.email);
    _model.emailFocusNode ??= FocusNode();
    _model.emailFocusNode!.addListener(() => safeSetState(() {}));
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
            begin: Offset(-10.0, 10.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Shortcuts(
      shortcuts: {},
      child: Actions(
        actions: {
          VoidCallbackIntent: CallbackAction<VoidCallbackIntent>(
            onInvoke: (intent) => intent.callback(),
          ),
        },
        child: Focus(
            autofocus: isShortcutsSupported,
            focusNode: _model.shortcutsFocusNode,
            child: GestureDetector(
              onTap: () {
                if (isShortcutsSupported &&
                    _model.shortcutsFocusNode.canRequestFocus) {
                  FocusScope.of(context)
                      .requestFocus(_model.shortcutsFocusNode);
                } else {
                  FocusScope.of(context).unfocus();
                  FocusManager.instance.primaryFocus?.unfocus();
                }
              },
              child: Scaffold(
                key: scaffoldKey,
                backgroundColor:
                    FlutterFlowTheme.of(context).secondaryBackground,
                body: Stack(
                  alignment: AlignmentDirectional(0.0, -1.0),
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
                            begin: AlignmentDirectional(1.0, -1.0),
                            end: AlignmentDirectional(-1.0, 1.0),
                          ),
                        ),
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Wrap(
                          spacing: 0.0,
                          runSpacing: 0.0,
                          alignment: WrapAlignment.start,
                          crossAxisAlignment: WrapCrossAlignment.start,
                          direction: Axis.horizontal,
                          runAlignment: WrapAlignment.start,
                          verticalDirection: VerticalDirection.down,
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                              constraints: BoxConstraints(
                                maxWidth: 400.0,
                              ),
                              decoration: BoxDecoration(),
                              child: Form(
                                key: _model.formKey,
                                autovalidateMode: AutovalidateMode.disabled,
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 0.0, 20.0, 0.0),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Lost Your Password?',
                                          textAlign: TextAlign.start,
                                          style: FlutterFlowTheme.of(context)
                                              .headlineMedium
                                              .override(
                                                fontFamily: 'Rubik',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 4.0, 0.0, 24.0),
                                          child: Text(
                                            'No problem! Enter your email below and we\'ll help you recover it.',
                                            textAlign: TextAlign.start,
                                            style: FlutterFlowTheme.of(context)
                                                .labelMedium
                                                .override(
                                                  fontFamily: 'Rubik',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 10.0, 0.0, 0.0),
                                          child: TextFormField(
                                            controller:
                                                _model.emailTextController,
                                            focusNode: _model.emailFocusNode,
                                            autofocus: false,
                                            autofillHints: [
                                              AutofillHints.username
                                            ],
                                            textInputAction:
                                                TextInputAction.next,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              isDense: false,
                                              labelText: 'Email Address',
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                fontFamily: 'Rubik',
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.normal,
                                                shadows: [
                                                  Shadow(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .customColor1,
                                                    offset: Offset(0.0, 2.0),
                                                    blurRadius: 40.0,
                                                  )
                                                ],
                                              ),
                                              alignLabelWithHint: false,
                                              hintText: 'marty@mcfly.com',
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily: 'Rubik',
                                                        letterSpacing: 0.0,
                                                      ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                              filled: true,
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              contentPadding:
                                                  EdgeInsets.all(20.0),
                                              hoverColor:
                                                  FlutterFlowTheme.of(context)
                                                      .customColor1,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Rubik',
                                                  letterSpacing: 0.0,
                                                ),
                                            keyboardType:
                                                TextInputType.emailAddress,
                                            cursorColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryText,
                                            validator: _model
                                                .emailTextControllerValidator
                                                .asValidator(context),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 15.0, 0.0, 0.0),
                                            child: FFButtonWidget(
                                              onPressed: () async {
                                                if (_model.formKey
                                                            .currentState ==
                                                        null ||
                                                    !_model
                                                        .formKey.currentState!
                                                        .validate()) {
                                                  return;
                                                }
                                                if (_model.emailTextController
                                                    .text.isEmpty) {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        'Email required!',
                                                      ),
                                                    ),
                                                  );
                                                  return;
                                                }
                                                await authManager.resetPassword(
                                                  email: _model
                                                      .emailTextController.text,
                                                  context: context,
                                                );
                                              },
                                              text: 'Send Recovery Email',
                                              options: FFButtonOptions(
                                                height: 40.0,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 16.0, 0.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily: 'Rubik',
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
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
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              context.goNamed('LoginPage');
                                            },
                                            text: 'Back to Log In',
                                            icon: FaIcon(
                                              FontAwesomeIcons.arrowLeft,
                                              size: 14.0,
                                            ),
                                            options: FFButtonOptions(
                                              height: 40.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 0.0),
                                              iconAlignment:
                                                  IconAlignment.start,
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color: Color(0x00E0E3E7),
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'Rubik',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
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
                                          ),
                                        ),
                                      ].divide(SizedBox(height: 10.0)),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ).animateOnPageLoad(
                          animationsMap['containerOnPageLoadAnimation']!),
                    ),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
