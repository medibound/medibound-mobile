import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import "package:medibound_portal_hdztzw/backend/backend.dart"
    as medibound_portal_hdztzw_backend;
import 'package:medibound_portal_hdztzw/app_state.dart'
    as medibound_portal_hdztzw_app_state;
import 'package:medibound_portal_hdztzw/flutter_flow/flutter_flow_util.dart'
    as medibound_portal_hdztzw_util
    show wrapWithModel, createModel, FlutterFlowDynamicModels;
import 'package:medibound_portal_hdztzw/utils/dropdown/component_profile_tile/component_profile_tile_widget.dart'
    as medibound_portal_hdztzw;
import 'package:medibound_portal_hdztzw/utils/empty/empty_widget.dart'
    as medibound_portal_hdztzw;
import 'package:medibound_portal_hdztzw/utils/empty_list/empty_list_widget.dart'
    as medibound_portal_hdztzw;
import 'package:expandable/expandable.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'wellness_page_model.dart';
export 'wellness_page_model.dart';

class WellnessPageWidget extends StatefulWidget {
  const WellnessPageWidget({super.key});

  @override
  State<WellnessPageWidget> createState() => _WellnessPageWidgetState();
}

class _WellnessPageWidgetState extends State<WellnessPageWidget>
    with TickerProviderStateMixin {
  late WellnessPageModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WellnessPageModel());

    _model.expandableExpandableController =
        ExpandableController(initialExpanded: false);
    animationsMap.addAll({
      'expandableOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 400.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
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
    context.watch<medibound_portal_hdztzw_app_state.FFAppState>();

    return SafeArea(
      child: Container(
        decoration: BoxDecoration(),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
              child: Container(
                decoration: BoxDecoration(),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(1.0, 0.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FFButtonWidget(
                            onPressed: () {
                              print('Button pressed ...');
                            },
                            text: 'Edit Dashboard',
                            options: FFButtonOptions(
                              height: 40.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: Color(0x00E0E3E7),
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    font: GoogleFonts.rubik(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                              elevation: 0.0,
                              borderRadius: BorderRadius.circular(10.0),
                              hoverColor: Colors.transparent,
                              hoverTextColor:
                                  FlutterFlowTheme.of(context).secondary,
                              hoverElevation: 0.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ].divide(SizedBox(height: 10.0)),
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: MediaQuery.sizeOf(context).width * 1.0,
                decoration: BoxDecoration(),
                alignment: AlignmentDirectional(0.0, -1.0),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: GradientText(
                                'Health Checkup',
                                style: FlutterFlowTheme.of(context)
                                    .headlineLarge
                                    .override(
                                      font: GoogleFonts.rubik(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .headlineLarge
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .headlineLarge
                                            .fontStyle,
                                      ),
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .headlineLarge
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .headlineLarge
                                          .fontStyle,
                                    ),
                                colors: [
                                  FlutterFlowTheme.of(context).customColor3,
                                  FlutterFlowTheme.of(context).primaryText
                                ],
                                gradientDirection: GradientDirection.ttb,
                                gradientType: GradientType.linear,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          'Dashboard',
                          style:
                              FlutterFlowTheme.of(context).titleLarge.override(
                                    font: GoogleFonts.rubik(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .fontStyle,
                                  ),
                        ),
                        medibound_portal_hdztzw_util.wrapWithModel(
                          model: _model.emptyListModel,
                          updateCallback: () => safeSetState(() {}),
                          child: medibound_portal_hdztzw.EmptyListWidget(
                            text:
                                'Scores and actionables appear here as you collect more datapoints!',
                            icon: Icon(
                              Icons.dashboard_rounded,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 30.0,
                            ),
                            height: 100.0,
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          color: Color(0x00000000),
                          child: ExpandableNotifier(
                            controller: _model.expandableExpandableController,
                            child: ExpandablePanel(
                              header: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 0.0, 10.0),
                                child: Text(
                                  'Your Datapoints',
                                  style: FlutterFlowTheme.of(context)
                                      .titleLarge
                                      .override(
                                        font: GoogleFonts.rubik(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .titleLarge
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleLarge
                                                  .fontStyle,
                                        ),
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
                              collapsed: StreamBuilder<
                                  List<
                                      medibound_portal_hdztzw_backend
                                      .DatapointsRecord>>(
                                stream: medibound_portal_hdztzw_backend
                                    .queryDatapointsRecord(
                                  queryBuilder: (datapointsRecord) =>
                                      datapointsRecord.where(
                                    'owner',
                                    isEqualTo: currentUserReference,
                                  ),
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 25.0,
                                        height: 25.0,
                                        child: SpinKitPulse(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 25.0,
                                        ),
                                      ),
                                    );
                                  }
                                  List<
                                          medibound_portal_hdztzw_backend
                                          .DatapointsRecord>
                                      containerDatapointsRecordList =
                                      snapshot.data!;

                                  return AnimatedContainer(
                                    duration: Duration(milliseconds: 100),
                                    curve: Curves.easeInOut,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    child: Container(
                                      decoration: BoxDecoration(),
                                      child: Builder(
                                        builder: (context) {
                                          final variableGroups =
                                              containerDatapointsRecordList
                                                  .unique((e) => e.data.preset)
                                                  .toList();

                                          return Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: List.generate(
                                                variableGroups.length,
                                                (variableGroupsIndex) {
                                              final variableGroupsItem =
                                                  variableGroups[
                                                      variableGroupsIndex];
                                              return Container(
                                                key: ValueKey(variableGroupsItem
                                                    .reference.id),
                                                decoration: BoxDecoration(),
                                                child: Container(
                                                  decoration: BoxDecoration(),
                                                  child: medibound_portal_hdztzw
                                                      .ComponentProfileTileWidget(
                                                    key: Key(
                                                        'Key46e_${variableGroupsIndex}_of_${variableGroups.length}'),
                                                    display:
                                                        medibound_portal_hdztzw_app_state
                                                                .FFAppState()
                                                            .VariablePresets
                                                            .where((e) =>
                                                                e.info.code ==
                                                                variableGroupsItem
                                                                    .preset)
                                                            .toList()
                                                            .firstOrNull
                                                            ?.info
                                                            .display,
                                                    subtitle:
                                                        '${containerDatapointsRecordList.where((e) => e.preset == variableGroupsItem.preset).toList().length.toString()} records',
                                                    photoUrl: '',
                                                    titleSize: 16.0,
                                                    height: 50.0,
                                                    padding: 10.0,
                                                    color:
                                                        medibound_portal_hdztzw_app_state
                                                                .FFAppState()
                                                            .VariablePresets
                                                            .where((e) =>
                                                                e.info.code ==
                                                                variableGroupsItem
                                                                    .preset)
                                                            .toList()
                                                            .firstOrNull
                                                            ?.info
                                                            .color,
                                                    iconFromText:
                                                        medibound_portal_hdztzw_app_state
                                                                .FFAppState()
                                                            .VariablePresets
                                                            .where((e) =>
                                                                e.info.code ==
                                                                variableGroupsItem
                                                                    .preset)
                                                            .toList()
                                                            .firstOrNull
                                                            ?.info
                                                            .icon,
                                                    widget: () =>
                                                        medibound_portal_hdztzw
                                                            .EmptyWidget(),
                                                  ),
                                                ),
                                              ).animateOnPageLoad(animationsMap[
                                                  'containerOnPageLoadAnimation1']!);
                                            }),
                                          );
                                        },
                                      ),
                                    ),
                                  );
                                },
                              ),
                              expanded: StreamBuilder<
                                  List<
                                      medibound_portal_hdztzw_backend
                                      .DatapointsRecord>>(
                                stream: medibound_portal_hdztzw_backend
                                    .queryDatapointsRecord(
                                  queryBuilder: (datapointsRecord) =>
                                      datapointsRecord.where(
                                    'owner',
                                    isEqualTo: currentUserReference,
                                  ),
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 25.0,
                                        height: 25.0,
                                        child: SpinKitPulse(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 25.0,
                                        ),
                                      ),
                                    );
                                  }
                                  List<
                                          medibound_portal_hdztzw_backend
                                          .DatapointsRecord>
                                      containerDatapointsRecordList =
                                      snapshot.data!;

                                  return AnimatedContainer(
                                    duration: Duration(milliseconds: 100),
                                    curve: Curves.easeInOut,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    child: Container(
                                      decoration: BoxDecoration(),
                                      child: Builder(
                                        builder: (context) {
                                          final variableGroups =
                                              medibound_portal_hdztzw_app_state
                                                      .FFAppState()
                                                  .VariablePresets
                                                  .toList();

                                          return Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: List.generate(
                                                variableGroups.length,
                                                (variableGroupsIndex) {
                                              final variableGroupsItem =
                                                  variableGroups[
                                                      variableGroupsIndex];
                                              return Container(
                                                key: ValueKey(variableGroupsItem
                                                    .info.code),
                                                decoration: BoxDecoration(),
                                                child: Container(
                                                  decoration: BoxDecoration(),
                                                  child: medibound_portal_hdztzw
                                                      .ComponentProfileTileWidget(
                                                    key: Key(
                                                        'Keyowi_${variableGroupsIndex}_of_${variableGroups.length}'),
                                                    display: variableGroupsItem
                                                        .info.display,
                                                    subtitle:
                                                        '${containerDatapointsRecordList.where((e) => e.preset == variableGroupsItem.info.code).toList().length.toString()} records',
                                                    photoUrl: '',
                                                    titleSize: 16.0,
                                                    height: 50.0,
                                                    padding: 10.0,
                                                    color: variableGroupsItem
                                                        .info.color,
                                                    iconFromText:
                                                        variableGroupsItem
                                                            .info.icon,
                                                    widget: () =>
                                                        medibound_portal_hdztzw
                                                            .EmptyWidget(),
                                                  ),
                                                ),
                                              ).animateOnPageLoad(animationsMap[
                                                  'containerOnPageLoadAnimation2']!);
                                            }),
                                          );
                                        },
                                      ),
                                    ),
                                  );
                                },
                              ),
                              theme: ExpandableThemeData(
                                tapHeaderToExpand: true,
                                tapBodyToExpand: false,
                                tapBodyToCollapse: false,
                                headerAlignment:
                                    ExpandablePanelHeaderAlignment.center,
                                hasIcon: true,
                                expandIcon: FontAwesomeIcons.angleDown,
                                collapseIcon: FontAwesomeIcons.angleUp,
                                iconSize: 16.0,
                                iconColor:
                                    FlutterFlowTheme.of(context).secondaryText,
                              ),
                            ),
                          ),
                        ).animateOnPageLoad(
                            animationsMap['expandableOnPageLoadAnimation']!),
                      ].divide(SizedBox(height: 10.0)),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
