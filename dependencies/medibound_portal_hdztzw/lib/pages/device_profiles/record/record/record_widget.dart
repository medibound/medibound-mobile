import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/device_profiles/record/body_section/body_section_widget.dart';
import '/pages/device_profiles/record/header/header_widget.dart';
import '/utils/empty/empty_widget.dart';
import 'dart:ui';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'record_model.dart';
export 'record_model.dart';

class RecordWidget extends StatefulWidget {
  const RecordWidget({
    super.key,
    required this.recordWidth,
    required this.recordTemplate,
    required this.data,
  });

  final double? recordWidth;
  final RecordTemplateRecord? recordTemplate;
  final List<DeviceVariableStruct>? data;

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
      width: widget!.recordWidth,
      decoration: BoxDecoration(),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 20.0, 20.0),
        child: SingleChildScrollView(
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
                  width: widget!.recordWidth,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Container(
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: Wrap(
                              spacing: 5.0,
                              runSpacing: 0.0,
                              alignment: WrapAlignment.start,
                              crossAxisAlignment: WrapCrossAlignment.start,
                              direction: Axis.vertical,
                              runAlignment: WrapAlignment.start,
                              verticalDirection: VerticalDirection.down,
                              clipBehavior: Clip.none,
                              children: [
                                AutoSizeText(
                                  valueOrDefault<String>(
                                    widget!.recordTemplate?.info?.display,
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
                                    if (widget!.recordTemplate?.source
                                            ?.sourceType ==
                                        CollectionSources.DEVICES) {
                                      return StreamBuilder<
                                          List<DeviceProfilesRecord>>(
                                        stream: queryDeviceProfilesRecord(
                                          queryBuilder:
                                              (deviceProfilesRecord) =>
                                                  deviceProfilesRecord.where(
                                            'info.code',
                                            isEqualTo: widget!
                                                .recordTemplate?.source?.uid,
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
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  size: 25.0,
                                                ),
                                              ),
                                            );
                                          }
                                          List<DeviceProfilesRecord>
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
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                            child: StreamBuilder<
                                                OrganizationsRecord>(
                                              stream: OrganizationsRecord
                                                  .getDocument(
                                                      containerDeviceProfilesRecord!
                                                          .organization!),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 25.0,
                                                      height: 25.0,
                                                      child: SpinKitPulse(
                                                        color:
                                                            FlutterFlowTheme.of(
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
                                                  decoration: BoxDecoration(),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                        width: 20.0,
                                                        height: 20.0,
                                                        clipBehavior:
                                                            Clip.antiAlias,
                                                        decoration:
                                                            BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
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
                                                          imageUrl:
                                                              containerOrganizationsRecord
                                                                  .profile
                                                                  .photoUrl,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                      AutoSizeText(
                                                        valueOrDefault<String>(
                                                          containerDeviceProfilesRecord
                                                              ?.info?.display,
                                                          'Device Name',
                                                        ),
                                                        textAlign:
                                                            TextAlign.start,
                                                        maxLines: 1,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Rubik',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 7.5)),
                                                  ),
                                                );
                                              },
                                            ),
                                          );
                                        },
                                      );
                                    } else {
                                      return wrapWithModel(
                                        model: _model.emptyModel,
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: EmptyWidget(),
                                      );
                                    }
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
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
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                  child: wrapWithModel(
                    model: _model.headerModel,
                    updateCallback: () => safeSetState(() {}),
                    child: HeaderWidget(
                      header: widget!.recordTemplate!.header,
                      headerWidth: (widget!.recordWidth!) - 40,
                      varList: widget!.data!,
                    ),
                  ),
                ),
              ),
              Builder(
                builder: (context) {
                  final sections =
                      widget!.recordTemplate?.sections?.toList() ?? [];

                  return ListView.separated(
                    padding: EdgeInsets.zero,
                    primary: false,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: sections.length,
                    separatorBuilder: (_, __) => SizedBox(height: 15.0),
                    itemBuilder: (context, sectionsIndex) {
                      final sectionsItem = sections[sectionsIndex];
                      return BodySectionWidget(
                        key: Key(
                            'Keye3n_${sectionsIndex}_of_${sections.length}'),
                        bodySection: sectionsItem,
                        bodySectionWidth: (widget!.recordWidth!) - 40,
                        varList: widget!.data!,
                      );
                    },
                  );
                },
              ),
            ].divide(SizedBox(height: 10.0)),
          ),
        ),
      ),
    );
  }
}
