import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/device_profiles/components/component/component_widget.dart';
import '/utils/empty_list/empty_list_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'header_builder_model.dart';
export 'header_builder_model.dart';

class HeaderBuilderWidget extends StatefulWidget {
  const HeaderBuilderWidget({
    super.key,
    required this.varList,
  });

  final List<DeviceVariableStruct>? varList;

  @override
  State<HeaderBuilderWidget> createState() => _HeaderBuilderWidgetState();
}

class _HeaderBuilderWidgetState extends State<HeaderBuilderWidget> {
  late HeaderBuilderModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HeaderBuilderModel());

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
      child: Wrap(
        spacing: 10.0,
        runSpacing: 0.0,
        alignment: WrapAlignment.start,
        crossAxisAlignment: WrapCrossAlignment.start,
        direction: Axis.vertical,
        runAlignment: WrapAlignment.start,
        verticalDirection: VerticalDirection.down,
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 40.0,
            decoration: BoxDecoration(),
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Text(
              'Header Components',
              style: FlutterFlowTheme.of(context).titleLarge.override(
                    fontFamily: 'Rubik',
                    letterSpacing: 0.0,
                  ),
            ),
          ),
          DragTarget<BlockComponentStruct>(
            onAcceptWithDetails: (details) async {
              if (functions.acceptBlock(details.data, _model.header.toList())) {
                _model.addToHeader(details.data);
                safeSetState(() {});
              }
              _model.onHover = false;
              safeSetState(() {});

              safeSetState(() {});
            },
            onWillAcceptWithDetails: (details) {
              (() async {
                _model.onHover = true;
                safeSetState(() {});

                safeSetState(() {});
              })();
              return true;
            },
            onLeave: (data) async {
              _model.onHover = false;
              safeSetState(() {});

              safeSetState(() {});
            },
            builder: (context, _, __) {
              return Container(
                width: functions.getBlockWidth(100.0, 'SECTION', 10.0),
                height: 122.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).alternate,
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                    color: _model.onHover
                        ? FlutterFlowTheme.of(context).alternate
                        : Colors.transparent,
                    width: 1.0,
                  ),
                ),
                alignment: AlignmentDirectional(-1.0, 0.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 10.0, 10.0),
                  child: Builder(
                    builder: (context) {
                      final headerComponents =
                          _model.header.toList().take(4).toList();
                      if (headerComponents.isEmpty) {
                        return Center(
                          child: Container(
                            width: double.infinity,
                            height: 100.0,
                            child: EmptyListWidget(
                              text: 'Drag Components Into This Space',
                              icon: Icon(
                                Icons.add_chart_rounded,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                              ),
                            ),
                          ),
                        );
                      }

                      return ListView.separated(
                        padding: EdgeInsets.zero,
                        primary: false,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: headerComponents.length,
                        separatorBuilder: (_, __) => SizedBox(width: 5.0),
                        itemBuilder: (context, headerComponentsIndex) {
                          final headerComponentsItem =
                              headerComponents[headerComponentsIndex];
                          return Container(
                            height: 105.0,
                            child: Stack(
                              alignment: AlignmentDirectional(-1.0, -1.0),
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      5.0, 5.0, 0.0, 0.0),
                                  child: ComponentWidget(
                                    key: Key(
                                        'Keyg4r_${headerComponentsIndex}_of_${headerComponents.length}'),
                                    totalHeight: 100.0,
                                    block: headerComponentsItem,
                                    spacing: 10.0,
                                    varList: widget!.varList!,
                                  ),
                                ),
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    _model.removeAtIndexFromHeader(
                                        headerComponentsIndex);
                                    safeSetState(() {});
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(100.0),
                                    child: Container(
                                      width: 25.0,
                                      height: 25.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 10.0,
                                            color: Color(0x63000000),
                                            offset: Offset(
                                              0.0,
                                              2.0,
                                            ),
                                          )
                                        ],
                                        borderRadius:
                                            BorderRadius.circular(100.0),
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          width: 1.0,
                                        ),
                                      ),
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: FaIcon(
                                          FontAwesomeIcons.minus,
                                          color: FlutterFlowTheme.of(context)
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
                        },
                      );
                    },
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
