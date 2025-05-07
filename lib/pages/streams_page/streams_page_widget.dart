import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/streams/add_device/add_device_widget.dart';
import '/pages/streams/manage_device/manage_device_widget.dart';
import '/utils/device_tile/device_tile_widget.dart';
import "package:medibound_portal_hdztzw/backend/backend.dart"
    as medibound_portal_hdztzw_backend;
import 'package:flutter_animate/flutter_animate.dart';
import 'package:medibound_portal_hdztzw/utils/empty_list/empty_list_widget.dart'
    as medibound_portal_hdztzw;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:expandable/expandable.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'streams_page_model.dart';
export 'streams_page_model.dart';

class StreamsPageWidget extends StatefulWidget {
  const StreamsPageWidget({
    super.key,
    bool? parameter1,
  }) : this.parameter1 = parameter1 ?? false;

  final bool parameter1;

  @override
  State<StreamsPageWidget> createState() => _StreamsPageWidgetState();
}

class _StreamsPageWidgetState extends State<StreamsPageWidget>
    with TickerProviderStateMixin {
  late StreamsPageModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StreamsPageModel());

    _model.searchTextController ??= TextEditingController();
    _model.searchFocusNode ??= FocusNode();
    _model.searchFocusNode!.addListener(() => safeSetState(() {}));
    _model.devicesExpandableController =
        ExpandableController(initialExpanded: false);
    _model.appsExpandableController =
        ExpandableController(initialExpanded: false);
    animationsMap.addAll({
      'deviceTileOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 200.0.ms,
            duration: 800.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 200.0.ms,
            duration: 600.0.ms,
            color: FlutterFlowTheme.of(context).alternate,
            angle: 0.524,
          ),
        ],
      ),
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
                padding: EdgeInsetsDirectional.fromSTEB(1.0, 0.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FFButtonWidget(
                      onPressed: () async {
                        safeSetState(() {});
                      },
                      text: 'Edit Streams',
                      options: FFButtonOptions(
                        height: 40.0,
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: Color(0x00E0E3E7),
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  font: GoogleFonts.rubik(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                                  color: FlutterFlowTheme.of(context).secondary,
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
                        hoverTextColor: FlutterFlowTheme.of(context).secondary,
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
                            return Padding(
                              padding: MediaQuery.viewInsetsOf(context),
                              child: Container(
                                height: 300.0,
                                child: AddDeviceWidget(),
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
                        height: 42.5,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).alternate,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  font: GoogleFonts.rubik(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                                  color: FlutterFlowTheme.of(context).secondary,
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
                        hoverColor:
                            FlutterFlowTheme.of(context).primaryBackground,
                        hoverTextColor: FlutterFlowTheme.of(context).secondary,
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
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                      child: GradientText(
                        'All Streams',
                        style:
                            FlutterFlowTheme.of(context).headlineLarge.override(
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
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Container(
                      height: 35.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).alternate,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                15.0, 0.0, 0.0, 0.0),
                            child: FaIcon(
                              FontAwesomeIcons.search,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 14.0,
                            ),
                          ),
                          Expanded(
                            child: TextFormField(
                              controller: _model.searchTextController,
                              focusNode: _model.searchFocusNode,
                              onChanged: (_) => EasyDebounce.debounce(
                                '_model.searchTextController',
                                Duration(milliseconds: 2000),
                                () => safeSetState(() {}),
                              ),
                              autofocus: false,
                              obscureText: false,
                              decoration: InputDecoration(
                                isDense: true,
                                labelStyle: FlutterFlowTheme.of(context)
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
                                      shadows: [
                                        Shadow(
                                          color: FlutterFlowTheme.of(context)
                                              .customColor1,
                                          offset: Offset(0.0, 2.0),
                                          blurRadius: 40.0,
                                        )
                                      ],
                                      lineHeight: 1.0,
                                    ),
                                alignLabelWithHint: false,
                                hintText: 'Search Devices and Apps...',
                                hintStyle: FlutterFlowTheme.of(context)
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
                                      lineHeight: 1.0,
                                    ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                errorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                focusedErrorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                contentPadding: EdgeInsetsDirectional.fromSTEB(
                                    5.0, 15.0, 20.0, 15.0),
                                hoverColor:
                                    FlutterFlowTheme.of(context).customColor1,
                                suffixIcon: _model
                                        .searchTextController!.text.isNotEmpty
                                    ? InkWell(
                                        onTap: () async {
                                          _model.searchTextController?.clear();
                                          safeSetState(() {});
                                        },
                                        child: Icon(
                                          Icons.clear,
                                          size: 16.0,
                                        ),
                                      )
                                    : null,
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
                                    lineHeight: 1.5,
                                  ),
                              cursorColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              validator: _model.searchTextControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                        ].divide(SizedBox(width: 5.0)),
                      ),
                    ),
                  ),
                ),
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
                    controller: _model.devicesExpandableController,
                    child: ExpandablePanel(
                      header: Text(
                        'Linked Devices',
                        style: FlutterFlowTheme.of(context).titleLarge.override(
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
                      collapsed: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Collapsed body text',
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
                        ],
                      ),
                      theme: ExpandableThemeData(
                        tapHeaderToExpand: true,
                        tapBodyToExpand: false,
                        tapBodyToCollapse: false,
                        headerAlignment: ExpandablePanelHeaderAlignment.center,
                        hasIcon: true,
                        iconColor: FlutterFlowTheme.of(context).primaryText,
                      ),
                    ),
                  ),
                ),
              AnimatedContainer(
                duration: Duration(milliseconds: 50),
                curve: Curves.easeInOut,
                decoration: BoxDecoration(),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                  child: StreamBuilder<
                      List<medibound_portal_hdztzw_backend.DeviceRecord>>(
                    stream: medibound_portal_hdztzw_backend.queryDeviceRecord(
                      queryBuilder: (deviceRecord) => deviceRecord.where(
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
                              color: FlutterFlowTheme.of(context).primary,
                              size: 25.0,
                            ),
                          ),
                        );
                      }
                      List<medibound_portal_hdztzw_backend.DeviceRecord>
                          gridViewDeviceRecordList = snapshot.data!;
                      if (gridViewDeviceRecordList.isEmpty) {
                        return Center(
                          child: Container(
                            width: double.infinity,
                            height: 200.0,
                            child: medibound_portal_hdztzw.EmptyListWidget(
                              text: 'No Devices Connected',
                              icon: FaIcon(
                                FontAwesomeIcons.clone,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 16.0,
                              ),
                              height: 200.0,
                            ),
                          ),
                        );
                      }

                      return GridView.builder(
                        padding: EdgeInsets.zero,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount:
                              (MediaQuery.sizeOf(context).width / 190).floor(),
                          crossAxisSpacing: 10.0,
                          mainAxisSpacing: 10.0,
                          childAspectRatio: 1.2,
                        ),
                        primary: false,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: gridViewDeviceRecordList.length,
                        itemBuilder: (context, gridViewIndex) {
                          final gridViewDeviceRecord =
                              gridViewDeviceRecordList[gridViewIndex];
                          return AnimatedOpacity(
                            opacity: gridViewDeviceRecord.status != 'offline'
                                ? 1.0
                                : 0.7,
                            duration: 300.0.ms,
                            curve: Curves.easeInOut,
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                if (gridViewDeviceRecord.status != 'offline') {
                                  await showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor:
                                        FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                    enableDrag: false,
                                    context: context,
                                    builder: (context) {
                                      return Padding(
                                        padding:
                                            MediaQuery.viewInsetsOf(context),
                                        child: ManageDeviceWidget(
                                          device:
                                              gridViewDeviceRecord.reference,
                                        ),
                                      );
                                    },
                                  ).then((value) => safeSetState(() {}));
                                }
                              },
                              child: wrapWithModel(
                                model: _model.deviceTileModels.getModel(
                                  gridViewDeviceRecord.info.code,
                                  gridViewIndex,
                                ),
                                updateCallback: () => safeSetState(() {}),
                                child: DeviceTileWidget(
                                  key: Key(
                                    'Keyn89_${gridViewDeviceRecord.info.code}',
                                  ),
                                  device: gridViewDeviceRecord,
                                  cornerIcon: FaIcon(
                                    FontAwesomeIcons.chevronRight,
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    size: 16.0,
                                  ),
                                  status: gridViewDeviceRecord.status,
                                  statusColor: gridViewDeviceRecord.status !=
                                          'offline'
                                      ? FlutterFlowTheme.of(context).secondary
                                      : FlutterFlowTheme.of(context)
                                          .secondaryText,
                                  battery: gridViewDeviceRecord.battery,
                                  isEdit: widget.parameter1,
                                ),
                              ),
                            ).animateOnPageLoad(animationsMap[
                                'deviceTileOnPageLoadAnimation']!),
                          );
                        },
                      );
                    },
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
                      'Third-Party Apps',
                      style: FlutterFlowTheme.of(context).titleLarge.override(
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
                    collapsed: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Coming Soon',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
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
                      ],
                    ),
                    expanded: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'Coming Soon',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
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
                      ],
                    ),
                    theme: ExpandableThemeData(
                      tapHeaderToExpand: true,
                      tapBodyToExpand: false,
                      tapBodyToCollapse: false,
                      headerAlignment: ExpandablePanelHeaderAlignment.center,
                      hasIcon: true,
                      iconColor: FlutterFlowTheme.of(context).primaryText,
                    ),
                  ),
                ),
              ).animateOnPageLoad(
                  animationsMap['expandableOnPageLoadAnimation']!),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(),
              ),
            ].divide(SizedBox(height: 10.0)),
          ),
        ),
      ),
    );
  }
}
