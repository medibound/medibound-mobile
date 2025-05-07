import '/flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'tab_bar_tile_model.dart';
export 'tab_bar_tile_model.dart';

class TabBarTileWidget extends StatefulWidget {
  const TabBarTileWidget({
    super.key,
    required this.text,
    this.icon,
    this.image,
    bool? active,
    required this.onClick,
  }) : this.active = active ?? false;

  final String? text;
  final Widget? icon;
  final String? image;
  final bool active;
  final Future Function()? onClick;

  @override
  State<TabBarTileWidget> createState() => _TabBarTileWidgetState();
}

class _TabBarTileWidgetState extends State<TabBarTileWidget> {
  late TabBarTileModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TabBarTileModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        if (widget.active == false) {
          await widget.onClick?.call();
          HapticFeedback.mediumImpact();
        }
      },
      child: Container(
        width: 100.0,
        height: 100.0,
        decoration: BoxDecoration(),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Builder(
              builder: (context) {
                if (widget.icon != null) {
                  return widget.icon!;
                } else if (widget.image != null && widget.image != '') {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100.0),
                      border: Border.all(
                        color: widget.active
                            ? FlutterFlowTheme.of(context).secondary
                            : FlutterFlowTheme.of(context).secondaryText,
                        width: valueOrDefault<double>(
                          (widget.active ? 1 : 0).toDouble(),
                          0.0,
                        ),
                      ),
                    ),
                    child: Container(
                      width: 24.0,
                      height: 24.0,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Image.network(
                        widget.image!,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                } else {
                  return Container(
                    width: 36.0,
                    height: 36.0,
                    decoration: BoxDecoration(),
                  );
                }
              },
            ),
            AutoSizeText(
              valueOrDefault<String>(
                widget.text,
                'Home',
              ),
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    font: GoogleFonts.rubik(
                      fontWeight:
                          FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                    ),
                    color: widget.active
                        ? FlutterFlowTheme.of(context).secondary
                        : FlutterFlowTheme.of(context).secondaryText,
                    fontSize: 12.0,
                    letterSpacing: 0.0,
                    fontWeight:
                        FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
