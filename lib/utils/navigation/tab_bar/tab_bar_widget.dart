import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/utils/navigation/tab_bar_tile/tab_bar_tile_widget.dart';
import 'dart:async';
import "package:medibound_portal_hdztzw/backend/schema/structs/index.dart"
    as medibound_portal_hdztzw_data_schema;
import '/custom_code/actions/index.dart' as actions;
import 'package:medibound_portal_hdztzw/app_state.dart'
    as medibound_portal_hdztzw_app_state;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:provider/provider.dart';
import 'tab_bar_model.dart';
export 'tab_bar_model.dart';

class TabBarWidget extends StatefulWidget {
  const TabBarWidget({super.key});

  @override
  State<TabBarWidget> createState() => _TabBarWidgetState();
}

class _TabBarWidgetState extends State<TabBarWidget> {
  late TabBarModel _model;

  late StreamSubscription<bool> _keyboardVisibilitySubscription;
  bool _isKeyboardVisible = false;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TabBarModel());

    if (!isWeb) {
      _keyboardVisibilitySubscription =
          KeyboardVisibilityController().onChange.listen((bool visible) {
        safeSetState(() {
          _isKeyboardVisible = visible;
        });
      });
    }

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    if (!isWeb) {
      _keyboardVisibilitySubscription.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();
    context.watch<medibound_portal_hdztzw_app_state.FFAppState>();

    return Visibility(
      visible: !(isWeb
          ? MediaQuery.viewInsetsOf(context).bottom > 0
          : _isKeyboardVisible),
      child: Container(
        width: MediaQuery.sizeOf(context).width * 1.0,
        height: 70.0,
        decoration: BoxDecoration(),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(15.0, 10.0, 15.0, 10.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: wrapWithModel(
                  model: _model.tabBarTileModel1,
                  updateCallback: () => safeSetState(() {}),
                  child: TabBarTileWidget(
                    text: 'Overview',
                    active: FFAppState().currentRoute.section == 'overview',
                    icon: Icon(
                      FFIcons.klogo,
                      color: FFAppState().currentRoute.section == 'overview'
                          ? FlutterFlowTheme.of(context).secondary
                          : FlutterFlowTheme.of(context).secondaryText,
                      size: 21.0,
                    ),
                    onClick: () async {
                      await actions.mobileNavigate(
                        context,
                        medibound_portal_hdztzw_data_schema.RouteStruct(
                          section: 'overview',
                        ),
                        false,
                        () async {
                          FFAppState().update(() {});
                        },
                      );
                    },
                  ),
                ),
              ),
              if (!isWeb)
                Expanded(
                  child: wrapWithModel(
                    model: _model.tabBarTileModel2,
                    updateCallback: () => safeSetState(() {}),
                    child: TabBarTileWidget(
                      text: 'Streams',
                      active: FFAppState().currentRoute.section == 'streams',
                      icon: Icon(
                        FFIcons.kstreams,
                        color: FFAppState().currentRoute.section == 'streams'
                            ? FlutterFlowTheme.of(context).secondary
                            : FlutterFlowTheme.of(context).secondaryText,
                        size: 22.0,
                      ),
                      onClick: () async {
                        await actions.mobileNavigate(
                          context,
                          medibound_portal_hdztzw_data_schema.RouteStruct(
                            section: 'streams',
                          ),
                          false,
                          () async {
                            FFAppState().update(() {});
                          },
                        );
                      },
                    ),
                  ),
                ),
              Expanded(
                child: wrapWithModel(
                  model: _model.tabBarTileModel3,
                  updateCallback: () => safeSetState(() {}),
                  child: TabBarTileWidget(
                    text: 'Insights',
                    active: FFAppState().currentRoute.section == 'insights',
                    icon: Icon(
                      FFIcons.kinsights,
                      color: FFAppState().currentRoute.section == 'insights'
                          ? FlutterFlowTheme.of(context).secondary
                          : FlutterFlowTheme.of(context).secondaryText,
                      size: 20.0,
                    ),
                    onClick: () async {
                      await actions.mobileNavigate(
                        context,
                        medibound_portal_hdztzw_data_schema.RouteStruct(
                          section: 'insights',
                        ),
                        false,
                        () async {
                          FFAppState().update(() {});
                        },
                      );
                    },
                  ),
                ),
              ),
              Expanded(
                child: wrapWithModel(
                  model: _model.tabBarTileModel4,
                  updateCallback: () => safeSetState(() {}),
                  child: TabBarTileWidget(
                    text: 'Wellness',
                    active: FFAppState().currentRoute.section == 'wellness',
                    icon: Icon(
                      FFIcons.kwellness,
                      color: FFAppState().currentRoute.section == 'wellness'
                          ? FlutterFlowTheme.of(context).secondary
                          : FlutterFlowTheme.of(context).secondaryText,
                      size: 20.0,
                    ),
                    onClick: () async {
                      await actions.mobileNavigate(
                        context,
                        medibound_portal_hdztzw_data_schema.RouteStruct(
                          section: 'wellness',
                        ),
                        false,
                        () async {
                          FFAppState().update(() {});
                        },
                      );
                    },
                  ),
                ),
              ),
              Expanded(
                child: AuthUserStreamWidget(
                  builder: (context) => wrapWithModel(
                    model: _model.tabBarTileModel5,
                    updateCallback: () => safeSetState(() {}),
                    child: TabBarTileWidget(
                      text: 'You',
                      active: FFAppState().currentRoute.section == 'profile',
                      image: currentUserDocument?.profile.photoUrl,
                      onClick: () async {
                        await actions.mobileNavigate(
                          context,
                          medibound_portal_hdztzw_data_schema.RouteStruct(
                            section: 'profile',
                          ),
                          false,
                          () async {
                            FFAppState().update(() {});
                          },
                        );
                      },
                    ),
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
