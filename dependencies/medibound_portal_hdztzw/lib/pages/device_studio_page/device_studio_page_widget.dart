import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/device_profiles/create_device_profile/create_device_profile_widget.dart';
import '/utils/doc_guide_block/doc_guide_block_widget.dart';
import '/utils/empty_list/empty_list_widget.dart';
import '/utils/loading/loading_widget.dart';
import 'dart:math';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'device_studio_page_model.dart';
export 'device_studio_page_model.dart';

class DeviceStudioPageWidget extends StatefulWidget {
  const DeviceStudioPageWidget({
    super.key,
    required this.organizations,
  });

  final List<OrganizationsRecord>? organizations;

  @override
  State<DeviceStudioPageWidget> createState() => _DeviceStudioPageWidgetState();
}

class _DeviceStudioPageWidgetState extends State<DeviceStudioPageWidget>
    with TickerProviderStateMixin {
  late DeviceStudioPageModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DeviceStudioPageModel());

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
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
    context.watch<FFAppState>();

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
                            'Device Studio',
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
                                      child: CreateDeviceProfileWidget(
                                        organizations: widget!.organizations!,
                                      ),
                                    );
                                  },
                                );
                              },
                              text: 'New Device Profile',
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
                            if (widget!.organizations != null &&
                                (widget!.organizations)!.isNotEmpty) {
                              return StreamBuilder<List<DeviceProfilesRecord>>(
                                stream: queryDeviceProfilesRecord(
                                  queryBuilder: (deviceProfilesRecord) =>
                                      deviceProfilesRecord
                                          .whereIn(
                                              'organization',
                                              widget!.organizations
                                                  ?.map((e) => e.reference)
                                                  .toList())
                                          .where(
                                            'organization',
                                            isEqualTo: _model
                                                    .checkboxListTileValue!
                                                ? widget!.organizations
                                                    ?.where((e) =>
                                                        e.reference.id ==
                                                        'efefe')
                                                    .toList()
                                                    ?.firstOrNull
                                                : widget!.organizations
                                                    ?.where((e) =>
                                                        e.reference.id ==
                                                        FFAppState()
                                                            .selectedOrganization
                                                            .uid)
                                                    .toList()
                                                    ?.firstOrNull
                                                    ?.reference,
                                          )
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
                                  List<DeviceProfilesRecord>
                                      wrapDeviceProfilesRecordList =
                                      snapshot.data!;
                                  if (wrapDeviceProfilesRecordList.isEmpty) {
                                    return Center(
                                      child: Container(
                                        height: 250.0,
                                        child: EmptyListWidget(
                                          text: 'No Device Profiles Found',
                                          height: 250.0,
                                          image:
                                              'https://storage.googleapis.com/medibound-portal-hdztzw.firebasestorage.app/general/loading-icons/devicesLoading.png',
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
                                        wrapDeviceProfilesRecordList.length,
                                        (wrapIndex) {
                                      final wrapDeviceProfilesRecord =
                                          wrapDeviceProfilesRecordList[
                                              wrapIndex];
                                      return InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          await actions.navigate(
                                            context,
                                            RouteStruct(
                                              section: 'developers',
                                              page: 'device-studio',
                                              id: wrapDeviceProfilesRecord
                                                  .reference.id,
                                            ),
                                            false,
                                            () async {
                                              _model.updatePage(() {});
                                            },
                                          );
                                        },
                                        child: Container(
                                          key: ValueKey(wrapDeviceProfilesRecord
                                              .reference.id),
                                          width: 175.0,
                                          height: 140.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                            ),
                                          ),
                                          child: Stack(
                                            children: [
                                              Container(
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
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Container(
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(2.5),
                                                              child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
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
                                                                  imageUrl: widget!
                                                                      .organizations!
                                                                      .where((e) =>
                                                                          e.reference
                                                                              .id ==
                                                                          wrapDeviceProfilesRecord
                                                                              .organization
                                                                              ?.id)
                                                                      .toList()
                                                                      .firstOrNull!
                                                                      .profile
                                                                      .photoUrl,
                                                                  width: 30.0,
                                                                  height: 30.0,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                            ),
                                                            if (responsiveVisibility(
                                                              context: context,
                                                              phone: false,
                                                              tablet: false,
                                                              tabletLandscape:
                                                                  false,
                                                              desktop: false,
                                                            ))
                                                              Container(
                                                                width: 25.0,
                                                                height: 25.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate,
                                                                  shape: BoxShape
                                                                      .circle,
                                                                ),
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child: FaIcon(
                                                                  FontAwesomeIcons
                                                                      .ellipsisH,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  size: 16.0,
                                                                ),
                                                              ),
                                                          ],
                                                        ),
                                                      ),
                                                      Container(
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Expanded(
                                                              child: ClipRRect(
                                                                child:
                                                                    Container(
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      AutoSizeText(
                                                                        wrapDeviceProfilesRecord
                                                                            .info
                                                                            .display
                                                                            .maybeHandleOverflow(
                                                                          maxChars:
                                                                              40,
                                                                          replacement:
                                                                              '…',
                                                                        ),
                                                                        maxLines:
                                                                            2,
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
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children:
                                                                            [
                                                                          Container(
                                                                            width:
                                                                                16.0,
                                                                            height:
                                                                                16.0,
                                                                            child:
                                                                                custom_widgets.IconFromText(
                                                                              width: 16.0,
                                                                              height: 16.0,
                                                                              name: valueOrDefault<String>(
                                                                                FFAppState().DeviceTypes.where((e) => e.code == wrapDeviceProfilesRecord.type).toList().firstOrNull?.icon,
                                                                                'Device Category',
                                                                              ),
                                                                              size: 16.0,
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                            ),
                                                                          ),
                                                                          AutoSizeText(
                                                                            valueOrDefault<String>(
                                                                              FFAppState().DeviceTypes.where((e) => e.code == wrapDeviceProfilesRecord.type).toList().firstOrNull?.display,
                                                                              'Device Category',
                                                                            ).maybeHandleOverflow(
                                                                              maxChars: 40,
                                                                              replacement: '…',
                                                                            ),
                                                                            maxLines:
                                                                                2,
                                                                            style: FlutterFlowTheme.of(context).titleLarge.override(
                                                                                  font: GoogleFonts.rubik(
                                                                                    fontWeight: FontWeight.normal,
                                                                                    fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                                                                                  ),
                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                  fontSize: 12.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.normal,
                                                                                  fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                                                                                ),
                                                                          ),
                                                                        ].divide(SizedBox(width: 5.0)),
                                                                      ),
                                                                    ].divide(SizedBox(
                                                                        height:
                                                                            5.0)),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
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
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                      size: 16.0,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
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
                      ).animateOnPageLoad(
                          animationsMap['containerOnPageLoadAnimation']!),
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
                          question: 'What is a Device Profile?',
                          answer:
                              'A Device Profile is a structured representation of a medical device’s essential characteristics, configuration, and operational details. It serves as a blueprint for managing the device\'s data, functionality, and integration within a platform like Medibound.',
                          button: 'Learn More',
                          buttonAction: () async {},
                        ),
                      ),
                      Material(
                        color: Colors.transparent,
                        child: Theme(
                          data: ThemeData(
                            checkboxTheme: CheckboxThemeData(
                              visualDensity: VisualDensity.compact,
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                            ),
                            unselectedWidgetColor:
                                FlutterFlowTheme.of(context).alternate,
                          ),
                          child: CheckboxListTile(
                            value: _model.checkboxListTileValue ??= false,
                            onChanged: (newValue) async {
                              safeSetState(() =>
                                  _model.checkboxListTileValue = newValue!);
                            },
                            title: Text(
                              'Show All Devices',
                              style: FlutterFlowTheme.of(context)
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
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                            ),
                            activeColor: FlutterFlowTheme.of(context).primary,
                            checkColor: FlutterFlowTheme.of(context).info,
                            dense: false,
                            controlAffinity: ListTileControlAffinity.trailing,
                            contentPadding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 12.0, 0.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
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
