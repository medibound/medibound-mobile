import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'value_trend_model.dart';
export 'value_trend_model.dart';

class ValueTrendWidget extends StatefulWidget {
  const ValueTrendWidget({
    super.key,
    required this.variable,
    this.orientation,
    required this.color,
  });

  final DeviceVariableStruct? variable;
  final GraphOrientation? orientation;
  final Color? color;

  @override
  State<ValueTrendWidget> createState() => _ValueTrendWidgetState();
}

class _ValueTrendWidgetState extends State<ValueTrendWidget> {
  late ValueTrendModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ValueTrendModel());

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
                      Builder(
                        builder: (context) {
                          if (widget!.variable!.data.number.lastOrNull! >
                              widget!.variable!.data.number.firstOrNull!) {
                            return FaIcon(
                              FontAwesomeIcons.arrowUp,
                              color: FlutterFlowTheme.of(context).success,
                              size: 14.0,
                            );
                          } else if (widget!.variable!.data.number.lastOrNull! <
                              widget!.variable!.data.number.firstOrNull!) {
                            return FaIcon(
                              FontAwesomeIcons.arrowDown,
                              color: FlutterFlowTheme.of(context).error,
                              size: 14.0,
                            );
                          } else {
                            return FaIcon(
                              FontAwesomeIcons.equals,
                              color: FlutterFlowTheme.of(context).alternate,
                              size: 14.0,
                            );
                          }
                        },
                      ),
                      Flexible(
                        flex: 2,
                        child: AutoSizeText(
                          valueOrDefault<String>(
                            widget!.variable?.data?.number?.lastOrNull
                                ?.toString(),
                            '0.0',
                          ).maybeHandleOverflow(
                            maxChars: 4,
                          ),
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          style: FlutterFlowTheme.of(context)
                              .headlineSmall
                              .override(
                                fontFamily: 'Rubik',
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 24.0,
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
                          ),
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          minFontSize: 4.0,
                          style:
                              FlutterFlowTheme.of(context).labelSmall.override(
                                    fontFamily: 'Rubik',
                                    fontSize: 10.0,
                                    letterSpacing: 0.0,
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
                  child: Wrap(
                    spacing: 5.0,
                    runSpacing: 0.0,
                    alignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    direction: Axis.horizontal,
                    runAlignment: WrapAlignment.start,
                    verticalDirection: VerticalDirection.down,
                    clipBehavior: Clip.none,
                    children: [
                      Builder(
                        builder: (context) {
                          if (widget!.variable!.data.number.lastOrNull! >
                              widget!.variable!.data.number.firstOrNull!) {
                            return FaIcon(
                              FontAwesomeIcons.arrowUp,
                              color: FlutterFlowTheme.of(context).success,
                              size: 16.0,
                            );
                          } else if (widget!.variable!.data.number.lastOrNull! <
                              widget!.variable!.data.number.firstOrNull!) {
                            return FaIcon(
                              FontAwesomeIcons.arrowDown,
                              color: FlutterFlowTheme.of(context).error,
                              size: 16.0,
                            );
                          } else {
                            return FaIcon(
                              FontAwesomeIcons.equals,
                              color: FlutterFlowTheme.of(context).alternate,
                              size: 16.0,
                            );
                          }
                        },
                      ),
                      AutoSizeText(
                        valueOrDefault<String>(
                          widget!.variable?.data?.number?.firstOrNull
                              ?.toString(),
                          '0.0',
                        ).maybeHandleOverflow(
                          maxChars: 4,
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        style:
                            FlutterFlowTheme.of(context).headlineSmall.override(
                                  fontFamily: 'Rubik',
                                  fontSize: 25.0,
                                  letterSpacing: 0.0,
                                ),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  child: AutoSizeText(
                    valueOrDefault<String>(
                      widget!.variable?.unit,
                      '{none}',
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    minFontSize: 10.0,
                    style: FlutterFlowTheme.of(context).labelSmall.override(
                          fontFamily: 'Rubik',
                          fontSize: 10.0,
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
