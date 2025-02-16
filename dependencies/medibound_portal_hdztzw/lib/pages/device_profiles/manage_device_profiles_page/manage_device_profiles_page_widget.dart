import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/custom_cloud_functions/custom_cloud_function_response_manager.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/device_profiles/builder/record_viewer/record_viewer_widget.dart';
import '/pages/devices/device_secret_dialog/device_secret_dialog_widget.dart';
import '/utils/desc_token/desc_token_widget.dart';
import '/utils/dialog_box/dialog_box_widget.dart';
import '/utils/doc_guide_block/doc_guide_block_widget.dart';
import '/utils/dropdown/component_profile_tile/component_profile_tile_widget.dart';
import '/utils/empty/empty_widget.dart';
import '/utils/empty_list/empty_list_widget.dart';
import '/utils/nav_bar/nav_bar_widget.dart';
import 'dart:math';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'manage_device_profiles_page_model.dart';
export 'manage_device_profiles_page_model.dart';

class ManageDeviceProfilesPageWidget extends StatefulWidget {
  const ManageDeviceProfilesPageWidget({
    super.key,
    required this.deviceProfile,
  });

  final DeviceProfilesRecord? deviceProfile;

  @override
  State<ManageDeviceProfilesPageWidget> createState() =>
      _ManageDeviceProfilesPageWidgetState();
}

class _ManageDeviceProfilesPageWidgetState
    extends State<ManageDeviceProfilesPageWidget>
    with TickerProviderStateMixin {
  late ManageDeviceProfilesPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ManageDeviceProfilesPageModel());

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
        List<OrganizationsRecord>
            manageDeviceProfilesPageOrganizationsRecordList = snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
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
                                        width: 900.0,
                                        height: 100.0,
                                        decoration: BoxDecoration(),
                                        alignment:
                                            AlignmentDirectional(-1.0, 0.0),
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(-1.0, 0.0),
                                          child: Padding(
                                            padding: EdgeInsets.all(20.0),
                                            child: FFButtonWidget(
                                              onPressed: () async {
                                                context.goNamed(
                                                    'DeviceProfilesPage');
                                              },
                                              text:
                                                  'Back to My Device Profiles',
                                              icon: FaIcon(
                                                FontAwesomeIcons.arrowLeft,
                                                size: 16.0,
                                              ),
                                              options: FFButtonOptions(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 0.0),
                                                iconAlignment:
                                                    IconAlignment.start,
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color: Color(0x00E0E3E7),
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily: 'Rubik',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondary,
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          lineHeight: 1.0,
                                                        ),
                                                elevation: 0.0,
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                hoverColor: Colors.transparent,
                                                hoverTextColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                hoverElevation: 0.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          decoration: BoxDecoration(),
                                          child: SingleChildScrollView(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Container(
                                                  width: 900.0,
                                                  decoration: BoxDecoration(),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.all(20.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    2.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            20.0),
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .alternate,
                                                                    ),
                                                                  ),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    children: [
                                                                      Padding(
                                                                        padding:
                                                                            EdgeInsets.all(2.5),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              20.0,
                                                                          height:
                                                                              20.0,
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
                                                                                Duration(milliseconds: 500),
                                                                            fadeOutDuration:
                                                                                Duration(milliseconds: 500),
                                                                            imageUrl:
                                                                                valueOrDefault<String>(
                                                                              manageDeviceProfilesPageOrganizationsRecordList.where((e) => e.reference.id == widget!.deviceProfile?.organization?.id).toList().firstOrNull?.profile?.photoUrl,
                                                                              'Org Name',
                                                                            ),
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            10.0,
                                                                            0.0),
                                                                        child:
                                                                            AutoSizeText(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            manageDeviceProfilesPageOrganizationsRecordList.where((e) => e.reference.id == widget!.deviceProfile?.organization?.id).toList().firstOrNull?.profile?.displayName,
                                                                            'Org Name',
                                                                          ).maybeHandleOverflow(
                                                                            maxChars:
                                                                                15,
                                                                            replacement:
                                                                                '…',
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .override(
                                                                                fontFamily: 'Rubik',
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ].divide(SizedBox(
                                                                        width:
                                                                            5.0)),
                                                                  ),
                                                                ),
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Text(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        widget!
                                                                            .deviceProfile
                                                                            ?.info
                                                                            ?.display,
                                                                        'Device Name',
                                                                      ).maybeHandleOverflow(
                                                                        maxChars:
                                                                            25,
                                                                        replacement:
                                                                            '…',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .displaySmall
                                                                          .override(
                                                                            fontFamily:
                                                                                'Rubik',
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                    ),
                                                                  ].divide(SizedBox(
                                                                      width:
                                                                          10.0)),
                                                                ),
                                                                Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    FFAppState()
                                                                        .DeviceTypes
                                                                        .where((e) =>
                                                                            e.code ==
                                                                            widget!.deviceProfile?.type)
                                                                        .toList()
                                                                        .firstOrNull
                                                                        ?.display,
                                                                    'Device Category',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyLarge
                                                                      .override(
                                                                        fontFamily:
                                                                            'Rubik',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          5.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Wrap(
                                                                    spacing:
                                                                        10.0,
                                                                    runSpacing:
                                                                        10.0,
                                                                    alignment:
                                                                        WrapAlignment
                                                                            .start,
                                                                    crossAxisAlignment:
                                                                        WrapCrossAlignment
                                                                            .start,
                                                                    direction: Axis
                                                                        .horizontal,
                                                                    runAlignment:
                                                                        WrapAlignment
                                                                            .start,
                                                                    verticalDirection:
                                                                        VerticalDirection
                                                                            .down,
                                                                    clipBehavior:
                                                                        Clip.none,
                                                                    children: [
                                                                      wrapWithModel(
                                                                        model: _model
                                                                            .descTokenModel1,
                                                                        updateCallback:
                                                                            () =>
                                                                                safeSetState(() {}),
                                                                        child:
                                                                            DescTokenWidget(
                                                                          text: FFAppState()
                                                                              .DeviceProfileModes
                                                                              .where((e) => e.code == widget!.deviceProfile?.mode)
                                                                              .toList()
                                                                              .firstOrNull!
                                                                              .display,
                                                                          icon:
                                                                              Icon(
                                                                            Icons.rocket_launch_rounded,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondary,
                                                                            size:
                                                                                16.0,
                                                                          ),
                                                                          onClick:
                                                                              () async {},
                                                                        ),
                                                                      ),
                                                                      wrapWithModel(
                                                                        model: _model
                                                                            .descTokenModel2,
                                                                        updateCallback:
                                                                            () =>
                                                                                safeSetState(() {}),
                                                                        child:
                                                                            DescTokenWidget(
                                                                          text: widget!
                                                                              .deviceProfile!
                                                                              .manualPath,
                                                                          icon:
                                                                              FaIcon(
                                                                            FontAwesomeIcons.link,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondary,
                                                                            size:
                                                                                14.0,
                                                                          ),
                                                                          onClick:
                                                                              () async {
                                                                            await launchURL(widget!.deviceProfile!.manualPath);
                                                                          },
                                                                        ),
                                                                      ),
                                                                      wrapWithModel(
                                                                        model: _model
                                                                            .descTokenModel3,
                                                                        updateCallback:
                                                                            () =>
                                                                                safeSetState(() {}),
                                                                        child:
                                                                            DescTokenWidget(
                                                                          text: FFAppState()
                                                                              .DeviceTransferTypes
                                                                              .where((e) => e.code == widget!.deviceProfile?.transferType)
                                                                              .toList()
                                                                              .firstOrNull!
                                                                              .display,
                                                                          icon:
                                                                              Icon(
                                                                            Icons.swap_horiz_rounded,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondary,
                                                                            size:
                                                                                16.0,
                                                                          ),
                                                                          onClick:
                                                                              () async {},
                                                                        ),
                                                                      ),
                                                                      wrapWithModel(
                                                                        model: _model
                                                                            .descTokenModel4,
                                                                        updateCallback:
                                                                            () =>
                                                                                safeSetState(() {}),
                                                                        child:
                                                                            DescTokenWidget(
                                                                          text:
                                                                              'UDI: ${widget!.deviceProfile?.uniqueDeviceIdentifier}',
                                                                          icon:
                                                                              Icon(
                                                                            Icons.fingerprint_rounded,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondary,
                                                                            size:
                                                                                16.0,
                                                                          ),
                                                                          onClick:
                                                                              () async {},
                                                                        ),
                                                                      ),
                                                                      wrapWithModel(
                                                                        model: _model
                                                                            .descTokenModel5,
                                                                        updateCallback:
                                                                            () =>
                                                                                safeSetState(() {}),
                                                                        child:
                                                                            DescTokenWidget(
                                                                          text:
                                                                              'Model #: ${widget!.deviceProfile?.modelNumber}',
                                                                          icon:
                                                                              Icon(
                                                                            Icons.memory_rounded,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondary,
                                                                            size:
                                                                                16.0,
                                                                          ),
                                                                          onClick:
                                                                              () async {},
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ].divide(SizedBox(
                                                                  height: 2.5)),
                                                            ),
                                                          ),
                                                        ),
                                                        FFButtonWidget(
                                                          onPressed: () {
                                                            print(
                                                                'Button pressed ...');
                                                          },
                                                          text:
                                                              'Edit Profile Details',
                                                          icon: Icon(
                                                            Icons.edit_rounded,
                                                            size: 14.0,
                                                          ),
                                                          options:
                                                              FFButtonOptions(
                                                            height: 40.0,
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
                                                                      fontFamily:
                                                                          'Rubik',
                                                                      fontSize:
                                                                          14.0,
                                                                      letterSpacing:
                                                                          0.0,
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
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  width: 900.0,
                                                  decoration: BoxDecoration(),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(20.0, 0.0,
                                                                20.0, 10.0),
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                      ),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        15.0,
                                                                        10.0,
                                                                        15.0,
                                                                        10.0),
                                                            child:
                                                                SelectionArea(
                                                                    child: Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                widget!
                                                                    .deviceProfile
                                                                    ?.info
                                                                    ?.description,
                                                                'Description',
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyLarge
                                                                  .override(
                                                                    fontFamily:
                                                                        'Rubik',
                                                                    fontSize:
                                                                        14.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            )),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 900.0,
                                                  child: Divider(
                                                    thickness: 1.0,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                  ),
                                                ),
                                                Container(
                                                  constraints: BoxConstraints(
                                                    maxWidth: 900.0,
                                                  ),
                                                  decoration: BoxDecoration(),
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, -1.0),
                                                    child: Wrap(
                                                      spacing: 0.0,
                                                      runSpacing: 0.0,
                                                      alignment:
                                                          WrapAlignment.start,
                                                      crossAxisAlignment:
                                                          WrapCrossAlignment
                                                              .start,
                                                      direction:
                                                          Axis.horizontal,
                                                      runAlignment:
                                                          WrapAlignment.start,
                                                      verticalDirection:
                                                          VerticalDirection
                                                              .down,
                                                      clipBehavior: Clip.none,
                                                      children: [
                                                        Container(
                                                          width: MediaQuery.sizeOf(
                                                                          context)
                                                                      .width <
                                                                  1200.0
                                                              ? 900.0
                                                              : 600.0,
                                                          decoration:
                                                              BoxDecoration(),
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, -1.0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    20.0),
                                                            child:
                                                                SingleChildScrollView(
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
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
                                                                      Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Text(
                                                                            'Deployed Devices',
                                                                            textAlign:
                                                                                TextAlign.start,
                                                                            maxLines:
                                                                                1,
                                                                            style: FlutterFlowTheme.of(context).headlineMedium.override(
                                                                                  fontFamily: 'Rubik',
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                          ),
                                                                          AutoSizeText(
                                                                            '34 Active Devices'.maybeHandleOverflow(
                                                                              maxChars: 40,
                                                                              replacement: '…',
                                                                            ),
                                                                            maxLines:
                                                                                2,
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
                                                                      FFButtonWidget(
                                                                        onPressed:
                                                                            () async {
                                                                          final firestoreBatch = FirebaseFirestore
                                                                              .instance
                                                                              .batch();
                                                                          try {
                                                                            await Future.delayed(const Duration(milliseconds: 1000));

                                                                            var deviceRecordReference =
                                                                                DeviceRecord.createDoc(widget!.deviceProfile!.reference);
                                                                            firestoreBatch.set(deviceRecordReference, {
                                                                              ...createDeviceRecordData(
                                                                                profile: widget!.deviceProfile?.reference,
                                                                                status: 'INACTIVE',
                                                                                key: updateKeyStruct(
                                                                                  KeyStruct(),
                                                                                  clearUnsetFields: false,
                                                                                  create: true,
                                                                                ),
                                                                              ),
                                                                              ...mapToFirestore(
                                                                                {
                                                                                  'last_updated': FieldValue.serverTimestamp(),
                                                                                  'created_time': FieldValue.serverTimestamp(),
                                                                                },
                                                                              ),
                                                                            });
                                                                            _model.device =
                                                                                DeviceRecord.getDocumentFromData({
                                                                              ...createDeviceRecordData(
                                                                                profile: widget!.deviceProfile?.reference,
                                                                                status: 'INACTIVE',
                                                                                key: updateKeyStruct(
                                                                                  KeyStruct(),
                                                                                  clearUnsetFields: false,
                                                                                  create: true,
                                                                                ),
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
                                                                                    display: widget!.deviceProfile?.info?.display,
                                                                                    description: widget!.deviceProfile?.info?.description,
                                                                                    code: _model.device?.reference.id,
                                                                                    clearUnsetFields: false,
                                                                                  ),
                                                                                ));
                                                                            try {
                                                                              final result = await FirebaseFunctions.instanceFor(region: 'us-central1').httpsCallable('createDeviceKey').call({});
                                                                              _model.keyOutput = CreateDeviceKeyCloudFunctionCallResponse(
                                                                                data: KeyStruct.fromMap(result.data),
                                                                                succeeded: true,
                                                                                resultAsString: result.data.toString(),
                                                                                jsonBody: result.data,
                                                                              );
                                                                            } on FirebaseFunctionsException catch (error) {
                                                                              _model.keyOutput = CreateDeviceKeyCloudFunctionCallResponse(
                                                                                errorCode: error.code,
                                                                                succeeded: false,
                                                                              );
                                                                            }

                                                                            if (_model.keyOutput!.succeeded!) {
                                                                              firestoreBatch.update(
                                                                                  _model.device!.reference,
                                                                                  createDeviceRecordData(
                                                                                    key: createKeyStruct(
                                                                                      privateWrappedKey: _model.keyOutput?.data?.privateWrappedKey,
                                                                                      publicWrappedKey: _model.keyOutput?.data?.publicWrappedKey,
                                                                                      fieldValues: {
                                                                                        'created_time': FieldValue.serverTimestamp(),
                                                                                      },
                                                                                      clearUnsetFields: false,
                                                                                    ),
                                                                                  ));
                                                                            }
                                                                          } finally {
                                                                            await firestoreBatch.commit();
                                                                          }

                                                                          safeSetState(
                                                                              () {});
                                                                        },
                                                                        text:
                                                                            'New Device',
                                                                        icon:
                                                                            FaIcon(
                                                                          FontAwesomeIcons
                                                                              .plus,
                                                                          size:
                                                                              14.0,
                                                                        ),
                                                                        options:
                                                                            FFButtonOptions(
                                                                          height:
                                                                              40.0,
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              16.0,
                                                                              0.0,
                                                                              16.0,
                                                                              0.0),
                                                                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          color:
                                                                              FlutterFlowTheme.of(context).alternate,
                                                                          textStyle: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .override(
                                                                                fontFamily: 'Rubik',
                                                                                fontSize: 14.0,
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                          elevation:
                                                                              0.0,
                                                                          borderRadius:
                                                                              BorderRadius.circular(10.0),
                                                                          hoverColor:
                                                                              FlutterFlowTheme.of(context).primaryBackground,
                                                                          hoverTextColor:
                                                                              FlutterFlowTheme.of(context).secondary,
                                                                          hoverElevation:
                                                                              0.0,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10.0),
                                                                    child:
                                                                        Container(
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(10.0),
                                                                        border:
                                                                            Border.all(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).alternate,
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                      ),
                                                                      child: StreamBuilder<
                                                                          List<
                                                                              DeviceRecord>>(
                                                                        stream:
                                                                            queryDeviceRecord(
                                                                          parent: widget!
                                                                              .deviceProfile
                                                                              ?.reference,
                                                                          queryBuilder: (deviceRecord) => deviceRecord.orderBy(
                                                                              'last_updated',
                                                                              descending: true),
                                                                        ),
                                                                        builder:
                                                                            (context,
                                                                                snapshot) {
                                                                          // Customize what your widget looks like when it's loading.
                                                                          if (!snapshot
                                                                              .hasData) {
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
                                                                          List<DeviceRecord>
                                                                              listViewDeviceRecordList =
                                                                              snapshot.data!;
                                                                          if (listViewDeviceRecordList
                                                                              .isEmpty) {
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

                                                                          return ListView
                                                                              .builder(
                                                                            padding:
                                                                                EdgeInsets.zero,
                                                                            primary:
                                                                                false,
                                                                            shrinkWrap:
                                                                                true,
                                                                            scrollDirection:
                                                                                Axis.vertical,
                                                                            itemCount:
                                                                                listViewDeviceRecordList.length,
                                                                            itemBuilder:
                                                                                (context, listViewIndex) {
                                                                              final listViewDeviceRecord = listViewDeviceRecordList[listViewIndex];
                                                                              return Builder(
                                                                                builder: (context) => InkWell(
                                                                                  splashColor: Colors.transparent,
                                                                                  focusColor: Colors.transparent,
                                                                                  hoverColor: Colors.transparent,
                                                                                  highlightColor: Colors.transparent,
                                                                                  onTap: () async {
                                                                                    await showDialog(
                                                                                      context: context,
                                                                                      builder: (dialogContext) {
                                                                                        return Dialog(
                                                                                          elevation: 0,
                                                                                          insetPadding: EdgeInsets.zero,
                                                                                          backgroundColor: Colors.transparent,
                                                                                          alignment: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                          child: GestureDetector(
                                                                                            onTap: () {
                                                                                              FocusScope.of(dialogContext).unfocus();
                                                                                              FocusManager.instance.primaryFocus?.unfocus();
                                                                                            },
                                                                                            child: Container(
                                                                                              height: 400.0,
                                                                                              width: 660.0,
                                                                                              child: DialogBoxWidget(
                                                                                                widget: () => DeviceSecretDialogWidget(
                                                                                                  device: listViewDeviceRecord,
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        );
                                                                                      },
                                                                                    );
                                                                                  },
                                                                                  child: ComponentProfileTileWidget(
                                                                                    key: Key('Keyoa8_${listViewIndex}_of_${listViewDeviceRecordList.length}'),
                                                                                    display: listViewDeviceRecord.info.code,
                                                                                    subtitle: 'Last updated ${dateTimeFormat(
                                                                                      "relative",
                                                                                      listViewDeviceRecord.lastUpdated,
                                                                                      locale: FFLocalizations.of(context).languageCode,
                                                                                    )}',
                                                                                    height: 50.0,
                                                                                    widget: () => EmptyWidget(),
                                                                                  ),
                                                                                ).animateOnPageLoad(animationsMap['componentProfileTileOnPageLoadAnimation']!),
                                                                              );
                                                                            },
                                                                          );
                                                                        },
                                                                      ),
                                                                    ),
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
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Text(
                                                                            'Retired Devices',
                                                                            textAlign:
                                                                                TextAlign.start,
                                                                            maxLines:
                                                                                1,
                                                                            style: FlutterFlowTheme.of(context).headlineMedium.override(
                                                                                  fontFamily: 'Rubik',
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ].divide(SizedBox(
                                                                    height:
                                                                        20.0)),
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
                                                          decoration:
                                                              BoxDecoration(),
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, -1.0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    20.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
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
                                                                Text(
                                                                  'Declared Variables',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .start,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Rubik',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                                StreamBuilder<
                                                                    RecordTemplateRecord>(
                                                                  stream: RecordTemplateRecord
                                                                      .getDocument(widget!
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

                                                                    final containerRecordTemplateRecord =
                                                                        snapshot
                                                                            .data!;

                                                                    return ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10.0),
                                                                      child:
                                                                          Container(
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          borderRadius:
                                                                              BorderRadius.circular(10.0),
                                                                          border:
                                                                              Border.all(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).alternate,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                        ),
                                                                        child:
                                                                            Builder(
                                                                          builder:
                                                                              (context) {
                                                                            final variables =
                                                                                containerRecordTemplateRecord.variables.toList();
                                                                            if (variables.isEmpty) {
                                                                              return Center(
                                                                                child: Container(
                                                                                  height: 150.0,
                                                                                  child: EmptyListWidget(
                                                                                    text: 'No Variables Found',
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
                                                                              shrinkWrap: true,
                                                                              scrollDirection: Axis.vertical,
                                                                              itemCount: variables.length,
                                                                              itemBuilder: (context, variablesIndex) {
                                                                                final variablesItem = variables[variablesIndex];
                                                                                return Padding(
                                                                                  padding: EdgeInsets.all(10.0),
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Expanded(
                                                                                        child: ClipRRect(
                                                                                          child: Container(
                                                                                            decoration: BoxDecoration(),
                                                                                            child: Text(
                                                                                              variablesItem.info.display.maybeHandleOverflow(
                                                                                                maxChars: 20,
                                                                                                replacement: '…',
                                                                                              ),
                                                                                              maxLines: 1,
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Rubik',
                                                                                                    letterSpacing: 0.0,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      Text(
                                                                                        valueOrDefault<String>(
                                                                                          FFAppState().DeviceVariableTypes.where((e) => e.code == variablesItem.type).toList().firstOrNull?.display,
                                                                                          'Type',
                                                                                        ),
                                                                                        maxLines: 1,
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Rubik',
                                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                                              fontSize: 12.0,
                                                                                              letterSpacing: 0.0,
                                                                                            ),
                                                                                      ),
                                                                                    ],
                                                                                  ).animateOnPageLoad(animationsMap['rowOnPageLoadAnimation']!),
                                                                                );
                                                                              },
                                                                            );
                                                                          },
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                ),
                                                                Text(
                                                                  'Record Layout',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .start,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Rubik',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                                StreamBuilder<
                                                                    RecordTemplateRecord>(
                                                                  stream: RecordTemplateRecord
                                                                      .getDocument(widget!
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

                                                                    final containerRecordTemplateRecord =
                                                                        snapshot
                                                                            .data!;

                                                                    return Container(
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(-1.0, 0.0),
                                                                            child:
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
                                                                                        alignment: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                        child: GestureDetector(
                                                                                          onTap: () {
                                                                                            FocusScope.of(dialogContext).unfocus();
                                                                                            FocusManager.instance.primaryFocus?.unfocus();
                                                                                          },
                                                                                          child: Container(
                                                                                            height: 600.0,
                                                                                            width: 660.0,
                                                                                            child: DialogBoxWidget(
                                                                                              widget: () => RecordViewerWidget(
                                                                                                header: containerRecordTemplateRecord.header,
                                                                                                sections: containerRecordTemplateRecord.sections,
                                                                                                profile: ProfileStruct(
                                                                                                  displayName: widget!.deviceProfile?.info?.display,
                                                                                                  photoUrl: valueOrDefault<String>(
                                                                                                    manageDeviceProfilesPageOrganizationsRecordList.where((e) => e.reference.id == widget!.deviceProfile?.organization?.id).toList().firstOrNull?.profile?.photoUrl,
                                                                                                    'Org Name',
                                                                                                  ),
                                                                                                ),
                                                                                                varList: containerRecordTemplateRecord.variables,
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      );
                                                                                    },
                                                                                  );
                                                                                },
                                                                                text: 'View Record',
                                                                                icon: FaIcon(
                                                                                  FontAwesomeIcons.arrowRight,
                                                                                  size: 16.0,
                                                                                ),
                                                                                options: FFButtonOptions(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                  iconAlignment: IconAlignment.end,
                                                                                  iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                  color: Color(0x00E0E3E7),
                                                                                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                        fontFamily: 'Rubik',
                                                                                        color: FlutterFlowTheme.of(context).secondary,
                                                                                        fontSize: 16.0,
                                                                                        letterSpacing: 0.0,
                                                                                        lineHeight: 1.0,
                                                                                      ),
                                                                                  elevation: 0.0,
                                                                                  borderRadius: BorderRadius.circular(10.0),
                                                                                  hoverColor: Colors.transparent,
                                                                                  hoverTextColor: FlutterFlowTheme.of(context).primaryText,
                                                                                  hoverElevation: 0.0,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    );
                                                                  },
                                                                ),
                                                              ].divide(SizedBox(
                                                                  height:
                                                                      15.0)),
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
