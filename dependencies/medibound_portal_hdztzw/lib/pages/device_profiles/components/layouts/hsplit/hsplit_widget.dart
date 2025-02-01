import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'hsplit_model.dart';
export 'hsplit_model.dart';

class HsplitWidget extends StatefulWidget {
  const HsplitWidget({
    super.key,
    required this.graph1,
    required this.graph2,
  });

  final Widget Function()? graph1;
  final Widget Function()? graph2;

  @override
  State<HsplitWidget> createState() => _HsplitWidgetState();
}

class _HsplitWidgetState extends State<HsplitWidget> {
  late HsplitModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HsplitModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          flex: 1,
          child: Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            height: MediaQuery.sizeOf(context).height * 1.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: Builder(builder: (_) {
              return widget.graph1!();
            }),
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            height: MediaQuery.sizeOf(context).height * 1.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: Builder(builder: (_) {
              return widget.graph2!();
            }),
          ),
        ),
      ].divide(SizedBox(height: 10.0)),
    );
  }
}
