import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/device_profiles/create_device_profile/create_device_profile_widget.dart';
import '/utils/doc_guide_block/doc_guide_block_widget.dart';
import '/utils/empty_list/empty_list_widget.dart';
import '/utils/loading/loading_widget.dart';
import '/utils/nav_bar/nav_bar_widget.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'device_profiles_page_model.dart';
export 'device_profiles_page_model.dart';

class DeviceProfilesPageWidget extends StatefulWidget {
  const DeviceProfilesPageWidget({super.key});

  @override
  State<DeviceProfilesPageWidget> createState() =>
      _DeviceProfilesPageWidgetState();
}

class _DeviceProfilesPageWidgetState extends State<DeviceProfilesPageWidget> {
  late DeviceProfilesPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DeviceProfilesPageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<List<OrganizationsRecord>>(
      stream: queryOrganizationsRecord(
        queryBuilder: (organizationsRecord) =>
            organizationsRecord.whereArrayContainsAny(
                'members',
                getRoledUserListFirestoreData(
                  functions.allRoledUsers(currentUserReference!),
                )),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: Center(
              child: SizedBox(
                width: 25.0,
                height: 25.0,
                child: SpinKitPulse(
                  color: FlutterFlowTheme.of(context).primary,
                  size: 25.0,
                ),
              ),
            ),
          );
        }
        List<OrganizationsRecord> deviceProfilesPageOrganizationsRecordList =
            snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: Container(
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
                                FlutterFlowTheme.of(context)
                                    .secondaryBackground,
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
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Container(
                          width: double.infinity,
                          height: MediaQuery.sizeOf(context).height * 1.0,
                          decoration: BoxDecoration(),
                          alignment: AlignmentDirectional(0.0, 0.0),
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
                                  child: NavBarWidget(
                                    page: 2,
                                  ),
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
                                        decoration: BoxDecoration(),
                                      ),
                                      Expanded(
                                        child: Container(
                                          constraints: BoxConstraints(
                                            maxWidth: 900.0,
                                          ),
                                          decoration: BoxDecoration(),
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(0.0, -1.0),
                                            child: Wrap(
                                              spacing: 0.0,
                                              runSpacing: 0.0,
                                              alignment: WrapAlignment.start,
                                              crossAxisAlignment:
                                                  WrapCrossAlignment.start,
                                              direction: Axis.horizontal,
                                              runAlignment: WrapAlignment.start,
                                              verticalDirection:
                                                  VerticalDirection.down,
                                              clipBehavior: Clip.none,
                                              children: [
                                                Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                                  .width <
                                                              1200.0
                                                          ? 900.0
                                                          : 600.0,
                                                  decoration: BoxDecoration(),
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, -1.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.all(20.0),
                                                    child:
                                                        SingleChildScrollView(
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Text(
                                                                'My Device Profiles',
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Rubik',
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                              Builder(
                                                                builder:
                                                                    (context) =>
                                                                        FFButtonWidget(
                                                                  onPressed:
                                                                      () async {
                                                                    await showDialog(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (dialogContext) {
                                                                        return Dialog(
                                                                          elevation:
                                                                              0,
                                                                          insetPadding:
                                                                              EdgeInsets.zero,
                                                                          backgroundColor:
                                                                              Colors.transparent,
                                                                          alignment:
                                                                              AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                          child:
                                                                              GestureDetector(
                                                                            onTap:
                                                                                () {
                                                                              FocusScope.of(dialogContext).unfocus();
                                                                              FocusManager.instance.primaryFocus?.unfocus();
                                                                            },
                                                                            child:
                                                                                CreateDeviceProfileWidget(),
                                                                          ),
                                                                        );
                                                                      },
                                                                    );
                                                                  },
                                                                  text:
                                                                      'New Device Profile',
                                                                  icon: FaIcon(
                                                                    FontAwesomeIcons
                                                                        .plus,
                                                                    size: 14.0,
                                                                  ),
                                                                  options:
                                                                      FFButtonOptions(
                                                                    height:
                                                                        40.0,
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            16.0,
                                                                            0.0,
                                                                            16.0,
                                                                            0.0),
                                                                    iconPadding:
                                                                        EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .alternate,
                                                                    textStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .override(
                                                                          fontFamily:
                                                                              'Rubik',
                                                                          fontSize:
                                                                              14.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                    elevation:
                                                                        0.0,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10.0),
                                                                    hoverColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .primaryBackground,
                                                                    hoverTextColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .secondary,
                                                                    hoverElevation:
                                                                        0.0,
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10.0),
                                                            ),
                                                            child: Builder(
                                                              builder:
                                                                  (context) {
                                                                if (deviceProfilesPageOrganizationsRecordList
                                                                    .isNotEmpty) {
                                                                  return StreamBuilder<
                                                                      List<
                                                                          DeviceProfilesRecord>>(
                                                                    stream:
                                                                        queryDeviceProfilesRecord(
                                                                      queryBuilder: (deviceProfilesRecord) => deviceProfilesRecord
                                                                          .whereIn(
                                                                              'organization',
                                                                              deviceProfilesPageOrganizationsRecordList.map((e) => e.reference).toList())
                                                                          .orderBy('edited_time'),
                                                                    ),
                                                                    builder:
                                                                        (context,
                                                                            snapshot) {
                                                                      // Customize what your widget looks like when it's loading.
                                                                      if (!snapshot
                                                                          .hasData) {
                                                                        return Center(
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                40.0,
                                                                            height:
                                                                                40.0,
                                                                            child:
                                                                                LoadingWidget(),
                                                                          ),
                                                                        );
                                                                      }
                                                                      List<DeviceProfilesRecord>
                                                                          gridViewDeviceProfilesRecordList =
                                                                          snapshot
                                                                              .data!;
                                                                      if (gridViewDeviceProfilesRecordList
                                                                          .isEmpty) {
                                                                        return Center(
                                                                          child:
                                                                              Container(
                                                                            height:
                                                                                150.0,
                                                                            child:
                                                                                EmptyListWidget(
                                                                              text: 'No Device Profiles Found',
                                                                              icon: Icon(
                                                                                Icons.cloud_off_rounded,
                                                                                color: FlutterFlowTheme.of(context).alternate,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        );
                                                                      }

                                                                      return GridView
                                                                          .builder(
                                                                        padding:
                                                                            EdgeInsets.zero,
                                                                        gridDelegate:
                                                                            SliverGridDelegateWithFixedCrossAxisCount(
                                                                          crossAxisCount:
                                                                              3,
                                                                          crossAxisSpacing:
                                                                              15.0,
                                                                          mainAxisSpacing:
                                                                              15.0,
                                                                          childAspectRatio:
                                                                              1.35,
                                                                        ),
                                                                        primary:
                                                                            false,
                                                                        shrinkWrap:
                                                                            true,
                                                                        scrollDirection:
                                                                            Axis.vertical,
                                                                        itemCount:
                                                                            gridViewDeviceProfilesRecordList.length,
                                                                        itemBuilder:
                                                                            (context,
                                                                                gridViewIndex) {
                                                                          final gridViewDeviceProfilesRecord =
                                                                              gridViewDeviceProfilesRecordList[gridViewIndex];
                                                                          return InkWell(
                                                                            splashColor:
                                                                                Colors.transparent,
                                                                            focusColor:
                                                                                Colors.transparent,
                                                                            hoverColor:
                                                                                Colors.transparent,
                                                                            highlightColor:
                                                                                Colors.transparent,
                                                                            onTap:
                                                                                () async {
                                                                              context.pushNamed(
                                                                                'ManageDeviceProfilesPage',
                                                                                queryParameters: {
                                                                                  'deviceProfile': serializeParam(
                                                                                    gridViewDeviceProfilesRecord,
                                                                                    ParamType.Document,
                                                                                  ),
                                                                                }.withoutNulls,
                                                                                extra: <String, dynamic>{
                                                                                  'deviceProfile': gridViewDeviceProfilesRecord,
                                                                                },
                                                                              );
                                                                            },
                                                                            child:
                                                                                Container(
                                                                              key: ValueKey(gridViewDeviceProfilesRecord.reference.id),
                                                                              width: 100.0,
                                                                              height: 100.0,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                boxShadow: [
                                                                                  BoxShadow(
                                                                                    blurRadius: 10.0,
                                                                                    color: Color(0x1E000000),
                                                                                    offset: Offset(
                                                                                      2.0,
                                                                                      2.0,
                                                                                    ),
                                                                                  )
                                                                                ],
                                                                                borderRadius: BorderRadius.circular(15.0),
                                                                                border: Border.all(
                                                                                  color: FlutterFlowTheme.of(context).alternate,
                                                                                ),
                                                                              ),
                                                                              child: Stack(
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: EdgeInsets.all(15.0),
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                          children: [
                                                                                            Flexible(
                                                                                              child: Container(
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
                                                                                                          imageUrl: valueOrDefault<String>(
                                                                                                            deviceProfilesPageOrganizationsRecordList.where((e) => e.reference.id == gridViewDeviceProfilesRecord.organization?.id).toList().firstOrNull?.profile?.photoUrl,
                                                                                                            'Org Name',
                                                                                                          ),
                                                                                                          fit: BoxFit.cover,
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                                                                                                      child: AutoSizeText(
                                                                                                        valueOrDefault<String>(
                                                                                                          deviceProfilesPageOrganizationsRecordList.where((e) => e.reference.id == gridViewDeviceProfilesRecord.organization?.id).toList().firstOrNull?.profile?.displayName,
                                                                                                          'Org Name',
                                                                                                        ).maybeHandleOverflow(
                                                                                                          maxChars: 15,
                                                                                                          replacement: '…',
                                                                                                        ),
                                                                                                        style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                              fontFamily: 'Rubik',
                                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                                              letterSpacing: 0.0,
                                                                                                            ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ].divide(SizedBox(width: 5.0)),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                            Container(
                                                                                              width: 25.0,
                                                                                              height: 25.0,
                                                                                              decoration: BoxDecoration(
                                                                                                color: FlutterFlowTheme.of(context).alternate,
                                                                                                shape: BoxShape.circle,
                                                                                              ),
                                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                                              child: FaIcon(
                                                                                                FontAwesomeIcons.ellipsisH,
                                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                size: 16.0,
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Expanded(
                                                                                              child: ClipRRect(
                                                                                                child: Container(
                                                                                                  decoration: BoxDecoration(),
                                                                                                  child: Column(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                    children: [
                                                                                                      AutoSizeText(
                                                                                                        gridViewDeviceProfilesRecord.info.display.maybeHandleOverflow(
                                                                                                          maxChars: 40,
                                                                                                          replacement: '…',
                                                                                                        ),
                                                                                                        maxLines: 2,
                                                                                                        style: FlutterFlowTheme.of(context).titleLarge.override(
                                                                                                              fontFamily: 'Rubik',
                                                                                                              letterSpacing: 0.0,
                                                                                                            ),
                                                                                                      ),
                                                                                                      AutoSizeText(
                                                                                                        valueOrDefault<String>(
                                                                                                          FFAppState().DeviceTypes.where((e) => e.code == gridViewDeviceProfilesRecord.type).toList().firstOrNull?.display,
                                                                                                          'Device Category',
                                                                                                        ).maybeHandleOverflow(
                                                                                                          maxChars: 40,
                                                                                                          replacement: '…',
                                                                                                        ),
                                                                                                        maxLines: 2,
                                                                                                        style: FlutterFlowTheme.of(context).titleLarge.override(
                                                                                                              fontFamily: 'Rubik',
                                                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                              fontSize: 12.0,
                                                                                                              letterSpacing: 0.0,
                                                                                                              fontWeight: FontWeight.normal,
                                                                                                            ),
                                                                                                      ),
                                                                                                      AutoSizeText(
                                                                                                        '34 Active Devices'.maybeHandleOverflow(
                                                                                                          maxChars: 40,
                                                                                                          replacement: '…',
                                                                                                        ),
                                                                                                        maxLines: 2,
                                                                                                        style: FlutterFlowTheme.of(context).titleLarge.override(
                                                                                                              fontFamily: 'Rubik',
                                                                                                              color: FlutterFlowTheme.of(context).secondary,
                                                                                                              fontSize: 12.0,
                                                                                                              letterSpacing: 0.0,
                                                                                                              fontWeight: FontWeight.normal,
                                                                                                            ),
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                  Align(
                                                                                    alignment: AlignmentDirectional(1.0, 1.0),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsets.all(15.0),
                                                                                      child: Container(
                                                                                        width: 25.0,
                                                                                        height: 25.0,
                                                                                        decoration: BoxDecoration(
                                                                                          shape: BoxShape.circle,
                                                                                        ),
                                                                                        alignment: AlignmentDirectional(0.0, 0.0),
                                                                                        child: FaIcon(
                                                                                          FontAwesomeIcons.chevronRight,
                                                                                          color: FlutterFlowTheme.of(context).alternate,
                                                                                          size: 16.0,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          );
                                                                        },
                                                                      );
                                                                    },
                                                                  );
                                                                } else {
                                                                  return Container(
                                                                    height:
                                                                        150.0,
                                                                    child:
                                                                        wrapWithModel(
                                                                      model: _model
                                                                          .emptyListModel,
                                                                      updateCallback:
                                                                          () =>
                                                                              safeSetState(() {}),
                                                                      child:
                                                                          EmptyListWidget(
                                                                        text:
                                                                            'No Device Profiles Found',
                                                                        icon:
                                                                            Icon(
                                                                          Icons
                                                                              .cloud_off_rounded,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryText,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                }
                                                              },
                                                            ),
                                                          ),
                                                        ].divide(SizedBox(
                                                            height: 20.0)),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                                  .width <
                                                              1200.0
                                                          ? 900.0
                                                          : 300.0,
                                                  decoration: BoxDecoration(),
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, -1.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.all(20.0),
                                                    child:
                                                        SingleChildScrollView(
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          wrapWithModel(
                                                            model: _model
                                                                .docGuideBlockModel,
                                                            updateCallback: () =>
                                                                safeSetState(
                                                                    () {}),
                                                            child:
                                                                DocGuideBlockWidget(
                                                              question:
                                                                  'What is a Device Profile?',
                                                              answer:
                                                                  'A Device Profile is a structured representation of a medical device’s essential characteristics, configuration, and operational details. It serves as a blueprint for managing the device\'s data, functionality, and integration within a platform like Medibound.',
                                                              button:
                                                                  'Learn More',
                                                              buttonAction:
                                                                  () async {},
                                                            ),
                                                          ),
                                                        ].divide(SizedBox(
                                                            height: 20.0)),
                                                      ),
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
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
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
