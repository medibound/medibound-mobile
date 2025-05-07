import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'variable_list_tile_model.dart';
export 'variable_list_tile_model.dart';

class VariableListTileWidget extends StatefulWidget {
  const VariableListTileWidget({
    super.key,
    required this.variable,
    this.editCallback,
    this.deleteCallback,
  });

  final VariableStruct? variable;
  final Future Function(VariableStruct variable)? editCallback;
  final Future Function(VariableStruct variable)? deleteCallback;

  @override
  State<VariableListTileWidget> createState() => _VariableListTileWidgetState();
}

class _VariableListTileWidgetState extends State<VariableListTileWidget> {
  late VariableListTileModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VariableListTileModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: Container(
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).alternate,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(15.0, 10.0, 15.0, 10.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                valueOrDefault<String>(
                  widget!.variable?.info?.display,
                  'Name',
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      font: GoogleFonts.rubik(
                        fontWeight:
                            FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                      fontSize: 16.0,
                      letterSpacing: 0.0,
                      fontWeight:
                          FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                    ),
              ),
              Text(
                valueOrDefault<String>(
                  FFAppState()
                      .VariableTypes
                      .where((e) => e.code == widget!.variable?.type)
                      .toList()
                      .firstOrNull
                      ?.display,
                  'Variable',
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      font: GoogleFonts.rubik(
                        fontWeight:
                            FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                      color: FlutterFlowTheme.of(context).secondaryText,
                      letterSpacing: 0.0,
                      fontWeight:
                          FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                    ),
              ),
              if (widget!.variable?.isList ?? true)
                FaIcon(
                  FontAwesomeIcons.list,
                  color: FlutterFlowTheme.of(context).secondary,
                  size: 16.0,
                ),
              if (widget!.variable?.isRanged ?? true)
                FaIcon(
                  FontAwesomeIcons.greaterThanEqual,
                  color: FlutterFlowTheme.of(context).secondary,
                  size: 16.0,
                ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(),
                ),
              ),
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  await widget.deleteCallback?.call(
                    widget!.variable!,
                  );
                },
                child: Icon(
                  Icons.remove_circle_rounded,
                  color: FlutterFlowTheme.of(context).error,
                  size: 16.0,
                ),
              ),
            ].divide(SizedBox(width: 15.0)),
          ),
        ),
      ),
    );
  }
}
