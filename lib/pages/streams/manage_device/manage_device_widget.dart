import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/records/record/record_widget.dart';
import "package:medibound_portal_hdztzw/backend/backend.dart"
    as medibound_portal_hdztzw_backend;
import "package:medibound_portal_hdztzw/backend/schema/structs/index.dart"
    as medibound_portal_hdztzw_data_schema;
import '/custom_code/actions/index.dart' as actions;
import 'package:medibound_portal_hdztzw/app_state.dart'
    as medibound_portal_hdztzw_app_state;
import 'package:medibound_portal_hdztzw/flutter_flow/custom_functions.dart'
    as medibound_portal_hdztzw_functions;
import 'package:medibound_portal_hdztzw/flutter_flow/flutter_flow_util.dart'
    as medibound_portal_hdztzw_util
    show wrapWithModel, createModel, FlutterFlowDynamicModels;
import 'package:medibound_portal_hdztzw/utils/desc_token/desc_token_widget.dart'
    as medibound_portal_hdztzw;
import 'package:medibound_portal_hdztzw/utils/dropdown/component_profile_tile/component_profile_tile_widget.dart'
    as medibound_portal_hdztzw;
import 'package:medibound_portal_hdztzw/utils/empty/empty_widget.dart'
    as medibound_portal_hdztzw;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'manage_device_model.dart';
export 'manage_device_model.dart';

class ManageDeviceWidget extends StatefulWidget {
  const ManageDeviceWidget({
    super.key,
    required this.device,
  });

  final medibound_portal_hdztzw_backend.DeviceRecord? device;

  @override
  State<ManageDeviceWidget> createState() => _ManageDeviceWidgetState();
}

class _ManageDeviceWidgetState extends State<ManageDeviceWidget>
    with TickerProviderStateMixin {
  late ManageDeviceModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ManageDeviceModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (!(FFAppState()
              .ConnectedDevices
              .where((e) => e.id == widget.device?.storedId)
              .toList()
              .firstOrNull !=
          null)) {
        Navigator.pop(context);
      }
    });

    animationsMap.addAll({
      'containerOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 160.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 200.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 27.0),
            end: Offset(0.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 200.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'buttonOnPageLoadAnimation': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            color: FlutterFlowTheme.of(context).alternate,
            angle: 0.524,
          ),
        ],
      ),
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();
    context.watch<medibound_portal_hdztzw_app_state.FFAppState>();

    return StreamBuilder<medibound_portal_hdztzw_backend.DeviceProfilesRecord>(
      stream: medibound_portal_hdztzw_backend.DeviceProfilesRecord.getDocument(
          widget.device!.parentReference),
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

        final containerDeviceProfilesRecord = snapshot.data!;

        return Container(
          height: 500.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(0.0),
              bottomRight: Radius.circular(0.0),
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 20.0, 20.0),
            child: StreamBuilder<
                medibound_portal_hdztzw_backend.OrganizationsRecord>(
              stream: medibound_portal_hdztzw_backend.OrganizationsRecord
                  .getDocument(containerDeviceProfilesRecord.organization!),
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

                final containerOrganizationsRecord = snapshot.data!;

                return SafeArea(
                  child: Container(
                    decoration: BoxDecoration(),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        SizedBox(
                          width: 100.0,
                          child: Divider(
                            thickness: 4.0,
                            color: FlutterFlowTheme.of(context).alternate,
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 5.0, 0.0, 0.0),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    child: Container(
                                      decoration: BoxDecoration(),
                                      child: SingleChildScrollView(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20.0),
                                                      border: Border.all(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                      ),
                                                    ),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  2.5),
                                                          child: Container(
                                                            width: 20.0,
                                                            height: 20.0,
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
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      10.0,
                                                                      0.0),
                                                          child: AutoSizeText(
                                                            valueOrDefault<
                                                                String>(
                                                              containerOrganizationsRecord
                                                                  .profile
                                                                  .displayName,
                                                              'Organization',
                                                            ).maybeHandleOverflow(
                                                              maxChars: 15,
                                                              replacement: '…',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Rubik',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        ),
                                                      ].divide(
                                                          SizedBox(width: 5.0)),
                                                    ),
                                                  ),
                                                ].divide(SizedBox(width: 10.0)),
                                              ),
                                            ),
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  valueOrDefault<String>(
                                                    containerDeviceProfilesRecord
                                                        .info.display,
                                                    'Device Name',
                                                  ).maybeHandleOverflow(
                                                    maxChars: 25,
                                                    replacement: '…',
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .headlineMedium
                                                      .override(
                                                        fontFamily: 'Rubik',
                                                        letterSpacing: 0.0,
                                                        lineHeight: 1.0,
                                                      ),
                                                ),
                                                Text(
                                                  valueOrDefault<String>(
                                                    medibound_portal_hdztzw_app_state
                                                            .FFAppState()
                                                        .DeviceTypes
                                                        .where((e) =>
                                                            e.code ==
                                                            containerDeviceProfilesRecord
                                                                .type)
                                                        .toList()
                                                        .firstOrNull
                                                        ?.display,
                                                    'Device Category',
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily: 'Rubik',
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ].divide(SizedBox(height: 0.0)),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 10.0, 0.0, 0.0),
                                              child: Container(
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(15.0, 10.0,
                                                          15.0, 10.0),
                                                  child: Text(
                                                    containerDeviceProfilesRecord
                                                        .info.description,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Rubik',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    await launchURL(
                                                        containerOrganizationsRecord
                                                            .website);
                                                  },
                                                  child:
                                                      medibound_portal_hdztzw_util
                                                          .wrapWithModel(
                                                    model: _model
                                                        .componentProfileTileModel1,
                                                    updateCallback: () =>
                                                        safeSetState(() {}),
                                                    child: medibound_portal_hdztzw
                                                        .ComponentProfileTileWidget(
                                                      display:
                                                          'Visit Company Website',
                                                      subtitle:
                                                          containerOrganizationsRecord
                                                              .website,
                                                      height: 60.0,
                                                      icon: FaIcon(
                                                        FontAwesomeIcons.globe,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                        size: 16.0,
                                                      ),
                                                      padding: 0.0,
                                                      widget: () =>
                                                          medibound_portal_hdztzw
                                                              .EmptyWidget(),
                                                    ),
                                                  ),
                                                ),
                                                InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    await launchURL(
                                                        containerDeviceProfilesRecord
                                                            .manualPath);
                                                  },
                                                  child:
                                                      medibound_portal_hdztzw_util
                                                          .wrapWithModel(
                                                    model: _model
                                                        .componentProfileTileModel2,
                                                    updateCallback: () =>
                                                        safeSetState(() {}),
                                                    child: medibound_portal_hdztzw
                                                        .ComponentProfileTileWidget(
                                                      display: 'View Manual',
                                                      subtitle:
                                                          containerDeviceProfilesRecord
                                                              .manualPath,
                                                      height: 60.0,
                                                      icon: FaIcon(
                                                        FontAwesomeIcons.link,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                        size: 16.0,
                                                      ),
                                                      padding: 0.0,
                                                      widget: () =>
                                                          medibound_portal_hdztzw
                                                              .EmptyWidget(),
                                                    ),
                                                  ),
                                                ),
                                              ].divide(SizedBox(height: 0.0)),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 5.0, 0.0, 0.0),
                                              child: Wrap(
                                                spacing: 10.0,
                                                runSpacing: 10.0,
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
                                                  medibound_portal_hdztzw_util
                                                      .wrapWithModel(
                                                    model:
                                                        _model.descTokenModel,
                                                    updateCallback: () =>
                                                        safeSetState(() {}),
                                                    child:
                                                        medibound_portal_hdztzw
                                                            .DescTokenWidget(
                                                      text:
                                                          'Model #: ${containerDeviceProfilesRecord.modelNumber}',
                                                      icon: FaIcon(
                                                        FontAwesomeIcons
                                                            .microchip,
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
                                            ),
                                          ].divide(SizedBox(height: 5.0)),
                                        ),
                                      ),
                                    ),
                                  ),
                                ].divide(SizedBox(height: 10.0)),
                              ),
                            ).animateOnPageLoad(animationsMap[
                                'containerOnPageLoadAnimation1']!),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 0.0, 0.0),
                            child: Builder(
                              builder: (context) {
                                if (FFAppState()
                                        .ConnectedDevices
                                        .where((e) =>
                                            e.id == widget.device?.storedId)
                                        .toList()
                                        .firstOrNull
                                        ?.status ==
                                    'READY') {
                                  return FFButtonWidget(
                                    onPressed: () async {
                                      await actions.writeDeviceCommand(
                                        BluetoothDeviceStruct(
                                          id: widget.device?.storedId,
                                        ),
                                        'INIT',
                                      );
                                    },
                                    text: 'Activate',
                                    icon: FaIcon(
                                      FontAwesomeIcons.play,
                                      size: 14.0,
                                    ),
                                    options: FFButtonOptions(
                                      height: 45.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 16.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Rubik',
                                            color: Colors.white,
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                          ),
                                      elevation: 0.0,
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  );
                                } else if (FFAppState()
                                        .ConnectedDevices
                                        .where((e) =>
                                            e.id == widget.device?.storedId)
                                        .toList()
                                        .firstOrNull
                                        ?.status ==
                                    'RUNNING') {
                                  return FFButtonWidget(
                                    onPressed: true
                                        ? null
                                        : () {
                                            print('Button pressed ...');
                                          },
                                    text: 'Running...',
                                    icon: Icon(
                                      Icons.rocket_launch,
                                      size: 14.0,
                                    ),
                                    options: FFButtonOptions(
                                      height: 45.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 16.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Rubik',
                                            color: Colors.white,
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                          ),
                                      elevation: 0.0,
                                      borderRadius: BorderRadius.circular(10.0),
                                      disabledColor:
                                          FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                      disabledTextColor:
                                          FlutterFlowTheme.of(context)
                                              .secondary,
                                    ),
                                  ).animateOnPageLoad(animationsMap[
                                      'buttonOnPageLoadAnimation']!);
                                } else if (FFAppState()
                                        .ConnectedDevices
                                        .where((e) =>
                                            e.id == widget.device?.storedId)
                                        .toList()
                                        .firstOrNull
                                        ?.status ==
                                    'FINISHED') {
                                  return StreamBuilder<
                                      medibound_portal_hdztzw_backend
                                      .RecordTemplateRecord>(
                                    stream: medibound_portal_hdztzw_backend
                                            .RecordTemplateRecord
                                        .getDocument(
                                            containerDeviceProfilesRecord
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
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              size: 25.0,
                                            ),
                                          ),
                                        );
                                      }

                                      final containerRecordTemplateRecord =
                                          snapshot.data!;

                                      return Container(
                                        decoration: BoxDecoration(),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              flex: 2,
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                  if (medibound_portal_hdztzw_functions
                                                      .checkVarListAgainstData(
                                                          containerRecordTemplateRecord
                                                              .variables
                                                              .toList(),
                                                          medibound_portal_hdztzw_functions
                                                              .convertStringToJson(FFAppState()
                                                                  .ConnectedDevices
                                                                  .where((e) =>
                                                                      e.id ==
                                                                      widget
                                                                          .device
                                                                          ?.storedId)
                                                                  .toList()
                                                                  .firstOrNull!
                                                                  .data))) {
                                                    var recordsRecordReference =
                                                        medibound_portal_hdztzw_backend
                                                                .RecordsRecord
                                                            .createDoc(
                                                                currentUserReference!);
                                                    await recordsRecordReference
                                                        .set({
                                                      ...medibound_portal_hdztzw_backend
                                                          .createRecordsRecordData(
                                                        info: medibound_portal_hdztzw_data_schema
                                                            .updateCodedValueStruct(
                                                          containerRecordTemplateRecord
                                                              .info,
                                                          clearUnsetFields:
                                                              false,
                                                          create: true,
                                                        ),
                                                        owner:
                                                            currentUserReference,
                                                        template:
                                                            containerRecordTemplateRecord
                                                                .reference,
                                                      ),
                                                      ...mapToFirestore(
                                                        {
                                                          'data':
                                                              getDeviceVariableListFirestoreData(
                                                            medibound_portal_hdztzw_functions.insertVarListData(
                                                                containerRecordTemplateRecord
                                                                    .variables
                                                                    .toList(),
                                                                medibound_portal_hdztzw_functions.convertStringToJson(FFAppState()
                                                                    .ConnectedDevices
                                                                    .where((e) =>
                                                                        e.id ==
                                                                        widget
                                                                            .device
                                                                            ?.storedId)
                                                                    .toList()
                                                                    .firstOrNull!
                                                                    .data)),
                                                          ),
                                                        },
                                                      ),
                                                    });
                                                    _model.record =
                                                        medibound_portal_hdztzw_backend
                                                                .RecordsRecord
                                                            .getDocumentFromData({
                                                      ...medibound_portal_hdztzw_backend
                                                          .createRecordsRecordData(
                                                        info: medibound_portal_hdztzw_data_schema
                                                            .updateCodedValueStruct(
                                                          containerRecordTemplateRecord
                                                              .info,
                                                          clearUnsetFields:
                                                              false,
                                                          create: true,
                                                        ),
                                                        owner:
                                                            currentUserReference,
                                                        template:
                                                            containerRecordTemplateRecord
                                                                .reference,
                                                      ),
                                                      ...mapToFirestore(
                                                        {
                                                          'data':
                                                              getDeviceVariableListFirestoreData(
                                                            medibound_portal_hdztzw_functions.insertVarListData(
                                                                containerRecordTemplateRecord
                                                                    .variables
                                                                    .toList(),
                                                                medibound_portal_hdztzw_functions.convertStringToJson(FFAppState()
                                                                    .ConnectedDevices
                                                                    .where((e) =>
                                                                        e.id ==
                                                                        widget
                                                                            .device
                                                                            ?.storedId)
                                                                    .toList()
                                                                    .firstOrNull!
                                                                    .data)),
                                                          ),
                                                        },
                                                      ),
                                                    }, recordsRecordReference);
                                                    await showModalBottomSheet(
                                                      isScrollControlled: true,
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryBackground,
                                                      enableDrag: false,
                                                      context: context,
                                                      builder: (context) {
                                                        return Padding(
                                                          padding: MediaQuery
                                                              .viewInsetsOf(
                                                                  context),
                                                          child: Container(
                                                            height: 600.0,
                                                            child: RecordWidget(
                                                              recordWidth:
                                                                  MediaQuery.sizeOf(
                                                                          context)
                                                                      .width,
                                                              record: _model
                                                                  .record!,
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ).then((value) =>
                                                        safeSetState(() {}));
                                                  } else {
                                                    await showDialog(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return AlertDialog(
                                                          title: Text(
                                                              'Data Format Invalid'),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext),
                                                              child: Text('Ok'),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    );
                                                  }

                                                  safeSetState(() {});
                                                },
                                                text: 'Save Record',
                                                icon: Icon(
                                                  Icons.download_rounded,
                                                  size: 16.0,
                                                ),
                                                options: FFButtonOptions(
                                                  height: 45.0,
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          16.0, 0.0, 16.0, 0.0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'Rubik',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                  elevation: 0.0,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                  await actions
                                                      .writeDeviceCommand(
                                                    BluetoothDeviceStruct(
                                                      id: widget
                                                          .device?.storedId,
                                                    ),
                                                    widget.device!.storedKey,
                                                  );
                                                },
                                                text: 'Reset',
                                                icon: FaIcon(
                                                  FontAwesomeIcons.redo,
                                                  size: 14.0,
                                                ),
                                                options: FFButtonOptions(
                                                  height: 45.0,
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          24.0, 0.0, 24.0, 0.0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: Color(0x3EFF5963),
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'Rubik',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                  elevation: 0.0,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                ),
                                              ),
                                            ),
                                          ].divide(SizedBox(width: 10.0)),
                                        ),
                                      );
                                    },
                                  );
                                } else {
                                  return FFButtonWidget(
                                    onPressed: true
                                        ? null
                                        : () {
                                            print('Button pressed ...');
                                          },
                                    text: 'WAITING...',
                                    options: FFButtonOptions(
                                      height: 45.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 16.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Rubik',
                                            color: Colors.white,
                                            letterSpacing: 0.0,
                                          ),
                                      elevation: 0.0,
                                      borderRadius: BorderRadius.circular(8.0),
                                      disabledColor: Color(0x00FFFFFF),
                                      disabledTextColor:
                                          FlutterFlowTheme.of(context)
                                              .secondaryText,
                                    ),
                                  );
                                }
                              },
                            ),
                          ),
                        ).animateOnPageLoad(
                            animationsMap['containerOnPageLoadAnimation2']!),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
