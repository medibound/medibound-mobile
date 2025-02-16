import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/streams/manage_device/manage_device_widget.dart';
import '/utils/device_tile/device_tile_widget.dart';
import "package:medibound_portal_hdztzw/backend/backend.dart"
    as medibound_portal_hdztzw_backend;
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter_animate/flutter_animate.dart';
import 'package:medibound_portal_hdztzw/app_state.dart'
    as medibound_portal_hdztzw_app_state;
import 'package:medibound_portal_hdztzw/utils/empty_list/empty_list_widget.dart'
    as medibound_portal_hdztzw;
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'device_list_model.dart';
export 'device_list_model.dart';

class DeviceListWidget extends StatefulWidget {
  const DeviceListWidget({
    super.key,
    bool? isEdit,
  }) : this.isEdit = isEdit ?? false;

  final bool isEdit;

  @override
  State<DeviceListWidget> createState() => _DeviceListWidgetState();
}

class _DeviceListWidgetState extends State<DeviceListWidget>
    with TickerProviderStateMixin {
  late DeviceListModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DeviceListModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (!(FFAppState().ConnectedDevices.isNotEmpty)) {
        _model.connectedDevicesTemp = await actions.getConnectedDevices(
          (device) async {
            _model.deviceConnectedFound =
                await medibound_portal_hdztzw_backend.queryDeviceRecordOnce(
              queryBuilder: (deviceRecord) => deviceRecord
                  .where(
                    'storedId',
                    isEqualTo: device.id,
                  )
                  .where(
                    'owner',
                    isEqualTo: currentUserReference,
                  ),
              limit: 1,
            );
            if ((_model.deviceConnectedFound != null &&
                    (_model.deviceConnectedFound)!.isNotEmpty) !=
                true) {
              await actions.disconnectDevice(
                device,
              );
            }
          },
        );
        FFAppState().ConnectedDevices =
            _model.connectedDevicesTemp!.toList().cast<BluetoothDeviceStruct>();
        _model.updatePage(() {});
      }
      await actions.getDevices(
        (device) async {
          _model.addToScannedDevicesLive(device);
          safeSetState(() {});
          _model.confirmKeyOutput = await actions.confirmKey(
            device,
          );
          if (_model.confirmKeyOutput != 'NO_AUTH') {
            _model.addToScannedDevicesLive(device);
            safeSetState(() {});
            _model.connection = await actions.connectDevice(
              device,
              (device) async {},
            );
            if (_model.connection!) {}
          }
        },
      );
    });

    _model.searchTextController ??= TextEditingController();
    _model.searchFocusNode ??= FocusNode();
    _model.searchFocusNode!.addListener(() => safeSetState(() {}));
    animationsMap.addAll({
      'deviceTileOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 200.0.ms,
            duration: 800.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 200.0.ms,
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

    return AnimatedContainer(
      duration: Duration(milliseconds: 50),
      curve: Curves.easeInOut,
      decoration: BoxDecoration(),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Container(
                    height: 40.0,
                    child: Stack(
                      alignment: AlignmentDirectional(-1.0, 0.0),
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              15.0, 0.0, 0.0, 0.0),
                          child: FaIcon(
                            FontAwesomeIcons.search,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 14.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 1.0),
                          child: TextFormField(
                            controller: _model.searchTextController,
                            focusNode: _model.searchFocusNode,
                            onChanged: (_) => EasyDebounce.debounce(
                              '_model.searchTextController',
                              Duration(milliseconds: 2000),
                              () => safeSetState(() {}),
                            ),
                            autofocus: false,
                            textInputAction: TextInputAction.search,
                            obscureText: false,
                            decoration: InputDecoration(
                              isDense: false,
                              labelStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                fontFamily: 'Rubik',
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.normal,
                                shadows: [
                                  Shadow(
                                    color: FlutterFlowTheme.of(context)
                                        .customColor1,
                                    offset: Offset(0.0, 2.0),
                                    blurRadius: 40.0,
                                  )
                                ],
                              ),
                              alignLabelWithHint: false,
                              hintText: 'Search Devices & Apps...',
                              hintStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Rubik',
                                    letterSpacing: 0.0,
                                  ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              filled: true,
                              fillColor: FlutterFlowTheme.of(context).alternate,
                              hoverColor:
                                  FlutterFlowTheme.of(context).customColor1,
                              prefixIcon: FaIcon(
                                FontAwesomeIcons.search,
                                color: Color(0x00D9FFF6),
                                size: 14.0,
                              ),
                              suffixIcon: _model
                                      .searchTextController!.text.isNotEmpty
                                  ? InkWell(
                                      onTap: () async {
                                        _model.searchTextController?.clear();
                                        safeSetState(() {});
                                      },
                                      child: Icon(
                                        Icons.clear,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 16.0,
                                      ),
                                    )
                                  : null,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Rubik',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  letterSpacing: 0.0,
                                ),
                            cursorColor:
                                FlutterFlowTheme.of(context).primaryText,
                            validator: _model.searchTextControllerValidator
                                .asValidator(context),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            StreamBuilder<List<medibound_portal_hdztzw_backend.DeviceRecord>>(
              stream: medibound_portal_hdztzw_backend.queryDeviceRecord(
                queryBuilder: (deviceRecord) => deviceRecord.where(
                  'owner',
                  isEqualTo: currentUserReference,
                ),
              ),
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
                List<medibound_portal_hdztzw_backend.DeviceRecord>
                    gridViewDeviceRecordList = snapshot.data!;
                if (gridViewDeviceRecordList.isEmpty) {
                  return Center(
                    child: Container(
                      width: double.infinity,
                      height: 200.0,
                      child: medibound_portal_hdztzw.EmptyListWidget(
                        text: 'No Devices Connected',
                        icon: FaIcon(
                          FontAwesomeIcons.clone,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 16.0,
                        ),
                        height: 200.0,
                      ),
                    ),
                  );
                }

                return GridView.builder(
                  padding: EdgeInsets.zero,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                    childAspectRatio: 1.2,
                  ),
                  primary: false,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: gridViewDeviceRecordList.length,
                  itemBuilder: (context, gridViewIndex) {
                    final gridViewDeviceRecord =
                        gridViewDeviceRecordList[gridViewIndex];
                    return AnimatedOpacity(
                      opacity: FFAppState()
                              .ConnectedDevices
                              .where(
                                  (e) => e.id == gridViewDeviceRecord.storedId)
                              .toList()
                              .isNotEmpty
                          ? 1.0
                          : 0.7,
                      duration: 300.0.ms,
                      curve: Curves.easeInOut,
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          if (FFAppState()
                              .ConnectedDevices
                              .where(
                                  (e) => e.id == gridViewDeviceRecord.storedId)
                              .toList()
                              .isNotEmpty) {
                            await showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Color(0x000B0C0C),
                              enableDrag: false,
                              useSafeArea: true,
                              context: context,
                              builder: (context) {
                                return Padding(
                                  padding: MediaQuery.viewInsetsOf(context),
                                  child: Container(
                                    height: 500.0,
                                    child: ManageDeviceWidget(
                                      device: gridViewDeviceRecord,
                                    ),
                                  ),
                                );
                              },
                            ).then((value) => safeSetState(() {}));
                          }
                        },
                        child: wrapWithModel(
                          model: _model.deviceTileModels.getModel(
                            gridViewDeviceRecord.info.code,
                            gridViewIndex,
                          ),
                          updateCallback: () => safeSetState(() {}),
                          child: DeviceTileWidget(
                            key: Key(
                              'Keyc1p_${gridViewDeviceRecord.info.code}',
                            ),
                            device: gridViewDeviceRecord,
                            cornerIcon: FaIcon(
                              FontAwesomeIcons.chevronRight,
                              color: FlutterFlowTheme.of(context).alternate,
                              size: 16.0,
                            ),
                            optionsButtonShow: FFAppState()
                                .ConnectedDevices
                                .where((e) =>
                                    e.id == gridViewDeviceRecord.storedId)
                                .toList()
                                .isNotEmpty,
                            optionsButtonIcon: FaIcon(
                              FontAwesomeIcons.play,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 12.0,
                            ),
                            status: valueOrDefault<String>(
                              FFAppState()
                                      .ConnectedDevices
                                      .where((e) =>
                                          e.id == gridViewDeviceRecord.storedId)
                                      .toList()
                                      .isNotEmpty
                                  ? FFAppState()
                                      .ConnectedDevices
                                      .where((e) =>
                                          e.id == gridViewDeviceRecord.storedId)
                                      .toList()
                                      .firstOrNull
                                      ?.status
                                  : 'DISCONNECTED',
                              'IDLE',
                            ),
                            statusColor: FFAppState()
                                    .ConnectedDevices
                                    .where((e) =>
                                        e.id == gridViewDeviceRecord.storedId)
                                    .toList()
                                    .isNotEmpty
                                ? FlutterFlowTheme.of(context).secondary
                                : FlutterFlowTheme.of(context).secondaryText,
                            battery: valueOrDefault<int>(
                              FFAppState()
                                      .ConnectedDevices
                                      .where((e) =>
                                          e.id == gridViewDeviceRecord.storedId)
                                      .toList()
                                      .isNotEmpty
                                  ? FFAppState()
                                      .ConnectedDevices
                                      .where((e) =>
                                          e.id == gridViewDeviceRecord.storedId)
                                      .toList()
                                      .firstOrNull
                                      ?.battery
                                  : null,
                              0,
                            ),
                            isEdit: widget.isEdit,
                          ),
                        ),
                      ).animateOnPageLoad(
                          animationsMap['deviceTileOnPageLoadAnimation']!),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
