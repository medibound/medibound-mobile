import '/flutter_flow/flutter_flow_util.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'date_picker_model.dart';
export 'date_picker_model.dart';

class DatePickerWidget extends StatefulWidget {
  const DatePickerWidget({
    super.key,
    String? label,
  }) : this.label = label ?? 'Label';

  final String label;

  @override
  State<DatePickerWidget> createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  late DatePickerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DatePickerModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional(1.0, 0.0),
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
          child: TextFormField(
            controller: _model.textController,
            focusNode: _model.textFieldFocusNode,
            onChanged: (_) => EasyDebounce.debounce(
              '_model.textController',
              Duration(milliseconds: 2000),
              () async {
                if (_model.textController.text == null ||
                    _model.textController.text == '') {
                  _model.date = null;
                  safeSetState(() {});
                }
              },
            ),
            autofocus: false,
            readOnly: true,
            obscureText: false,
            decoration: InputDecoration(
              isDense: false,
              labelText: widget!.label,
              labelStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Rubik',
                    letterSpacing: 0.0,
                  ),
              alignLabelWithHint: false,
              hintText: 'Select Date',
              hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
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
              fillColor: FlutterFlowTheme.of(context).alternate,
              contentPadding: EdgeInsets.all(20.0),
              hoverColor: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Rubik',
                  letterSpacing: 0.0,
                ),
            keyboardType: TextInputType.datetime,
            cursorColor: FlutterFlowTheme.of(context).primaryText,
            validator: _model.textControllerValidator.asValidator(context),
          ),
        ),
        InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () async {
            final _datePickedDate = await showDatePicker(
              context: context,
              initialDate: getCurrentTimestamp,
              firstDate: DateTime(1900),
              lastDate: (getCurrentTimestamp ?? DateTime(2050)),
              builder: (context, child) {
                return wrapInMaterialDatePickerTheme(
                  context,
                  child!,
                  headerBackgroundColor: FlutterFlowTheme.of(context).primary,
                  headerForegroundColor: FlutterFlowTheme.of(context).info,
                  headerTextStyle:
                      FlutterFlowTheme.of(context).headlineLarge.override(
                            fontFamily: 'Rubik',
                            fontSize: 32.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                          ),
                  pickerBackgroundColor:
                      FlutterFlowTheme.of(context).secondaryBackground,
                  pickerForegroundColor:
                      FlutterFlowTheme.of(context).primaryText,
                  selectedDateTimeBackgroundColor:
                      FlutterFlowTheme.of(context).primary,
                  selectedDateTimeForegroundColor:
                      FlutterFlowTheme.of(context).info,
                  actionButtonForegroundColor:
                      FlutterFlowTheme.of(context).primaryText,
                  iconSize: 24.0,
                );
              },
            );

            if (_datePickedDate != null) {
              safeSetState(() {
                _model.datePicked = DateTime(
                  _datePickedDate.year,
                  _datePickedDate.month,
                  _datePickedDate.day,
                );
              });
            } else if (_model.datePicked != null) {
              safeSetState(() {
                _model.datePicked = getCurrentTimestamp;
              });
            }
            safeSetState(() {
              _model.textController?.text = dateTimeFormat(
                "yMd",
                _model.datePicked,
                locale: FFLocalizations.of(context).languageCode,
              );
            });
            _model.date = _model.datePicked;
            safeSetState(() {});
          },
          child: Container(
            width: double.infinity,
            height: 57.0,
            decoration: BoxDecoration(),
          ),
        ),
      ],
    );
  }
}
