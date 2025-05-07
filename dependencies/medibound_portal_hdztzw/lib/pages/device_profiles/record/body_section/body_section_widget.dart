import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/utils/empty_list/empty_list_widget.dart';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'body_section_model.dart';
export 'body_section_model.dart';

class BodySectionWidget extends StatefulWidget {
  const BodySectionWidget({
    super.key,
    required this.bodySection,
    required this.bodySectionWidth,
    required this.varList,
  });

  final BodySectionStruct? bodySection;
  final double? bodySectionWidth;
  final List<VariableStruct>? varList;

  @override
  State<BodySectionWidget> createState() => _BodySectionWidgetState();
}

class _BodySectionWidgetState extends State<BodySectionWidget> {
  late BodySectionModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BodySectionModel());

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

    return Container(
      decoration: BoxDecoration(),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Container(
                width: widget!.bodySectionWidth,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).alternate,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: EdgeInsets.all(valueOrDefault<double>(
                    ((widget!.bodySectionWidth!) / 437.5) * 7.5,
                    0.0,
                  )),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (widget!.bodySection?.title != null &&
                          widget!.bodySection?.title != '')
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              5.0, 5.0, 5.0, 0.0),
                          child: AutoSizeText(
                            valueOrDefault<String>(
                              widget!.bodySection?.title,
                              'Title Text',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .titleLarge
                                .override(
                                  font: GoogleFonts.rubik(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .fontStyle,
                                  ),
                                  fontSize: 20.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .titleLarge
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleLarge
                                      .fontStyle,
                                ),
                          ),
                        ),
                      if (widget!.bodySection?.subtitle != null &&
                          widget!.bodySection?.subtitle != '')
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              5.0, 0.0, 5.0, 0.0),
                          child: AutoSizeText(
                            valueOrDefault<String>(
                              widget!.bodySection?.subtitle,
                              'Subtitle Text',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  font: GoogleFonts.rubik(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontStyle,
                                  ),
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .fontStyle,
                                ),
                          ),
                        ),
                      if (widget!.bodySection?.body != null &&
                          widget!.bodySection?.body != '')
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              5.0, 10.0, 5.0, 10.0),
                          child: AutoSizeText(
                            valueOrDefault<String>(
                              widget!.bodySection?.body,
                              'Body Text',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
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
                      SafeArea(
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          alignment: AlignmentDirectional(-1.0, -1.0),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 5.0, 0.0, 0.0),
                              child: Builder(
                                builder: (context) {
                                  final components = widget!
                                          .bodySection?.components
                                          ?.toList() ??
                                      [];
                                  if (components.isEmpty) {
                                    return Center(
                                      child: Container(
                                        width: double.infinity,
                                        height: 105.0,
                                        child: EmptyListWidget(
                                          text: 'No Components to Display',
                                          icon: Icon(
                                            Icons.cloud_off_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                          ),
                                        ),
                                      ),
                                    );
                                  }

                                  return Wrap(
                                    spacing:
                                        ((widget!.bodySectionWidth!) / 437.5) *
                                            7.5,
                                    runSpacing:
                                        ((widget!.bodySectionWidth!) / 437.5) *
                                            7.5,
                                    alignment: WrapAlignment.start,
                                    crossAxisAlignment:
                                        WrapCrossAlignment.start,
                                    direction: Axis.horizontal,
                                    runAlignment: WrapAlignment.start,
                                    verticalDirection: VerticalDirection.down,
                                    clipBehavior: Clip.none,
                                    children: List.generate(components.length,
                                        (componentsIndex) {
                                      final componentsItem =
                                          components[componentsIndex];
                                      return Container(
                                        height:
                                            ((widget!.bodySectionWidth!) - 25) /
                                                4,
                                        child: Stack(
                                          alignment:
                                              AlignmentDirectional(-1.0, -1.0),
                                          children: [
                                            custom_widgets.Component(
                                              width: 100.0,
                                              height: 100.0,
                                              totalHeight:
                                                  ((widget!.bodySectionWidth!) /
                                                          437.5) *
                                                      100,
                                              variable: widget!.varList
                                                  ?.where((e) =>
                                                      e.info.code ==
                                                      componentsItem.variableIds
                                                          .firstOrNull)
                                                  .toList()
                                                  ?.firstOrNull,
                                              block: componentsItem,
                                            ),
                                          ],
                                        ),
                                      );
                                    }),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    ].divide(SizedBox(height: 0.0)),
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
