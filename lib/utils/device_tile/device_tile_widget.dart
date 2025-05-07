import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_util.dart';
import "package:medibound_portal_hdztzw/backend/backend.dart"
    as medibound_portal_hdztzw_backend;
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:medibound_portal_hdztzw/app_state.dart'
    as medibound_portal_hdztzw_app_state;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'device_tile_model.dart';
export 'device_tile_model.dart';

class DeviceTileWidget extends StatefulWidget {
  const DeviceTileWidget({
    super.key,
    required this.device,
    required this.cornerIcon,
    Color? statusColor,
    String? status,
    int? battery,
    this.isEdit,
  })  : this.statusColor = statusColor ?? const Color(0x2AEFEFF4),
        this.status = status ?? 'DISCONNECTED',
        this.battery = battery ?? 100;

  final medibound_portal_hdztzw_backend.DeviceRecord? device;
  final Widget? cornerIcon;
  final Color statusColor;
  final String status;
  final int battery;
  final bool? isEdit;

  @override
  State<DeviceTileWidget> createState() => _DeviceTileWidgetState();
}

class _DeviceTileWidgetState extends State<DeviceTileWidget>
    with TickerProviderStateMixin {
  late DeviceTileModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DeviceTileModel());

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
          key: ValueKey(widget.device!.info.code),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Stack(
            children: [
              Transform.scale(
                scaleX: 1.0,
                scaleY: 1.0,
                alignment: AlignmentDirectional(1.0, 1.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 10.0,
                        color: Color(0x14000000),
                        offset: Offset(
                          2.0,
                          2.0,
                        ),
                      )
                    ],
                    borderRadius: BorderRadius.circular(15.0),
                    border: Border.all(
                      color: FlutterFlowTheme.of(context).alternate,
                      width: 1.0,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(15.0),
                    child: StreamBuilder<
                        medibound_portal_hdztzw_backend.OrganizationsRecord>(
                      stream:
                          medibound_portal_hdztzw_backend.OrganizationsRecord
                              .getDocument(
                                  containerDeviceProfilesRecord.organization!),
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

                        final columnOrganizationsRecord = snapshot.data!;

                        return Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Align(
                                alignment: AlignmentDirectional(1.0, -1.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, -1.0),
                                      child: Container(
                                        decoration: BoxDecoration(),
                                        child: Container(
                                          width: 50.0,
                                          height: 20.0,
                                          child: custom_widgets.Battery(
                                            width: 50.0,
                                            height: 20.0,
                                            value: 50,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Expanded(
                                  child: ClipRRect(
                                    child: Container(
                                      decoration: BoxDecoration(),
                                      alignment:
                                          AlignmentDirectional(-1.0, 1.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.all(2.5),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: CachedNetworkImage(
                                                fadeInDuration:
                                                    Duration(milliseconds: 500),
                                                fadeOutDuration:
                                                    Duration(milliseconds: 500),
                                                imageUrl:
                                                    columnOrganizationsRecord
                                                        .profile.photoUrl,
                                                width: 30.0,
                                                height: 30.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          AutoSizeText(
                                            containerDeviceProfilesRecord
                                                .info.display
                                                .maybeHandleOverflow(
                                              maxChars: 15,
                                              replacement: '…',
                                            ),
                                            maxLines: 1,
                                            style: FlutterFlowTheme.of(context)
                                                .titleLarge
                                                .override(
                                                  font: GoogleFonts.rubik(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleLarge
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleLarge
                                                            .fontStyle,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleLarge
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleLarge
                                                          .fontStyle,
                                                ),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 5.0),
                                                child: AutoSizeText(
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
                                                  ).maybeHandleOverflow(
                                                    maxChars: 40,
                                                    replacement: '…',
                                                  ),
                                                  maxLines: 2,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleLarge
                                                      .override(
                                                        font: GoogleFonts.rubik(
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleLarge
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleLarge
                                                                .fontStyle,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          if (widget.status != '')
                                            AutoSizeText(
                                              widget.status
                                                  .maybeHandleOverflow(
                                                maxChars: 40,
                                                replacement: '…',
                                              ),
                                              maxLines: 2,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLarge
                                                      .override(
                                                        font: GoogleFonts.rubik(
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleLarge
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            widget.statusColor,
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleLarge
                                                                .fontStyle,
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
                        );
                      },
                    ),
                  ),
                ),
              ),
              if (!widget.isEdit!)
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
                      child: widget.cornerIcon!,
                    ),
                  ),
                ),
              Align(
                alignment: AlignmentDirectional(-1.0, -1.0),
                child: Transform.translate(
                  offset: Offset(-10.0, -10.0),
                  child: Visibility(
                    visible: widget.isEdit ?? true,
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        await widget.device!.reference.update({
                          ...mapToFirestore(
                            {
                              'owner': FieldValue.delete(),
                            },
                          ),
                        });
                      },
                      child: Container(
                        width: 30.0,
                        height: 30.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 4.0,
                              color: Color(0x10000000),
                              offset: Offset(
                                -2.0,
                                2.0,
                              ),
                            )
                          ],
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).alternate,
                            width: 1.5,
                          ),
                        ),
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Icon(
                          Icons.close_rounded,
                          color: FlutterFlowTheme.of(context).error,
                          size: 20.0,
                        ),
                      ),
                    ).animateOnPageLoad(
                        animationsMap['containerOnPageLoadAnimation']!),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
