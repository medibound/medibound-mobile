import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'menu_tile_model.dart';
export 'menu_tile_model.dart';

class MenuTileWidget extends StatefulWidget {
  const MenuTileWidget({
    super.key,
    required this.onClick,
    String? title,
    this.icon,
    bool? isActive,
    this.color,
  })  : this.title = title ?? 'Title',
        this.isActive = isActive ?? false;

  final Future Function()? onClick;
  final String title;
  final Widget? icon;
  final bool isActive;
  final Color? color;

  @override
  State<MenuTileWidget> createState() => _MenuTileWidgetState();
}

class _MenuTileWidgetState extends State<MenuTileWidget> {
  late MenuTileModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MenuTileModel());

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
      decoration: BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: MouseRegion(
              opaque: false,
              cursor: SystemMouseCursors.basic ?? MouseCursor.defer,
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  if (!widget!.isActive) {
                    await widget.onClick?.call();
                  }
                },
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 100),
                  curve: Curves.easeInOut,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: valueOrDefault<Color>(
                      () {
                        if (widget!.isActive) {
                          return FlutterFlowTheme.of(context).primaryBackground;
                        } else if (_model.onHover) {
                          return FlutterFlowTheme.of(context).alternate;
                        } else {
                          return Colors.transparent;
                        }
                      }(),
                      Colors.transparent,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        widget!.icon!,
                        Text(
                          widget!.title,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Rubik',
                            color: valueOrDefault<Color>(
                              () {
                                if (widget!.isActive) {
                                  return FlutterFlowTheme.of(context).secondary;
                                } else if (widget!.color != null) {
                                  return widget!.color;
                                } else {
                                  return FlutterFlowTheme.of(context)
                                      .primaryText;
                                }
                              }(),
                              FlutterFlowTheme.of(context).primaryText,
                            ),
                            fontSize: 16.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w500,
                            shadows: [
                              Shadow(
                                color: valueOrDefault<Color>(
                                  widget!.isActive
                                      ? Color(0x2F000000)
                                      : Colors.transparent,
                                  Colors.transparent,
                                ),
                                offset: Offset(0.0, 2.0),
                                blurRadius: 10.0,
                              )
                            ],
                          ),
                        ),
                      ].divide(SizedBox(width: 10.0)),
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
          ),
        ],
      ),
    );
  }
}
