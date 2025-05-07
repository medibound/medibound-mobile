import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/streams/add_device/add_device_widget.dart';
import "package:medibound_portal_hdztzw/backend/backend.dart"
    as medibound_portal_hdztzw_backend;
import 'package:medibound_portal_hdztzw/utils/dropdown/component_profile_tile/component_profile_tile_widget.dart'
    as medibound_portal_hdztzw;
import 'package:medibound_portal_hdztzw/utils/empty/empty_widget.dart'
    as medibound_portal_hdztzw;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
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

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InsightsPageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsets.all(20.0),
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
                            text: 'Edit Chats',
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
                            text: 'Ask Medi',
                            icon: Icon(
                              FFIcons.ksparkmedi,
                              size: 18.0,
                            ),
                            options: FFButtonOptions(
                              height: 42.5,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: Colors.transparent,
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
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).alternate,
                                width: 1.5,
                              ),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10.0),
                                bottomRight: Radius.circular(0.0),
                                topLeft: Radius.circular(10.0),
                                topRight: Radius.circular(10.0),
                              ),
                              hoverColor: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              hoverTextColor:
                                  FlutterFlowTheme.of(context).secondary,
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
                              'Your Insights',
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
                        ),
                      ],
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
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(),
                        child: Padding(
                          padding: EdgeInsets.all(20.0),
                          child: StreamBuilder<
                              List<
                                  medibound_portal_hdztzw_backend
                                  .MessagesRecord>>(
                            stream: medibound_portal_hdztzw_backend
                                .queryMessagesRecord(
                              queryBuilder: (messagesRecord) => messagesRecord
                                  .where(
                                    'owner',
                                    isEqualTo: currentUserReference,
                                  )
                                  .orderBy('created_time', descending: true),
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 25.0,
                                    height: 25.0,
                                    child: SpinKitPulse(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 25.0,
                                    ),
                                  ),
                                );
                              }
                              List<
                                      medibound_portal_hdztzw_backend
                                      .MessagesRecord>
                                  columnMessagesRecordList = snapshot.data!;

                              return Column(
                                mainAxisSize: MainAxisSize.max,
                                children: List.generate(
                                    columnMessagesRecordList.length,
                                    (columnIndex) {
                                  final columnMessagesRecord =
                                      columnMessagesRecordList[columnIndex];
                                  return Container(
                                    key: ValueKey(
                                        columnMessagesRecord.reference.id),
                                    decoration: BoxDecoration(),
                                    child: StreamBuilder<
                                        medibound_portal_hdztzw_backend
                                        .AgentsRecord>(
                                      stream: medibound_portal_hdztzw_backend
                                              .AgentsRecord
                                          .getDocument(
                                              columnMessagesRecord.agent!),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 25.0,
                                              height: 25.0,
                                              child: SpinKitPulse(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                size: 25.0,
                                              ),
                                            ),
                                          );
                                        }

                                        final containerAgentsRecord =
                                            snapshot.data!;

                                        return Container(
                                          decoration: BoxDecoration(),
                                          child: StreamBuilder<
                                              medibound_portal_hdztzw_backend
                                              .OrganizationsRecord>(
                                            stream:
                                                medibound_portal_hdztzw_backend
                                                        .OrganizationsRecord
                                                    .getDocument(
                                                        containerAgentsRecord
                                                            .organization!),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 25.0,
                                                    height: 25.0,
                                                    child: SpinKitPulse(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      size: 25.0,
                                                    ),
                                                  ),
                                                );
                                              }

                                              final containerOrganizationsRecord =
                                                  snapshot.data!;

                                              return Container(
                                                decoration: BoxDecoration(),
                                                child: StreamBuilder<
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
                                                                'created_time',
                                                                descending:
                                                                    true),
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
                                                    if (snapshot
                                                        .data!.isEmpty) {
                                                      return Container();
                                                    }
                                                    final containerMessageRecord =
                                                        containerMessageRecordList
                                                                .isNotEmpty
                                                            ? containerMessageRecordList
                                                                .first
                                                            : null;

                                                    return Container(
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: medibound_portal_hdztzw
                                                          .ComponentProfileTileWidget(
                                                        key: Key(
                                                            'Keymfp_${columnIndex}_of_${columnMessagesRecordList.length}'),
                                                        display:
                                                            columnMessagesRecord
                                                                .info.display,
                                                        subtitle:
                                                            containerMessageRecord!
                                                                .message,
                                                        photoUrl:
                                                            containerAgentsRecord
                                                                .profile
                                                                .photoUrl,
                                                        titleSize: 18.0,
                                                        photoSize: 35.0,
                                                        height: 70.0,
                                                        padding: 0.0,
                                                        subPhotoUrl:
                                                            containerOrganizationsRecord
                                                                .profile
                                                                .photoUrl,
                                                        widget: () =>
                                                            medibound_portal_hdztzw
                                                                .EmptyWidget(),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              );
                                            },
                                          ),
                                        );
                                      },
                                    ),
                                  );
                                }),
                              );
                            },
                          ),
                        ),
                      ),
                    ].divide(SizedBox(height: 10.0)),
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
