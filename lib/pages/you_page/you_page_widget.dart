import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/utils/navigation/tab_bar/tab_bar_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'you_page_model.dart';
export 'you_page_model.dart';

class YouPageWidget extends StatefulWidget {
  const YouPageWidget({super.key});

  @override
  State<YouPageWidget> createState() => _YouPageWidgetState();
}

class _YouPageWidgetState extends State<YouPageWidget> {
  late YouPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => YouPageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        body: Container(
          width: double.infinity,
          height: MediaQuery.sizeOf(context).height * 1.0,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                FlutterFlowTheme.of(context).secondaryBackground,
                FlutterFlowTheme.of(context).primaryBackground
              ],
              stops: [0.0, 1.0],
              begin: AlignmentDirectional(0.0, -1.0),
              end: AlignmentDirectional(0, 1.0),
            ),
          ),
          child: Stack(
            children: [
              Opacity(
                opacity: 0.5,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        FlutterFlowTheme.of(context).secondaryBackground,
                        FlutterFlowTheme.of(context).accent1,
                        FlutterFlowTheme.of(context).accent3
                      ],
                      stops: [0.0, 0.4, 1.0],
                      begin: AlignmentDirectional(-1.0, 1.0),
                      end: AlignmentDirectional(1.0, -1.0),
                    ),
                  ),
                  child: SafeArea(
                    child: Container(
                      width: double.infinity,
                      height: 150.0,
                      decoration: BoxDecoration(),
                    ),
                  ),
                ),
              ),
              SafeArea(
                child: Container(
                  decoration: BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: SafeArea(
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            decoration: BoxDecoration(),
                            alignment: AlignmentDirectional(0.0, -1.0),
                            child: Padding(
                              padding: EdgeInsets.all(20.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        1.0, 0.0, 0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 10.0, 0.0, 0.0),
                                            child: GradientText(
                                              'YOUR HEALTH IN YOUR HANDS',
                                              textAlign: TextAlign.center,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelLarge
                                                      .override(
                                                        fontFamily: 'Rubik',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.8,
                                                      ),
                                              colors: [
                                                FlutterFlowTheme.of(context)
                                                    .accent1,
                                                FlutterFlowTheme.of(context)
                                                    .accent3
                                              ],
                                              gradientDirection:
                                                  GradientDirection.ltr,
                                              gradientType: GradientType.linear,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: 160.0,
                                    height: 160.0,
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 30.0,
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          offset: Offset(
                                            0.0,
                                            10.0,
                                          ),
                                        )
                                      ],
                                      gradient: LinearGradient(
                                        colors: [
                                          FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          FlutterFlowTheme.of(context)
                                              .primaryBackground
                                        ],
                                        stops: [0.0, 1.0],
                                        begin: AlignmentDirectional(1.0, -0.5),
                                        end: AlignmentDirectional(-1.0, 0.5),
                                      ),
                                      shape: BoxShape.circle,
                                    ),
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: AuthUserStreamWidget(
                                      builder: (context) => Container(
                                        width: 150.0,
                                        height: 150.0,
                                        clipBehavior: Clip.antiAlias,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                        ),
                                        child: CachedNetworkImage(
                                          fadeInDuration:
                                              Duration(milliseconds: 500),
                                          fadeOutDuration:
                                              Duration(milliseconds: 500),
                                          imageUrl: currentUserDocument!
                                              .profile.photoUrl,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  FFButtonWidget(
                                    onPressed: () async {
                                      GoRouter.of(context).prepareAuthEvent();
                                      await authManager.signOut();
                                      GoRouter.of(context)
                                          .clearRedirectLocation();

                                      context.goNamedAuth(
                                          'LoginPage', context.mounted);
                                    },
                                    text: 'Log Out',
                                    icon: FaIcon(
                                      FontAwesomeIcons.signInAlt,
                                      size: 14.0,
                                    ),
                                    options: FFButtonOptions(
                                      height: 40.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 16.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: Color(0x00E0E3E7),
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Rubik',
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                          ),
                                      elevation: 0.0,
                                      borderRadius: BorderRadius.circular(10.0),
                                      hoverColor: Color(0x3EFF5963),
                                      hoverTextColor:
                                          FlutterFlowTheme.of(context).error,
                                      hoverElevation: 0.0,
                                    ),
                                  ),
                                ].divide(SizedBox(height: 10.0)),
                              ),
                            ),
                          ),
                        ),
                      ),
                      wrapWithModel(
                        model: _model.tabBarModel,
                        updateCallback: () => safeSetState(() {}),
                        child: TabBarWidget(
                          selected: 5,
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
    );
  }
}
