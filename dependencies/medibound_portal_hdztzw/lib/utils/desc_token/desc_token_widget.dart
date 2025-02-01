import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'desc_token_model.dart';
export 'desc_token_model.dart';

class DescTokenWidget extends StatefulWidget {
  const DescTokenWidget({
    super.key,
    required this.text,
    required this.icon,
    required this.onClick,
  });

  final String? text;
  final Widget? icon;
  final Future Function()? onClick;

  @override
  State<DescTokenWidget> createState() => _DescTokenWidgetState();
}

class _DescTokenWidgetState extends State<DescTokenWidget> {
  late DescTokenModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DescTokenModel());

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
        await widget.onClick?.call();
      },
      child: Container(
        decoration: BoxDecoration(),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            widget!.icon!,
            Text(
              valueOrDefault<String>(
                widget!.text,
                'Token',
              ).maybeHandleOverflow(
                maxChars: 45,
                replacement: '…',
              ),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Rubik',
                    letterSpacing: 0.0,
                  ),
            ),
          ].divide(SizedBox(width: 5.0)),
        ),
      ),
    );
  }
}
