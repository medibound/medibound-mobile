import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/device_profiles/components/component/component_widget.dart';
import '/utils/empty_list/empty_list_widget.dart';
import 'dart:ui';
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
  });

  final BodySectionStruct? bodySection;
  final double? bodySectionWidth;

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
                  padding: EdgeInsets.all(7.5),
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
                                  fontFamily: 'Rubik',
                                  fontSize: 20.0,
                                  letterSpacing: 0.0,
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
                                  fontFamily: 'Rubik',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
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
                                  fontFamily: 'Rubik',
                                  letterSpacing: 0.0,
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
                                    spacing: 7.5,
                                    runSpacing: 5.0,
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
                                            ComponentWidget(
                                              key: Key(
                                                  'Keyk3a_${componentsIndex}_of_${components.length}'),
                                              totalHeight:
                                                  ((widget!.bodySectionWidth!) -
                                                          37.5) /
                                                      4,
                                              block: componentsItem,
                                              spacing: 7.5,
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
