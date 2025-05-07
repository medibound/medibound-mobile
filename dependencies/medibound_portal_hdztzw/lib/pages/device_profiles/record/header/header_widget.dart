import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'header_model.dart';
export 'header_model.dart';

class HeaderWidget extends StatefulWidget {
  const HeaderWidget({
    super.key,
    required this.header,
    required this.headerWidth,
    required this.varList,
  });

  final List<BlockComponentStruct>? header;
  final double? headerWidth;
  final List<VariableStruct>? varList;

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  late HeaderModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HeaderModel());

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
      width: widget!.headerWidth,
      height: ((widget!.headerWidth!) / 437.5) * 115,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).alternate,
        borderRadius: BorderRadius.circular(10.0),
      ),
      alignment: AlignmentDirectional(-1.0, 0.0),
      child: Padding(
        padding: EdgeInsets.all(valueOrDefault<double>(
          ((widget!.headerWidth!) / 437.5) * 7.5,
          0.0,
        )),
        child: Builder(
          builder: (context) {
            final headerComponents = widget!.header!.toList().take(4).toList();

            return ListView.separated(
              padding: EdgeInsets.zero,
              primary: false,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: headerComponents.length,
              separatorBuilder: (_, __) =>
                  SizedBox(width: ((widget!.headerWidth!) / 437.5) * 7.5),
              itemBuilder: (context, headerComponentsIndex) {
                final headerComponentsItem =
                    headerComponents[headerComponentsIndex];
                return Container(
                  height: ((widget!.headerWidth!) / 437.5) * 100.0,
                  child: Stack(
                    alignment: AlignmentDirectional(-1.0, -1.0),
                    children: [
                      custom_widgets.Component(
                        width: 100.0,
                        height: 100.0,
                        totalHeight: ((widget!.headerWidth!) / 437.5) * 100,
                        variable: widget!.varList
                            ?.where((e) =>
                                e.info.code ==
                                headerComponentsItem.variableIds.firstOrNull)
                            .toList()
                            ?.firstOrNull,
                        block: headerComponentsItem,
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
