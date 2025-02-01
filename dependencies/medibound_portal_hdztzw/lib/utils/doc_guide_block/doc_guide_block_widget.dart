import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'doc_guide_block_model.dart';
export 'doc_guide_block_model.dart';

class DocGuideBlockWidget extends StatefulWidget {
  const DocGuideBlockWidget({
    super.key,
    required this.question,
    required this.answer,
    required this.buttonAction,
    required this.button,
  });

  final String? question;
  final String? answer;
  final Future Function()? buttonAction;
  final String? button;

  @override
  State<DocGuideBlockWidget> createState() => _DocGuideBlockWidgetState();
}

class _DocGuideBlockWidgetState extends State<DocGuideBlockWidget> {
  late DocGuideBlockModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DocGuideBlockModel());

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
      borderRadius: BorderRadius.circular(10.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
            color: FlutterFlowTheme.of(context).alternate,
            width: 1.0,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  FaIcon(
                    FontAwesomeIcons.solidLightbulb,
                    color: FlutterFlowTheme.of(context).secondary,
                    size: 12.0,
                  ),
                  Text(
                    'Documentation Guide',
                    textAlign: TextAlign.start,
                    style: FlutterFlowTheme.of(context).labelMedium.override(
                          fontFamily: 'Rubik',
                          color: FlutterFlowTheme.of(context).secondary,
                          fontSize: 12.0,
                          letterSpacing: 0.0,
                        ),
                  ),
                ].divide(SizedBox(width: 5.0)),
              ),
              Text(
                valueOrDefault<String>(
                  widget!.question,
                  'Question',
                ),
                style: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: 'Rubik',
                      fontSize: 16.0,
                      letterSpacing: 0.0,
                    ),
              ),
              Divider(
                thickness: 2.0,
                color: FlutterFlowTheme.of(context).alternate,
              ),
              Text(
                valueOrDefault<String>(
                  widget!.answer,
                  'Answer',
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Rubik',
                      letterSpacing: 0.0,
                    ),
              ),
              Align(
                alignment: AlignmentDirectional(-1.0, 0.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      await widget.buttonAction?.call();
                    },
                    text: valueOrDefault<String>(
                      widget!.button,
                      'Learn more',
                    ),
                    icon: FaIcon(
                      FontAwesomeIcons.arrowRight,
                      size: 14.0,
                    ),
                    options: FFButtonOptions(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      iconAlignment: IconAlignment.end,
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: Color(0x00E0E3E7),
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Rubik',
                                color: FlutterFlowTheme.of(context).secondary,
                                fontSize: 14.0,
                                letterSpacing: 0.0,
                                lineHeight: 1.0,
                              ),
                      elevation: 0.0,
                      borderRadius: BorderRadius.circular(10.0),
                      hoverColor: Colors.transparent,
                      hoverTextColor: FlutterFlowTheme.of(context).primaryText,
                      hoverElevation: 0.0,
                    ),
                  ),
                ),
              ),
            ].divide(SizedBox(height: 0.0)),
          ),
        ),
      ),
    );
  }
}
