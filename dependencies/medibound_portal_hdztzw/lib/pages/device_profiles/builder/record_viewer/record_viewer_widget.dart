import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/device_profiles/record/record_sample/record_sample_widget.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'record_viewer_model.dart';
export 'record_viewer_model.dart';

class RecordViewerWidget extends StatefulWidget {
  const RecordViewerWidget({
    super.key,
    required this.header,
    required this.sections,
    required this.profile,
    required this.varList,
  });

  final List<BlockComponentStruct>? header;
  final List<BodySectionStruct>? sections;
  final ProfileStruct? profile;
  final List<DeviceVariableStruct>? varList;

  @override
  State<RecordViewerWidget> createState() => _RecordViewerWidgetState();
}

class _RecordViewerWidgetState extends State<RecordViewerWidget> {
  late RecordViewerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RecordViewerModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 1.0),
      child: ClipRRect(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(),
          alignment: AlignmentDirectional(0.0, 0.0),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
            child: Container(
              width: 400.0,
              height: MediaQuery.sizeOf(context).height * 1.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 40.0,
                    color: FlutterFlowTheme.of(context).alternate,
                    offset: Offset(
                      0.0,
                      -20.0,
                    ),
                  )
                ],
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(0.0),
                  bottomRight: Radius.circular(0.0),
                  topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0),
                ),
                shape: BoxShape.rectangle,
              ),
              child: Container(
                decoration: BoxDecoration(),
                child: wrapWithModel(
                  model: _model.recordSampleModel,
                  updateCallback: () => safeSetState(() {}),
                  child: RecordSampleWidget(
                    recordWidth: 400.0,
                    header: widget!.header!,
                    sections: widget!.sections!,
                    profile: widget!.profile!,
                    varList: widget!.varList!,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
