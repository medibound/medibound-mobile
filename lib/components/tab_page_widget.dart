import '/flutter_flow/flutter_flow_util.dart';
import '/utils/navigation/tab_bar/tab_bar_widget.dart';
import 'package:medibound_portal_hdztzw/app_state.dart'
    as medibound_portal_hdztzw_app_state;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'tab_page_model.dart';
export 'tab_page_model.dart';

class TabPageWidget extends StatefulWidget {
  const TabPageWidget({
    super.key,
    required this.pageWidget,
  });

  final Widget Function()? pageWidget;

  @override
  State<TabPageWidget> createState() => _TabPageWidgetState();
}

class _TabPageWidgetState extends State<TabPageWidget> {
  late TabPageModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TabPageModel());

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

    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        constraints: BoxConstraints(
          maxWidth: 450.0,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              FlutterFlowTheme.of(context).secondaryBackground,
              FlutterFlowTheme.of(context).primaryBackground
            ],
            stops: [0.0, 1.0],
            begin: AlignmentDirectional(0.98, -1.0),
            end: AlignmentDirectional(-0.98, 1.0),
          ),
        ),
        child: SafeArea(
          child: Container(
            decoration: BoxDecoration(),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Builder(builder: (_) {
                    return widget.pageWidget != null
                        ? widget.pageWidget!()
                        : SizedBox.shrink();
                  }),
                ),
                if (FFAppState().currentRoute.page == '')
                  wrapWithModel(
                    model: _model.tabBarModel,
                    updateCallback: () => safeSetState(() {}),
                    child: TabBarWidget(),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
