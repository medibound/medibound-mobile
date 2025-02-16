import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import "package:medibound_portal_hdztzw/backend/backend.dart"
    as medibound_portal_hdztzw_backend;
import "package:medibound_portal_hdztzw/backend/schema/enums/enums.dart"
    as medibound_portal_hdztzw_enums;
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
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'record_model.dart';
export 'record_model.dart';

class RecordWidget extends StatefulWidget {
  const RecordWidget({
    super.key,
    required this.recordWidth,
    required this.record,
  });

  final double? recordWidth;
  final medibound_portal_hdztzw_backend.RecordsRecord? record;

  @override
  State<RecordWidget> createState() => _RecordWidgetState();
}

class _RecordWidgetState extends State<RecordWidget> {
  late RecordModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RecordModel());
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

        return Container(
          width: widget.recordWidth,
          decoration: BoxDecoration(),
          child: Padding(
            padding: EdgeInsets.all(20.0),
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
                                      verticalDirection: VerticalDirection.down,
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
                                          style: FlutterFlowTheme.of(context)
                                              .headlineSmall
                                              .override(
                                                fontFamily: 'Rubik',
                                                letterSpacing: 0.0,
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
                                                stream:
                                                    medibound_portal_hdztzw_backend
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
                                                  List<
                                                          medibound_portal_hdztzw_backend
                                                          .DeviceProfilesRecord>
                                                      containerDeviceProfilesRecordList =
                                                      snapshot.data!;
                                                  // Return an empty Container when the item does not exist.
                                                  if (snapshot.data!.isEmpty) {
                                                    return Container();
                                                  }
                                                  final containerDeviceProfilesRecord =
                                                      containerDeviceProfilesRecordList
                                                              .isNotEmpty
                                                          ? containerDeviceProfilesRecordList
                                                              .first
                                                          : null;

                                                  return Container(
                                                    decoration: BoxDecoration(),
                                                    child: StreamBuilder<
                                                        medibound_portal_hdztzw_backend
                                                        .OrganizationsRecord>(
                                                      stream: medibound_portal_hdztzw_backend
                                                              .OrganizationsRecord
                                                          .getDocument(
                                                              containerDeviceProfilesRecord!
                                                                  .organization!),
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

                                                        final containerOrganizationsRecord =
                                                            snapshot.data!;

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
                                                              Container(
                                                                width: 20.0,
                                                                height: 20.0,
                                                                clipBehavior: Clip
                                                                    .antiAlias,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  shape: BoxShape
                                                                      .circle,
                                                                ),
                                                                child:
                                                                    CachedNetworkImage(
                                                                  fadeInDuration:
                                                                      Duration(
                                                                          milliseconds:
                                                                              500),
                                                                  fadeOutDuration:
                                                                      Duration(
                                                                          milliseconds:
                                                                              500),
                                                                  imageUrl: containerOrganizationsRecord
                                                                      .profile
                                                                      .photoUrl,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                              AutoSizeText(
                                                                valueOrDefault<
                                                                    String>(
                                                                  containerDeviceProfilesRecord
                                                                      .info
                                                                      .display,
                                                                  'Device Name',
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
                                                                maxLines: 1,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Rubik',
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                            ].divide(SizedBox(
                                                                width: 7.5)),
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
                              ],
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: medibound_portal_hdztzw_util.wrapWithModel(
                          model: _model.headerModel,
                          updateCallback: () => safeSetState(() {}),
                          child: medibound_portal_hdztzw.HeaderWidget(
                            headerWidth: (widget.recordWidth!) - 40,
                            header: containerRecordTemplateRecord.header,
                            varList: widget.record!.data,
                          ),
                        ),
                      ),
                      Builder(
                        builder: (context) {
                          final sections =
                              containerRecordTemplateRecord.sections.toList();

                          return ListView.separated(
                            padding: EdgeInsets.zero,
                            primary: false,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: sections.length,
                            separatorBuilder: (_, __) => SizedBox(height: 15.0),
                            itemBuilder: (context, sectionsIndex) {
                              final sectionsItem = sections[sectionsIndex];
                              return medibound_portal_hdztzw.BodySectionWidget(
                                key: Key(
                                    'Keydor_${sectionsIndex}_of_${sections.length}'),
                                bodySectionWidth: (widget.recordWidth!) - 40,
                                varList: widget.record!.data,
                                bodySection: sectionsItem,
                              );
                            },
                          );
                        },
                      ),
                      Container(
                        width: double.infinity,
                        height: 100.0,
                        decoration: BoxDecoration(),
                      ),
                    ].divide(SizedBox(height: 10.0)),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, 1.0),
                  child: FFButtonWidget(
                    onPressed: () {
                      print('Button pressed ...');
                    },
                    text: 'What\'s Next',
                    icon: Icon(
                      FFIcons.ksparkmedi,
                      size: 18.0,
                    ),
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 45.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Rubik',
                                color: Colors.white,
                                fontSize: 16.0,
                                letterSpacing: 0.0,
                              ),
                      elevation: 0.0,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
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
