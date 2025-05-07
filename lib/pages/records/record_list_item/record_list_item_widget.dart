import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_util.dart';
import "package:medibound_portal_hdztzw/backend/backend.dart"
    as medibound_portal_hdztzw_backend;
import "package:medibound_portal_hdztzw/backend/schema/enums/enums.dart"
    as medibound_portal_hdztzw_enums;
import "package:medibound_portal_hdztzw/backend/schema/structs/index.dart"
    as medibound_portal_hdztzw_data_schema;
import 'package:medibound_portal_hdztzw/flutter_flow/flutter_flow_util.dart'
    as medibound_portal_hdztzw_util
    show wrapWithModel, createModel, FlutterFlowDynamicModels;
import 'package:medibound_portal_hdztzw/pages/device_profiles/record/header/header_widget.dart'
    as medibound_portal_hdztzw;
import 'package:medibound_portal_hdztzw/utils/empty/empty_widget.dart'
    as medibound_portal_hdztzw;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'record_list_item_model.dart';
export 'record_list_item_model.dart';

class RecordListItemWidget extends StatefulWidget {
  const RecordListItemWidget({
    super.key,
    required this.recordWidth,
    required this.record,
    required this.data,
    bool? selected,
    bool? message,
  })  : this.selected = selected ?? false,
        this.message = message ?? false;

  final double? recordWidth;
  final medibound_portal_hdztzw_backend.RecordsRecord? record;
  final List<medibound_portal_hdztzw_data_schema.VariableStruct>? data;
  final bool selected;
  final bool message;

  @override
  State<RecordListItemWidget> createState() => _RecordListItemWidgetState();
}

class _RecordListItemWidgetState extends State<RecordListItemWidget>
    with TickerProviderStateMixin {
  late RecordListItemModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RecordListItemModel());

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOutQuint,
            delay: 0.0.ms,
            duration: 430.0.ms,
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
    return Stack(
      alignment: AlignmentDirectional(1.0, -1.0),
      children: [
        StreamBuilder<medibound_portal_hdztzw_backend.RecordTemplateRecord>(
          stream:
              medibound_portal_hdztzw_backend.RecordTemplateRecord.getDocument(
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
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15.0),
                  bottomRight: Radius.circular(15.0),
                  topLeft: Radius.circular(15.0),
                  topRight: Radius.circular(valueOrDefault<double>(
                    widget.message ? 5.0 : 15.0,
                    0.0,
                  )),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15.0),
                      bottomRight: Radius.circular(15.0),
                      topLeft: Radius.circular(15.0),
                      topRight: Radius.circular(valueOrDefault<double>(
                        widget.message ? 5.0 : 15.0,
                        0.0,
                      )),
                    ),
                    border: Border.all(
                      color: widget.selected
                          ? FlutterFlowTheme.of(context).primary
                          : Colors.transparent,
                      width: widget.selected ? 1.5 : 0.0,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Container(
                          width: (widget.recordWidth!) - 30.0,
                          decoration: BoxDecoration(),
                          child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
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
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        5.0, 0.0, 0.0, 0.0),
                                                child: Wrap(
                                                  spacing: 2.0,
                                                  runSpacing: 0.0,
                                                  alignment:
                                                      WrapAlignment.start,
                                                  crossAxisAlignment:
                                                      WrapCrossAlignment.start,
                                                  direction: Axis.vertical,
                                                  runAlignment:
                                                      WrapAlignment.start,
                                                  verticalDirection:
                                                      VerticalDirection.down,
                                                  clipBehavior: Clip.none,
                                                  children: [
                                                    AutoSizeText(
                                                      valueOrDefault<String>(
                                                        widget.record?.info
                                                            .display,
                                                        'Example Record',
                                                      ).maybeHandleOverflow(
                                                        maxChars: 20,
                                                        replacement: '…',
                                                      ),
                                                      textAlign:
                                                          TextAlign.start,
                                                      maxLines: 1,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .headlineSmall
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .rubik(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineSmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineSmall
                                                                      .fontStyle,
                                                                ),
                                                                fontSize: 18.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineSmall
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineSmall
                                                                    .fontStyle,
                                                              ),
                                                    ),
                                                    Builder(
                                                      builder: (context) {
                                                        if (containerRecordTemplateRecord
                                                                .source
                                                                .sourceType ==
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
                                                                        .source
                                                                        .uid,
                                                              ),
                                                              singleRecord:
                                                                  true,
                                                            ),
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
                                                              List<
                                                                      medibound_portal_hdztzw_backend
                                                                      .DeviceProfilesRecord>
                                                                  containerDeviceProfilesRecordList =
                                                                  snapshot
                                                                      .data!;
                                                              // Return an empty Container when the item does not exist.
                                                              if (snapshot.data!
                                                                  .isEmpty) {
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
                                                                          width:
                                                                              25.0,
                                                                          height:
                                                                              25.0,
                                                                          child:
                                                                              SpinKitPulse(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
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
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children:
                                                                            [
                                                                          AutoSizeText(
                                                                            'from',
                                                                            textAlign:
                                                                                TextAlign.start,
                                                                            maxLines:
                                                                                1,
                                                                            style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                  font: GoogleFonts.rubik(
                                                                                    fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                  ),
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
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
                                                                              shape: BoxShape.circle,
                                                                            ),
                                                                            child:
                                                                                CachedNetworkImage(
                                                                              fadeInDuration: Duration(milliseconds: 500),
                                                                              fadeOutDuration: Duration(milliseconds: 500),
                                                                              imageUrl: valueOrDefault<String>(
                                                                                containerOrganizationsRecord.profile.photoUrl,
                                                                                'https://picsum.photos/seed/338/600',
                                                                              ),
                                                                              fit: BoxFit.cover,
                                                                            ),
                                                                          ),
                                                                          AutoSizeText(
                                                                            valueOrDefault<String>(
                                                                              containerDeviceProfilesRecord.info.display,
                                                                              'Device Name',
                                                                            ),
                                                                            textAlign:
                                                                                TextAlign.start,
                                                                            maxLines:
                                                                                1,
                                                                            style: FlutterFlowTheme.of(context).labelMedium.override(
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
                                                                        ].divide(SizedBox(width: 5.0)),
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
                                                            model: _model
                                                                .emptyModel,
                                                            updateCallback: () =>
                                                                safeSetState(
                                                                    () {}),
                                                            child: medibound_portal_hdztzw
                                                                .EmptyWidget(),
                                                          );
                                                        }
                                                      },
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
                                ),
                                medibound_portal_hdztzw_util.wrapWithModel(
                                  model: _model.headerModel,
                                  updateCallback: () => safeSetState(() {}),
                                  child: medibound_portal_hdztzw.HeaderWidget(
                                    headerWidth: (widget.recordWidth!) - 20.0,
                                    header:
                                        containerRecordTemplateRecord.header,
                                    varList: widget.data!,
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
            );
          },
        ),
        Container(
          decoration: BoxDecoration(),
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (!widget.message)
                  Container(
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).alternate,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(10.0, 5.0, 10.0, 5.0),
                      child: Text(
                        valueOrDefault<String>(
                          dateTimeFormat(
                            "yMd",
                            widget.record?.createdTime,
                            locale: FFLocalizations.of(context).languageCode,
                          ),
                          '08/04/2005',
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.rubik(
                                fontWeight: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                              letterSpacing: 0.0,
                              fontWeight: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                      ),
                    ),
                  ),
                if (widget.selected)
                  Container(
                    width: 25.0,
                    height: 25.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primary,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.check_rounded,
                      color: FlutterFlowTheme.of(context).secondary,
                      size: 16.0,
                    ),
                  ).animateOnPageLoad(
                      animationsMap['containerOnPageLoadAnimation']!),
              ].divide(SizedBox(width: 10.0)),
            ),
          ),
        ),
      ],
    );
  }
}
