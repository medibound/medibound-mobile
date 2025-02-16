import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/streams/add_device/add_device_widget.dart';
import '/utils/navigation/tab_bar/tab_bar_widget.dart';
import "package:medibound_portal_hdztzw/backend/backend.dart"
    as medibound_portal_hdztzw_backend;
import 'package:medibound_portal_hdztzw/utils/dropdown/component_profile_tile/component_profile_tile_widget.dart'
    as medibound_portal_hdztzw;
import 'package:medibound_portal_hdztzw/utils/empty/empty_widget.dart'
    as medibound_portal_hdztzw;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'insights_page_model.dart';
export 'insights_page_model.dart';

class InsightsPageWidget extends StatefulWidget {
  const InsightsPageWidget({super.key});

  @override
  State<InsightsPageWidget> createState() => _InsightsPageWidgetState();
}

class _InsightsPageWidgetState extends State<InsightsPageWidget> {
  late InsightsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InsightsPageModel());
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
          height: MediaQuery.sizeOf(context).height * 1.0,
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
          child: Stack(
            children: [
              Opacity(
                opacity: 0.5,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        FlutterFlowTheme.of(context).secondaryBackground,
                        FlutterFlowTheme.of(context).accent1,
                        FlutterFlowTheme.of(context).accent3
                      ],
                      stops: [0.0, 0.4, 1.0],
                      begin: AlignmentDirectional(-1.0, 1.0),
                      end: AlignmentDirectional(1.0, -1.0),
                    ),
                  ),
                  child: SafeArea(
                    child: Container(
                      width: double.infinity,
                      height: 110.0,
                      decoration: BoxDecoration(),
                    ),
                  ),
                ),
              ),
              SafeArea(
                child: Container(
                  decoration: BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: SafeArea(
                          child: Container(
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
                                            onPressed: () {
                                              print('Button pressed ...');
                                            },
                                            text: 'Manage Chats',
                                            options: FFButtonOptions(
                                              height: 40.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color: Color(0x00E0E3E7),
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'Rubik',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                              elevation: 0.0,
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
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
                                                backgroundColor:
                                                    Color(0x000B0C0C),
                                                enableDrag: false,
                                                useSafeArea: true,
                                                context: context,
                                                builder: (context) {
                                                  return GestureDetector(
                                                    onTap: () {
                                                      FocusScope.of(context)
                                                          .unfocus();
                                                      FocusManager
                                                          .instance.primaryFocus
                                                          ?.unfocus();
                                                    },
                                                    child: Padding(
                                                      padding: MediaQuery
                                                          .viewInsetsOf(
                                                              context),
                                                      child: Container(
                                                        height: 300.0,
                                                        child:
                                                            AddDeviceWidget(),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ).then((value) =>
                                                  safeSetState(() {}));
                                            },
                                            text: 'Ask Medi',
                                            icon: Icon(
                                              FFIcons.ksparkmedi,
                                              size: 18.0,
                                            ),
                                            options: FFButtonOptions(
                                              height: 40.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color: Colors.transparent,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'Rubik',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                              elevation: 0.0,
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                width: 1.5,
                                              ),
                                              borderRadius: BorderRadius.only(
                                                bottomLeft:
                                                    Radius.circular(10.0),
                                                bottomRight:
                                                    Radius.circular(0.0),
                                                topLeft: Radius.circular(10.0),
                                                topRight: Radius.circular(10.0),
                                              ),
                                              hoverColor:
                                                  FlutterFlowTheme.of(context)
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
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 10.0, 0.0, 0.0),
                                            child: GradientText(
                                              'Your Insights',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineLarge
                                                      .override(
                                                        fontFamily: 'Rubik',
                                                        letterSpacing: 0.0,
                                                      ),
                                              colors: [
                                                FlutterFlowTheme.of(context)
                                                    .customColor3,
                                                FlutterFlowTheme.of(context)
                                                    .primaryText
                                              ],
                                              gradientDirection:
                                                  GradientDirection.ttb,
                                              gradientType: GradientType.linear,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      width: double.infinity,
                                      height: 25.0,
                                      decoration: BoxDecoration(),
                                    ),
                                    Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      decoration: BoxDecoration(),
                                      child: StreamBuilder<
                                          List<
                                              medibound_portal_hdztzw_backend
                                              .MessagesRecord>>(
                                        stream: medibound_portal_hdztzw_backend
                                            .queryMessagesRecord(
                                          queryBuilder: (messagesRecord) =>
                                              messagesRecord.where(
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
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  size: 25.0,
                                                ),
                                              ),
                                            );
                                          }
                                          List<
                                                  medibound_portal_hdztzw_backend
                                                  .MessagesRecord>
                                              columnMessagesRecordList =
                                              snapshot.data!;

                                          return Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: List.generate(
                                                columnMessagesRecordList.length,
                                                (columnIndex) {
                                              final columnMessagesRecord =
                                                  columnMessagesRecordList[
                                                      columnIndex];
                                              return StreamBuilder<
                                                  List<
                                                      medibound_portal_hdztzw_backend
                                                      .MessageRecord>>(
                                                stream:
                                                    medibound_portal_hdztzw_backend
                                                        .queryMessageRecord(
                                                  parent: columnMessagesRecord
                                                      .reference,
                                                  queryBuilder:
                                                      (messageRecord) =>
                                                          messageRecord.orderBy(
                                                              'created_time'),
                                                  singleRecord: true,
                                                ),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 25.0,
                                                        height: 25.0,
                                                        child: SpinKitPulse(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          size: 25.0,
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  List<
                                                          medibound_portal_hdztzw_backend
                                                          .MessageRecord>
                                                      containerMessageRecordList =
                                                      snapshot.data!;
                                                  // Return an empty Container when the item does not exist.
                                                  if (snapshot.data!.isEmpty) {
                                                    return Container();
                                                  }
                                                  final containerMessageRecord =
                                                      containerMessageRecordList
                                                              .isNotEmpty
                                                          ? containerMessageRecordList
                                                              .first
                                                          : null;

                                                  return Container(
                                                    decoration: BoxDecoration(),
                                                    child: StreamBuilder<
                                                        List<
                                                            medibound_portal_hdztzw_backend
                                                            .UsersRecord>>(
                                                      stream:
                                                          medibound_portal_hdztzw_backend
                                                              .queryUsersRecord(
                                                        queryBuilder:
                                                            (usersRecord) =>
                                                                usersRecord
                                                                    .where(
                                                          'profile.uid',
                                                          isEqualTo:
                                                              columnMessagesRecord
                                                                  .members
                                                                  .where((e) =>
                                                                      e.id !=
                                                                      currentUserReference
                                                                          ?.id)
                                                                  .toList()
                                                                  .firstOrNull
                                                                  ?.id,
                                                        ),
                                                        singleRecord: true,
                                                      ),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return Center(
                                                            child: SizedBox(
                                                              width: 25.0,
                                                              height: 25.0,
                                                              child:
                                                                  SpinKitPulse(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                size: 25.0,
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                        List<
                                                                medibound_portal_hdztzw_backend
                                                                .UsersRecord>
                                                            containerUsersRecordList =
                                                            snapshot.data!;
                                                        // Return an empty Container when the item does not exist.
                                                        if (snapshot
                                                            .data!.isEmpty) {
                                                          return Container();
                                                        }
                                                        final containerUsersRecord =
                                                            containerUsersRecordList
                                                                    .isNotEmpty
                                                                ? containerUsersRecordList
                                                                    .first
                                                                : null;

                                                        return Container(
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: medibound_portal_hdztzw
                                                              .ComponentProfileTileWidget(
                                                            key: Key(
                                                                'Keydvm_${columnIndex}_of_${columnMessagesRecordList.length}'),
                                                            display:
                                                                containerUsersRecord
                                                                    ?.profile
                                                                    .displayName,
                                                            subtitle:
                                                                containerMessageRecord!
                                                                    .message,
                                                            photoUrl:
                                                                containerUsersRecord
                                                                    ?.profile
                                                                    .photoUrl,
                                                            titleSize: 18.0,
                                                            photoSize: 30.0,
                                                            height: 60.0,
                                                            padding: 0.0,
                                                            widget: () =>
                                                                medibound_portal_hdztzw
                                                                    .EmptyWidget(),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  );
                                                },
                                              );
                                            }),
                                          );
                                        },
                                      ),
                                    ),
                                  ].divide(SizedBox(height: 10.0)),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      wrapWithModel(
                        model: _model.tabBarModel,
                        updateCallback: () => safeSetState(() {}),
                        child: TabBarWidget(
                          selected: 3,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
