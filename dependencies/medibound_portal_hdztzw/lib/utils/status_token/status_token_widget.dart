import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'status_token_model.dart';
export 'status_token_model.dart';

class StatusTokenWidget extends StatefulWidget {
  const StatusTokenWidget({
    super.key,
    this.status,
  });

  final CodedValueStruct? status;

  @override
  State<StatusTokenWidget> createState() => _StatusTokenWidgetState();
}

class _StatusTokenWidgetState extends State<StatusTokenWidget> {
  late StatusTokenModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StatusTokenModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Opacity(
          opacity: 0.2,
          child: Container(
            decoration: BoxDecoration(
              color: valueOrDefault<Color>(
                widget!.status?.color,
                FlutterFlowTheme.of(context).secondary,
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(7.5, 5.0, 7.5, 5.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Opacity(
                    opacity: 0.0,
                    child: Container(
                      width: 16.0,
                      height: 16.0,
                      child: custom_widgets.IconFromText(
                        width: 16.0,
                        height: 16.0,
                        name: widget!.status!.icon,
                        size: 16.0,
                        color: widget!.status!.color!,
                      ),
                    ),
                  ),
                  Opacity(
                    opacity: 0.0,
                    child: Text(
                      valueOrDefault<String>(
                        widget!.status?.display,
                        'Status',
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.rubik(
                              fontWeight: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
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
                ].divide(SizedBox(width: 5.0)),
              ),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(7.5, 5.0, 7.5, 5.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 16.0,
                  height: 16.0,
                  child: custom_widgets.IconFromText(
                    width: 16.0,
                    height: 16.0,
                    name: widget!.status!.icon,
                    size: 16.0,
                    color: widget!.status!.color!,
                  ),
                ),
                Text(
                  valueOrDefault<String>(
                    widget!.status?.display,
                    'Status',
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.rubik(
                          fontWeight: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                        color: valueOrDefault<Color>(
                          widget!.status?.color,
                          FlutterFlowTheme.of(context).secondary,
                        ),
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                ),
              ].divide(SizedBox(width: 5.0)),
            ),
          ),
        ),
      ],
    );
  }
}
