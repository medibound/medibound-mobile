import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/utils/navigation/tab_bar_tile/tab_bar_tile_widget.dart';
import 'dart:async';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'tab_bar_model.dart';
export 'tab_bar_model.dart';

class TabBarWidget extends StatefulWidget {
  const TabBarWidget({
    super.key,
    required this.selected,
  });

  final int? selected;

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
    return Visibility(
      visible: !(isWeb
          ? MediaQuery.viewInsetsOf(context).bottom > 0
          : _isKeyboardVisible),
      child: Container(
        width: MediaQuery.sizeOf(context).width * 1.0,
        height: 70.0,
        decoration: BoxDecoration(),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: wrapWithModel(
                model: _model.tabBarTileModel1,
                updateCallback: () => safeSetState(() {}),
                child: TabBarTileWidget(
                  text: 'Overview',
                  active: widget.selected == 1,
                  icon: Icon(
                    FFIcons.klogo,
                    color: widget.selected == 1
                        ? FlutterFlowTheme.of(context).secondary
                        : FlutterFlowTheme.of(context).secondaryText,
                    size: 22.0,
                  ),
                  onClick: () async {
                    context.pushNamed('HomePage');
                  },
                ),
              ),
            ),
            Expanded(
              child: wrapWithModel(
                model: _model.tabBarTileModel2,
                updateCallback: () => safeSetState(() {}),
                child: TabBarTileWidget(
                  text: 'Streams',
                  active: widget.selected == 2,
                  icon: Icon(
                    FFIcons.krecords,
                    color: widget.selected == 2
                        ? FlutterFlowTheme.of(context).secondary
                        : FlutterFlowTheme.of(context).secondaryText,
                    size: 22.0,
                  ),
                  onClick: () async {
                    context.pushNamed('StreamsPage');
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
                  active: widget.selected == 3,
                  icon: Icon(
                    FFIcons.kchatwithmedi,
                    color: widget.selected == 3
                        ? FlutterFlowTheme.of(context).secondary
                        : FlutterFlowTheme.of(context).secondaryText,
                    size: 24.0,
                  ),
                  onClick: () async {},
                ),
              ),
            ),
            Expanded(
              child: wrapWithModel(
                model: _model.tabBarTileModel4,
                updateCallback: () => safeSetState(() {}),
                child: TabBarTileWidget(
                  text: 'Wellness',
                  active: widget.selected == 4,
                  icon: Icon(
                    Icons.favorite_rounded,
                    color: widget.selected == 4
                        ? FlutterFlowTheme.of(context).secondary
                        : FlutterFlowTheme.of(context).secondaryText,
                    size: 24.0,
                  ),
                  onClick: () async {},
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
                    active: widget.selected == 5,
                    image: currentUserDocument?.profile.photoUrl,
                    onClick: () async {
                      context.pushNamed('YouPage');
                    },
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
