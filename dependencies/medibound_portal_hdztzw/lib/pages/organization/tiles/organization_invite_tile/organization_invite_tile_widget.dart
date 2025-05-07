import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'organization_invite_tile_model.dart';
export 'organization_invite_tile_model.dart';

class OrganizationInviteTileWidget extends StatefulWidget {
  const OrganizationInviteTileWidget({
    super.key,
    double? titleSize,
    double? photoSize,
    double? height,
    double? padding,
    required this.organizationInvite,
  })  : this.titleSize = titleSize ?? 14.0,
        this.photoSize = photoSize ?? 35.0,
        this.height = height ?? 50.0,
        this.padding = padding ?? 10.0;

  final double titleSize;
  final double photoSize;
  final double height;
  final double padding;
  final RolesRecord? organizationInvite;

  @override
  State<OrganizationInviteTileWidget> createState() =>
      _OrganizationInviteTileWidgetState();
}

class _OrganizationInviteTileWidgetState
    extends State<OrganizationInviteTileWidget> {
  late OrganizationInviteTileModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OrganizationInviteTileModel());

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

    return StreamBuilder<OrganizationsRecord>(
      stream: OrganizationsRecord.getDocument(
          widget!.organizationInvite!.parentReference),
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
                          containerOrganizationsRecord.profile.photoUrl,
                          width: widget!.photoSize,
                          height: widget!.photoSize,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              containerOrganizationsRecord.profile.displayName,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
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
                                    .where((e) =>
                                        e.code ==
                                        containerOrganizationsRecord.type)
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
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
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
                        padding:
                            EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).alternate,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                7.5, 5.0, 7.5, 5.0),
                            child: Text(
                              'INVITE',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
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
                      FFButtonWidget(
                        onPressed: () async {
                          await widget!.organizationInvite!.reference
                              .update(createRolesRecordData(
                            linkedUser: currentUserReference,
                          ));
                        },
                        text: 'Accept',
                        options: FFButtonOptions(
                          height: 35.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).secondary,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    font: GoogleFonts.rubik(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                    color: Colors.white,
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
                        ),
                      ),
                      FFButtonWidget(
                        onPressed: () async {
                          await widget!.organizationInvite!.reference.delete();
                        },
                        text: 'Reject',
                        options: FFButtonOptions(
                          height: 35.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: Color(0x00E0E3E7),
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    font: GoogleFonts.rubik(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context).error,
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
      },
    );
  }
}
