import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'list_graph_model.dart';
export 'list_graph_model.dart';

class ListGraphWidget extends StatefulWidget {
  const ListGraphWidget({
    super.key,
    required this.heading,
    required this.subheading,
    required this.numberArray,
  });

  final String? heading;
  final String? subheading;
  final List<double>? numberArray;

  @override
  State<ListGraphWidget> createState() => _ListGraphWidgetState();
}

class _ListGraphWidgetState extends State<ListGraphWidget> {
  late ListGraphModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListGraphModel());

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
      alignment: AlignmentDirectional(1.0, 0.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  valueOrDefault<String>(
                    widget!.heading,
                    'Requests',
                  ),
                  style: FlutterFlowTheme.of(context).bodyLarge.override(
                        fontFamily: 'Rubik',
                        color: FlutterFlowTheme.of(context).secondary,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w500,
                      ),
                ),
                Text(
                  valueOrDefault<String>(
                    widget!.subheading,
                    'In ____',
                  ),
                  style: FlutterFlowTheme.of(context).bodySmall.override(
                        fontFamily: 'Rubik',
                        color: FlutterFlowTheme.of(context).secondaryText,
                        letterSpacing: 0.0,
                      ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Container(
              width: 120.0,
              height: double.infinity,
              child: custom_widgets.SplineAreaGraph(
                width: 120.0,
                height: double.infinity,
                color: FlutterFlowTheme.of(context).secondary,
                variable: DeviceVariableStruct(
                  data: VariableDataStruct(
                    number: widget!.numberArray,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
