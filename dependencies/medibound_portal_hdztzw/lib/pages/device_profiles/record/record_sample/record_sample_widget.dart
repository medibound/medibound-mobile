import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/device_profiles/record/body_section/body_section_widget.dart';
import '/pages/device_profiles/record/header/header_widget.dart';
import 'dart:ui';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'record_sample_model.dart';
export 'record_sample_model.dart';

class RecordSampleWidget extends StatefulWidget {
  const RecordSampleWidget({
    super.key,
    required this.recordWidth,
    required this.header,
    required this.sections,
    required this.varList,
  });

  final double? recordWidth;
  final List<BlockComponentStruct>? header;
  final List<BodySectionStruct>? sections;
  final List<VariableStruct>? varList;

  @override
  State<RecordSampleWidget> createState() => _RecordSampleWidgetState();
}

class _RecordSampleWidgetState extends State<RecordSampleWidget> {
  late RecordSampleModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RecordSampleModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: Container(
        width: widget!.recordWidth,
        decoration: BoxDecoration(),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 0.0,
                  decoration: BoxDecoration(),
                ),
                SizedBox(
                  width: 100.0,
                  child: Divider(
                    thickness: 4.0,
                    color: FlutterFlowTheme.of(context).alternate,
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(-1.0, 0.0),
                  child: Container(
                    width: widget!.recordWidth,
                    decoration: BoxDecoration(),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Container(
                              decoration: BoxDecoration(),
                              child: Wrap(
                                spacing: 5.0,
                                runSpacing: 0.0,
                                alignment: WrapAlignment.start,
                                crossAxisAlignment: WrapCrossAlignment.start,
                                direction: Axis.vertical,
                                runAlignment: WrapAlignment.start,
                                verticalDirection: VerticalDirection.down,
                                clipBehavior: Clip.none,
                                children: [
                                  AutoSizeText(
                                    'Sample Record'.maybeHandleOverflow(
                                      maxChars: 20,
                                      replacement: '…',
                                    ),
                                    textAlign: TextAlign.start,
                                    maxLines: 1,
                                    style: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .override(
                                          font: GoogleFonts.rubik(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .headlineSmall
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .headlineSmall
                                                    .fontStyle,
                                          ),
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .headlineSmall
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .headlineSmall
                                                  .fontStyle,
                                        ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              decoration: BoxDecoration(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(-1.0, 0.0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                    child: wrapWithModel(
                      model: _model.headerModel,
                      updateCallback: () => safeSetState(() {}),
                      child: HeaderWidget(
                        header: widget!.header!,
                        headerWidth: (widget!.recordWidth!) - 40.0,
                        varList: widget!.varList!,
                      ),
                    ),
                  ),
                ),
                Builder(
                  builder: (context) {
                    final sections = widget!.sections!.toList();

                    return ListView.separated(
                      padding: EdgeInsets.zero,
                      primary: false,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: sections.length,
                      separatorBuilder: (_, __) => SizedBox(height: 15.0),
                      itemBuilder: (context, sectionsIndex) {
                        final sectionsItem = sections[sectionsIndex];
                        return BodySectionWidget(
                          key: Key(
                              'Keykbv_${sectionsIndex}_of_${sections.length}'),
                          bodySection: sectionsItem,
                          bodySectionWidth: (widget!.recordWidth!) - 40,
                          varList: widget!.varList!,
                        );
                      },
                    );
                  },
                ),
              ].divide(SizedBox(height: 10.0)).addToEnd(SizedBox(height: 40.0)),
            ),
          ),
        ),
      ),
    );
  }
}
