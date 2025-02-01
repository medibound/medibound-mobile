import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/device_profiles/components/component/component_widget.dart';
import '/utils/empty_list/empty_list_widget.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'body_builder_section_model.dart';
export 'body_builder_section_model.dart';

class BodyBuilderSectionWidget extends StatefulWidget {
  const BodyBuilderSectionWidget({
    super.key,
    required this.bodySectionCallback,
    required this.bodySection,
  });

  final Future Function(String id)? bodySectionCallback;
  final BodySectionStruct? bodySection;

  @override
  State<BodyBuilderSectionWidget> createState() =>
      _BodyBuilderSectionWidgetState();
}

class _BodyBuilderSectionWidgetState extends State<BodyBuilderSectionWidget> {
  late BodyBuilderSectionModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BodyBuilderSectionModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      safeSetState(() {
        _model.textController1?.text = widget!.bodySection!.title;
      });
      safeSetState(() {
        _model.textController2?.text = widget!.bodySection!.subtitle;
      });
      safeSetState(() {
        _model.textController3?.text = widget!.bodySection!.body;
      });
      _model.section = widget!.bodySection;
      safeSetState(() {});
    });

    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??= TextEditingController();
    _model.textFieldFocusNode2 ??= FocusNode();

    _model.textController3 ??= TextEditingController();
    _model.textFieldFocusNode3 ??= FocusNode();

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
      alignment: AlignmentDirectional(1.0, 0.0),
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Container(
                width: functions.getBlockWidth(100.0, 'SECTION', 10.0),
                constraints: BoxConstraints(
                  minHeight: 200.0,
                ),
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).alternate,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(5.0, 10.0, 10.0, 10.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(10.0, 5.0, 5.0, 0.0),
                        child: TextFormField(
                          controller: _model.textController1,
                          focusNode: _model.textFieldFocusNode1,
                          onChanged: (_) => EasyDebounce.debounce(
                            '_model.textController1',
                            Duration(milliseconds: 2000),
                            () async {
                              _model.updateSectionStruct(
                                (e) => e..title = _model.textController1.text,
                              );
                              safeSetState(() {});
                              await widget.bodySectionCallback?.call(
                                _model.section!.id,
                              );
                            },
                          ),
                          autofocus: false,
                          obscureText: false,
                          decoration: InputDecoration(
                            isDense: true,
                            labelStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Rubik',
                                  fontSize: 24.0,
                                  letterSpacing: 0.0,
                                ),
                            alignLabelWithHint: true,
                            hintText: 'Title Field...',
                            hintStyle: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  fontFamily: 'Rubik',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  fontSize: 24.0,
                                  letterSpacing: 0.0,
                                ),
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            focusedErrorBorder: InputBorder.none,
                          ),
                          style:
                              FlutterFlowTheme.of(context).titleMedium.override(
                                    fontFamily: 'Rubik',
                                    fontSize: 24.0,
                                    letterSpacing: 0.0,
                                  ),
                          textAlign: TextAlign.start,
                          cursorColor: FlutterFlowTheme.of(context).primaryText,
                          validator: _model.textController1Validator
                              .asValidator(context),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 5.0, 0.0),
                        child: TextFormField(
                          controller: _model.textController2,
                          focusNode: _model.textFieldFocusNode2,
                          onChanged: (_) => EasyDebounce.debounce(
                            '_model.textController2',
                            Duration(milliseconds: 2000),
                            () async {
                              _model.updateSectionStruct(
                                (e) =>
                                    e..subtitle = _model.textController2.text,
                              );
                              safeSetState(() {});
                              await widget.bodySectionCallback?.call(
                                _model.section!.id,
                              );
                            },
                          ),
                          autofocus: false,
                          obscureText: false,
                          decoration: InputDecoration(
                            isDense: true,
                            labelStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Rubik',
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                ),
                            hintText: 'Subtitle Field...',
                            hintStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Rubik',
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                ),
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            focusedErrorBorder: InputBorder.none,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Rubik',
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                fontSize: 16.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w500,
                              ),
                          textAlign: TextAlign.start,
                          cursorColor: FlutterFlowTheme.of(context).primaryText,
                          validator: _model.textController2Validator
                              .asValidator(context),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            10.0, 10.0, 5.0, 10.0),
                        child: TextFormField(
                          controller: _model.textController3,
                          focusNode: _model.textFieldFocusNode3,
                          onChanged: (_) => EasyDebounce.debounce(
                            '_model.textController3',
                            Duration(milliseconds: 2000),
                            () async {
                              _model.updateSectionStruct(
                                (e) => e..body = _model.textController3.text,
                              );
                              safeSetState(() {});
                              await widget.bodySectionCallback?.call(
                                _model.section!.id,
                              );
                            },
                          ),
                          autofocus: false,
                          obscureText: false,
                          decoration: InputDecoration(
                            isDense: true,
                            labelStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Rubik',
                                  letterSpacing: 0.0,
                                ),
                            hintText: 'Body Text...',
                            hintStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Rubik',
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                ),
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            focusedErrorBorder: InputBorder.none,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Rubik',
                                    letterSpacing: 0.0,
                                  ),
                          textAlign: TextAlign.start,
                          maxLines: null,
                          cursorColor: FlutterFlowTheme.of(context).primaryText,
                          validator: _model.textController3Validator
                              .asValidator(context),
                        ),
                      ),
                      if (!(widget!.bodySection!.components.isNotEmpty))
                        Divider(
                          height: 1.0,
                          thickness: 1.0,
                          indent: 5.0,
                          color: FlutterFlowTheme.of(context).alternate,
                        ),
                      SafeArea(
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          alignment: AlignmentDirectional(-1.0, -1.0),
                          child: DragTarget<BlockComponentStruct>(
                            onAcceptWithDetails: (details) async {
                              _model.updateSectionStruct(
                                (e) => e
                                  ..updateComponents(
                                    (e) => e.add(details.data),
                                  ),
                              );
                              safeSetState(() {});
                              await widget.bodySectionCallback?.call(
                                _model.section!.id,
                              );

                              safeSetState(() {});
                            },
                            builder: (context, _, __) {
                              return Container(
                                width: double.infinity,
                                decoration: BoxDecoration(),
                                child: Builder(
                                  builder: (context) {
                                    final components =
                                        _model.section?.components?.toList() ??
                                            [];
                                    if (components.isEmpty) {
                                      return Center(
                                        child: Container(
                                          width: double.infinity,
                                          height: 105.0,
                                          child: EmptyListWidget(
                                            text:
                                                'Drag Components Into This Space',
                                            icon: Icon(
                                              Icons.addchart_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                            ),
                                          ),
                                        ),
                                      );
                                    }

                                    return Wrap(
                                      spacing: 5.0,
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
                                          height: 105.0,
                                          child: Stack(
                                            alignment: AlignmentDirectional(
                                                -1.0, -1.0),
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        5.0, 5.0, 0.0, 0.0),
                                                child: ComponentWidget(
                                                  key: Key(
                                                      'Keyyr9_${componentsIndex}_of_${components.length}'),
                                                  totalHeight: 100.0,
                                                  block: componentsItem,
                                                  spacing: 10.0,
                                                ),
                                              ),
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  _model.updateSectionStruct(
                                                    (e) => e
                                                      ..updateComponents(
                                                        (e) => e.removeAt(
                                                            componentsIndex),
                                                      ),
                                                  );
                                                  safeSetState(() {});
                                                  await widget
                                                      .bodySectionCallback
                                                      ?.call(
                                                    _model.section!.id,
                                                  );
                                                },
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100.0),
                                                  child: Container(
                                                    width: 25.0,
                                                    height: 25.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      boxShadow: [
                                                        BoxShadow(
                                                          blurRadius: 10.0,
                                                          color:
                                                              Color(0x63000000),
                                                          offset: Offset(
                                                            0.0,
                                                            2.0,
                                                          ),
                                                        )
                                                      ],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              100.0),
                                                      border: Border.all(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        width: 1.0,
                                                      ),
                                                    ),
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: FaIcon(
                                                        FontAwesomeIcons.minus,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        size: 14.0,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      }),
                                    );
                                  },
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
