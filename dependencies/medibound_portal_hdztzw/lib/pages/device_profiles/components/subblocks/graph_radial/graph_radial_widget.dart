import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'graph_radial_model.dart';
export 'graph_radial_model.dart';

class GraphRadialWidget extends StatefulWidget {
  const GraphRadialWidget({
    super.key,
    required this.variable,
    required this.color,
  });

  final DeviceVariableStruct? variable;
  final Color? color;

  @override
  State<GraphRadialWidget> createState() => _GraphRadialWidgetState();
}

class _GraphRadialWidgetState extends State<GraphRadialWidget> {
  late GraphRadialModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GraphRadialModel());

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
        mainAxisSize: MainAxisSize.max,
        children: [
          AutoSizeText(
            valueOrDefault<String>(
              widget!.variable?.info?.display,
              'Name',
            ).maybeHandleOverflow(
              maxChars: 15,
              replacement: '…',
            ),
            textAlign: TextAlign.center,
            maxLines: 1,
            minFontSize: 8.0,
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Rubik',
                  fontSize: 8.0,
                  letterSpacing: 0.0,
                ),
          ),
          Expanded(
            flex: 5,
            child: Stack(
              alignment: AlignmentDirectional(0.0, 0.0),
              children: [
                Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: MediaQuery.sizeOf(context).height * 1.0,
                  child: custom_widgets.RadialGraph(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: MediaQuery.sizeOf(context).height * 1.0,
                    color: widget!.color!,
                    variable: widget!.variable!,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(2.5, 2.5, 2.5, 2.5),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                        child: AutoSizeText(
                          valueOrDefault<String>(
                            widget!.variable?.data?.number?.firstOrNull
                                ?.toString(),
                            '0.0',
                          ).maybeHandleOverflow(
                            maxChars: 3,
                            replacement: '…',
                          ),
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          minFontSize: 16.0,
                          style: FlutterFlowTheme.of(context)
                              .headlineSmall
                              .override(
                                fontFamily: 'Rubik',
                                fontSize: 16.0,
                                letterSpacing: 0.0,
                                lineHeight: 1.0,
                              ),
                        ),
                      ),
                      Flexible(
                        child: AutoSizeText(
                          valueOrDefault<String>(
                            widget!.variable?.unit,
                            '{none}',
                          ).maybeHandleOverflow(
                            maxChars: 5,
                            replacement: '…',
                          ),
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          minFontSize: 8.0,
                          style:
                              FlutterFlowTheme.of(context).labelSmall.override(
                                    fontFamily: 'Rubik',
                                    fontSize: 4.0,
                                    letterSpacing: 0.0,
                                    lineHeight: 0.8,
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ].divide(SizedBox(height: 2.5)),
      ),
    );
  }
}
