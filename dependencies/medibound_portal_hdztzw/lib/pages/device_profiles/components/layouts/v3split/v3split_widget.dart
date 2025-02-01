import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'v3split_model.dart';
export 'v3split_model.dart';

class V3splitWidget extends StatefulWidget {
  const V3splitWidget({
    super.key,
    required this.graph1,
    required this.graph2,
    required this.graph3,
  });

  final Widget Function()? graph1;
  final Widget Function()? graph2;
  final Widget Function()? graph3;

  @override
  State<V3splitWidget> createState() => _V3splitWidgetState();
}

class _V3splitWidgetState extends State<V3splitWidget> {
  late V3splitModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => V3splitModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
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
        Expanded(
          child: Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            height: MediaQuery.sizeOf(context).height * 1.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: Builder(builder: (_) {
              return widget.graph3!();
            }),
          ),
        ),
      ],
    );
  }
}
