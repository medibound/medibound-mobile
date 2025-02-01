import '/flutter_flow/flutter_flow_util.dart';
import "package:medibound_portal_hdztzw/backend/backend.dart"
    as medibound_portal_hdztzw_backend;
import 'package:medibound_portal_hdztzw/app_state.dart'
    as medibound_portal_hdztzw_app_state;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'device_tile_model.dart';
export 'device_tile_model.dart';

class DeviceTileWidget extends StatefulWidget {
  const DeviceTileWidget({
    super.key,
    required this.device,
    required this.cornerIcon,
    bool? optionsButtonShow,
    this.optionsButtonIcon,
    Color? statusColor,
    String? status,
    bool? checkStatus,
  })  : optionsButtonShow = optionsButtonShow ?? true,
        statusColor = statusColor ?? const Color(0x2AEFEFF4),
        status = status ?? 'DISCONNECTED',
        checkStatus = checkStatus ?? false;

  final medibound_portal_hdztzw_backend.DeviceRecord? device;
  final Widget? cornerIcon;
  final bool optionsButtonShow;
  final Widget? optionsButtonIcon;
  final Color statusColor;
  final String status;
  final bool checkStatus;

  @override
  State<DeviceTileWidget> createState() => _DeviceTileWidgetState();
}

class _DeviceTileWidgetState extends State<DeviceTileWidget> {
  late DeviceTileModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DeviceTileModel());
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
            color: FlutterFlowTheme.of(context).secondaryBackground,
            boxShadow: const [
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
                padding: const EdgeInsets.all(15.0),
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

                    final columnOrganizationsRecord = snapshot.data!;

                    return Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(2.5),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: CachedNetworkImage(
                                  fadeInDuration: const Duration(milliseconds: 500),
                                  fadeOutDuration: const Duration(milliseconds: 500),
                                  imageUrl: columnOrganizationsRecord
                                      .profile.photoUrl,
                                  width: 35.0,
                                  height: 35.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            if (widget.optionsButtonShow)
                              Container(
                                width: 25.0,
                                height: 25.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).alternate,
                                  shape: BoxShape.circle,
                                ),
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: widget.optionsButtonIcon!,
                              ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: ClipRRect(
                                child: Container(
                                  decoration: const BoxDecoration(),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
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
                                              fontFamily: 'Rubik',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
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
                                          style: FlutterFlowTheme.of(context)
                                              .titleLarge
                                              .override(
                                                fontFamily: 'Rubik',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                fontSize: 12.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.normal,
                                              ),
                                        ),
                                      ),
                                      AutoSizeText(
                                        widget.status.maybeHandleOverflow(
                                          maxChars: 40,
                                          replacement: '…',
                                        ),
                                        maxLines: 2,
                                        style: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .override(
                                              fontFamily: 'Rubik',
                                              color: widget.statusColor,
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
                    );
                  },
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(1.0, 1.0),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    width: 25.0,
                    height: 25.0,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: widget.cornerIcon!,
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
