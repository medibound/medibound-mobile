import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/streams/add_device/add_device_widget.dart';
import '/pages/streams/device_list/device_list_widget.dart';
import '/utils/navigation/tab_bar/tab_bar_widget.dart';
import "package:medibound_portal_hdztzw/backend/backend.dart"
    as medibound_portal_hdztzw_backend;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/permissions_util.dart';
import 'package:medibound_portal_hdztzw/utils/empty_list/empty_list_widget.dart'
    as medibound_portal_hdztzw;
import 'package:expandable/expandable.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'streams_page_model.dart';
export 'streams_page_model.dart';

class StreamsPageWidget extends StatefulWidget {
  const StreamsPageWidget({super.key});

  @override
  State<StreamsPageWidget> createState() => _StreamsPageWidgetState();
}

class _StreamsPageWidgetState extends State<StreamsPageWidget>
    with TickerProviderStateMixin {
  late StreamsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StreamsPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await requestPermission(bluetoothPermission);
      _model.devices =
          await medibound_portal_hdztzw_backend.queryDeviceRecordOnce(
        queryBuilder: (deviceRecord) => deviceRecord.where(
          'owner',
          isEqualTo: currentUserReference,
        ),
      );
    });

    _model.devicesExpandableController =
        ExpandableController(initialExpanded: false);
    _model.appsExpandableController =
        ExpandableController(initialExpanded: false);
    animationsMap.addAll({
      'expandableOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 300.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                FlutterFlowTheme.of(context).secondaryBackground,
                FlutterFlowTheme.of(context).primaryBackground
              ],
              stops: [0.0, 1.0],
              begin: AlignmentDirectional(0.0, -1.0),
              end: AlignmentDirectional(0, 1.0),
            ),
          ),
          child: SafeArea(
            child: Container(
              decoration: BoxDecoration(),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    decoration: BoxDecoration(),
                    alignment: AlignmentDirectional(0.0, -1.0),
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  1.0, 0.0, 0.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  FFButtonWidget(
                                    onPressed: () async {
                                      _model.isEdit = !_model.isEdit;
                                      safeSetState(() {});
                                    },
                                    text: 'Edit Layout',
                                    options: FFButtonOptions(
                                      height: 40.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: Color(0x00E0E3E7),
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Rubik',
                                            color: FlutterFlowTheme.of(context)
                                                .secondary,
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                          ),
                                      elevation: 0.0,
                                      borderRadius: BorderRadius.circular(10.0),
                                      hoverColor: Colors.transparent,
                                      hoverTextColor:
                                          FlutterFlowTheme.of(context)
                                              .secondary,
                                      hoverElevation: 0.0,
                                    ),
                                  ),
                                  FFButtonWidget(
                                    onPressed: () async {
                                      await showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: Color(0x000B0C0C),
                                        enableDrag: false,
                                        useSafeArea: true,
                                        context: context,
                                        builder: (context) {
                                          return GestureDetector(
                                            onTap: () {
                                              FocusScope.of(context).unfocus();
                                              FocusManager.instance.primaryFocus
                                                  ?.unfocus();
                                            },
                                            child: Padding(
                                              padding: MediaQuery.viewInsetsOf(
                                                  context),
                                              child: Container(
                                                height: 300.0,
                                                child: AddDeviceWidget(),
                                              ),
                                            ),
                                          );
                                        },
                                      ).then((value) => safeSetState(() {}));
                                    },
                                    text: 'Add Device',
                                    icon: FaIcon(
                                      FontAwesomeIcons.plus,
                                      size: 14.0,
                                    ),
                                    options: FFButtonOptions(
                                      height: 40.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 16.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Rubik',
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                          ),
                                      elevation: 0.0,
                                      borderRadius: BorderRadius.circular(10.0),
                                      hoverColor: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      hoverTextColor:
                                          FlutterFlowTheme.of(context)
                                              .secondary,
                                      hoverElevation: 0.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 0.0),
                                    child: GradientText(
                                      'All Streams',
                                      style: FlutterFlowTheme.of(context)
                                          .headlineLarge
                                          .override(
                                            fontFamily: 'Rubik',
                                            letterSpacing: 0.0,
                                          ),
                                      colors: [
                                        FlutterFlowTheme.of(context)
                                            .customColor3,
                                        FlutterFlowTheme.of(context).primaryText
                                      ],
                                      gradientDirection: GradientDirection.ttb,
                                      gradientType: GradientType.linear,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            if (responsiveVisibility(
                              context: context,
                              phone: false,
                              tablet: false,
                              tabletLandscape: false,
                              desktop: false,
                            ))
                              Container(
                                width: double.infinity,
                                height: 200.0,
                                color: Color(0x00000000),
                                child: ExpandableNotifier(
                                  controller:
                                      _model.devicesExpandableController,
                                  child: ExpandablePanel(
                                    header: Text(
                                      'Linked Devices',
                                      style: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .override(
                                            fontFamily: 'Rubik',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    collapsed: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          'Collapsed body text',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Rubik',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ],
                                    ),
                                    expanded: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          'Expanded body text',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Rubik',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ],
                                    ),
                                    theme: ExpandableThemeData(
                                      tapHeaderToExpand: true,
                                      tapBodyToExpand: false,
                                      tapBodyToCollapse: false,
                                      headerAlignment:
                                          ExpandablePanelHeaderAlignment.center,
                                      hasIcon: true,
                                      iconColor: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                                  ),
                                ),
                              ),
                            AnimatedContainer(
                              duration: Duration(milliseconds: 50),
                              curve: Curves.easeInOut,
                              decoration: BoxDecoration(),
                              child: custom_widgets.BLEWrapper(
                                width: double.infinity,
                                height: 300.0,
                                widget: () => DeviceListWidget(
                                  isEdit: _model.isEdit,
                                ),
                                loadingWidget: () =>
                                    medibound_portal_hdztzw.EmptyListWidget(
                                  text: 'Bluetooth is Disabled',
                                  icon: Icon(
                                    Icons.bluetooth_disabled_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 16.0,
                                  ),
                                  height: 200.0,
                                ),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              height: 200.0,
                              color: Color(0x00000000),
                              child: ExpandableNotifier(
                                controller: _model.appsExpandableController,
                                child: ExpandablePanel(
                                  header: Text(
                                    'Installed Apps',
                                    style: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .override(
                                          fontFamily: 'Rubik',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                  collapsed: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        'Coming Soon',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Rubik',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ],
                                  ),
                                  expanded: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        'Coming Soon',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Rubik',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ],
                                  ),
                                  theme: ExpandableThemeData(
                                    tapHeaderToExpand: true,
                                    tapBodyToExpand: false,
                                    tapBodyToCollapse: false,
                                    headerAlignment:
                                        ExpandablePanelHeaderAlignment.center,
                                    hasIcon: true,
                                    iconColor: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                                ),
                              ),
                            ).animateOnPageLoad(animationsMap[
                                'expandableOnPageLoadAnimation']!),
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(),
                            ),
                          ].divide(SizedBox(height: 10.0)),
                        ),
                      ),
                    ),
                  ),
                  wrapWithModel(
                    model: _model.tabBarModel,
                    updateCallback: () => safeSetState(() {}),
                    child: TabBarWidget(
                      selected: 2,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
