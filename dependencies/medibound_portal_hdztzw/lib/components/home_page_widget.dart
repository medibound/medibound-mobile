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
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({
    super.key,
    required this.pageWidget,
  });

  final Widget Function(List<OrganizationsRecord> organizations)? pageWidget;

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

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

    return FutureBuilder<ApiCallResponse>(
      future: MediboundGroup.getOrganizationsCall.call(
        jwt: currentJwtToken,
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
        final containerGetOrganizationsResponse = snapshot.data!;

        return Container(
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
          alignment: AlignmentDirectional(-1.0, -1.0),
          child: Container(
            decoration: BoxDecoration(),
            child: Stack(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Opacity(
                      opacity: 0.5,
                      child: Container(
                        width: double.infinity,
                        height: 100.0,
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
                      ),
                    ),
                    Flexible(
                      child: Container(
                        width: double.infinity,
                        height: MediaQuery.sizeOf(context).height * 1.0,
                        decoration: BoxDecoration(),
                        alignment: AlignmentDirectional(0.0, 0.0),
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Container(
                          width: double.infinity,
                          height: MediaQuery.sizeOf(context).height * 1.0,
                          decoration: BoxDecoration(),
                          alignment: AlignmentDirectional(-1.0, -1.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              if (responsiveVisibility(
                                context: context,
                                phone: false,
                                tablet: false,
                              ))
                                wrapWithModel(
                                  model: _model.navBarModel,
                                  updateCallback: () => safeSetState(() {}),
                                  updateOnChange: true,
                                  child: NavBarWidget(),
                                ),
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        height: 100.0,
                                        constraints: BoxConstraints(
                                          maxWidth: 900.0,
                                        ),
                                        decoration: BoxDecoration(),
                                        child: Padding(
                                          padding: EdgeInsets.all(10.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              if ((FFAppState()
                                                              .currentRoute
                                                              .id !=
                                                          null &&
                                                      FFAppState()
                                                              .currentRoute
                                                              .id !=
                                                          '') &&
                                                  (FFAppState()
                                                              .currentRoute
                                                              .page !=
                                                          null &&
                                                      FFAppState()
                                                              .currentRoute
                                                              .page !=
                                                          '') &&
                                                  (FFAppState()
                                                              .currentRoute
                                                              .section !=
                                                          null &&
                                                      FFAppState()
                                                              .currentRoute
                                                              .section !=
                                                          ''))
                                                FFButtonWidget(
                                                  onPressed: () async {
                                                    await actions.navigate(
                                                      context,
                                                      RouteStruct(
                                                        section: FFAppState()
                                                            .currentRoute
                                                            .section,
                                                        page: FFAppState()
                                                            .currentRoute
                                                            .page,
                                                      ),
                                                      false,
                                                      () async {
                                                        safeSetState(() {});
                                                      },
                                                    );
                                                  },
                                                  text:
                                                      'Go Back To ${FFAppState().RouteStacks.where((e) => e.section.code == FFAppState().currentRoute.section).toList().firstOrNull?.section?.display}',
                                                  icon: Icon(
                                                    Icons.chevron_left_rounded,
                                                    size: 15.0,
                                                  ),
                                                  options: FFButtonOptions(
                                                    height: 20.0,
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    iconPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: Color(0x00E0E3E7),
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .titleSmall
                                                        .override(
                                                          font:
                                                              GoogleFonts.rubik(
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
                                                          color: FlutterFlowTheme
                                                                  .of(context)
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
                                                            10.0),
                                                    hoverTextColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                    hoverElevation: 0.0,
                                                  ),
                                                ),
                                              Expanded(
                                                child: Container(
                                                  width: 100.0,
                                                  height: 100.0,
                                                  decoration: BoxDecoration(),
                                                ),
                                              ),
                                              if ((MediboundGroup
                                                              .getOrganizationsCall
                                                              .profiles(
                                                            containerGetOrganizationsResponse
                                                                .jsonBody,
                                                          ) !=
                                                          null &&
                                                      (MediboundGroup
                                                              .getOrganizationsCall
                                                              .profiles(
                                                        containerGetOrganizationsResponse
                                                            .jsonBody,
                                                      ))!
                                                          .isNotEmpty) &&
                                                  (FFAppState()
                                                          .currentRoute
                                                          .section !=
                                                      'dashboard') &&
                                                  (FFAppState()
                                                              .currentRoute
                                                              .id ==
                                                          null ||
                                                      FFAppState()
                                                              .currentRoute
                                                              .id ==
                                                          ''))
                                                StreamBuilder<
                                                    List<OrganizationsRecord>>(
                                                  stream:
                                                      queryOrganizationsRecord(
                                                    queryBuilder: (organizationsRecord) =>
                                                        organizationsRecord
                                                            .whereIn(
                                                                'profile.uid',
                                                                MediboundGroup
                                                                    .getOrganizationsCall
                                                                    .profiles(
                                                                      containerGetOrganizationsResponse
                                                                          .jsonBody,
                                                                    )
                                                                    ?.map((e) =>
                                                                        e.uid)
                                                                    .toList()),
                                                  ),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 25.0,
                                                          height: 25.0,
                                                          child: SpinKitPulse(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            size: 25.0,
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    List<OrganizationsRecord>
                                                        containerOrganizationsRecordList =
                                                        snapshot.data!;

                                                    return Container(
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                1.0, 0.0),
                                                        child: Container(
                                                          width: 200.0,
                                                          height: 42.5,
                                                          child: custom_widgets
                                                              .ProfileDropdown(
                                                            width: 200.0,
                                                            height: 42.5,
                                                            hintText: 'View As',
                                                            circle: false,
                                                            items:
                                                                containerOrganizationsRecordList
                                                                    .map((e) =>
                                                                        e.profile)
                                                                    .toList(),
                                                            initialItem:
                                                                FFAppState()
                                                                    .selectedOrganization,
                                                            onChanged:
                                                                (item) async {
                                                              FFAppState()
                                                                      .selectedOrganization =
                                                                  item;
                                                              FFAppState()
                                                                  .update(
                                                                      () {});
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
                                      Expanded(
                                        child: Builder(
                                          builder: (context) {
                                            if (MediboundGroup
                                                        .getOrganizationsCall
                                                        .profiles(
                                                      containerGetOrganizationsResponse
                                                          .jsonBody,
                                                    ) !=
                                                    null &&
                                                (MediboundGroup
                                                        .getOrganizationsCall
                                                        .profiles(
                                                  containerGetOrganizationsResponse
                                                      .jsonBody,
                                                ))!
                                                    .isNotEmpty) {
                                              return StreamBuilder<
                                                  List<OrganizationsRecord>>(
                                                stream:
                                                    queryOrganizationsRecord(
                                                  queryBuilder:
                                                      (organizationsRecord) =>
                                                          organizationsRecord
                                                              .whereIn(
                                                                  'profile.uid',
                                                                  MediboundGroup
                                                                      .getOrganizationsCall
                                                                      .profiles(
                                                                        containerGetOrganizationsResponse
                                                                            .jsonBody,
                                                                      )
                                                                      ?.map((e) =>
                                                                          e.uid)
                                                                      .toList()),
                                                ),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 25.0,
                                                        height: 25.0,
                                                        child: SpinKitPulse(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          size: 25.0,
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  List<OrganizationsRecord>
                                                      containerOrganizationsRecordList =
                                                      snapshot.data!;

                                                  return Container(
                                                    width: double.infinity,
                                                    constraints: BoxConstraints(
                                                      minHeight: 200.0,
                                                      maxWidth: 900.0,
                                                    ),
                                                    decoration: BoxDecoration(),
                                                    child: Container(
                                                      key: ValueKey(
                                                          (FFAppState()
                                                                  .currentRoute
                                                                  .toMap())
                                                              .toString()),
                                                      child:
                                                          Builder(builder: (_) {
                                                        return widget
                                                                    .pageWidget !=
                                                                null
                                                            ? widget
                                                                .pageWidget!(
                                                                containerOrganizationsRecordList,
                                                              )
                                                            : SizedBox.shrink();
                                                      }),
                                                    ),
                                                  );
                                                },
                                              );
                                            } else {
                                              return Container(
                                                width: double.infinity,
                                                constraints: BoxConstraints(
                                                  minHeight: 200.0,
                                                  maxWidth: 900.0,
                                                ),
                                                decoration: BoxDecoration(),
                                                child: Container(
                                                  key: ValueKey((FFAppState()
                                                          .currentRoute
                                                          .toMap())
                                                      .toString()),
                                                  child: Builder(builder: (_) {
                                                    return widget.pageWidget !=
                                                            null
                                                        ? widget.pageWidget!(
                                                            _model
                                                                .emptyOrganizations,
                                                          )
                                                        : SizedBox.shrink();
                                                  }),
                                                ),
                                              );
                                            }
                                          },
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
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
