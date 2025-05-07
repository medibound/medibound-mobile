import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/custom_cloud_functions/custom_cloud_function_response_manager.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/device_profiles/builder/record_viewer/record_viewer_widget.dart';
import '/pages/devices/device_secret_dialog/device_secret_dialog_widget.dart';
import '/utils/desc_token/desc_token_widget.dart';
import '/utils/dialog_box/dialog_box_widget.dart';
import '/utils/doc_guide_block/doc_guide_block_widget.dart';
import '/utils/dropdown/component_profile_tile/component_profile_tile_widget.dart';
import '/utils/empty_list/empty_list_widget.dart';
import '/utils/loading/loading_widget.dart';
import '/utils/status_token/status_token_widget.dart';
import 'dart:math';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:collection/collection.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'manage_device_profiles_model.dart';
export 'manage_device_profiles_model.dart';

class ManageDeviceProfilesWidget extends StatefulWidget {
  const ManageDeviceProfilesWidget({
    super.key,
    required this.organizations,
  });

  final List<OrganizationsRecord>? organizations;

  @override
  State<ManageDeviceProfilesWidget> createState() =>
      _ManageDeviceProfilesWidgetState();
}

class _ManageDeviceProfilesWidgetState extends State<ManageDeviceProfilesWidget>
    with TickerProviderStateMixin {
  late ManageDeviceProfilesModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ManageDeviceProfilesModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget!.organizations != null &&
          (widget!.organizations)!.isNotEmpty) {
        _model.deviceProfiles = await queryDeviceProfilesRecordOnce(
          queryBuilder: (deviceProfilesRecord) => deviceProfilesRecord
              .whereIn('organization',
                  widget!.organizations?.map((e) => e.reference).toList())
              .where(
                'info.code',
                isEqualTo: FFAppState().currentRoute.id,
              ),
        );
        if (_model.deviceProfiles != null &&
            (_model.deviceProfiles)!.isNotEmpty) {
          _model.loading = false;
          _model.deviceProfile = _model.deviceProfiles?.firstOrNull;
          _model.ownerOrganization = widget!.organizations
              ?.where((e) =>
                  e.reference.id == _model.deviceProfile?.organization?.id)
              .toList()
              ?.firstOrNull;
          safeSetState(() {});
          safeSetState(() {
            _model.descriptionTextController?.text =
                _model.deviceProfile!.info.description;
          });
          safeSetState(() {
            _model.textController2?.text = _model.deviceProfile!.manualPath;
          });
          safeSetState(() {
            _model.textController3?.text =
                _model.deviceProfile!.uniqueDeviceIdentifier;
          });
          safeSetState(() {
            _model.textController4?.text = _model.deviceProfile!.modelNumber;
          });
          return;
        }
      }
      await actions.navigate(
        context,
        RouteStruct(
          section: 'developers',
          page: 'device-studio',
        ),
        false,
        () async {
          safeSetState(() {});
        },
      );
    });

    _model.tabBarController = TabController(
      vsync: this,
      length: 5,
      initialIndex: min(
          valueOrDefault<int>(
            FFAppState().currentRoute.tab != null &&
                    FFAppState().currentRoute.tab != ''
                ? valueOrDefault<int>(
                    int.parse(FFAppState().currentRoute.tab),
                    0,
                  )
                : 0,
            0,
          ),
          4),
    )
      ..addListener(() => safeSetState(() {}))
      ..addListener(() async {
        if (_model.tabBarController!.indexIsChanging) {
          return;
        }

        await actions.updateBrowserUrlPath(
          RouteStruct(
            display: FFAppState().currentRoute.display,
            section: FFAppState().currentRoute.section,
            page: FFAppState().currentRoute.page,
            id: FFAppState().currentRoute.id,
            tab: _model.tabBarCurrentIndex.toString(),
          ),
        );
      });

    _model.descriptionTextController ??=
        TextEditingController(text: _model.deviceProfile?.info?.description);
    _model.descriptionFocusNode ??= FocusNode();
    _model.descriptionFocusNode!.addListener(() => safeSetState(() {}));
    _model.textController2 ??=
        TextEditingController(text: _model.deviceProfile?.manualPath);
    _model.textFieldFocusNode1 ??= FocusNode();
    _model.textFieldFocusNode1!.addListener(() => safeSetState(() {}));
    _model.textController3 ??= TextEditingController(
        text: _model.deviceProfile?.uniqueDeviceIdentifier);
    _model.textFieldFocusNode2 ??= FocusNode();
    _model.textFieldFocusNode2!.addListener(() => safeSetState(() {}));
    _model.textController4 ??=
        TextEditingController(text: _model.deviceProfile?.modelNumber);
    _model.textFieldFocusNode3 ??= FocusNode();
    _model.textFieldFocusNode3!.addListener(() => safeSetState(() {}));
    animationsMap.addAll({
      'componentProfileTileOnPageLoadAnimation': AnimationInfo(
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
      'rowOnPageLoadAnimation': AnimationInfo(
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
      decoration: BoxDecoration(),
      child: Builder(
        builder: (context) {
          if (!_model.loading) {
            return Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: 900.0,
                  decoration: BoxDecoration(),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.all(2.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  decoration: BoxDecoration(),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 5.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              valueOrDefault<String>(
                                                _model.deviceProfile?.info
                                                    ?.display,
                                                'Device Name',
                                              ).maybeHandleOverflow(
                                                maxChars: 25,
                                                replacement: '…',
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .displaySmall
                                                      .override(
                                                        font: GoogleFonts.rubik(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .displaySmall
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .displaySmall
                                                                  .fontStyle,
                                                        ),
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .displaySmall
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .displaySmall
                                                                .fontStyle,
                                                        lineHeight: 1.0,
                                                      ),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Container(
                                                  width: 16.0,
                                                  height: 16.0,
                                                  child: custom_widgets
                                                      .IconFromText(
                                                    width: 16.0,
                                                    height: 16.0,
                                                    name:
                                                        valueOrDefault<String>(
                                                      FFAppState()
                                                          .DeviceTypes
                                                          .where((e) =>
                                                              e.code ==
                                                              valueOrDefault<
                                                                  String>(
                                                                _model
                                                                    .deviceProfile
                                                                    ?.type,
                                                                'Device Name',
                                                              ))
                                                          .toList()
                                                          .firstOrNull
                                                          ?.icon,
                                                      'Device Category',
                                                    ),
                                                    size: 16.0,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                  ),
                                                ),
                                                Text(
                                                  valueOrDefault<String>(
                                                    FFAppState()
                                                        .DeviceTypes
                                                        .where((e) =>
                                                            e.code ==
                                                            valueOrDefault<
                                                                String>(
                                                              _model
                                                                  .deviceProfile
                                                                  ?.type,
                                                              'Device Name',
                                                            ))
                                                        .toList()
                                                        .firstOrNull
                                                        ?.display,
                                                    'Device Category',
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyLarge
                                                      .override(
                                                        font: GoogleFonts.rubik(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyLarge
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyLarge
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyLarge
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyLarge
                                                                .fontStyle,
                                                        lineHeight: 1.0,
                                                      ),
                                                ),
                                              ].divide(SizedBox(width: 5.0)),
                                            ),
                                          ].divide(SizedBox(width: 15.0)),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.all(2.5),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    child: CachedNetworkImage(
                                                      fadeInDuration: Duration(
                                                          milliseconds: 500),
                                                      fadeOutDuration: Duration(
                                                          milliseconds: 500),
                                                      imageUrl: widget!
                                                          .organizations!
                                                          .where((e) =>
                                                              e.reference.id ==
                                                              _model
                                                                  .deviceProfile
                                                                  ?.organization
                                                                  ?.id)
                                                          .toList()
                                                          .firstOrNull!
                                                          .profile
                                                          .photoUrl,
                                                      width: 25.0,
                                                      height: 25.0,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 10.0, 0.0),
                                                  child: AutoSizeText(
                                                    valueOrDefault<String>(
                                                      widget!.organizations
                                                          ?.where((e) =>
                                                              e.reference.id ==
                                                              _model
                                                                  .deviceProfile
                                                                  ?.organization
                                                                  ?.id)
                                                          .toList()
                                                          ?.firstOrNull
                                                          ?.profile
                                                          ?.displayName,
                                                      'Org Name',
                                                    ).maybeHandleOverflow(
                                                      maxChars: 15,
                                                      replacement: '…',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .labelMedium
                                                        .override(
                                                          font:
                                                              GoogleFonts.rubik(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontStyle,
                                                          ),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontStyle,
                                                        ),
                                                  ),
                                                ),
                                              ].divide(SizedBox(width: 5.0)),
                                            ),
                                            Wrap(
                                              spacing: 10.0,
                                              runSpacing: 10.0,
                                              alignment: WrapAlignment.start,
                                              crossAxisAlignment:
                                                  WrapCrossAlignment.start,
                                              direction: Axis.horizontal,
                                              runAlignment: WrapAlignment.start,
                                              verticalDirection:
                                                  VerticalDirection.down,
                                              clipBehavior: Clip.none,
                                              children: [
                                                wrapWithModel(
                                                  model: _model.descTokenModel1,
                                                  updateCallback: () =>
                                                      safeSetState(() {}),
                                                  child: DescTokenWidget(
                                                    text: 'Manual Link',
                                                    icon: FaIcon(
                                                      FontAwesomeIcons.link,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondary,
                                                      size: 14.0,
                                                    ),
                                                    onClick: () async {
                                                      await launchURL(
                                                          valueOrDefault<
                                                              String>(
                                                        _model.deviceProfile
                                                            ?.manualPath,
                                                        'Device Name',
                                                      ));
                                                    },
                                                  ),
                                                ),
                                                wrapWithModel(
                                                  model: _model.descTokenModel2,
                                                  updateCallback: () =>
                                                      safeSetState(() {}),
                                                  child: DescTokenWidget(
                                                    text:
                                                        'UDI: ${_model.deviceProfile?.uniqueDeviceIdentifier}',
                                                    icon: Icon(
                                                      Icons.fingerprint_rounded,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondary,
                                                      size: 16.0,
                                                    ),
                                                    onClick: () async {},
                                                  ),
                                                ),
                                                wrapWithModel(
                                                  model: _model.descTokenModel3,
                                                  updateCallback: () =>
                                                      safeSetState(() {}),
                                                  child: DescTokenWidget(
                                                    text:
                                                        'Model #: ${_model.deviceProfile?.modelNumber}',
                                                    icon: Icon(
                                                      Icons.memory_rounded,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondary,
                                                      size: 16.0,
                                                    ),
                                                    onClick: () async {},
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ].divide(SizedBox(width: 5.0)),
                                        ),
                                      ].divide(SizedBox(height: 10.0)),
                                    ),
                                  ),
                                ),
                              ].divide(SizedBox(height: 2.5)),
                            ),
                          ),
                        ),
                        FFButtonWidget(
                          onPressed: () async {
                            safeSetState(() {
                              _model.tabBarController!.animateTo(
                                _model.tabBarController!.length - 1,
                                duration: Duration(milliseconds: 300),
                                curve: Curves.ease,
                              );
                            });
                          },
                          text: 'Edit Device Details',
                          icon: Icon(
                            Icons.edit_rounded,
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
                            hoverColor:
                                FlutterFlowTheme.of(context).primaryBackground,
                            hoverTextColor:
                                FlutterFlowTheme.of(context).secondary,
                            hoverElevation: 0.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 900.0,
                  child: Divider(
                    thickness: 1.0,
                    color: FlutterFlowTheme.of(context).alternate,
                  ),
                ),
                Flexible(
                  child: Container(
                    constraints: BoxConstraints(
                      maxWidth: 900.0,
                    ),
                    decoration: BoxDecoration(),
                    child: Container(
                      decoration: BoxDecoration(),
                      child: Align(
                        alignment: AlignmentDirectional(0.0, -1.0),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment(-1.0, 0),
                              child: TabBar(
                                isScrollable: true,
                                labelColor:
                                    FlutterFlowTheme.of(context).primaryText,
                                unselectedLabelColor:
                                    FlutterFlowTheme.of(context).secondaryText,
                                labelStyle: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                      font: GoogleFonts.rubik(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .fontStyle,
                                      ),
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .fontStyle,
                                    ),
                                unselectedLabelStyle: FlutterFlowTheme.of(
                                        context)
                                    .titleMedium
                                    .override(
                                      font: GoogleFonts.rubik(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .fontStyle,
                                      ),
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .fontStyle,
                                    ),
                                indicatorColor:
                                    FlutterFlowTheme.of(context).secondary,
                                indicatorWeight: 3.0,
                                tabs: [
                                  Tab(
                                    text: 'Instances',
                                  ),
                                  Tab(
                                    text: 'Variables',
                                  ),
                                  Tab(
                                    text: 'Regulatory Timeline',
                                  ),
                                  Tab(
                                    text: 'Development',
                                  ),
                                  Tab(
                                    text: 'Settings',
                                  ),
                                ],
                                controller: _model.tabBarController,
                                onTap: (i) async {
                                  [
                                    () async {},
                                    () async {},
                                    () async {},
                                    () async {},
                                    () async {}
                                  ][i]();
                                },
                              ),
                            ),
                            Expanded(
                              child: TabBarView(
                                controller: _model.tabBarController,
                                physics: const NeverScrollableScrollPhysics(),
                                children: [
                                  KeepAliveWidgetWrapper(
                                    builder: (context) => SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0.0, -1.0),
                                            child: Container(
                                              decoration: BoxDecoration(),
                                              child: Wrap(
                                                spacing: 0.0,
                                                runSpacing: 0.0,
                                                alignment: WrapAlignment.start,
                                                crossAxisAlignment:
                                                    WrapCrossAlignment.start,
                                                direction: Axis.horizontal,
                                                runAlignment:
                                                    WrapAlignment.start,
                                                verticalDirection:
                                                    VerticalDirection.down,
                                                clipBehavior: Clip.none,
                                                children: [
                                                  Container(
                                                    width: MediaQuery.sizeOf(
                                                                    context)
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
                                                            StreamBuilder<
                                                                List<
                                                                    DeviceRecord>>(
                                                              stream:
                                                                  queryDeviceRecord(
                                                                parent: _model
                                                                    .deviceProfile
                                                                    ?.reference,
                                                                queryBuilder: (deviceRecord) =>
                                                                    deviceRecord.orderBy(
                                                                        'last_updated',
                                                                        descending:
                                                                            true),
                                                              ),
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
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        size:
                                                                            25.0,
                                                                      ),
                                                                    ),
                                                                  );
                                                                }
                                                                List<DeviceRecord>
                                                                    containerDeviceRecordList =
                                                                    snapshot
                                                                        .data!;

                                                                return Container(
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              Text(
                                                                                'Deployed Instances',
                                                                                textAlign: TextAlign.start,
                                                                                maxLines: 1,
                                                                                style: FlutterFlowTheme.of(context).headlineMedium.override(
                                                                                      font: GoogleFonts.rubik(
                                                                                        fontWeight: FlutterFlowTheme.of(context).headlineMedium.fontWeight,
                                                                                        fontStyle: FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                                                                                      ),
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FlutterFlowTheme.of(context).headlineMedium.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                                                                                    ),
                                                                              ),
                                                                              AutoSizeText(
                                                                                '${containerDeviceRecordList.length.toString()} Active Devices'.maybeHandleOverflow(
                                                                                  maxChars: 40,
                                                                                  replacement: '…',
                                                                                ),
                                                                                maxLines: 2,
                                                                                style: FlutterFlowTheme.of(context).titleLarge.override(
                                                                                      font: GoogleFonts.rubik(
                                                                                        fontWeight: FontWeight.normal,
                                                                                        fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                                                                                      ),
                                                                                      color: FlutterFlowTheme.of(context).secondary,
                                                                                      fontSize: 12.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.normal,
                                                                                      fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                                                                                    ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          FFButtonWidget(
                                                                            onPressed:
                                                                                () async {
                                                                              final firestoreBatch = FirebaseFirestore.instance.batch();
                                                                              try {
                                                                                await Future.delayed(const Duration(milliseconds: 1000));
                                                                                try {
                                                                                  final result = await FirebaseFunctions.instanceFor(region: 'us-central1').httpsCallable('createDeviceKey').call({});
                                                                                  _model.secretKey = CreateDeviceKeyCloudFunctionCallResponse(
                                                                                    data: result.data,
                                                                                    succeeded: true,
                                                                                    resultAsString: result.data.toString(),
                                                                                    jsonBody: result.data,
                                                                                  );
                                                                                } on FirebaseFunctionsException catch (error) {
                                                                                  _model.secretKey = CreateDeviceKeyCloudFunctionCallResponse(
                                                                                    errorCode: error.code,
                                                                                    succeeded: false,
                                                                                  );
                                                                                }

                                                                                var deviceRecordReference = DeviceRecord.createDoc(_model.deviceProfile!.reference);
                                                                                firestoreBatch.set(deviceRecordReference, {
                                                                                  ...createDeviceRecordData(
                                                                                    profile: _model.deviceProfile?.reference,
                                                                                    status: 'offline',
                                                                                    online: false,
                                                                                  ),
                                                                                  ...mapToFirestore(
                                                                                    {
                                                                                      'last_updated': FieldValue.serverTimestamp(),
                                                                                      'created_time': FieldValue.serverTimestamp(),
                                                                                    },
                                                                                  ),
                                                                                });
                                                                                _model.device = DeviceRecord.getDocumentFromData({
                                                                                  ...createDeviceRecordData(
                                                                                    profile: _model.deviceProfile?.reference,
                                                                                    status: 'offline',
                                                                                    online: false,
                                                                                  ),
                                                                                  ...mapToFirestore(
                                                                                    {
                                                                                      'last_updated': DateTime.now(),
                                                                                      'created_time': DateTime.now(),
                                                                                    },
                                                                                  ),
                                                                                }, deviceRecordReference);

                                                                                firestoreBatch.update(
                                                                                    _model.device!.reference,
                                                                                    createDeviceRecordData(
                                                                                      info: createCodedValueStruct(
                                                                                        display: _model.deviceProfile?.info?.display,
                                                                                        description: valueOrDefault<String>(
                                                                                          _model.deviceProfile?.info?.description,
                                                                                          'Device Name',
                                                                                        ),
                                                                                        code: _model.device?.reference.id,
                                                                                        icon: FFAppState().DeviceTypes.where((e) => e.code == _model.deviceProfile?.type).toList().firstOrNull?.icon,
                                                                                        clearUnsetFields: false,
                                                                                      ),
                                                                                    ));
                                                                              } finally {
                                                                                await firestoreBatch.commit();
                                                                              }

                                                                              safeSetState(() {});
                                                                            },
                                                                            text:
                                                                                'New Device',
                                                                            icon:
                                                                                FaIcon(
                                                                              FontAwesomeIcons.plus,
                                                                              size: 14.0,
                                                                            ),
                                                                            options:
                                                                                FFButtonOptions(
                                                                              height: 42.5,
                                                                              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                              iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                              color: FlutterFlowTheme.of(context).alternate,
                                                                              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                    font: GoogleFonts.rubik(
                                                                                      fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                    ),
                                                                                    fontSize: 14.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                  ),
                                                                              elevation: 0.0,
                                                                              borderRadius: BorderRadius.circular(10.0),
                                                                              hoverColor: FlutterFlowTheme.of(context).primaryBackground,
                                                                              hoverTextColor: FlutterFlowTheme.of(context).secondary,
                                                                              hoverElevation: 0.0,
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      ClipRRect(
                                                                        borderRadius:
                                                                            BorderRadius.circular(10.0),
                                                                        child:
                                                                            Container(
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            borderRadius:
                                                                                BorderRadius.circular(10.0),
                                                                            border:
                                                                                Border.all(
                                                                              color: FlutterFlowTheme.of(context).alternate,
                                                                              width: 1.0,
                                                                            ),
                                                                          ),
                                                                          child:
                                                                              Builder(
                                                                            builder:
                                                                                (context) {
                                                                              final devices = containerDeviceRecordList.toList();
                                                                              if (devices.isEmpty) {
                                                                                return Center(
                                                                                  child: Container(
                                                                                    height: 150.0,
                                                                                    child: EmptyListWidget(
                                                                                      text: 'No Devices Found',
                                                                                      icon: Icon(
                                                                                        Icons.cloud_off_rounded,
                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              }

                                                                              return ListView.builder(
                                                                                padding: EdgeInsets.zero,
                                                                                primary: false,
                                                                                shrinkWrap: true,
                                                                                scrollDirection: Axis.vertical,
                                                                                itemCount: devices.length,
                                                                                itemBuilder: (context, devicesIndex) {
                                                                                  final devicesItem = devices[devicesIndex];
                                                                                  return Builder(
                                                                                    builder: (context) => InkWell(
                                                                                      splashColor: Colors.transparent,
                                                                                      focusColor: Colors.transparent,
                                                                                      hoverColor: Colors.transparent,
                                                                                      highlightColor: Colors.transparent,
                                                                                      onTap: () async {
                                                                                        _model.secretKeyOutput = await MediboundGroup.getSecretKeyCall.call(
                                                                                          jwt: currentJwtToken,
                                                                                          deviceProfileId: _model.deviceProfile?.reference.id,
                                                                                          deviceId: devicesItem.reference.id,
                                                                                        );

                                                                                        if ((_model.secretKeyOutput?.succeeded ?? true)) {
                                                                                          await showDialog(
                                                                                            context: context,
                                                                                            builder: (dialogContext) {
                                                                                              return Dialog(
                                                                                                elevation: 0,
                                                                                                insetPadding: EdgeInsets.zero,
                                                                                                backgroundColor: Colors.transparent,
                                                                                                alignment: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                                child: DeviceSecretDialogWidget(
                                                                                                  secretKey: MediboundGroup.getSecretKeyCall.key(
                                                                                                    (_model.secretKeyOutput?.jsonBody ?? ''),
                                                                                                  )!,
                                                                                                ),
                                                                                              );
                                                                                            },
                                                                                          );
                                                                                        }

                                                                                        safeSetState(() {});
                                                                                      },
                                                                                      child: ComponentProfileTileWidget(
                                                                                        key: Key('Key4hi_${devicesIndex}_of_${devices.length}'),
                                                                                        display: devicesItem.info.display,
                                                                                        subtitle: 'Last updated ${dateTimeFormat(
                                                                                          "relative",
                                                                                          devicesItem.lastUpdated,
                                                                                          locale: FFLocalizations.of(context).languageCode,
                                                                                        )}',
                                                                                        height: 50.0,
                                                                                        iconFromText: devicesItem.info.icon,
                                                                                        widget: () => StatusTokenWidget(
                                                                                          status: FFAppState().DeviceStatus.where((e) => e.code == devicesItem.status).toList().firstOrNull,
                                                                                        ),
                                                                                      ),
                                                                                    ).animateOnPageLoad(animationsMap['componentProfileTileOnPageLoadAnimation']!),
                                                                                  );
                                                                                },
                                                                              );
                                                                            },
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ].divide(SizedBox(
                                                                        height:
                                                                            10.0)),
                                                                  ),
                                                                );
                                                              },
                                                            ),
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      'Retired Devices',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .start,
                                                                      maxLines:
                                                                          1,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .headlineMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.rubik(
                                                                              fontWeight: FlutterFlowTheme.of(context).headlineMedium.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                                                                            ),
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).headlineMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ].divide(SizedBox(
                                                              height: 20.0)),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    width: MediaQuery.sizeOf(
                                                                    context)
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
                                                                  'How Do I Integrate My Hardware?',
                                                              answer:
                                                                  'Integrating your hardware into a platform like Medibound involves connecting your device’s functionality and data streams to the system. Here’s a step-by-step guide tailored for Medibound:',
                                                              button:
                                                                  'Start Here',
                                                              buttonAction:
                                                                  () async {},
                                                            ),
                                                          ),
                                                          StreamBuilder<
                                                              RecordTemplateRecord>(
                                                            stream: RecordTemplateRecord
                                                                .getDocument(_model
                                                                    .deviceProfile!
                                                                    .recordTemplate!),
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

                                                              final containerRecordTemplateRecord =
                                                                  snapshot
                                                                      .data!;

                                                              return ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10.0),
                                                                child:
                                                                    Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10.0),
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .alternate,
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          ),
                                                          StreamBuilder<
                                                              RecordTemplateRecord>(
                                                            stream: RecordTemplateRecord
                                                                .getDocument(_model
                                                                    .deviceProfile!
                                                                    .recordTemplate!),
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

                                                              final containerRecordTemplateRecord =
                                                                  snapshot
                                                                      .data!;

                                                              return Container(
                                                                decoration:
                                                                    BoxDecoration(),
                                                              );
                                                            },
                                                          ),
                                                        ].divide(SizedBox(
                                                            height: 15.0)),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ].addToEnd(SizedBox(height: 100.0)),
                                      ),
                                    ),
                                  ),
                                  KeepAliveWidgetWrapper(
                                    builder: (context) => Padding(
                                      padding: EdgeInsets.all(20.0),
                                      child: SingleChildScrollView(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Output Record',
                                              textAlign: TextAlign.start,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineSmall
                                                      .override(
                                                        font: GoogleFonts.rubik(
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
                                            StreamBuilder<RecordTemplateRecord>(
                                              stream: RecordTemplateRecord
                                                  .getDocument(_model
                                                      .deviceProfile!
                                                      .recordTemplate!),
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

                                                final containerRecordTemplateRecord =
                                                    snapshot.data!;

                                                return Container(
                                                  constraints: BoxConstraints(
                                                    maxWidth: 600.0,
                                                  ),
                                                  decoration: BoxDecoration(),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Stack(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                1.0, 1.0),
                                                        children: [
                                                          Container(
                                                            height: 300.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .alternate,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          15.0),
                                                            ),
                                                            child:
                                                                wrapWithModel(
                                                              model: _model
                                                                  .recordViewerModel,
                                                              updateCallback: () =>
                                                                  safeSetState(
                                                                      () {}),
                                                              child:
                                                                  RecordViewerWidget(
                                                                header:
                                                                    containerRecordTemplateRecord
                                                                        .header,
                                                                sections:
                                                                    containerRecordTemplateRecord
                                                                        .sections,
                                                                profile:
                                                                    ProfileStruct(
                                                                  displayName:
                                                                      valueOrDefault<
                                                                          String>(
                                                                    _model
                                                                        .deviceProfile
                                                                        ?.info
                                                                        ?.display,
                                                                    'Device Name',
                                                                  ),
                                                                  photoUrl: widget!
                                                                      .organizations
                                                                      ?.where((e) =>
                                                                          e.reference
                                                                              .id ==
                                                                          _model
                                                                              .deviceProfile
                                                                              ?.organization
                                                                              ?.id)
                                                                      .toList()
                                                                      ?.firstOrNull
                                                                      ?.profile
                                                                      ?.photoUrl,
                                                                ),
                                                                varList:
                                                                    containerRecordTemplateRecord
                                                                        .variables,
                                                              ),
                                                            ),
                                                          ),
                                                          Builder(
                                                            builder:
                                                                (context) =>
                                                                    Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(
                                                                          10.0),
                                                              child:
                                                                  FlutterFlowIconButton(
                                                                borderRadius:
                                                                    8.0,
                                                                buttonSize:
                                                                    40.0,
                                                                fillColor: Color(
                                                                    0x00E0E3E7),
                                                                hoverColor: Colors
                                                                    .transparent,
                                                                icon: Icon(
                                                                  Icons
                                                                      .open_in_new_rounded,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondary,
                                                                  size: 24.0,
                                                                ),
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
                                                                            Container(
                                                                          height:
                                                                              600.0,
                                                                          width:
                                                                              660.0,
                                                                          child:
                                                                              DialogBoxWidget(
                                                                            widget: () =>
                                                                                RecordViewerWidget(
                                                                              header: containerRecordTemplateRecord.header,
                                                                              sections: containerRecordTemplateRecord.sections,
                                                                              profile: ProfileStruct(
                                                                                displayName: valueOrDefault<String>(
                                                                                  _model.deviceProfile?.info?.display,
                                                                                  'Device Name',
                                                                                ),
                                                                                photoUrl: widget!.organizations?.where((e) => e.reference.id == _model.deviceProfile?.organization?.id).toList()?.firstOrNull?.profile?.photoUrl,
                                                                              ),
                                                                              varList: containerRecordTemplateRecord.variables,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    },
                                                                  );
                                                                },
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              },
                                            ),
                                            Text(
                                              'Input Variables',
                                              textAlign: TextAlign.start,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineSmall
                                                      .override(
                                                        font: GoogleFonts.rubik(
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
                                            StreamBuilder<RecordTemplateRecord>(
                                              stream: RecordTemplateRecord
                                                  .getDocument(_model
                                                      .deviceProfile!
                                                      .recordTemplate!),
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

                                                final containerRecordTemplateRecord =
                                                    snapshot.data!;

                                                return ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                  child: Container(
                                                    constraints: BoxConstraints(
                                                      maxWidth: 600.0,
                                                    ),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                      border: Border.all(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        width: 1.0,
                                                      ),
                                                    ),
                                                    child: Builder(
                                                      builder: (context) {
                                                        final variables =
                                                            containerRecordTemplateRecord
                                                                .variables
                                                                .toList();
                                                        if (variables.isEmpty) {
                                                          return Center(
                                                            child: Container(
                                                              height: 150.0,
                                                              child:
                                                                  EmptyListWidget(
                                                                text:
                                                                    'No Variables Found',
                                                                icon: Icon(
                                                                  Icons
                                                                      .cloud_off_rounded,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        }

                                                        return ListView.builder(
                                                          padding:
                                                              EdgeInsets.zero,
                                                          shrinkWrap: true,
                                                          scrollDirection:
                                                              Axis.vertical,
                                                          itemCount:
                                                              variables.length,
                                                          itemBuilder: (context,
                                                              variablesIndex) {
                                                            final variablesItem =
                                                                variables[
                                                                    variablesIndex];
                                                            return Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(
                                                                          10.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            5.0,
                                                                            0.0),
                                                                    child:
                                                                        Stack(
                                                                      children: [
                                                                        Opacity(
                                                                          opacity:
                                                                              0.1,
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                25.0,
                                                                            height:
                                                                                25.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: valueOrDefault<Color>(
                                                                                variablesItem.info.color != null ? variablesItem.info.color : FlutterFlowTheme.of(context).secondary,
                                                                                FlutterFlowTheme.of(context).secondary,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(5.0),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding:
                                                                              EdgeInsets.all(2.5),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                20.0,
                                                                            height:
                                                                                20.0,
                                                                            child:
                                                                                custom_widgets.IconFromText(
                                                                              width: 20.0,
                                                                              height: 20.0,
                                                                              name: variablesItem.info.icon,
                                                                              size: 20.0,
                                                                              color: valueOrDefault<Color>(
                                                                                variablesItem.info.color != null ? variablesItem.info.color : FlutterFlowTheme.of(context).secondary,
                                                                                FlutterFlowTheme.of(context).secondary,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    child:
                                                                        ClipRRect(
                                                                      child:
                                                                          Container(
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Text(
                                                                              variablesItem.info.display.maybeHandleOverflow(
                                                                                maxChars: 20,
                                                                                replacement: '…',
                                                                              ),
                                                                              maxLines: 1,
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    font: GoogleFonts.rubik(
                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                            ),
                                                                            Container(
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                borderRadius: BorderRadius.circular(5.0),
                                                                              ),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(5.0, 2.5, 5.0, 2.5),
                                                                                child: Text(
                                                                                  variablesItem.info.code.maybeHandleOverflow(
                                                                                    maxChars: 16,
                                                                                    replacement: '…',
                                                                                  ),
                                                                                  maxLines: 1,
                                                                                  style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                        font: GoogleFonts.rubik(
                                                                                          fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                          fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                        ),
                                                                                        color: FlutterFlowTheme.of(context).secondary,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                        fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      FFAppState()
                                                                          .VariableTypes
                                                                          .where((e) =>
                                                                              e.code ==
                                                                              variablesItem.type)
                                                                          .toList()
                                                                          .firstOrNull
                                                                          ?.display,
                                                                      'Variable',
                                                                    ),
                                                                    maxLines: 1,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.rubik(
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryText,
                                                                          fontSize:
                                                                              12.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                  ),
                                                                ].divide(SizedBox(
                                                                    width:
                                                                        5.0)),
                                                              ).animateOnPageLoad(
                                                                  animationsMap[
                                                                      'rowOnPageLoadAnimation']!),
                                                            );
                                                          },
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          ]
                                              .divide(SizedBox(height: 15.0))
                                              .addToEnd(
                                                  SizedBox(height: 100.0)),
                                        ),
                                      ),
                                    ),
                                  ),
                                  KeepAliveWidgetWrapper(
                                    builder: (context) => SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          custom_widgets
                                              .RegulatoryTimelineWidget(
                                            width: double.infinity,
                                            height: 600.0,
                                            initialTimeline: _model
                                                .deviceProfile?.timelineStorage,
                                            onUpdate: (timeline) async {
                                              await _model
                                                  .deviceProfile!.reference
                                                  .update(
                                                      createDeviceProfilesRecordData(
                                                timelineStorage: timeline,
                                              ));
                                              _model.deviceProfileUpdated =
                                                  await DeviceProfilesRecord
                                                      .getDocumentOnce(_model
                                                          .deviceProfile!
                                                          .reference);
                                              _model.deviceProfile =
                                                  _model.deviceProfileUpdated;
                                              safeSetState(() {});

                                              safeSetState(() {});
                                            },
                                          ),
                                        ].addToEnd(SizedBox(height: 100.0)),
                                      ),
                                    ),
                                  ),
                                  KeepAliveWidgetWrapper(
                                    builder: (context) => Padding(
                                      padding: EdgeInsets.all(10.0),
                                      child: SingleChildScrollView(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Bill of Materials',
                                              textAlign: TextAlign.start,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineSmall
                                                      .override(
                                                        font: GoogleFonts.rubik(
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
                                          ]
                                              .divide(SizedBox(height: 15.0))
                                              .addToStart(
                                                  SizedBox(height: 15.0))
                                              .addToEnd(
                                                  SizedBox(height: 100.0)),
                                        ),
                                      ),
                                    ),
                                  ),
                                  KeepAliveWidgetWrapper(
                                    builder: (context) => SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Form(
                                            key: _model.formKey,
                                            autovalidateMode:
                                                AutovalidateMode.disabled,
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Container(
                                                  constraints: BoxConstraints(
                                                    maxWidth: 600.0,
                                                  ),
                                                  decoration: BoxDecoration(),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 10.0,
                                                                0.0, 0.0),
                                                    child: TextFormField(
                                                      controller: _model
                                                          .descriptionTextController,
                                                      focusNode: _model
                                                          .descriptionFocusNode,
                                                      autofocus: false,
                                                      textInputAction:
                                                          TextInputAction.next,
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        isDense: true,
                                                        labelText:
                                                            'Description',
                                                        labelStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .rubik(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                  shadows: [
                                                                    Shadow(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .customColor1,
                                                                      offset: Offset(
                                                                          0.0,
                                                                          2.0),
                                                                      blurRadius:
                                                                          40.0,
                                                                    )
                                                                  ],
                                                                  lineHeight:
                                                                      1.0,
                                                                ),
                                                        alignLabelWithHint:
                                                            false,
                                                        hintText:
                                                            'The innovation that makes time travel possible',
                                                        hintStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .rubik(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontStyle,
                                                                  lineHeight:
                                                                      1.0,
                                                                ),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0x00000000),
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                        ),
                                                        errorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                        ),
                                                        focusedErrorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                        ),
                                                        filled: true,
                                                        fillColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        contentPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    20.0,
                                                                    19.0,
                                                                    20.0,
                                                                    19.0),
                                                        hoverColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .customColor1,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .rubik(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                                lineHeight: 1.0,
                                                              ),
                                                      maxLines: 5,
                                                      cursorColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      validator: _model
                                                          .descriptionTextControllerValidator
                                                          .asValidator(context),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  constraints: BoxConstraints(
                                                    maxWidth: 600.0,
                                                  ),
                                                  decoration: BoxDecoration(),
                                                  child: TextFormField(
                                                    controller:
                                                        _model.textController2,
                                                    focusNode: _model
                                                        .textFieldFocusNode1,
                                                    autofocus: false,
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      isDense: true,
                                                      labelText: 'Manual Path',
                                                      labelStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .rubik(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                                shadows: [
                                                                  Shadow(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .customColor1,
                                                                    offset:
                                                                        Offset(
                                                                            0.0,
                                                                            2.0),
                                                                    blurRadius:
                                                                        40.0,
                                                                  )
                                                                ],
                                                                lineHeight: 1.0,
                                                              ),
                                                      alignLabelWithHint: false,
                                                      hintText: 'TextField',
                                                      hintStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .rubik(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontStyle,
                                                                ),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontStyle,
                                                                lineHeight: 1.0,
                                                              ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0x00000000),
                                                          width: 2.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          width: 2.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                      ),
                                                      errorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          width: 2.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                      ),
                                                      focusedErrorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          width: 2.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                      ),
                                                      filled: true,
                                                      fillColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                      contentPadding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  20.0,
                                                                  19.0,
                                                                  20.0,
                                                                  19.0),
                                                      hoverColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .customColor1,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font:
                                                              GoogleFonts.rubik(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                          lineHeight: 1.0,
                                                        ),
                                                    maxLines: null,
                                                    cursorColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                    validator: _model
                                                        .textController2Validator
                                                        .asValidator(context),
                                                  ),
                                                ),
                                                Container(
                                                  constraints: BoxConstraints(
                                                    maxWidth: 600.0,
                                                  ),
                                                  decoration: BoxDecoration(),
                                                  child: TextFormField(
                                                    controller:
                                                        _model.textController3,
                                                    focusNode: _model
                                                        .textFieldFocusNode2,
                                                    autofocus: false,
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      isDense: true,
                                                      labelText:
                                                          'Unique Device Identifier',
                                                      labelStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .rubik(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                                shadows: [
                                                                  Shadow(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .customColor1,
                                                                    offset:
                                                                        Offset(
                                                                            0.0,
                                                                            2.0),
                                                                    blurRadius:
                                                                        40.0,
                                                                  )
                                                                ],
                                                                lineHeight: 1.0,
                                                              ),
                                                      alignLabelWithHint: false,
                                                      hintText: 'TextField',
                                                      hintStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .rubik(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontStyle,
                                                                ),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontStyle,
                                                                lineHeight: 1.0,
                                                              ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0x00000000),
                                                          width: 2.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          width: 2.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                      ),
                                                      errorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          width: 2.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                      ),
                                                      focusedErrorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          width: 2.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                      ),
                                                      filled: true,
                                                      fillColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                      contentPadding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  20.0,
                                                                  19.0,
                                                                  20.0,
                                                                  19.0),
                                                      hoverColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .customColor1,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font:
                                                              GoogleFonts.rubik(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                          lineHeight: 1.0,
                                                        ),
                                                    maxLines: null,
                                                    cursorColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                    validator: _model
                                                        .textController3Validator
                                                        .asValidator(context),
                                                  ),
                                                ),
                                                Container(
                                                  constraints: BoxConstraints(
                                                    maxWidth: 600.0,
                                                  ),
                                                  decoration: BoxDecoration(),
                                                  child: TextFormField(
                                                    controller:
                                                        _model.textController4,
                                                    focusNode: _model
                                                        .textFieldFocusNode3,
                                                    autofocus: false,
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      isDense: true,
                                                      labelText: 'Model Number',
                                                      labelStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .rubik(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                                shadows: [
                                                                  Shadow(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .customColor1,
                                                                    offset:
                                                                        Offset(
                                                                            0.0,
                                                                            2.0),
                                                                    blurRadius:
                                                                        40.0,
                                                                  )
                                                                ],
                                                                lineHeight: 1.0,
                                                              ),
                                                      alignLabelWithHint: false,
                                                      hintText: 'TextField',
                                                      hintStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .rubik(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontStyle,
                                                                ),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontStyle,
                                                                lineHeight: 1.0,
                                                              ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0x00000000),
                                                          width: 2.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          width: 2.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                      ),
                                                      errorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          width: 2.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                      ),
                                                      focusedErrorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          width: 2.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                      ),
                                                      filled: true,
                                                      fillColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                      contentPadding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  20.0,
                                                                  19.0,
                                                                  20.0,
                                                                  19.0),
                                                      hoverColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .customColor1,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font:
                                                              GoogleFonts.rubik(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                          lineHeight: 1.0,
                                                        ),
                                                    maxLines: null,
                                                    cursorColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                    validator: _model
                                                        .textController4Validator
                                                        .asValidator(context),
                                                  ),
                                                ),
                                                Container(
                                                  constraints: BoxConstraints(
                                                    maxWidth: 600.0,
                                                  ),
                                                  decoration: BoxDecoration(),
                                                  child: Container(
                                                    width: double.infinity,
                                                    height: 40.0,
                                                    child:
                                                        custom_widgets.Dropdown(
                                                      width: double.infinity,
                                                      height: 40.0,
                                                      hintText:
                                                          'Device Category',
                                                      items: FFAppState()
                                                          .DeviceTypes,
                                                      initialItem: FFAppState()
                                                          .DeviceTypes
                                                          .where((e) =>
                                                              e.code ==
                                                              _model
                                                                  .deviceProfile
                                                                  ?.type)
                                                          .toList()
                                                          .firstOrNull,
                                                      onChanged: (item) async {
                                                        _model.deviceType =
                                                            item;
                                                        safeSetState(() {});
                                                      },
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  constraints: BoxConstraints(
                                                    maxWidth: 600.0,
                                                  ),
                                                  decoration: BoxDecoration(),
                                                  child: Container(
                                                    width: double.infinity,
                                                    height: 40.0,
                                                    child: custom_widgets
                                                        .ProfileDropdown(
                                                      width: double.infinity,
                                                      height: 40.0,
                                                      hintText:
                                                          'Owner Organization',
                                                      circle: false,
                                                      items: widget!
                                                          .organizations!
                                                          .map((e) => e.profile)
                                                          .toList(),
                                                      initialItem: widget!
                                                          .organizations
                                                          ?.where((e) =>
                                                              e.reference.id ==
                                                              _model
                                                                  .deviceProfile
                                                                  ?.organization
                                                                  ?.id)
                                                          .toList()
                                                          ?.firstOrNull
                                                          ?.profile,
                                                      onChanged: (item) async {
                                                        _model.ownerOrganization =
                                                            widget!
                                                                .organizations
                                                                ?.where((e) =>
                                                                    e.profile
                                                                        .uid ==
                                                                    item.uid)
                                                                .toList()
                                                                ?.firstOrNull;
                                                        _model
                                                            .updatePage(() {});
                                                      },
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  constraints: BoxConstraints(
                                                    maxWidth: 600.0,
                                                  ),
                                                  decoration: BoxDecoration(),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      FFButtonWidget(
                                                        onPressed: () {
                                                          print(
                                                              'Button pressed ...');
                                                        },
                                                        text: 'Reset',
                                                        options:
                                                            FFButtonOptions(
                                                          height: 42.5,
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      16.0,
                                                                      0.0,
                                                                      16.0,
                                                                      0.0),
                                                          iconPadding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .alternate,
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .rubik(
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .fontStyle,
                                                                    ),
                                                                    fontSize:
                                                                        14.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .fontStyle,
                                                                  ),
                                                          elevation: 0.0,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                          hoverColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primaryBackground,
                                                          hoverTextColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .secondary,
                                                          hoverElevation: 0.0,
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                1.0, 0.0),
                                                        child: FFButtonWidget(
                                                          onPressed: () async {
                                                            if (_model.formKey
                                                                        .currentState ==
                                                                    null ||
                                                                !_model.formKey
                                                                    .currentState!
                                                                    .validate()) {
                                                              return;
                                                            }

                                                            await _model
                                                                .deviceProfile!
                                                                .reference
                                                                .update(
                                                                    createDeviceProfilesRecordData(
                                                              manualPath: _model
                                                                  .textController2
                                                                  .text,
                                                              modelNumber: _model
                                                                  .textController4
                                                                  .text,
                                                              uniqueDeviceIdentifier:
                                                                  _model
                                                                      .textController3
                                                                      .text,
                                                              type: _model
                                                                  .deviceType
                                                                  ?.code,
                                                              organization: _model
                                                                  .ownerOrganization
                                                                  ?.reference,
                                                            ));
                                                            _model.newDeviceProfile =
                                                                await DeviceProfilesRecord
                                                                    .getDocumentOnce(_model
                                                                        .deviceProfile!
                                                                        .reference);
                                                            _model.deviceProfile =
                                                                _model
                                                                    .newDeviceProfile;
                                                            safeSetState(() {});

                                                            safeSetState(() {});
                                                          },
                                                          text: 'Save Details',
                                                          options:
                                                              FFButtonOptions(
                                                            height: 42.5,
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        0.0,
                                                                        16.0,
                                                                        0.0),
                                                            iconPadding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondary,
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .rubik(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontStyle,
                                                                      ),
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          14.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .fontStyle,
                                                                    ),
                                                            elevation: 0.0,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0),
                                                          ),
                                                        ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 10.0)),
                                                  ),
                                                ),
                                              ].divide(SizedBox(height: 15.0)),
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
                    ),
                  ),
                ),
              ],
            );
          } else {
            return wrapWithModel(
              model: _model.loadingModel,
              updateCallback: () => safeSetState(() {}),
              child: LoadingWidget(),
            );
          }
        },
      ),
    );
  }
}
