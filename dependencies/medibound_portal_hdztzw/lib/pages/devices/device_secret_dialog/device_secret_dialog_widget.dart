import '/backend/backend.dart';
import '/backend/custom_cloud_functions/custom_cloud_function_response_manager.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/utils/loading/loading_widget.dart';
import 'dart:ui';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'device_secret_dialog_model.dart';
export 'device_secret_dialog_model.dart';

class DeviceSecretDialogWidget extends StatefulWidget {
  const DeviceSecretDialogWidget({
    super.key,
    required this.device,
  });

  final DeviceRecord? device;

  @override
  State<DeviceSecretDialogWidget> createState() =>
      _DeviceSecretDialogWidgetState();
}

class _DeviceSecretDialogWidgetState extends State<DeviceSecretDialogWidget> {
  late DeviceSecretDialogModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DeviceSecretDialogModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      try {
        final result =
            await FirebaseFunctions.instanceFor(region: 'us-central1')
                .httpsCallable('unwrapDeviceKey')
                .call({
          "publicWrappedKey": widget!.device!.key.publicWrappedKey,
          "privateWrappedKey": widget!.device!.key.privateWrappedKey,
        });
        _model.key = UnwrapDeviceKeyCloudFunctionCallResponse(
          data: KeyStruct.fromMap(result.data),
          succeeded: true,
          resultAsString: result.data.toString(),
          jsonBody: result.data,
        );
      } on FirebaseFunctionsException catch (error) {
        _model.key = UnwrapDeviceKeyCloudFunctionCallResponse(
          errorCode: error.code,
          succeeded: false,
        );
      }

      _model.deviceKey = _model.key?.data;
      safeSetState(() {});
    });

    _model.deviceIdTextController ??=
        TextEditingController(text: widget!.device?.reference.id);
    _model.deviceIdFocusNode ??= FocusNode();
    _model.deviceIdFocusNode!.addListener(() => safeSetState(() {}));
    _model.secretKeyTextController ??= TextEditingController();
    _model.secretKeyFocusNode ??= FocusNode();
    _model.secretKeyFocusNode!.addListener(() => safeSetState(() {}));
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {
          _model.secretKeyTextController?.text =
              'CiQAFyn2De4Q8J63HJxXfLBPMLdIXHln/OJFN9i3xzxTZr59T2ASSQCzOIQrG+9Z+TSRR/xPb93nk1LdlmwGno8gP6MvdKhooprKqQJcRC7cHG0F+4GyA0/cn+1W3SGIMRELWJog0dcvkxMjDwSzIqk=';
        }));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        if (_model.deviceKey != null) {
          return Container(
            width: double.infinity,
            decoration: BoxDecoration(),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Container(
                    decoration: BoxDecoration(),
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: BarcodeWidget(
                        data: _model.deviceKey!.publicRawKey,
                        barcode: Barcode.aztec(),
                        width: 230.0,
                        height: 230.0,
                        color: FlutterFlowTheme.of(context).primaryText,
                        backgroundColor: Colors.transparent,
                        errorBuilder: (_context, _error) => SizedBox(
                          width: 230.0,
                          height: 230.0,
                        ),
                        drawText: false,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(),
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Setup and Connect Your Device',
                            style: FlutterFlowTheme.of(context)
                                .headlineSmall
                                .override(
                                  fontFamily: 'Rubik',
                                  fontSize: 30.0,
                                  letterSpacing: 0.0,
                                ),
                          ),
                          Divider(
                            thickness: 2.0,
                            color: FlutterFlowTheme.of(context).alternate,
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 0.0, 10.0),
                            child: Stack(
                              alignment: AlignmentDirectional(1.0, 0.0),
                              children: [
                                TextFormField(
                                  controller: _model.deviceIdTextController,
                                  focusNode: _model.deviceIdFocusNode,
                                  autofocus: false,
                                  readOnly: true,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    isDense: false,
                                    labelText: 'Device ID',
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                      fontFamily: 'Rubik',
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.normal,
                                      shadows: [
                                        Shadow(
                                          color: FlutterFlowTheme.of(context)
                                              .customColor1,
                                          offset: Offset(0.0, 2.0),
                                          blurRadius: 40.0,
                                        )
                                      ],
                                    ),
                                    alignLabelWithHint: false,
                                    hintText: 'DeviceID',
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Rubik',
                                          letterSpacing: 0.0,
                                        ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    filled: true,
                                    fillColor:
                                        FlutterFlowTheme.of(context).alternate,
                                    contentPadding: EdgeInsets.all(20.0),
                                    hoverColor: FlutterFlowTheme.of(context)
                                        .customColor1,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Rubik',
                                        letterSpacing: 0.0,
                                      ),
                                  cursorColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                  validator: _model
                                      .deviceIdTextControllerValidator
                                      .asValidator(context),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(1.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsets.all(5.0),
                                    child: FlutterFlowIconButton(
                                      borderRadius: 40.0,
                                      buttonSize: 40.0,
                                      hoverColor: Colors.transparent,
                                      hoverIconColor:
                                          FlutterFlowTheme.of(context)
                                              .secondary,
                                      icon: FaIcon(
                                        FontAwesomeIcons.solidCopy,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 16.0,
                                      ),
                                      onPressed: () async {
                                        await Clipboard.setData(ClipboardData(
                                            text:
                                                widget!.device!.reference.id));
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Stack(
                            alignment: AlignmentDirectional(1.0, 0.0),
                            children: [
                              TextFormField(
                                controller: _model.secretKeyTextController,
                                focusNode: _model.secretKeyFocusNode,
                                autofocus: false,
                                readOnly: true,
                                obscureText: !_model.secretKeyVisibility,
                                decoration: InputDecoration(
                                  isDense: false,
                                  labelText: 'Secret Key',
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Rubik',
                                        letterSpacing: 0.0,
                                      ),
                                  alignLabelWithHint: false,
                                  hintText: 'SecretKey',
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Rubik',
                                        letterSpacing: 0.0,
                                      ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  filled: true,
                                  fillColor:
                                      FlutterFlowTheme.of(context).alternate,
                                  contentPadding: EdgeInsets.all(20.0),
                                  hoverColor:
                                      FlutterFlowTheme.of(context).customColor1,
                                  suffixIcon: InkWell(
                                    onTap: () => safeSetState(
                                      () => _model.secretKeyVisibility =
                                          !_model.secretKeyVisibility,
                                    ),
                                    focusNode: FocusNode(skipTraversal: true),
                                    child: Icon(
                                      _model.secretKeyVisibility
                                          ? Icons.visibility_outlined
                                          : Icons.visibility_off_outlined,
                                      color: Colors.transparent,
                                      size: 0.0,
                                    ),
                                  ),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Rubik',
                                      letterSpacing: 0.0,
                                    ),
                                cursorColor:
                                    FlutterFlowTheme.of(context).primaryText,
                                validator: _model
                                    .secretKeyTextControllerValidator
                                    .asValidator(context),
                              ),
                              Align(
                                alignment: AlignmentDirectional(1.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: FlutterFlowIconButton(
                                    borderRadius: 40.0,
                                    buttonSize: 40.0,
                                    hoverColor: Colors.transparent,
                                    hoverIconColor:
                                        FlutterFlowTheme.of(context).secondary,
                                    icon: FaIcon(
                                      FontAwesomeIcons.solidCopy,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 16.0,
                                    ),
                                    onPressed: () async {
                                      await Clipboard.setData(ClipboardData(
                                          text:
                                              _model.deviceKey!.privateRawKey));
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ].divide(SizedBox(height: 5.0)),
                      ),
                    ),
                  ),
                ),
              ].divide(SizedBox(width: 5.0)),
            ),
          );
        } else {
          return Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: wrapWithModel(
              model: _model.loadingModel,
              updateCallback: () => safeSetState(() {}),
              child: LoadingWidget(),
            ),
          );
        }
      },
    );
  }
}
