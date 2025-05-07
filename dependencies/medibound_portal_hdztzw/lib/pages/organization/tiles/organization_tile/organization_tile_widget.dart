import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'organization_tile_model.dart';
export 'organization_tile_model.dart';

class OrganizationTileWidget extends StatefulWidget {
  const OrganizationTileWidget({
    super.key,
    double? titleSize,
    double? photoSize,
    double? height,
    double? padding,
    required this.organization,
  })  : this.titleSize = titleSize ?? 14.0,
        this.photoSize = photoSize ?? 35.0,
        this.height = height ?? 50.0,
        this.padding = padding ?? 10.0;

  final double titleSize;
  final double photoSize;
  final double height;
  final double padding;
  final OrganizationsRecord? organization;

  @override
  State<OrganizationTileWidget> createState() => _OrganizationTileWidgetState();
}

class _OrganizationTileWidgetState extends State<OrganizationTileWidget> {
  late OrganizationTileModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OrganizationTileModel());

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
      width: MediaQuery.sizeOf(context).width * 1.0,
      height: widget!.height,
      decoration: BoxDecoration(),
      child: MouseRegion(
        opaque: false,
        cursor: SystemMouseCursors.click ?? MouseCursor.defer,
        child: ClipRRect(
          child: AnimatedContainer(
            duration: Duration(milliseconds: 150),
            curve: Curves.easeInOut,
            width: double.infinity,
            decoration: BoxDecoration(
              color: _model.onHover
                  ? FlutterFlowTheme.of(context).alternate
                  : Color(0x00000000),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(
                  valueOrDefault<double>(
                    widget!.padding,
                    0.0,
                  ),
                  0.0,
                  valueOrDefault<double>(
                    widget!.padding,
                    0.0,
                  ),
                  0.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.network(
                      widget!.organization!.profile.photoUrl,
                      width: widget!.photoSize,
                      height: widget!.photoSize,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Image.asset(
                        'packages/medibound_portal_hdztzw/assets/images/error_image.png',
                        width: widget!.photoSize,
                        height: widget!.photoSize,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          valueOrDefault<String>(
                            widget!.organization?.profile?.displayName,
                            'Organization',
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.rubik(
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    fontSize: widget!.titleSize,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                        ),
                        Text(
                          valueOrDefault<String>(
                            FFAppState()
                                .OrganizationTypes
                                .where(
                                    (e) => e.code == widget!.organization?.type)
                                .toList()
                                .firstOrNull
                                ?.display,
                            'Type',
                          ).maybeHandleOverflow(
                            maxChars: 30,
                            replacement: '…',
                          ),
                          maxLines: 1,
                          style: FlutterFlowTheme.of(context)
                              .bodySmall
                              .override(
                                font: GoogleFonts.rubik(
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .fontStyle,
                                ),
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                letterSpacing: 0.0,
                                fontWeight: FlutterFlowTheme.of(context)
                                    .bodySmall
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodySmall
                                    .fontStyle,
                                lineHeight: 1.0,
                              ),
                        ),
                      ].divide(SizedBox(height: 0.0)),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).alternate,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(7.5, 5.0, 7.5, 5.0),
                        child: Text(
                          widget!.organization?.owner == currentUserReference
                              ? 'OWNER'
                              : 'MEMBER',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.rubik(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    fontSize: 10.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                        ),
                      ),
                    ),
                  ),
                  Spacer(),
                  Container(
                    width: 20.0,
                    decoration: BoxDecoration(),
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: FaIcon(
                      FontAwesomeIcons.angleRight,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 16.0,
                    ),
                  ),
                ].divide(SizedBox(width: 5.0)),
              ),
            ),
          ),
        ),
        onEnter: ((event) async {
          safeSetState(() => _model.mouseRegionHovered = true);
          _model.onHover = true;
          safeSetState(() {});
        }),
        onExit: ((event) async {
          safeSetState(() => _model.mouseRegionHovered = false);
          _model.onHover = false;
          safeSetState(() {});
        }),
      ),
    );
  }
}
