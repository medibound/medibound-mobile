import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'value_string_model.dart';
export 'value_string_model.dart';

class ValueStringWidget extends StatefulWidget {
  const ValueStringWidget({
    super.key,
    required this.variable,
    this.orientation,
    required this.color,
  });

  final DeviceVariableStruct? variable;
  final GraphOrientation? orientation;
  final Color? color;

  @override
  State<ValueStringWidget> createState() => _ValueStringWidgetState();
}

class _ValueStringWidgetState extends State<ValueStringWidget> {
  late ValueStringModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ValueStringModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        if (valueOrDefault<bool>(
          widget!.orientation == GraphOrientation.HORIZONTAL,
          false,
        )) {
          return Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            height: MediaQuery.sizeOf(context).height * 1.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Flexible(
                  child: Container(
                    decoration: BoxDecoration(),
                    alignment: AlignmentDirectional(-1.0, 0.0),
                    child: AutoSizeText(
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
                            fontSize: 14.0,
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(
                        flex: 2,
                        child: AutoSizeText(
                          valueOrDefault<String>(
                            widget!.variable?.data?.string?.lastOrNull,
                            'String',
                          ).maybeHandleOverflow(
                            maxChars: 15,
                            replacement: '…',
                          ),
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          minFontSize: 16.0,
                          style: FlutterFlowTheme.of(context)
                              .headlineSmall
                              .override(
                                fontFamily: 'Rubik',
                                color: widget!.color,
                                fontSize: 24.0,
                                letterSpacing: 0.0,
                                lineHeight: 1.0,
                              ),
                        ),
                      ),
                    ].divide(SizedBox(width: 5.0)),
                  ),
                ),
              ],
            ),
          );
        } else {
          return Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            height: MediaQuery.sizeOf(context).height * 1.0,
            decoration: BoxDecoration(),
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: AutoSizeText(
                    valueOrDefault<String>(
                      widget!.variable?.info?.display,
                      'Name',
                    ).maybeHandleOverflow(
                      maxChars: 15,
                      replacement: '…',
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    minFontSize: 14.0,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Rubik',
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
                Flexible(
                  child: AutoSizeText(
                    valueOrDefault<String>(
                      widget!.variable?.data?.string?.lastOrNull,
                      'String',
                    ).maybeHandleOverflow(
                      maxChars: 10,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    minFontSize: 24.0,
                    style: FlutterFlowTheme.of(context).headlineSmall.override(
                          fontFamily: 'Rubik',
                          color: widget!.color,
                          fontSize: 24.0,
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
