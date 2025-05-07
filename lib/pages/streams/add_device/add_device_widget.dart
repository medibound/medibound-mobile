import '/flutter_flow/flutter_flow_util.dart';
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
import 'package:collection/collection.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:google_fonts/google_fonts.dart';
import 'add_device_model.dart';
export 'add_device_model.dart';

class AddDeviceWidget extends StatefulWidget {
  const AddDeviceWidget({super.key});

  @override
  State<AddDeviceWidget> createState() => _AddDeviceWidgetState();
}

class _AddDeviceWidgetState extends State<AddDeviceWidget> {
  late AddDeviceModel _model;

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
      await Future.delayed(const Duration(milliseconds: 1500));
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
    return Container(
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
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 20.0),
        child: SafeArea(
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
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                    child: Container(
                      width: double.infinity,
                      height: 500.0,
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 40.0),
                        child: PageView(
                          physics: const NeverScrollableScrollPhysics(),
                          controller: _model.pageViewController ??=
                              PageController(initialPage: 0),
                          scrollDirection: Axis.horizontal,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 20.0, 0.0),
                              child: Container(
                                decoration: BoxDecoration(),
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Select an verification method',
                                        style: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              font: GoogleFonts.rubik(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .fontStyle,
                                              ),
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
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

                                              _model.devicePull =
                                                  await medibound_portal_hdztzw_backend
                                                      .queryDeviceRecordOnce(
                                                queryBuilder: (deviceRecord) =>
                                                    deviceRecord.where(
                                                  'info.code',
                                                  isEqualTo: _model.barcodeId,
                                                ),
                                              );
                                              if (_model.devicePull != null &&
                                                  (_model.devicePull)!
                                                      .isNotEmpty) {
                                                if (!_model
                                                    .devicePull!.firstOrNull!
                                                    .hasOwner()) {
                                                  await _model
                                                      .pageViewController
                                                      ?.nextPage(
                                                    duration: Duration(
                                                        milliseconds: 300),
                                                    curve: Curves.ease,
                                                  );
                                                  _model.isConnected =
                                                      await actions
                                                          .checkDeviceBLE(
                                                    _model
                                                        .devicePull!
                                                        .firstOrNull!
                                                        .reference
                                                        .id,
                                                  );
                                                  if (_model.isConnected!) {
                                                    Navigator.pop(context);
                                                  } else {
                                                    await _model
                                                        .pageViewController
                                                        ?.previousPage(
                                                      duration: Duration(
                                                          milliseconds: 300),
                                                      curve: Curves.ease,
                                                    );
                                                    await showDialog(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return AlertDialog(
                                                          title: Text(
                                                              'Device not detected'),
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
                                                } else {
                                                  await showDialog(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return AlertDialog(
                                                        title: Text(
                                                            'Device is already set up'),
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
                                              } else {
                                                await showDialog(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return AlertDialog(
                                                      title: Text(
                                                          'No Device Found'),
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
                                            child: medibound_portal_hdztzw_util
                                                .wrapWithModel(
                                              model: _model
                                                  .componentProfileTileModel1,
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: medibound_portal_hdztzw
                                                  .ComponentProfileTileWidget(
                                                display: 'Secure Scan',
                                                subtitle: 'Use the barcode',
                                                titleSize: 20.0,
                                                photoSize: 40.0,
                                                height: 75.0,
                                                icon: Icon(
                                                  Icons.qr_code_rounded,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondary,
                                                  size: 24.0,
                                                ),
                                                widget: () =>
                                                    medibound_portal_hdztzw
                                                        .EmptyWidget(),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Opacity(
                                        opacity: 0.5,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            child: medibound_portal_hdztzw_util
                                                .wrapWithModel(
                                              model: _model
                                                  .componentProfileTileModel2,
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: medibound_portal_hdztzw
                                                  .ComponentProfileTileWidget(
                                                display: 'Contactless Tap',
                                                subtitle:
                                                    'Transfer with NFC\nComing Soon',
                                                titleSize: 20.0,
                                                photoSize: 40.0,
                                                height: 75.0,
                                                icon: Icon(
                                                  Icons.nfc_rounded,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondary,
                                                  size: 24.0,
                                                ),
                                                widget: () =>
                                                    medibound_portal_hdztzw
                                                        .EmptyWidget(),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ].divide(SizedBox(height: 10.0)),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Connection status',
                                    style: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          font: GoogleFonts.rubik(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontStyle,
                                          ),
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontStyle,
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
                                            decoration: BoxDecoration(),
                                          );
                                        } else {
                                          return medibound_portal_hdztzw_util
                                              .wrapWithModel(
                                            model: _model.loadingModel1,
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child: medibound_portal_hdztzw
                                                .LoadingWidget(),
                                          );
                                        }
                                      },
                                    ),
                                  medibound_portal_hdztzw_util.wrapWithModel(
                                    model: _model.loadingModel2,
                                    updateCallback: () => safeSetState(() {}),
                                    child:
                                        medibound_portal_hdztzw.LoadingWidget(),
                                  ),
                                ].divide(SizedBox(height: 10.0)),
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
