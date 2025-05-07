import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/agents/create_agent/create_agent_widget.dart';
import '/utils/doc_guide_block/doc_guide_block_widget.dart';
import '/utils/empty_list/empty_list_widget.dart';
import '/utils/loading/loading_widget.dart';
import 'dart:ui';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'agent_builder_page_model.dart';
export 'agent_builder_page_model.dart';

class AgentBuilderPageWidget extends StatefulWidget {
  const AgentBuilderPageWidget({
    super.key,
    required this.organizations,
  });

  final List<OrganizationsRecord>? organizations;

  @override
  State<AgentBuilderPageWidget> createState() => _AgentBuilderPageWidgetState();
}

class _AgentBuilderPageWidgetState extends State<AgentBuilderPageWidget> {
  late AgentBuilderPageModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AgentBuilderPageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: 900.0,
      ),
      decoration: BoxDecoration(),
      child: Align(
        alignment: AlignmentDirectional(0.0, -1.0),
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
              width: MediaQuery.sizeOf(context).width < 1200.0 ? 900.0 : 600.0,
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
                            'Agent Builder',
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
                          Builder(
                            builder: (context) => FFButtonWidget(
                              onPressed: () async {
                                await showDialog(
                                  context: context,
                                  builder: (dialogContext) {
                                    return Dialog(
                                      elevation: 0,
                                      insetPadding: EdgeInsets.zero,
                                      backgroundColor: Colors.transparent,
                                      alignment: AlignmentDirectional(0.0, 0.0)
                                          .resolve(Directionality.of(context)),
                                      child: CreateAgentWidget(
                                        organizations: widget!.organizations!,
                                      ),
                                    );
                                  },
                                );
                              },
                              text: 'New Agent',
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
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontStyle,
                                      ),
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
                                hoverColor: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                hoverTextColor:
                                    FlutterFlowTheme.of(context).secondary,
                                hoverElevation: 0.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Builder(
                          builder: (context) {
                            if ((widget!.organizations != null &&
                                    (widget!.organizations)!.isNotEmpty) ==
                                true) {
                              return StreamBuilder<List<AgentsRecord>>(
                                stream: queryAgentsRecord(
                                  queryBuilder: (agentsRecord) => agentsRecord
                                      .whereIn(
                                          'organization',
                                          widget!.organizations
                                              ?.map((e) => e.reference)
                                              .toList())
                                      .orderBy('edited_time'),
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: Container(
                                        width: 40.0,
                                        height: 40.0,
                                        child: LoadingWidget(),
                                      ),
                                    );
                                  }
                                  List<AgentsRecord> wrapAgentsRecordList =
                                      snapshot.data!;
                                  if (wrapAgentsRecordList.isEmpty) {
                                    return Center(
                                      child: Container(
                                        height: 150.0,
                                        child: EmptyListWidget(
                                          text: 'No Agents Found',
                                          icon: FaIcon(
                                            FontAwesomeIcons.skullCrossbones,
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                          ),
                                        ),
                                      ),
                                    );
                                  }

                                  return Wrap(
                                    spacing: 10.0,
                                    runSpacing: 10.0,
                                    alignment: WrapAlignment.start,
                                    crossAxisAlignment:
                                        WrapCrossAlignment.start,
                                    direction: Axis.horizontal,
                                    runAlignment: WrapAlignment.start,
                                    verticalDirection: VerticalDirection.down,
                                    clipBehavior: Clip.none,
                                    children: List.generate(
                                        wrapAgentsRecordList.length,
                                        (wrapIndex) {
                                      final wrapAgentsRecord =
                                          wrapAgentsRecordList[wrapIndex];
                                      return Container(
                                        key: ValueKey(
                                            wrapAgentsRecord.reference.id),
                                        width: 175.0,
                                        height: 140.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                          ),
                                        ),
                                        child: Stack(
                                          children: [
                                            Container(
                                              width: double.infinity,
                                              decoration: BoxDecoration(),
                                              child: Padding(
                                                padding: EdgeInsets.all(15.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Flexible(
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                        ),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Expanded(
                                                              child: ClipRRect(
                                                                child:
                                                                    Container(
                                                                  width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      1.0,
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Flexible(
                                                                            child:
                                                                                Container(
                                                                              decoration: BoxDecoration(
                                                                                borderRadius: BorderRadius.circular(20.0),
                                                                                border: Border.all(
                                                                                  color: FlutterFlowTheme.of(context).alternate,
                                                                                ),
                                                                              ),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.min,
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: EdgeInsets.all(2.5),
                                                                                    child: Container(
                                                                                      width: 20.0,
                                                                                      height: 20.0,
                                                                                      clipBehavior: Clip.antiAlias,
                                                                                      decoration: BoxDecoration(
                                                                                        shape: BoxShape.circle,
                                                                                      ),
                                                                                      child: CachedNetworkImage(
                                                                                        fadeInDuration: Duration(milliseconds: 500),
                                                                                        fadeOutDuration: Duration(milliseconds: 500),
                                                                                        imageUrl: widget!.organizations!.where((e) => e.reference.id == wrapAgentsRecord.organization?.id).toList().firstOrNull!.profile.photoUrl,
                                                                                        fit: BoxFit.cover,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                                                                                    child: AutoSizeText(
                                                                                      valueOrDefault<String>(
                                                                                        widget!.organizations?.where((e) => e.reference.id == wrapAgentsRecord.organization?.id).toList()?.firstOrNull?.profile?.displayName,
                                                                                        'Org Name',
                                                                                      ).maybeHandleOverflow(
                                                                                        maxChars: 15,
                                                                                        replacement: '…',
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                            font: GoogleFonts.rubik(
                                                                                              fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                            ),
                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                            fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ].divide(SizedBox(width: 5.0)),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Text(
                                                                        wrapAgentsRecord
                                                                            .profile
                                                                            .displayName
                                                                            .maybeHandleOverflow(
                                                                          maxChars:
                                                                              40,
                                                                          replacement:
                                                                              '…',
                                                                        ),
                                                                        maxLines:
                                                                            1,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .titleLarge
                                                                            .override(
                                                                              font: GoogleFonts.rubik(
                                                                                fontWeight: FlutterFlowTheme.of(context).titleLarge.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                                                                              ),
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FlutterFlowTheme.of(context).titleLarge.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                                                                            ),
                                                                      ),
                                                                    ],
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
                                              ),
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  1.0, 1.0),
                                              child: Padding(
                                                padding: EdgeInsets.all(15.0),
                                                child: Container(
                                                  width: 25.0,
                                                  height: 25.0,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                  ),
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: FaIcon(
                                                    FontAwesomeIcons
                                                        .chevronRight,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                    size: 16.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    }),
                                  );
                                },
                              );
                            } else {
                              return Container(
                                height: 150.0,
                                child: wrapWithModel(
                                  model: _model.emptyListModel,
                                  updateCallback: () => safeSetState(() {}),
                                  child: EmptyListWidget(
                                    text: 'No Device Profiles Found',
                                    icon: Icon(
                                      Icons.cloud_off_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                    ),
                                  ),
                                ),
                              );
                            }
                          },
                        ),
                      ),
                    ].divide(SizedBox(height: 20.0)),
                  ),
                ),
              ),
            ),
            Container(
              width: MediaQuery.sizeOf(context).width < 1200.0 ? 900.0 : 300.0,
              decoration: BoxDecoration(),
              alignment: AlignmentDirectional(0.0, -1.0),
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      wrapWithModel(
                        model: _model.docGuideBlockModel,
                        updateCallback: () => safeSetState(() {}),
                        child: DocGuideBlockWidget(
                          question: 'What is an Agent?',
                          answer:
                              'An AI-powered digital assistant integrated into the Medibound ecosystem to streamline medical device management and enhance user interaction.',
                          button: 'Learn More',
                          buttonAction: () async {},
                        ),
                      ),
                    ].divide(SizedBox(height: 20.0)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
