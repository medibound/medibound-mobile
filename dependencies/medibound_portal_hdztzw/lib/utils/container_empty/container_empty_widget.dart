import '/flutter_flow/flutter_flow_util.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'container_empty_model.dart';
export 'container_empty_model.dart';

class ContainerEmptyWidget extends StatefulWidget {
  const ContainerEmptyWidget({super.key});

  @override
  State<ContainerEmptyWidget> createState() => _ContainerEmptyWidgetState();
}

class _ContainerEmptyWidgetState extends State<ContainerEmptyWidget> {
  late ContainerEmptyModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ContainerEmptyModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15.0),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          border: Border.all(
            color: FlutterFlowTheme.of(context).alternate,
            width: 3.0,
          ),
        ),
      ),
    );
  }
}
