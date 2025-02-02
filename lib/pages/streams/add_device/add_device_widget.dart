import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/custom_cloud_functions/custom_cloud_function_response_manager.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/utils/device_tile/device_tile_widget.dart';
import "package:medibound_portal_hdztzw/backend/backend.dart"
    as medibound_portal_hdztzw_backend;
import '/custom_code/actions/index.dart' as actions;
import 'package:medibound_portal_hdztzw/flutter_flow/flutter_flow_util.dart'
    as medibound_portal_hdztzw_util
    show wrapWithModel, createModel, FlutterFlowDynamicModels;
import 'package:medibound_portal_hdztzw/utils/dropdown/component_profile_tile/component_profile_tile_widget.dart'
    as medibound_portal_hdztzw;
import 'package:medibound_portal_hdztzw/utils/empty/empty_widget.dart'
    as medibound_portal_hdztzw;
import 'package:medibound_portal_hdztzw/utils/loading/loading_widget.dart'
    as medibound_portal_hdztzw;
import 'package:cloud_functions/cloud_functions.dart';
import 'package:collection/collection.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'add_device_model.dart';
export 'add_device_model.dart';

class AddDeviceWidget extends StatefulWidget {
  const AddDeviceWidget({super.key});

  @override
  State<AddDeviceWidget> createState() => _AddDeviceWidgetState();
}

class _AddDeviceWidgetState extends State<AddDeviceWidget>
    with TickerProviderStateMixin {
  late AddDeviceModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddDeviceModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.btDevicesAvailable = [];
      safeSetState(() {});
      await actions.getDevices(
        (device) async {
          _model.deviceSearch =
              await medibound_portal_hdztzw_backend.queryDeviceRecordOnce(
            queryBuilder: (deviceRecord) => deviceRecord
                .where(
                  'info.code',
                  isEqualTo: device.deviceId,
                )
                .where(
                  'owner',
                  isNotEqualTo: currentUserReference,
                ),
          );
          if (_model.deviceSearch != null &&
              (_model.deviceSearch)!.isNotEmpty) {
            _model.addToBtDevicesAvailable(BluetoothDeviceStruct(
              name: device.name,
              id: device.id,
              deviceId: device.deviceId,
              ref: _model.deviceSearch?.firstOrNull?.reference,
            ));
            safeSetState(() {});
          }
        },
      );
    });

    animationsMap.addAll({
      'rowOnPageLoadAnimation': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1600.0.ms,
            color: FlutterFlowTheme.of(context).secondaryBackground,
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
    return Container(
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 20.0, 20.0),
        child: SafeArea(
          child: Container(
            decoration: const BoxDecoration(),
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
                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                    child: SizedBox(
                      width: double.infinity,
                      height: 500.0,
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 40.0),
                        child: PageView(
                          physics: const NeverScrollableScrollPhysics(),
                          controller: _model.pageViewController ??=
                              PageController(initialPage: 0),
                          scrollDirection: Axis.horizontal,
                          children: [
                            Container(
                              decoration: const BoxDecoration(),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Select an available device',
                                    style: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Rubik',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                  Builder(
                                    builder: (context) {
                                      if (_model
                                          .btDevicesAvailable.isNotEmpty) {
                                        return Container(
                                          decoration: const BoxDecoration(),
                                          child: Builder(
                                            builder: (context) {
                                              final btDevices = _model
                                                  .btDevicesAvailable
                                                  .toList();

                                              return SingleChildScrollView(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: List.generate(
                                                      btDevices.length,
                                                      (btDevicesIndex) {
                                                    final btDevicesItem =
                                                        btDevices[
                                                            btDevicesIndex];
                                                    return StreamBuilder<
                                                        medibound_portal_hdztzw_backend
                                                        .DeviceRecord>(
                                                      stream:
                                                          medibound_portal_hdztzw_backend
                                                                  .DeviceRecord
                                                              .getDocument(
                                                                  btDevicesItem
                                                                      .ref!),
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

                                                        final containerDeviceRecord =
                                                            snapshot.data!;

                                                        return InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            _model.bTDeviceSelected =
                                                                btDevicesItem;
                                                            safeSetState(() {});
                                                            await _model
                                                                .pageViewController
                                                                ?.nextPage(
                                                              duration: const Duration(
                                                                  milliseconds:
                                                                      300),
                                                              curve:
                                                                  Curves.ease,
                                                            );
                                                          },
                                                          child: Container(
                                                            width: 175.0,
                                                            height: 130.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                            ),
                                                            child:
                                                                wrapWithModel(
                                                              model: _model
                                                                  .deviceTileModels
                                                                  .getModel(
                                                                btDevicesItem
                                                                    .id,
                                                                btDevicesIndex,
                                                              ),
                                                              updateCallback: () =>
                                                                  safeSetState(
                                                                      () {}),
                                                              updateOnChange:
                                                                  true,
                                                              child:
                                                                  DeviceTileWidget(
                                                                key: Key(
                                                                  'Keycy3_${btDevicesItem.id}',
                                                                ),
                                                                cornerIcon:
                                                                    FaIcon(
                                                                  FontAwesomeIcons
                                                                      .plus,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  size: 16.0,
                                                                ),
                                                                optionsButtonShow:
                                                                    false,
                                                                statusColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .alternate,
                                                                status: ' ',
                                                                checkStatus:
                                                                    false,
                                                                device:
                                                                    containerDeviceRecord,
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    );
                                                  }).divide(
                                                      const SizedBox(width: 10.0)),
                                                ),
                                              );
                                            },
                                          ),
                                        );
                                      } else {
                                        return ClipRRect(
                                          child: Container(
                                            decoration: const BoxDecoration(),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Container(
                                                  width: 175.0,
                                                  height: 130.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15.0),
                                                  ),
                                                ),
                                                Container(
                                                  width: 175.0,
                                                  height: 130.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15.0),
                                                  ),
                                                ),
                                                Container(
                                                  width: 175.0,
                                                  height: 130.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15.0),
                                                  ),
                                                ),
                                              ].divide(const SizedBox(width: 10.0)),
                                            ).animateOnPageLoad(animationsMap[
                                                'rowOnPageLoadAnimation']!),
                                          ),
                                        );
                                      }
                                    },
                                  ),
                                ].divide(const SizedBox(height: 10.0)),
                              ),
                            ),
                            Container(
                              decoration: const BoxDecoration(),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Select an verification method',
                                    style: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Rubik',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          _model.barcodeId =
                                              await FlutterBarcodeScanner
                                                  .scanBarcode(
                                            '#C62828', // scanning line color
                                            'Cancel', // cancel button text
                                            true, // whether to show the flash icon
                                            ScanMode.QR,
                                          );

                                          _model.deviceSelected =
                                              await medibound_portal_hdztzw_backend
                                                      .DeviceRecord
                                                  .getDocumentOnce(_model
                                                      .bTDeviceSelected!.ref!);
                                          try {
                                            final result =
                                                await FirebaseFunctions
                                                        .instanceFor(
                                                            region:
                                                                'us-central1')
                                                    .httpsCallable('checkKey')
                                                    .call({
                                              "key": _model.barcodeId,
                                              "publicWrappedKey": _model
                                                  .deviceSelected!
                                                  .key
                                                  .publicWrappedKey,
                                              "privateWrappedKey": _model
                                                  .deviceSelected!
                                                  .key
                                                  .privateWrappedKey,
                                            });
                                            _model.validationKey =
                                                CheckKeyCloudFunctionCallResponse(
                                              data: result.data,
                                              succeeded: true,
                                              resultAsString:
                                                  result.data.toString(),
                                              jsonBody: result.data,
                                            );
                                          } on FirebaseFunctionsException catch (error) {
                                            _model.validationKey =
                                                CheckKeyCloudFunctionCallResponse(
                                              errorCode: error.code,
                                              succeeded: false,
                                            );
                                          }

                                          if (_model.validationKey?.data !=
                                                  null &&
                                              _model.validationKey?.data !=
                                                  '') {
                                            await _model.pageViewController
                                                ?.nextPage(
                                              duration:
                                                  const Duration(milliseconds: 300),
                                              curve: Curves.ease,
                                            );

                                            await _model
                                                .deviceSelected!.reference
                                                .update(
                                                    medibound_portal_hdztzw_backend
                                                        .createDeviceRecordData(
                                              storedId:
                                                  _model.bTDeviceSelected?.id,
                                              storedKey:
                                                  _model.validationKey?.data,
                                            ));
                                            await actions.connectDevice(
                                              _model.bTDeviceSelected!,
                                              (device) async {},
                                            );
                                          }

                                          safeSetState(() {});
                                        },
                                        child: medibound_portal_hdztzw_util
                                            .wrapWithModel(
                                          model:
                                              _model.componentProfileTileModel1,
                                          updateCallback: () =>
                                              safeSetState(() {}),
                                          child: medibound_portal_hdztzw
                                              .ComponentProfileTileWidget(
                                            display: 'Secure Scan',
                                            subtitle: 'Use the barcode',
                                            photoUrl: '',
                                            titleSize: 20.0,
                                            photoSize: 40.0,
                                            height: 75.0,
                                            icon: Icon(
                                              Icons.qr_code_scanner_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                              size: 24.0,
                                            ),
                                            widget: () =>
                                                const medibound_portal_hdztzw
                                                    .EmptyWidget(),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Opacity(
                                    opacity: 0.5,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        child: medibound_portal_hdztzw_util
                                            .wrapWithModel(
                                          model:
                                              _model.componentProfileTileModel2,
                                          updateCallback: () =>
                                              safeSetState(() {}),
                                          child: medibound_portal_hdztzw
                                              .ComponentProfileTileWidget(
                                            display: 'Contactless Tap',
                                            subtitle:
                                                'Contactless via NFC\nComing Soon',
                                            photoUrl: '',
                                            titleSize: 20.0,
                                            photoSize: 40.0,
                                            height: 75.0,
                                            icon: Icon(
                                              Icons.nfc,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                              size: 24.0,
                                            ),
                                            widget: () =>
                                                const medibound_portal_hdztzw
                                                    .EmptyWidget(),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ].divide(const SizedBox(height: 10.0)),
                              ),
                            ),
                            Container(
                              decoration: const BoxDecoration(),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Connection status',
                                    style: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Rubik',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                  if (responsiveVisibility(
                                    context: context,
                                    phone: false,
                                    tablet: false,
                                    tabletLandscape: false,
                                    desktop: false,
                                  ))
                                    Builder(
                                      builder: (context) {
                                        if (!_model.connectionLoading) {
                                          return Container(
                                            decoration: const BoxDecoration(),
                                          );
                                        } else {
                                          return medibound_portal_hdztzw_util
                                              .wrapWithModel(
                                            model: _model.loadingModel1,
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child: const medibound_portal_hdztzw
                                                .LoadingWidget(),
                                          );
                                        }
                                      },
                                    ),
                                  medibound_portal_hdztzw_util.wrapWithModel(
                                    model: _model.loadingModel2,
                                    updateCallback: () => safeSetState(() {}),
                                    child:
                                        const medibound_portal_hdztzw.LoadingWidget(),
                                  ),
                                ].divide(const SizedBox(height: 10.0)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
