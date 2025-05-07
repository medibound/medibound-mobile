import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/device_profiles/record/record_sample/record_sample_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'records_page_model.dart';
export 'records_page_model.dart';

class RecordsPageWidget extends StatefulWidget {
  const RecordsPageWidget({
    super.key,
    required this.recordId,
  });

  final DocumentReference? recordId;

  static String routeName = 'RecordsPage';
  static String routePath = '/record';
  static void maybeSetRouteName(String? updatedRouteName) =>
      routeName = updatedRouteName ?? routeName;
  static void maybeSetRoutePath(String? updatedRoutePath) =>
      routePath = updatedRoutePath ?? routePath;

  @override
  State<RecordsPageWidget> createState() => _RecordsPageWidgetState();
}

class _RecordsPageWidgetState extends State<RecordsPageWidget> {
  late RecordsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RecordsPageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<RecordTemplateRecord>(
      stream: RecordTemplateRecord.getDocument(widget!.recordId!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: Center(
              child: SizedBox(
                width: 25.0,
                height: 25.0,
                child: SpinKitPulse(
                  color: FlutterFlowTheme.of(context).primary,
                  size: 25.0,
                ),
              ),
            ),
          );
        }

        final recordsPageRecordTemplateRecord = snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: SafeArea(
              top: true,
              child: wrapWithModel(
                model: _model.recordSampleModel,
                updateCallback: () => safeSetState(() {}),
                child: RecordSampleWidget(
                  recordWidth: MediaQuery.sizeOf(context).width,
                  header: recordsPageRecordTemplateRecord.header,
                  sections: recordsPageRecordTemplateRecord.sections,
                  varList: recordsPageRecordTemplateRecord.variables,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
