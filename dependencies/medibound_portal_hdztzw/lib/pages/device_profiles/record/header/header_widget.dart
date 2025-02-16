import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/device_profiles/components/component/component_widget.dart';
import '/utils/empty_list/empty_list_widget.dart';
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
  final List<DeviceVariableStruct>? varList;

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
    return Container(
      decoration: BoxDecoration(),
      child: Wrap(
        spacing: 10.0,
        runSpacing: 0.0,
        alignment: WrapAlignment.start,
        crossAxisAlignment: WrapCrossAlignment.start,
        direction: Axis.vertical,
        runAlignment: WrapAlignment.start,
        verticalDirection: VerticalDirection.down,
        clipBehavior: Clip.none,
        children: [
          Container(
            width: widget!.headerWidth,
            height: (((widget!.headerWidth!) - 25) / 4) + 12,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).alternate,
              borderRadius: BorderRadius.circular(10.0),
            ),
            alignment: AlignmentDirectional(-1.0, 0.0),
            child: Padding(
              padding: EdgeInsets.all(7.5),
              child: Builder(
                builder: (context) {
                  final headerComponents =
                      widget!.header!.toList().take(4).toList();
                  if (headerComponents.isEmpty) {
                    return Center(
                      child: Container(
                        width: double.infinity,
                        height: 100.0,
                        child: EmptyListWidget(
                          text: 'No Components to Display',
                          icon: Icon(
                            Icons.cloud_off,
                            color: FlutterFlowTheme.of(context).secondaryText,
                          ),
                        ),
                      ),
                    );
                  }

                  return ListView.separated(
                    padding: EdgeInsets.zero,
                    primary: false,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: headerComponents.length,
                    separatorBuilder: (_, __) => SizedBox(width: 7.5),
                    itemBuilder: (context, headerComponentsIndex) {
                      final headerComponentsItem =
                          headerComponents[headerComponentsIndex];
                      return Stack(
                        alignment: AlignmentDirectional(-1.0, -1.0),
                        children: [
                          ComponentWidget(
                            key: Key(
                                'Keya91_${headerComponentsIndex}_of_${headerComponents.length}'),
                            totalHeight: ((widget!.headerWidth!) - 37.5) / 4,
                            block: headerComponentsItem,
                            spacing: 7.5,
                            varList: widget!.varList!,
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
