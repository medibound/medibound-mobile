import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'component_profile_tile_model.dart';
export 'component_profile_tile_model.dart';

class ComponentProfileTileWidget extends StatefulWidget {
  const ComponentProfileTileWidget({
    super.key,
    this.display,
    required this.subtitle,
    this.photoUrl,
    double? titleSize,
    double? photoSize,
    double? height,
    required this.widget,
    this.icon,
    double? padding,
    this.color,
  })  : this.titleSize = titleSize ?? 14.0,
        this.photoSize = photoSize ?? 35.0,
        this.height = height ?? 50.0,
        this.padding = padding ?? 10.0;

  final String? display;
  final String? subtitle;
  final String? photoUrl;
  final double titleSize;
  final double photoSize;
  final double height;
  final Widget Function()? widget;
  final Widget? icon;
  final double padding;
  final Color? color;

  @override
  State<ComponentProfileTileWidget> createState() =>
      _ComponentProfileTileWidgetState();
}

class _ComponentProfileTileWidgetState
    extends State<ComponentProfileTileWidget> {
  late ComponentProfileTileModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ComponentProfileTileModel());

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
                  Builder(
                    builder: (context) {
                      if (widget!.icon != null) {
                        return Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 10.0, 0.0),
                          child: widget!.icon!,
                        );
                      } else if (widget!.photoUrl != null &&
                          widget!.photoUrl != '') {
                        return Visibility(
                          visible: widget!.photoUrl != null &&
                              widget!.photoUrl != '',
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 8.0, 0.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(40.0),
                              child: CachedNetworkImage(
                                fadeInDuration: Duration(milliseconds: 500),
                                fadeOutDuration: Duration(milliseconds: 500),
                                imageUrl: widget!.photoUrl!,
                                width: widget!.photoSize,
                                height: widget!.photoSize,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        );
                      } else if (widget!.color != null) {
                        return Visibility(
                          visible: widget!.color != null,
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 5.0, 0.0),
                            child: Container(
                              width: 20.0,
                              height: 20.0,
                              decoration: BoxDecoration(
                                color: widget!.color,
                                borderRadius: BorderRadius.circular(100.0),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context).alternate,
                                  width: 1.0,
                                ),
                              ),
                            ),
                          ),
                        );
                      } else {
                        return Container(
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                        );
                      }
                    },
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget!.display!,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Rubik',
                                    fontSize: widget!.titleSize,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                        Text(
                          valueOrDefault<String>(
                            widget!.subtitle,
                            ' subtitle',
                          ),
                          style: FlutterFlowTheme.of(context)
                              .bodySmall
                              .override(
                                fontFamily: 'Rubik',
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                letterSpacing: 0.0,
                              ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Builder(builder: (_) {
                    return widget.widget!();
                  }),
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
                ],
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
