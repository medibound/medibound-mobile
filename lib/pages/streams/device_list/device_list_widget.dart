import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/utils/device_tile/device_tile_widget.dart';
import "package:medibound_portal_hdztzw/backend/backend.dart"
    as medibound_portal_hdztzw_backend;
import '/custom_code/actions/index.dart' as actions;
import 'package:medibound_portal_hdztzw/app_state.dart'
    as medibound_portal_hdztzw_app_state;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'device_list_model.dart';
export 'device_list_model.dart';

class DeviceListWidget extends StatefulWidget {
  const DeviceListWidget({super.key});

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
      await actions.getDevices(
        (device) async {
          _model.addToScannedDevicesLive(device);
          safeSetState(() {});
          _model.deviceFound =
              await medibound_portal_hdztzw_backend.queryDeviceRecordOnce(
            queryBuilder: (deviceRecord) => deviceRecord
                .where(
                  'info.code',
                  isEqualTo: device.deviceId,
                )
                .where(
                  'owner',
                  isEqualTo: currentUserReference,
                ),
            limit: 1,
          );
          if (_model.deviceFound != null && (_model.deviceFound)!.isNotEmpty) {
            _model.addToScannedDevicesLive(device);
            safeSetState(() {});
            _model.connection = await actions.connectDevice(
              device,
              (device) async {},
              (status, device) async {},
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

    return Container(
      decoration: const BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: SizedBox(
                  height: 40.0,
                  child: Stack(
                    alignment: const AlignmentDirectional(-1.0, 0.0),
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 0.0, 0.0),
                        child: FaIcon(
                          FontAwesomeIcons.search,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 14.0,
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 1.0),
                        child: TextFormField(
                          controller: _model.searchTextController,
                          focusNode: _model.searchFocusNode,
                          onChanged: (_) => EasyDebounce.debounce(
                            '_model.searchTextController',
                            const Duration(milliseconds: 2000),
                            () => safeSetState(() {}),
                          ),
                          autofocus: false,
                          textInputAction: TextInputAction.search,
                          obscureText: false,
                          decoration: InputDecoration(
                            isDense: true,
                            labelStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                              fontFamily: 'Rubik',
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.normal,
                              shadows: [
                                Shadow(
                                  color:
                                      FlutterFlowTheme.of(context).customColor1,
                                  offset: const Offset(0.0, 2.0),
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
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            focusedErrorBorder: InputBorder.none,
                            filled: true,
                            fillColor: FlutterFlowTheme.of(context).alternate,
                            contentPadding: const EdgeInsets.all(15.0),
                            hoverColor:
                                FlutterFlowTheme.of(context).customColor1,
                            prefixIcon: const FaIcon(
                              FontAwesomeIcons.search,
                              color: Color(0x00D9FFF6),
                              size: 14.0,
                            ),
                            suffixIcon:
                                _model.searchTextController!.text.isNotEmpty
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
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                letterSpacing: 0.0,
                              ),
                          cursorColor: FlutterFlowTheme.of(context).primaryText,
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

              return GridView.builder(
                padding: EdgeInsets.zero,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
                  return wrapWithModel(
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
                      optionsButtonShow: true,
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
                            ? 'Connected'
                            : 'Disconnected',
                        'Disconnected',
                      ),
                      statusColor: FFAppState()
                              .ConnectedDevices
                              .where(
                                  (e) => e.id == gridViewDeviceRecord.storedId)
                              .toList()
                              .isNotEmpty
                          ? FlutterFlowTheme.of(context).secondary
                          : FlutterFlowTheme.of(context).secondaryText,
                      checkStatus: false,
                    ),
                  ).animateOnPageLoad(
                      animationsMap['deviceTileOnPageLoadAnimation']!);
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
