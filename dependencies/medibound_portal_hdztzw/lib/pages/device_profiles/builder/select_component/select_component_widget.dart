import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/utils/container_empty/container_empty_widget.dart';
import '/utils/container_loading/container_loading_widget.dart';
import '/utils/empty_list/empty_list_widget.dart';
import 'dart:math';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:expandable/expandable.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'select_component_model.dart';
export 'select_component_model.dart';

class SelectComponentWidget extends StatefulWidget {
  const SelectComponentWidget({
    super.key,
    this.variablesList,
  });

  final List<VariableStruct>? variablesList;

  @override
  State<SelectComponentWidget> createState() => _SelectComponentWidgetState();
}

class _SelectComponentWidgetState extends State<SelectComponentWidget>
    with TickerProviderStateMixin {
  late SelectComponentModel _model;

  bool expandableListenerRegistered = false;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SelectComponentModel());

    _model.expandableExpandableController =
        ExpandableController(initialExpanded: false);
    animationsMap.addAll({
      'containerOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
    });

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
      width: 237.5,
      height: MediaQuery.sizeOf(context).height * 1.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
            child: Container(
              width: double.infinity,
              height: 45.0,
              child: custom_widgets.Dropdown(
                width: double.infinity,
                height: 45.0,
                hintText: 'Variable',
                items: functions.deviceVariablesToDropdowns(
                    widget!.variablesList!.toList()),
                initialItem: widget!.variablesList?.firstOrNull?.info,
                onChanged: (item) async {
                  _model.selectedVariable = widget!.variablesList
                      ?.where((e) => e.info.code == item.code)
                      .toList()
                      ?.firstOrNull;
                  _model.updatePage(() {});
                },
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
            child: Container(
              width: double.infinity,
              height: 45.0,
              child: custom_widgets.Dropdown(
                width: double.infinity,
                height: 45.0,
                hintText: 'Graph Size',
                items: FFAppState().GraphSizes,
                initialItem: FFAppState().GraphSizes.firstOrNull,
                onChanged: (item) async {
                  _model.selectedGraphSize = item;
                  _model.updatePage(() {});
                },
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Builder(builder: (_) {
                    if (!expandableListenerRegistered) {
                      expandableListenerRegistered = true;
                      _model.expandableExpandableController.addListener(
                        () async {
                          _model.updatePage(() {});
                        },
                      );
                    }
                    return Container(
                      width: double.infinity,
                      color: Color(0x00000000),
                      child: ExpandableNotifier(
                        controller: _model.expandableExpandableController,
                        child: ExpandablePanel(
                          header: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                15.0, 0.0, 0.0, 0.0),
                            child: Text(
                              _model.expandableExpandableController.expanded!
                                  ? 'View Results'
                                  : 'More Options',
                              style: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    font: GoogleFonts.rubik(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontStyle,
                                  ),
                            ),
                          ),
                          collapsed: Builder(
                            builder: (context) {
                              final sizedSubBlocks = FFAppState()
                                  .BlockTypes
                                  .where((e) =>
                                      e.allowedSizes.contains(
                                          _model.selectedGraphSize?.code) &&
                                      e.allowedVariableForms.contains(
                                          _model.selectedVariable?.isList ==
                                                  true
                                              ? 'array'
                                              : 'singleton') &&
                                      e.allowedVariableTypes.contains(
                                          _model.selectedVariable?.type))
                                  .toList();
                              if (sizedSubBlocks.isEmpty) {
                                return Container(
                                  width: double.infinity,
                                  height: 200.0,
                                  child: EmptyListWidget(
                                    text: 'No Components Found',
                                    height: 200.0,
                                    image:
                                        'https://storage.googleapis.com/medibound-portal-hdztzw.firebasestorage.app/general/loading-icons/componentsLoading.png',
                                  ),
                                );
                              }

                              return ListView.separated(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: sizedSubBlocks.length,
                                separatorBuilder: (_, __) =>
                                    SizedBox(height: 10.0),
                                itemBuilder: (context, sizedSubBlocksIndex) {
                                  final sizedSubBlocksItem =
                                      sizedSubBlocks[sizedSubBlocksIndex];
                                  return Column(
                                    key: ValueKey(sizedSubBlocksItem.info.code),
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      if (sizedSubBlocksIndex == 0)
                                        Container(
                                          width: double.infinity,
                                          height: 150.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                          child: Container(
                                            width: double.infinity,
                                            height: double.infinity,
                                            child: Stack(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              children: [
                                                Opacity(
                                                  opacity: 0.3,
                                                  child: Container(
                                                    width: double.infinity,
                                                    height: double.infinity,
                                                    decoration: BoxDecoration(
                                                      gradient: LinearGradient(
                                                        colors: [
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .accent1,
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .accent3
                                                        ],
                                                        stops: [0.4, 1.0],
                                                        begin:
                                                            AlignmentDirectional(
                                                                -1.0, 1.0),
                                                        end:
                                                            AlignmentDirectional(
                                                                1.0, -1.0),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 10.0, 0.0, 10.0),
                                                  child: Container(
                                                    decoration: BoxDecoration(),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Icon(
                                                              FFIcons
                                                                  .ksparkmedi,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondary,
                                                              size: 16.0,
                                                            ),
                                                            Text(
                                                              'We Suggests...',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .rubik(
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontWeight,
                                                                      fontStyle:
                                                                          FontStyle
                                                                              .italic,
                                                                    ),
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondary,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontWeight,
                                                                    fontStyle:
                                                                        FontStyle
                                                                            .italic,
                                                                  ),
                                                            ),
                                                          ].divide(SizedBox(
                                                              width: 10.0)),
                                                        ),
                                                        FutureBuilder<
                                                            ApiCallResponse>(
                                                          future: FFAppState()
                                                              .blockSuggestions(
                                                            uniqueQueryKey:
                                                                '${_model.selectedGraphSize?.code}-${_model.selectedVariable?.info?.code}',
                                                            requestFn: () =>
                                                                MediboundGroup
                                                                    .getComponentSuggestionCall
                                                                    .call(
                                                              dataJson: functions.transformComponentToJson(
                                                                  _model
                                                                      .selectedVariable!,
                                                                  FFAppState()
                                                                      .Colors
                                                                      .toList(),
                                                                  FFAppState()
                                                                      .TickerTypes
                                                                      .toList(),
                                                                  FFAppState()
                                                                      .TimeWindows
                                                                      .toList(),
                                                                  FFAppState()
                                                                      .BlockTypes
                                                                      .where((e) =>
                                                                          e.allowedSizes.contains(_model
                                                                              .selectedGraphSize
                                                                              ?.code) &&
                                                                          e.allowedVariableForms.contains(_model.selectedVariable?.isList == true
                                                                              ? 'array'
                                                                              : 'singleton') &&
                                                                          e.allowedVariableTypes.contains(_model
                                                                              .selectedVariable
                                                                              ?.type))
                                                                      .toList()),
                                                              token:
                                                                  currentJwtToken,
                                                            ),
                                                          ),
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
                                                              return Container(
                                                                width: _model
                                                                            .selectedGraphSize
                                                                            ?.code ==
                                                                        'quarter'
                                                                    ? 100.0
                                                                    : 207.5,
                                                                height: 100.0,
                                                                child:
                                                                    ContainerLoadingWidget(),
                                                              );
                                                            }
                                                            final containerGetComponentSuggestionResponse =
                                                                snapshot.data!;

                                                            return Container(
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Draggable<
                                                                  BlockComponentStruct>(
                                                                data:
                                                                    BlockComponentStruct(
                                                                  info: FFAppState()
                                                                      .BlockTypes
                                                                      .where((e) =>
                                                                          e.info.code ==
                                                                          MediboundGroup.getComponentSuggestionCall.blockCode(
                                                                            containerGetComponentSuggestionResponse.jsonBody,
                                                                          ))
                                                                      .toList()
                                                                      .firstOrNull
                                                                      ?.info,
                                                                  graphSize: _model
                                                                      .selectedGraphSize
                                                                      ?.code,
                                                                  color:
                                                                      colorFromCssString(
                                                                    MediboundGroup
                                                                        .getComponentSuggestionCall
                                                                        .colorCode(
                                                                      containerGetComponentSuggestionResponse
                                                                          .jsonBody,
                                                                    )!,
                                                                    defaultColor:
                                                                        Colors
                                                                            .black,
                                                                  ),
                                                                  blockType: MediboundGroup
                                                                      .getComponentSuggestionCall
                                                                      .blockCode(
                                                                    containerGetComponentSuggestionResponse
                                                                        .jsonBody,
                                                                  ),
                                                                  variableIds: widget!
                                                                      .variablesList
                                                                      ?.map((e) => e
                                                                          .info
                                                                          .code)
                                                                      .toList()
                                                                      ?.where((e) =>
                                                                          e ==
                                                                          _model
                                                                              .selectedVariable
                                                                              ?.info
                                                                              ?.code)
                                                                      .toList(),
                                                                  timeWindow: MediboundGroup
                                                                      .getComponentSuggestionCall
                                                                      .timewindowCode(
                                                                    containerGetComponentSuggestionResponse
                                                                        .jsonBody,
                                                                  ),
                                                                  tickerType: MediboundGroup
                                                                      .getComponentSuggestionCall
                                                                      .tickerCode(
                                                                    containerGetComponentSuggestionResponse
                                                                        .jsonBody,
                                                                  ),
                                                                ),
                                                                feedback:
                                                                    Material(
                                                                  type: MaterialType
                                                                      .transparency,
                                                                  child: custom_widgets
                                                                      .Component(
                                                                    width:
                                                                        100.0,
                                                                    height:
                                                                        100.0,
                                                                    totalHeight:
                                                                        100.0,
                                                                    variable: _model
                                                                        .selectedVariable,
                                                                    block:
                                                                        BlockComponentStruct(
                                                                      info: FFAppState()
                                                                          .BlockTypes
                                                                          .where((e) =>
                                                                              e.info.code ==
                                                                              MediboundGroup.getComponentSuggestionCall.blockCode(
                                                                                containerGetComponentSuggestionResponse.jsonBody,
                                                                              ))
                                                                          .toList()
                                                                          .firstOrNull
                                                                          ?.info,
                                                                      graphSize: _model
                                                                          .selectedGraphSize
                                                                          ?.code,
                                                                      color:
                                                                          colorFromCssString(
                                                                        MediboundGroup
                                                                            .getComponentSuggestionCall
                                                                            .colorCode(
                                                                          containerGetComponentSuggestionResponse
                                                                              .jsonBody,
                                                                        )!,
                                                                        defaultColor:
                                                                            Colors.black,
                                                                      ),
                                                                      blockType: MediboundGroup
                                                                          .getComponentSuggestionCall
                                                                          .blockCode(
                                                                        containerGetComponentSuggestionResponse
                                                                            .jsonBody,
                                                                      ),
                                                                      variableIds: widget!
                                                                          .variablesList
                                                                          ?.map((e) => e
                                                                              .info
                                                                              .code)
                                                                          .toList()
                                                                          ?.where((e) =>
                                                                              e ==
                                                                              _model.selectedVariable?.info?.code)
                                                                          .toList(),
                                                                      timeWindow: MediboundGroup
                                                                          .getComponentSuggestionCall
                                                                          .timewindowCode(
                                                                        containerGetComponentSuggestionResponse
                                                                            .jsonBody,
                                                                      ),
                                                                      tickerType: MediboundGroup
                                                                          .getComponentSuggestionCall
                                                                          .tickerCode(
                                                                        containerGetComponentSuggestionResponse
                                                                            .jsonBody,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                childWhenDragging:
                                                                    Container(
                                                                  width: _model
                                                                              .selectedGraphSize
                                                                              ?.code ==
                                                                          'quarter'
                                                                      ? 100.0
                                                                      : 207.5,
                                                                  height: 100.0,
                                                                  child:
                                                                      ContainerEmptyWidget(),
                                                                ),
                                                                child: custom_widgets
                                                                    .Component(
                                                                  width: 100.0,
                                                                  height: 100.0,
                                                                  totalHeight:
                                                                      100.0,
                                                                  variable: _model
                                                                      .selectedVariable,
                                                                  block:
                                                                      BlockComponentStruct(
                                                                    info: FFAppState()
                                                                        .BlockTypes
                                                                        .where((e) =>
                                                                            e.info.code ==
                                                                            MediboundGroup.getComponentSuggestionCall.blockCode(
                                                                              containerGetComponentSuggestionResponse.jsonBody,
                                                                            ))
                                                                        .toList()
                                                                        .firstOrNull
                                                                        ?.info,
                                                                    graphSize: _model
                                                                        .selectedGraphSize
                                                                        ?.code,
                                                                    color:
                                                                        colorFromCssString(
                                                                      MediboundGroup
                                                                          .getComponentSuggestionCall
                                                                          .colorCode(
                                                                        containerGetComponentSuggestionResponse
                                                                            .jsonBody,
                                                                      )!,
                                                                      defaultColor:
                                                                          Colors
                                                                              .black,
                                                                    ),
                                                                    blockType: MediboundGroup
                                                                        .getComponentSuggestionCall
                                                                        .blockCode(
                                                                      containerGetComponentSuggestionResponse
                                                                          .jsonBody,
                                                                    ),
                                                                    variableIds: widget!
                                                                        .variablesList
                                                                        ?.map((e) => e
                                                                            .info
                                                                            .code)
                                                                        .toList()
                                                                        ?.where((e) =>
                                                                            e ==
                                                                            _model.selectedVariable?.info?.code)
                                                                        .toList(),
                                                                    timeWindow: MediboundGroup
                                                                        .getComponentSuggestionCall
                                                                        .timewindowCode(
                                                                      containerGetComponentSuggestionResponse
                                                                          .jsonBody,
                                                                    ),
                                                                    tickerType: MediboundGroup
                                                                        .getComponentSuggestionCall
                                                                        .tickerCode(
                                                                      containerGetComponentSuggestionResponse
                                                                          .jsonBody,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ).animateOnPageLoad(
                                                                animationsMap[
                                                                    'containerOnPageLoadAnimation1']!);
                                                          },
                                                        ),
                                                      ].divide(SizedBox(
                                                          height: 5.0)),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      Draggable<BlockComponentStruct>(
                                        data: BlockComponentStruct(
                                          info: sizedSubBlocksItem.info,
                                          graphSize:
                                              _model.selectedGraphSize?.code,
                                          color: _model.selectedColor,
                                          blockType:
                                              sizedSubBlocksItem.info.code,
                                          variableIds: widget!.variablesList
                                              ?.map((e) => e.info.code)
                                              .toList()
                                              ?.where((e) =>
                                                  e ==
                                                  _model.selectedVariable?.info
                                                      ?.code)
                                              .toList(),
                                          timeWindow:
                                              _model.selectedTimeWindow?.code,
                                          tickerType:
                                              _model.selectedTicker?.code,
                                        ),
                                        feedback: Material(
                                          type: MaterialType.transparency,
                                          child: Container(
                                            key: ValueKey(
                                                '${sizedSubBlocksItem.info.code}-${_model.selectedVariable?.info?.code}'),
                                            child: custom_widgets.Component(
                                              width: 100.0,
                                              height: 100.0,
                                              totalHeight: 100.0,
                                              variable: _model.selectedVariable,
                                              block: BlockComponentStruct(
                                                info: sizedSubBlocksItem.info,
                                                graphSize: _model
                                                    .selectedGraphSize?.code,
                                                color: _model.selectedColor,
                                                blockType: sizedSubBlocksItem
                                                    .info.code,
                                                variableIds: widget!
                                                    .variablesList
                                                    ?.map((e) => e.info.code)
                                                    .toList()
                                                    ?.where((e) =>
                                                        e ==
                                                        _model.selectedVariable
                                                            ?.info?.code)
                                                    .toList(),
                                                timeWindow: _model
                                                    .selectedTimeWindow?.code,
                                                tickerType:
                                                    _model.selectedTicker?.code,
                                              ),
                                            ),
                                          ).animateOnPageLoad(animationsMap[
                                              'containerOnPageLoadAnimation2']!),
                                        ),
                                        childWhenDragging: Container(
                                          width:
                                              _model.selectedGraphSize?.code ==
                                                      'quarter'
                                                  ? 100.0
                                                  : 207.5,
                                          height: 100.0,
                                          child: ContainerEmptyWidget(),
                                        ),
                                        child: Container(
                                          key: ValueKey(
                                              '${sizedSubBlocksItem.info.code}-${_model.selectedVariable?.info?.code}'),
                                          child: custom_widgets.Component(
                                            width: 100.0,
                                            height: 100.0,
                                            totalHeight: 100.0,
                                            variable: _model.selectedVariable,
                                            block: BlockComponentStruct(
                                              info: sizedSubBlocksItem.info,
                                              graphSize: _model
                                                  .selectedGraphSize?.code,
                                              color: _model.selectedColor,
                                              blockType:
                                                  sizedSubBlocksItem.info.code,
                                              variableIds: widget!.variablesList
                                                  ?.map((e) => e.info.code)
                                                  .toList()
                                                  ?.where((e) =>
                                                      e ==
                                                      _model.selectedVariable
                                                          ?.info?.code)
                                                  .toList(),
                                              timeWindow: _model
                                                  .selectedTimeWindow?.code,
                                              tickerType:
                                                  _model.selectedTicker?.code,
                                            ),
                                          ),
                                        ).animateOnPageLoad(animationsMap[
                                            'containerOnPageLoadAnimation2']!),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                          ),
                          expanded: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                15.0, 0.0, 15.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  width: double.infinity,
                                  height: 45.0,
                                  child: custom_widgets.Dropdown(
                                    width: double.infinity,
                                    height: 45.0,
                                    hintText: 'Color',
                                    items: FFAppState().Colors,
                                    initialItem:
                                        FFAppState().Colors.firstOrNull,
                                    onChanged: (item) async {
                                      _model.selectedColor = item.color;
                                      _model.updatePage(() {});
                                    },
                                  ),
                                ),
                                Container(
                                  width: double.infinity,
                                  height: 45.0,
                                  child: custom_widgets.Dropdown(
                                    width: double.infinity,
                                    height: 45.0,
                                    hintText: 'Ticker',
                                    items: FFAppState().TickerTypes,
                                    initialItem:
                                        FFAppState().TickerTypes.firstOrNull,
                                    onChanged: (item) async {
                                      _model.selectedTicker = item;
                                      _model.updatePage(() {});
                                    },
                                  ),
                                ),
                                Container(
                                  width: double.infinity,
                                  height: 45.0,
                                  child: custom_widgets.Dropdown(
                                    width: double.infinity,
                                    height: 45.0,
                                    hintText: 'Time Window',
                                    items: FFAppState().TimeWindows,
                                    initialItem:
                                        FFAppState().TimeWindows.firstOrNull,
                                    onChanged: (item) async {
                                      _model.selectedTimeWindow = item;
                                      _model.updatePage(() {});
                                    },
                                  ),
                                ),
                              ].divide(SizedBox(height: 7.5)),
                            ),
                          ),
                          theme: ExpandableThemeData(
                            tapHeaderToExpand: true,
                            tapBodyToExpand: false,
                            tapBodyToCollapse: false,
                            headerAlignment:
                                ExpandablePanelHeaderAlignment.center,
                            hasIcon: true,
                            iconColor:
                                FlutterFlowTheme.of(context).secondaryText,
                          ),
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ),
          ),
        ].divide(SizedBox(height: 7.5)),
      ),
    );
  }
}
