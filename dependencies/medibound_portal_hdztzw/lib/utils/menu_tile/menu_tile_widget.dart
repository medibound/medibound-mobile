import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:expandable/expandable.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'menu_tile_model.dart';
export 'menu_tile_model.dart';

class MenuTileWidget extends StatefulWidget {
  const MenuTileWidget({
    super.key,
    required this.routeStack,
  });

  final RouteStackStruct? routeStack;

  @override
  State<MenuTileWidget> createState() => _MenuTileWidgetState();
}

class _MenuTileWidgetState extends State<MenuTileWidget> {
  late MenuTileModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MenuTileModel());

    _model.expandableExpandableController =
        ExpandableController(initialExpanded: true);
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
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: MouseRegion(
              opaque: false,
              cursor: SystemMouseCursors.basic ?? MouseCursor.defer,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 100),
                curve: Curves.easeInOut,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Container(
                  width: double.infinity,
                  color: Color(0x00000000),
                  child: ExpandableNotifier(
                    controller: _model.expandableExpandableController,
                    child: ExpandablePanel(
                      header: Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: MouseRegion(
                          opaque: false,
                          cursor: SystemMouseCursors.basic ?? MouseCursor.defer,
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeIn,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  valueOrDefault<Color>(
                                    () {
                                      if (widget!.routeStack?.section?.code ==
                                          FFAppState().currentRoute.section) {
                                        return FlutterFlowTheme.of(context)
                                            .primaryBackground;
                                      } else if (_model.onHover) {
                                        return FlutterFlowTheme.of(context)
                                            .alternate;
                                      } else {
                                        return Colors.transparent;
                                      }
                                    }(),
                                    FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                  ),
                                  valueOrDefault<Color>(
                                    Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? Colors.transparent
                                        : Color(0x00FFFFFF),
                                    Color(0x00FFFFFF),
                                  )
                                ],
                                stops: [0.5, 1.0],
                                begin: AlignmentDirectional(-1.0, 0.0),
                                end: AlignmentDirectional(1.0, 0),
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  15.0, 10.0, 15.0, 10.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    width: 25.0,
                                    height: 25.0,
                                    child: custom_widgets.IconFromText(
                                      width: 25.0,
                                      height: 25.0,
                                      name: widget!.routeStack!.section.icon,
                                      size: 25.0,
                                      color: valueOrDefault<Color>(
                                        widget!.routeStack?.section?.code ==
                                                FFAppState()
                                                    .currentRoute
                                                    .section
                                            ? FlutterFlowTheme.of(context)
                                                .secondary
                                            : FlutterFlowTheme.of(context)
                                                .primaryText,
                                        Colors.transparent,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    valueOrDefault<String>(
                                      widget!.routeStack?.section?.display,
                                      'Display',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.rubik(
                                            fontWeight: FontWeight.w500,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                ].divide(SizedBox(width: 10.0)),
                              ),
                            ),
                          ),
                          onEnter: ((event) async {
                            safeSetState(
                                () => _model.mouseRegionHovered2 = true);
                            _model.onHover = true;
                            safeSetState(() {});
                          }),
                          onExit: ((event) async {
                            safeSetState(
                                () => _model.mouseRegionHovered2 = false);
                            _model.onHover = false;
                            safeSetState(() {});
                          }),
                        ),
                      ),
                      collapsed: Visibility(
                        visible: widget!.routeStack?.section?.code ==
                            FFAppState().currentRoute.section,
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Builder(
                            builder: (context) {
                              final routePages =
                                  widget!.routeStack?.routes?.toList() ?? [];

                              return Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: List.generate(routePages.length,
                                    (routePagesIndex) {
                                  final routePagesItem =
                                      routePages[routePagesIndex];
                                  return Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      routePagesItem.display,
                                      textAlign: TextAlign.start,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.rubik(
                                              fontWeight: FontWeight.w500,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            color: routePagesItem.code ==
                                                    FFAppState()
                                                        .currentRoute
                                                        .page
                                                ? FlutterFlowTheme.of(context)
                                                    .secondary
                                                : FlutterFlowTheme.of(context)
                                                    .primaryText,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  );
                                }).divide(SizedBox(height: 10.0)),
                              );
                            },
                          ),
                        ),
                      ),
                      expanded: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Builder(
                          builder: (context) {
                            final routePages =
                                widget!.routeStack?.routes?.toList() ?? [];

                            return Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: List.generate(routePages.length,
                                  (routePagesIndex) {
                                final routePagesItem =
                                    routePages[routePagesIndex];
                                return Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 0.0, 0.0, 0.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      await actions.navigate(
                                        context,
                                        RouteStruct(
                                          section:
                                              widget!.routeStack?.section?.code,
                                          page: routePagesItem.code,
                                        ),
                                        false,
                                        () async {
                                          safeSetState(() {});
                                        },
                                      );
                                    },
                                    child: Text(
                                      routePagesItem.display,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.rubik(
                                              fontWeight: FontWeight.w500,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            color: routePagesItem.code ==
                                                    FFAppState()
                                                        .currentRoute
                                                        .page
                                                ? FlutterFlowTheme.of(context)
                                                    .secondary
                                                : FlutterFlowTheme.of(context)
                                                    .primaryText,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ),
                                );
                              }).divide(SizedBox(height: 10.0)),
                            );
                          },
                        ),
                      ),
                      theme: ExpandableThemeData(
                        tapHeaderToExpand: true,
                        tapBodyToExpand: false,
                        tapBodyToCollapse: false,
                        headerAlignment: ExpandablePanelHeaderAlignment.center,
                        hasIcon: true,
                        expandIcon: FontAwesomeIcons.angleRight,
                        collapseIcon: FontAwesomeIcons.angleDown,
                        iconSize: 16.0,
                        iconColor: widget!.routeStack?.section?.code !=
                                FFAppState().currentRoute.section
                            ? FlutterFlowTheme.of(context).primaryText
                            : Colors.transparent,
                      ),
                    ),
                  ),
                ),
              ),
              onEnter: ((event) async {
                safeSetState(() => _model.mouseRegionHovered1 = true);
                _model.onHover = true;
                safeSetState(() {});
              }),
              onExit: ((event) async {
                safeSetState(() => _model.mouseRegionHovered1 = false);
                _model.onHover = false;
                safeSetState(() {});
              }),
            ),
          ),
        ],
      ),
    );
  }
}
