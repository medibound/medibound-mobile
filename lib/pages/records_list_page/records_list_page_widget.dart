import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/records/record/record_widget.dart';
import '/pages/records/record_list_item/record_list_item_widget.dart';
import "package:medibound_portal_hdztzw/backend/backend.dart"
    as medibound_portal_hdztzw_backend;
import "package:medibound_portal_hdztzw/backend/schema/structs/index.dart"
    as medibound_portal_hdztzw_data_schema;
import '/custom_code/actions/index.dart' as actions;
import 'package:medibound_portal_hdztzw/utils/empty_list/empty_list_widget.dart'
    as medibound_portal_hdztzw;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'records_list_page_model.dart';
export 'records_list_page_model.dart';

class RecordsListPageWidget extends StatefulWidget {
  const RecordsListPageWidget({super.key});

  @override
  State<RecordsListPageWidget> createState() => _RecordsListPageWidgetState();
}

class _RecordsListPageWidgetState extends State<RecordsListPageWidget>
    with TickerProviderStateMixin {
  late RecordsListPageModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RecordsListPageModel());

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 200.0.ms,
            duration: 800.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 200.0.ms,
            duration: 600.0.ms,
            color: FlutterFlowTheme.of(context).alternate,
            angle: 0.524,
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
    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        constraints: BoxConstraints(
          maxWidth: 450.0,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              FlutterFlowTheme.of(context).secondaryBackground,
              FlutterFlowTheme.of(context).primaryBackground
            ],
            stops: [0.0, 1.0],
            begin: AlignmentDirectional(0.98, -1.0),
            end: AlignmentDirectional(-0.98, 1.0),
          ),
        ),
        child: SafeArea(
          child: Container(
            decoration: BoxDecoration(),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Container(
                    decoration: BoxDecoration(),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              1.0, 0.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              FFButtonWidget(
                                onPressed: () async {
                                  await actions.mobileNavigate(
                                    context,
                                    medibound_portal_hdztzw_data_schema
                                        .RouteStruct(
                                      section: 'overview',
                                    ),
                                    false,
                                    () async {
                                      FFAppState().update(() {});
                                    },
                                  );
                                },
                                text: 'Back',
                                icon: FaIcon(
                                  FontAwesomeIcons.chevronLeft,
                                  size: 14.0,
                                ),
                                options: FFButtonOptions(
                                  height: 40.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  iconAlignment: IconAlignment.start,
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: Color(0x00E0E3E7),
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
                                        color: FlutterFlowTheme.of(context)
                                            .secondary,
                                        fontSize: 16.0,
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
                                  hoverColor: Colors.transparent,
                                  hoverTextColor:
                                      FlutterFlowTheme.of(context).secondary,
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
                                  height: 42.5,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).alternate,
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
                                        color: FlutterFlowTheme.of(context)
                                            .secondary,
                                        fontSize: 16.0,
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
                                  hoverColor: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  hoverTextColor:
                                      FlutterFlowTheme.of(context).secondary,
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
                                  'Your Records',
                                  style: FlutterFlowTheme.of(context)
                                      .headlineLarge
                                      .override(
                                        font: GoogleFonts.rubik(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .headlineLarge
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .headlineLarge
                                                  .fontStyle,
                                        ),
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .headlineLarge
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .headlineLarge
                                            .fontStyle,
                                      ),
                                  colors: [
                                    FlutterFlowTheme.of(context).customColor3,
                                    FlutterFlowTheme.of(context).primaryText
                                  ],
                                  gradientDirection: GradientDirection.ttb,
                                  gradientType: GradientType.linear,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ].divide(SizedBox(height: 10.0)),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    decoration: BoxDecoration(),
                    alignment: AlignmentDirectional(0.0, -1.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                      child: StreamBuilder<
                          List<medibound_portal_hdztzw_backend.RecordsRecord>>(
                        stream:
                            medibound_portal_hdztzw_backend.queryRecordsRecord(
                          queryBuilder: (recordsRecord) => recordsRecord
                              .where(
                                'owner',
                                isEqualTo: currentUserReference,
                              )
                              .orderBy('created_time', descending: true),
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Container(
                              height: 100.0,
                              child: medibound_portal_hdztzw.EmptyListWidget(
                                text: 'Retrieving Your Records...',
                                icon: Icon(
                                  FFIcons.kpersonrecord,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 16.0,
                                ),
                                height: 100.0,
                              ),
                            );
                          }
                          List<medibound_portal_hdztzw_backend.RecordsRecord>
                              listViewRecordsRecordList = snapshot.data!;

                          return ListView.separated(
                            padding: EdgeInsets.fromLTRB(
                              0,
                              0,
                              0,
                              20.0,
                            ),
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: listViewRecordsRecordList.length,
                            separatorBuilder: (_, __) => SizedBox(height: 10.0),
                            itemBuilder: (context, listViewIndex) {
                              final listViewRecordsRecord =
                                  listViewRecordsRecordList[listViewIndex];
                              return Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.0),
                                  border: Border.all(
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    width: 1.0,
                                  ),
                                ),
                                child: StreamBuilder<
                                    List<
                                        medibound_portal_hdztzw_backend
                                        .DatapointsRecord>>(
                                  stream: medibound_portal_hdztzw_backend
                                      .queryDatapointsRecord(
                                    parent: listViewRecordsRecord.reference,
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
                                    List<
                                            medibound_portal_hdztzw_backend
                                            .DatapointsRecord>
                                        containerDatapointsRecordList =
                                        snapshot.data!;

                                    return Container(
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 10.0,
                                            color: Color(0x14000000),
                                            offset: Offset(
                                              2.0,
                                              2.0,
                                            ),
                                          )
                                        ],
                                      ),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          await showModalBottomSheet(
                                            isScrollControlled: true,
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            enableDrag: false,
                                            context: context,
                                            builder: (context) {
                                              return Padding(
                                                padding:
                                                    MediaQuery.viewInsetsOf(
                                                        context),
                                                child: Container(
                                                  height: 500.0,
                                                  child: RecordWidget(
                                                    recordWidth:
                                                        MediaQuery.sizeOf(
                                                                context)
                                                            .width,
                                                    record:
                                                        listViewRecordsRecord,
                                                    data:
                                                        containerDatapointsRecordList
                                                            .map((e) => e.data)
                                                            .toList(),
                                                    showNext: true,
                                                  ),
                                                ),
                                              );
                                            },
                                          ).then(
                                              (value) => safeSetState(() {}));
                                        },
                                        child: wrapWithModel(
                                          model: _model.recordListItemModels
                                              .getModel(
                                            listViewRecordsRecord.reference.id,
                                            listViewIndex,
                                          ),
                                          updateCallback: () =>
                                              safeSetState(() {}),
                                          child: Hero(
                                            tag: listViewRecordsRecord
                                                .reference.id,
                                            transitionOnUserGestures: true,
                                            child: Material(
                                              color: Colors.transparent,
                                              child: RecordListItemWidget(
                                                key: Key(
                                                  'Keyhvt_${listViewRecordsRecord.reference.id}',
                                                ),
                                                recordWidth:
                                                    (MediaQuery.sizeOf(context)
                                                                    .width <
                                                                450.0
                                                            ? MediaQuery.sizeOf(
                                                                    context)
                                                                .width
                                                            : 450.0) -
                                                        40.0,
                                                selected: false,
                                                message: false,
                                                record: listViewRecordsRecord,
                                                data:
                                                    containerDatapointsRecordList
                                                        .map((e) => e.data)
                                                        .toList(),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ).animateOnPageLoad(animationsMap[
                                  'containerOnPageLoadAnimation']!);
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
