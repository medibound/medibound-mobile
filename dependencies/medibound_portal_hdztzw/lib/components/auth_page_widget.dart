import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/utils/auth_header/auth_header_widget.dart';
import 'dart:ui';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'auth_page_model.dart';
export 'auth_page_model.dart';

class AuthPageWidget extends StatefulWidget {
  const AuthPageWidget({
    super.key,
    required this.pageWidget,
  });

  final Widget Function()? pageWidget;

  @override
  State<AuthPageWidget> createState() => _AuthPageWidgetState();
}

class _AuthPageWidgetState extends State<AuthPageWidget> {
  late AuthPageModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AuthPageModel());

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
                    maxWidth: 800.0,
                  ),
                  decoration: BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      if ((FFAppState().currentRoute.section == 'onboarding') &&
                          (FFAppState().currentRoute.id != null &&
                              FFAppState().currentRoute.id != ''))
                        StreamBuilder<List<OrganizationsRecord>>(
                          stream: queryOrganizationsRecord(
                            queryBuilder: (organizationsRecord) =>
                                organizationsRecord.where(
                              'profile.uid',
                              isEqualTo: FFAppState().currentRoute.id,
                            ),
                            limit: 1,
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
                            List<OrganizationsRecord>
                                containerOrganizationsRecordList =
                                snapshot.data!;

                            return Container(
                              constraints: BoxConstraints(
                                maxWidth: 440.0,
                              ),
                              decoration: BoxDecoration(),
                              child: Visibility(
                                visible:
                                    containerOrganizationsRecordList.isNotEmpty,
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 0.0, 20.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        child: Image.network(
                                          valueOrDefault<String>(
                                            containerOrganizationsRecordList
                                                .firstOrNull?.profile?.photoUrl,
                                            'Organization Name',
                                          ),
                                          width: 35.0,
                                          height: 35.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Invite From',
                                            style: FlutterFlowTheme.of(context)
                                                .labelSmall
                                                .override(
                                                  font: GoogleFonts.rubik(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelSmall
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelSmall
                                                            .fontStyle,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelSmall
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelSmall
                                                          .fontStyle,
                                                ),
                                          ),
                                          Text(
                                            valueOrDefault<String>(
                                              containerOrganizationsRecordList
                                                  .firstOrNull
                                                  ?.profile
                                                  ?.displayName,
                                              'Organization Name',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.rubik(
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ].divide(SizedBox(width: 7.5)),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      Container(
                        height: 500.0,
                        constraints: BoxConstraints(
                          maxWidth: 800.0,
                        ),
                        decoration: BoxDecoration(),
                        child: Builder(builder: (_) {
                          return widget.pageWidget != null
                              ? widget.pageWidget!()
                              : SizedBox.shrink();
                        }),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        wrapWithModel(
          model: _model.authHeaderModel,
          updateCallback: () => safeSetState(() {}),
          child: AuthHeaderWidget(),
        ),
      ],
    );
  }
}
