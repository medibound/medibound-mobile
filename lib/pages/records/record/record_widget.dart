import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import "package:medibound_portal_hdztzw/backend/backend.dart"
    as medibound_portal_hdztzw_backend;
import "package:medibound_portal_hdztzw/backend/schema/enums/enums.dart"
    as medibound_portal_hdztzw_enums;
import "package:medibound_portal_hdztzw/backend/schema/structs/index.dart"
    as medibound_portal_hdztzw_data_schema;
import 'package:medibound_portal_hdztzw/flutter_flow/flutter_flow_util.dart'
    as medibound_portal_hdztzw_util
    show wrapWithModel, createModel, FlutterFlowDynamicModels;
import 'package:medibound_portal_hdztzw/pages/device_profiles/record/body_section/body_section_widget.dart'
    as medibound_portal_hdztzw;
import 'package:medibound_portal_hdztzw/pages/device_profiles/record/header/header_widget.dart'
    as medibound_portal_hdztzw;
import 'package:medibound_portal_hdztzw/utils/empty/empty_widget.dart'
    as medibound_portal_hdztzw;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:collection/collection.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'record_model.dart';
export 'record_model.dart';

class RecordWidget extends StatefulWidget {
  const RecordWidget({
    super.key,
    required this.recordWidth,
    required this.record,
    required this.data,
    bool? showNext,
  }) : this.showNext = showNext ?? false;

  final double? recordWidth;
  final medibound_portal_hdztzw_backend.RecordsRecord? record;
  final List<medibound_portal_hdztzw_data_schema.VariableStruct>? data;
  final bool showNext;

  @override
  State<RecordWidget> createState() => _RecordWidgetState();
}

class _RecordWidgetState extends State<RecordWidget>
    with TickerProviderStateMixin {
  late RecordModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RecordModel());

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 300.0.ms,
            duration: 600.0.ms,
            color: Color(0x80FFFFFF),
            angle: 0.524,
          ),
          SaturateEffect(
            curve: Curves.easeInOut,
            delay: 400.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 27.0),
            end: Offset(0.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
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
    return StreamBuilder<medibound_portal_hdztzw_backend.RecordTemplateRecord>(
      stream: medibound_portal_hdztzw_backend.RecordTemplateRecord.getDocument(
          widget.record!.template!),
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

        final containerRecordTemplateRecord = snapshot.data!;

        return SafeArea(
          child: Container(
            width: widget.recordWidth,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(0.0),
                bottomRight: Radius.circular(0.0),
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 20.0, 0.0),
              child: Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 100.0,
                          child: Divider(
                            thickness: 4.0,
                            color: FlutterFlowTheme.of(context).alternate,
                          ),
                        ),
                        Stack(
                          children: [
                            Align(
                              alignment: AlignmentDirectional(1.0, -1.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).alternate,
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 5.0, 10.0, 5.0),
                                  child: Text(
                                    valueOrDefault<String>(
                                      dateTimeFormat(
                                        "yMd",
                                        widget.record?.createdTime,
                                        locale: FFLocalizations.of(context)
                                            .languageCode,
                                      ),
                                      '08/04/2005',
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
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: Container(
                                width: widget.recordWidth,
                                decoration: BoxDecoration(),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 5.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Container(
                                          decoration: BoxDecoration(),
                                          child: Wrap(
                                            spacing: 5.0,
                                            runSpacing: 0.0,
                                            alignment: WrapAlignment.start,
                                            crossAxisAlignment:
                                                WrapCrossAlignment.start,
                                            direction: Axis.vertical,
                                            runAlignment: WrapAlignment.start,
                                            verticalDirection:
                                                VerticalDirection.down,
                                            clipBehavior: Clip.none,
                                            children: [
                                              AutoSizeText(
                                                valueOrDefault<String>(
                                                  widget.record?.info.display,
                                                  'Example Record',
                                                ).maybeHandleOverflow(
                                                  maxChars: 20,
                                                  replacement: '…',
                                                ),
                                                textAlign: TextAlign.start,
                                                maxLines: 1,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineSmall
                                                        .override(
                                                          font:
                                                              GoogleFonts.rubik(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineSmall
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineSmall
                                                                    .fontStyle,
                                                          ),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .headlineSmall
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .headlineSmall
                                                                  .fontStyle,
                                                        ),
                                              ),
                                              Builder(
                                                builder: (context) {
                                                  if (containerRecordTemplateRecord
                                                          .source.sourceType ==
                                                      medibound_portal_hdztzw_enums
                                                          .CollectionSources
                                                          .DEVICES) {
                                                    return StreamBuilder<
                                                        List<
                                                            medibound_portal_hdztzw_backend
                                                            .DeviceProfilesRecord>>(
                                                      stream: medibound_portal_hdztzw_backend
                                                          .queryDeviceProfilesRecord(
                                                        queryBuilder:
                                                            (deviceProfilesRecord) =>
                                                                deviceProfilesRecord
                                                                    .where(
                                                          'info.code',
                                                          isEqualTo:
                                                              containerRecordTemplateRecord
                                                                  .source.uid,
                                                        ),
                                                        singleRecord: true,
                                                      ),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return Center(
                                                            child: SizedBox(
                                                              width: 25.0,
                                                              height: 25.0,
                                                              child:
                                                                  SpinKitPulse(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                size: 25.0,
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                        List<
                                                                medibound_portal_hdztzw_backend
                                                                .DeviceProfilesRecord>
                                                            containerDeviceProfilesRecordList =
                                                            snapshot.data!;
                                                        // Return an empty Container when the item does not exist.
                                                        if (snapshot
                                                            .data!.isEmpty) {
                                                          return Container();
                                                        }
                                                        final containerDeviceProfilesRecord =
                                                            containerDeviceProfilesRecordList
                                                                    .isNotEmpty
                                                                ? containerDeviceProfilesRecordList
                                                                    .first
                                                                : null;

                                                        return Container(
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: StreamBuilder<
                                                              medibound_portal_hdztzw_backend
                                                              .OrganizationsRecord>(
                                                            stream: medibound_portal_hdztzw_backend
                                                                    .OrganizationsRecord
                                                                .getDocument(
                                                                    containerDeviceProfilesRecord!
                                                                        .organization!),
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return Center(
                                                                  child:
                                                                      SizedBox(
                                                                    width: 25.0,
                                                                    height:
                                                                        25.0,
                                                                    child:
                                                                        SpinKitPulse(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      size:
                                                                          25.0,
                                                                    ),
                                                                  ),
                                                                );
                                                              }

                                                              final containerOrganizationsRecord =
                                                                  snapshot
                                                                      .data!;

                                                              return Container(
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    AutoSizeText(
                                                                      'from',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .start,
                                                                      maxLines:
                                                                          1,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.rubik(
                                                                              fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                            ),
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                    Container(
                                                                      width:
                                                                          20.0,
                                                                      height:
                                                                          20.0,
                                                                      clipBehavior:
                                                                          Clip.antiAlias,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        shape: BoxShape
                                                                            .circle,
                                                                      ),
                                                                      child:
                                                                          CachedNetworkImage(
                                                                        fadeInDuration:
                                                                            Duration(milliseconds: 500),
                                                                        fadeOutDuration:
                                                                            Duration(milliseconds: 500),
                                                                        imageUrl:
                                                                            valueOrDefault<String>(
                                                                          containerOrganizationsRecord
                                                                              .profile
                                                                              .photoUrl,
                                                                          'https://picsum.photos/seed/338/600',
                                                                        ),
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    ),
                                                                    InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        Navigator.pop(
                                                                            context);
                                                                      },
                                                                      child:
                                                                          AutoSizeText(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          containerDeviceProfilesRecord
                                                                              .info
                                                                              .display,
                                                                          'Device Name',
                                                                        ),
                                                                        textAlign:
                                                                            TextAlign.start,
                                                                        maxLines:
                                                                            1,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .override(
                                                                              font: GoogleFonts.rubik(
                                                                                fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                              ),
                                                                              color: FlutterFlowTheme.of(context).secondary,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ].divide(SizedBox(
                                                                      width:
                                                                          5.0)),
                                                                ),
                                                              );
                                                            },
                                                          ),
                                                        );
                                                      },
                                                    );
                                                  } else {
                                                    return medibound_portal_hdztzw_util
                                                        .wrapWithModel(
                                                      model: _model.emptyModel,
                                                      updateCallback: () =>
                                                          safeSetState(() {}),
                                                      child:
                                                          medibound_portal_hdztzw
                                                              .EmptyWidget(),
                                                    );
                                                  }
                                                },
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
                          ],
                        ),
                        Align(
                          alignment: AlignmentDirectional(-1.0, 0.0),
                          child: medibound_portal_hdztzw_util.wrapWithModel(
                            model: _model.headerModel,
                            updateCallback: () => safeSetState(() {}),
                            child: medibound_portal_hdztzw.HeaderWidget(
                              headerWidth: (widget.recordWidth!) - 40,
                              header: containerRecordTemplateRecord.header,
                              varList: widget.data!,
                            ),
                          ),
                        ),
                        Builder(
                          builder: (context) {
                            final sections =
                                containerRecordTemplateRecord.sections.toList();

                            return ListView.separated(
                              padding: EdgeInsets.fromLTRB(
                                0,
                                0,
                                0,
                                80.0,
                              ),
                              primary: false,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: sections.length,
                              separatorBuilder: (_, __) =>
                                  SizedBox(height: 15.0),
                              itemBuilder: (context, sectionsIndex) {
                                final sectionsItem = sections[sectionsIndex];
                                return medibound_portal_hdztzw
                                    .BodySectionWidget(
                                  key: Key(
                                      'Keydor_${sectionsIndex}_of_${sections.length}'),
                                  bodySectionWidth: (widget.recordWidth!) - 40,
                                  varList: widget.data!,
                                  bodySection: sectionsItem,
                                );
                              },
                            );
                          },
                        ),
                      ].divide(SizedBox(height: 10.0)),
                    ),
                  ),
                  if (widget.showNext)
                    Align(
                      alignment: AlignmentDirectional(0.0, 1.0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Container(
                            width: double.infinity,
                            height: 45.0,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  FlutterFlowTheme.of(context).primary,
                                  FlutterFlowTheme.of(context).secondary
                                ],
                                stops: [0.0, 1.0],
                                begin: AlignmentDirectional(0.0, -1.0),
                                end: AlignmentDirectional(0, 1.0),
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Align(
                              alignment: AlignmentDirectional(0.0, 1.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  _model.agentMedi =
                                      await medibound_portal_hdztzw_backend
                                          .queryAgentsRecordOnce(
                                            queryBuilder: (agentsRecord) =>
                                                agentsRecord.where(
                                              'profile.uid',
                                              isEqualTo: 'sV5DT7G4GpTOsuAJaH6j',
                                            ),
                                            singleRecord: true,
                                          )
                                          .then((s) => s.firstOrNull);

                                  var messagesRecordReference =
                                      medibound_portal_hdztzw_backend
                                          .MessagesRecord.collection
                                          .doc();
                                  await messagesRecordReference.set({
                                    ...medibound_portal_hdztzw_backend
                                        .createMessagesRecordData(
                                      owner: currentUserReference,
                                      info: medibound_portal_hdztzw_data_schema
                                          .createCodedValueStruct(
                                        display: 'New Chat',
                                        description:
                                            'Conversation with Medi about a record',
                                        clearUnsetFields: false,
                                        create: true,
                                      ),
                                      agent: _model.agentMedi?.reference,
                                      loading: false,
                                    ),
                                    ...mapToFirestore(
                                      {
                                        'created_time':
                                            FieldValue.serverTimestamp(),
                                        'members': [currentUserReference],
                                      },
                                    ),
                                  });
                                  _model.messageGroup =
                                      medibound_portal_hdztzw_backend
                                          .MessagesRecord.getDocumentFromData({
                                    ...medibound_portal_hdztzw_backend
                                        .createMessagesRecordData(
                                      owner: currentUserReference,
                                      info: medibound_portal_hdztzw_data_schema
                                          .createCodedValueStruct(
                                        display: 'New Chat',
                                        description:
                                            'Conversation with Medi about a record',
                                        clearUnsetFields: false,
                                        create: true,
                                      ),
                                      agent: _model.agentMedi?.reference,
                                      loading: false,
                                    ),
                                    ...mapToFirestore(
                                      {
                                        'created_time': DateTime.now(),
                                        'members': [currentUserReference],
                                      },
                                    ),
                                  }, messagesRecordReference);

                                  await _model.messageGroup!.reference.update(
                                      medibound_portal_hdztzw_backend
                                          .createMessagesRecordData(
                                    info: medibound_portal_hdztzw_data_schema
                                        .createCodedValueStruct(
                                      code: _model.agentMedi?.reference.id,
                                      clearUnsetFields: false,
                                    ),
                                  ));

                                  var messageRecordReference =
                                      medibound_portal_hdztzw_backend
                                              .MessageRecord
                                          .createDoc(
                                              _model.messageGroup!.reference);
                                  await messageRecordReference.set({
                                    ...medibound_portal_hdztzw_backend
                                        .createMessageRecordData(
                                      record: widget.record?.reference,
                                      sentBy:
                                          medibound_portal_hdztzw_data_schema
                                              .updateProfileStruct(
                                        currentUserDocument?.profile,
                                        clearUnsetFields: false,
                                        create: true,
                                      ),
                                    ),
                                    ...mapToFirestore(
                                      {
                                        'created_time':
                                            FieldValue.serverTimestamp(),
                                      },
                                    ),
                                  });
                                  _model.messageInitial =
                                      medibound_portal_hdztzw_backend
                                          .MessageRecord.getDocumentFromData({
                                    ...medibound_portal_hdztzw_backend
                                        .createMessageRecordData(
                                      record: widget.record?.reference,
                                      sentBy:
                                          medibound_portal_hdztzw_data_schema
                                              .updateProfileStruct(
                                        currentUserDocument?.profile,
                                        clearUnsetFields: false,
                                        create: true,
                                      ),
                                    ),
                                    ...mapToFirestore(
                                      {
                                        'created_time': DateTime.now(),
                                      },
                                    ),
                                  }, messageRecordReference);
                                  Navigator.pop(context);

                                  safeSetState(() {});
                                },
                                text: 'What\'s Next',
                                icon: Icon(
                                  FFIcons.ksparkmedi,
                                  size: 18.0,
                                ),
                                options: FFButtonOptions(
                                  width: double.infinity,
                                  height: 42.5,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: Color(0x6000D6A1),
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
                                ),
                              ),
                            ),
                          ),
                        ).animateOnPageLoad(
                            animationsMap['containerOnPageLoadAnimation']!),
                      ),
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
