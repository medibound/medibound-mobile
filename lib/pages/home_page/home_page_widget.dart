import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/utils/navigation/tab_bar/tab_bar_widget.dart';
import 'package:medibound_portal_hdztzw/flutter_flow/flutter_flow_util.dart'
    as medibound_portal_hdztzw_util
    show wrapWithModel, createModel, FlutterFlowDynamicModels;
import 'package:medibound_portal_hdztzw/utils/empty_list/empty_list_widget.dart'
    as medibound_portal_hdztzw;
import 'package:medibound_portal_hdztzw/utils/icon_token/icon_token_widget.dart'
    as medibound_portal_hdztzw;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());
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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Container(
          width: double.infinity,
          height: double.infinity,
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
          child: SafeArea(
            child: Container(
              decoration: BoxDecoration(),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    decoration: BoxDecoration(),
                    alignment: AlignmentDirectional(0.0, -1.0),
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  1.0, 0.0, 0.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  FFButtonWidget(
                                    onPressed: () {
                                      print('Button pressed ...');
                                    },
                                    text: 'My Cards',
                                    icon: Icon(
                                      FFIcons.kmediwallet,
                                      size: 18.0,
                                    ),
                                    options: FFButtonOptions(
                                      height: 40.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: Color(0x00E0E3E7),
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Rubik',
                                            color: FlutterFlowTheme.of(context)
                                                .secondary,
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                          ),
                                      elevation: 0.0,
                                      borderRadius: BorderRadius.circular(10.0),
                                      hoverColor: Colors.transparent,
                                      hoverTextColor:
                                          FlutterFlowTheme.of(context)
                                              .secondary,
                                      hoverElevation: 0.0,
                                    ),
                                  ),
                                  FFButtonWidget(
                                    onPressed: () {
                                      print('Button pressed ...');
                                    },
                                    text: 'Add Record',
                                    icon: FaIcon(
                                      FontAwesomeIcons.plus,
                                      size: 14.0,
                                    ),
                                    options: FFButtonOptions(
                                      height: 40.0,
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
                                            fontFamily: 'Rubik',
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                          ),
                                      elevation: 0.0,
                                      borderRadius: BorderRadius.circular(10.0),
                                      hoverColor: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      hoverTextColor:
                                          FlutterFlowTheme.of(context)
                                              .secondary,
                                      hoverElevation: 0.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 0.0),
                                    child: GradientText(
                                      'Your Health Story',
                                      style: FlutterFlowTheme.of(context)
                                          .headlineLarge
                                          .override(
                                            fontFamily: 'Rubik',
                                            letterSpacing: 0.0,
                                          ),
                                      colors: [
                                        FlutterFlowTheme.of(context)
                                            .customColor3,
                                        FlutterFlowTheme.of(context).primaryText
                                      ],
                                      gradientDirection: GradientDirection.ttb,
                                      gradientType: GradientType.linear,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  decoration: BoxDecoration(),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      AuthUserStreamWidget(
                                        builder: (context) => AutoSizeText(
                                          'Hey, ${(currentUserDocument?.givenNames.toList() ?? []).firstOrNull}!'
                                              .maybeHandleOverflow(
                                            maxChars: 20,
                                            replacement: '…',
                                          ),
                                          maxLines: 1,
                                          style: FlutterFlowTheme.of(context)
                                              .titleLarge
                                              .override(
                                                fontFamily: 'Rubik',
                                                fontSize: 28.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ),
                                      Text(
                                        'Ready to Own Your Health Today?',
                                        maxLines: 1,
                                        style: FlutterFlowTheme.of(context)
                                            .labelSmall
                                            .override(
                                              fontFamily: 'Rubik',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                medibound_portal_hdztzw_util.wrapWithModel(
                                  model: _model.iconTokenModel,
                                  updateCallback: () => safeSetState(() {}),
                                  child:
                                      medibound_portal_hdztzw.IconTokenWidget(
                                    text: 'Medi Summary',
                                    icon: Icon(
                                      FFIcons.ksparkmedi,
                                      color: FlutterFlowTheme.of(context)
                                          .secondary,
                                      size: 14.0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              height: 50.0,
                              decoration: BoxDecoration(),
                              child: medibound_portal_hdztzw_util.wrapWithModel(
                                model: _model.emptyListModel1,
                                updateCallback: () => safeSetState(() {}),
                                child: medibound_portal_hdztzw.EmptyListWidget(
                                  text: 'Insert AI Health Summary Here',
                                  icon: Icon(
                                    FFIcons.ksparkmedi,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 14.0,
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: FFButtonWidget(
                                onPressed: () {
                                  print('Button pressed ...');
                                },
                                text: 'View All Records',
                                options: FFButtonOptions(
                                  height: 40.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: Color(0x00E0E3E7),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Rubik',
                                        color: FlutterFlowTheme.of(context)
                                            .secondary,
                                        fontSize: 14.0,
                                        letterSpacing: 0.0,
                                      ),
                                  elevation: 0.0,
                                  borderRadius: BorderRadius.circular(10.0),
                                  hoverColor: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  hoverTextColor:
                                      FlutterFlowTheme.of(context).secondary,
                                  hoverElevation: 0.0,
                                ),
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                AutoSizeText(
                                  '🚀',
                                  maxLines: 1,
                                  style: FlutterFlowTheme.of(context)
                                      .titleLarge
                                      .override(
                                        fontFamily: 'Rubik',
                                        fontSize: 24.0,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                                Container(
                                  decoration: BoxDecoration(),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      AutoSizeText(
                                        'Explore New Devices & Apps',
                                        maxLines: 1,
                                        style: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .override(
                                              fontFamily: 'Rubik',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                      Text(
                                        'Discover what\'s new and exciting!',
                                        maxLines: 1,
                                        style: FlutterFlowTheme.of(context)
                                            .labelSmall
                                            .override(
                                              fontFamily: 'Rubik',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ].divide(SizedBox(width: 10.0)),
                            ),
                            Container(
                              height: 50.0,
                              decoration: BoxDecoration(),
                              child: medibound_portal_hdztzw_util.wrapWithModel(
                                model: _model.emptyListModel2,
                                updateCallback: () => safeSetState(() {}),
                                child: medibound_portal_hdztzw.EmptyListWidget(
                                  text: 'Insert Apps & Devices Here',
                                  icon: FaIcon(
                                    FontAwesomeIcons.shapes,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 14.0,
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: FFButtonWidget(
                                onPressed: () {
                                  print('Button pressed ...');
                                },
                                text: 'Shop All Streams',
                                options: FFButtonOptions(
                                  height: 40.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: Color(0x00E0E3E7),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Rubik',
                                        color: FlutterFlowTheme.of(context)
                                            .secondary,
                                        fontSize: 14.0,
                                        letterSpacing: 0.0,
                                      ),
                                  elevation: 0.0,
                                  borderRadius: BorderRadius.circular(10.0),
                                  hoverColor: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  hoverTextColor:
                                      FlutterFlowTheme.of(context).secondary,
                                  hoverElevation: 0.0,
                                ),
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                AutoSizeText(
                                  '🔔',
                                  maxLines: 1,
                                  style: FlutterFlowTheme.of(context)
                                      .titleLarge
                                      .override(
                                        fontFamily: 'Rubik',
                                        fontSize: 24.0,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                                Container(
                                  decoration: BoxDecoration(),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      AutoSizeText(
                                        'Stay in the Loop!',
                                        maxLines: 1,
                                        style: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .override(
                                              fontFamily: 'Rubik',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                      Text(
                                        'Latest updates and important alerts at a glance.',
                                        maxLines: 1,
                                        style: FlutterFlowTheme.of(context)
                                            .labelSmall
                                            .override(
                                              fontFamily: 'Rubik',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ].divide(SizedBox(width: 10.0)),
                            ),
                            Container(
                              height: 50.0,
                              decoration: BoxDecoration(),
                              child: medibound_portal_hdztzw_util.wrapWithModel(
                                model: _model.emptyListModel3,
                                updateCallback: () => safeSetState(() {}),
                                child: medibound_portal_hdztzw.EmptyListWidget(
                                  text: 'No Updates or Alerts',
                                  icon: FaIcon(
                                    FontAwesomeIcons.solidBellSlash,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 14.0,
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: FFButtonWidget(
                                onPressed: () {
                                  print('Button pressed ...');
                                },
                                text: 'View All Updates & Alerts',
                                options: FFButtonOptions(
                                  height: 40.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: Color(0x00E0E3E7),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Rubik',
                                        color: FlutterFlowTheme.of(context)
                                            .secondary,
                                        fontSize: 14.0,
                                        letterSpacing: 0.0,
                                      ),
                                  elevation: 0.0,
                                  borderRadius: BorderRadius.circular(10.0),
                                  hoverColor: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  hoverTextColor:
                                      FlutterFlowTheme.of(context).secondary,
                                  hoverElevation: 0.0,
                                ),
                              ),
                            ),
                          ].divide(SizedBox(height: 10.0)),
                        ),
                      ),
                    ),
                  ),
                  wrapWithModel(
                    model: _model.tabBarModel,
                    updateCallback: () => safeSetState(() {}),
                    child: TabBarWidget(
                      selected: 1,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
