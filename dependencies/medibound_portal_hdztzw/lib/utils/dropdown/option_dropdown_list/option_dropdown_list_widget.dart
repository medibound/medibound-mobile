import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/utils/dropdown/component_profile_tile/component_profile_tile_widget.dart';
import '/utils/empty/empty_widget.dart';
import '/utils/loading/loading_widget.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'option_dropdown_list_model.dart';
export 'option_dropdown_list_model.dart';

class OptionDropdownListWidget extends StatefulWidget {
  const OptionDropdownListWidget({
    super.key,
    required this.width,
    required this.action,
    this.optionsList,
    this.optionType,
    required this.label,
  });

  final double? width;
  final Future Function(DropdownStruct option)? action;
  final List<DropdownStruct>? optionsList;
  final Options? optionType;
  final String? label;

  @override
  State<OptionDropdownListWidget> createState() =>
      _OptionDropdownListWidgetState();
}

class _OptionDropdownListWidgetState extends State<OptionDropdownListWidget> {
  late OptionDropdownListModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OptionDropdownListModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget!.optionType == null) {
        _model.compOptionsList =
            widget!.optionsList!.toList().cast<DropdownStruct>();
        safeSetState(() {});
      } else if (widget!.optionType == Options.UNITS) {
      } else {
        _model.compOptionsList =
            widget!.optionsList!.toList().cast<DropdownStruct>();
        safeSetState(() {});
      }
    });

    _model.searchTextController ??= TextEditingController();
    _model.searchFocusNode ??= FocusNode();
    _model.searchFocusNode!.addListener(() => safeSetState(() {}));
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: widget!.width! > 600.0 ? 600.0 : widget!.width,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            boxShadow: [
              BoxShadow(
                blurRadius: 4.0,
                color: Color(0x33000000),
                offset: Offset(
                  0.0,
                  2.0,
                ),
              )
            ],
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (widget!.optionType != null)
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: TextFormField(
                          controller: _model.searchTextController,
                          focusNode: _model.searchFocusNode,
                          onChanged: (_) => EasyDebounce.debounce(
                            '_model.searchTextController',
                            Duration(milliseconds: 2000),
                            () async {
                              if (widget!.optionType == null) {
                                _model.compOptionsList = widget!.optionsList!
                                    .toList()
                                    .cast<DropdownStruct>();
                                safeSetState(() {});
                              } else if (widget!.optionType == Options.UNITS) {
                                _model.isLoading = true;
                                _model.compOptionsList = [];
                                safeSetState(() {});
                                _model.listResultsCopy =
                                    await APIForUCUMGroup.getUCUMUnitsCall.call(
                                  terms: _model.searchTextController.text,
                                );

                                _model.isLoading = false;
                                safeSetState(() {});
                                if ((_model.listResultsCopy?.succeeded ??
                                        true) ==
                                    true) {
                                  _model.compOptionsList = functions
                                      .arraysToDropdown(
                                          APIForUCUMGroup.getUCUMUnitsCall
                                              .displays(
                                                (_model.listResultsCopy
                                                        ?.jsonBody ??
                                                    ''),
                                              )!
                                              .toList(),
                                          APIForUCUMGroup.getUCUMUnitsCall
                                              .codes(
                                                (_model.listResultsCopy
                                                        ?.jsonBody ??
                                                    ''),
                                              )!
                                              .toList(),
                                          APIForUCUMGroup.getUCUMUnitsCall
                                              .codes(
                                                (_model.listResultsCopy
                                                        ?.jsonBody ??
                                                    ''),
                                              )!
                                              .toList())
                                      .toList()
                                      .cast<DropdownStruct>();
                                  safeSetState(() {});
                                }
                              }

                              safeSetState(() {});
                            },
                          ),
                          autofocus: false,
                          textInputAction: TextInputAction.search,
                          obscureText: false,
                          decoration: InputDecoration(
                            isDense: true,
                            labelStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                              fontFamily: 'Rubik',
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.normal,
                              shadows: [
                                Shadow(
                                  color:
                                      FlutterFlowTheme.of(context).customColor1,
                                  offset: Offset(0.0, 2.0),
                                  blurRadius: 40.0,
                                )
                              ],
                            ),
                            alignLabelWithHint: false,
                            hintText: 'Search ${widget!.label}s...',
                            hintStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Rubik',
                                  letterSpacing: 0.0,
                                ),
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            focusedErrorBorder: InputBorder.none,
                            filled: true,
                            fillColor: FlutterFlowTheme.of(context).alternate,
                            contentPadding: EdgeInsets.all(15.0),
                            hoverColor:
                                FlutterFlowTheme.of(context).customColor1,
                            suffixIcon: _model
                                    .searchTextController!.text.isNotEmpty
                                ? InkWell(
                                    onTap: () async {
                                      _model.searchTextController?.clear();
                                      if (widget!.optionType == null) {
                                        _model.compOptionsList = widget!
                                            .optionsList!
                                            .toList()
                                            .cast<DropdownStruct>();
                                        safeSetState(() {});
                                      } else if (widget!.optionType ==
                                          Options.UNITS) {
                                        _model.isLoading = true;
                                        _model.compOptionsList = [];
                                        safeSetState(() {});
                                        _model.listResultsCopy =
                                            await APIForUCUMGroup
                                                .getUCUMUnitsCall
                                                .call(
                                          terms:
                                              _model.searchTextController.text,
                                        );

                                        _model.isLoading = false;
                                        safeSetState(() {});
                                        if ((_model.listResultsCopy
                                                    ?.succeeded ??
                                                true) ==
                                            true) {
                                          _model.compOptionsList = functions
                                              .arraysToDropdown(
                                                  APIForUCUMGroup
                                                      .getUCUMUnitsCall
                                                      .displays(
                                                        (_model.listResultsCopy
                                                                ?.jsonBody ??
                                                            ''),
                                                      )!
                                                      .toList(),
                                                  APIForUCUMGroup
                                                      .getUCUMUnitsCall
                                                      .codes(
                                                        (_model.listResultsCopy
                                                                ?.jsonBody ??
                                                            ''),
                                                      )!
                                                      .toList(),
                                                  APIForUCUMGroup
                                                      .getUCUMUnitsCall
                                                      .codes(
                                                        (_model.listResultsCopy
                                                                ?.jsonBody ??
                                                            ''),
                                                      )!
                                                      .toList())
                                              .toList()
                                              .cast<DropdownStruct>();
                                          safeSetState(() {});
                                        }
                                      }

                                      safeSetState(() {});
                                      safeSetState(() {});
                                    },
                                    child: Icon(
                                      Icons.clear,
                                      size: 22,
                                    ),
                                  )
                                : null,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Rubik',
                                    letterSpacing: 0.0,
                                  ),
                          cursorColor: FlutterFlowTheme.of(context).primaryText,
                          validator: _model.searchTextControllerValidator
                              .asValidator(context),
                        ),
                      ),
                    ),
                  ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 10.0),
                  child: Text(
                    'Tap to select',
                    style: FlutterFlowTheme.of(context).labelSmall.override(
                          fontFamily: 'Rubik',
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
                Builder(
                  builder: (context) {
                    if (_model.isLoading == false) {
                      return ClipRRect(
                        child: Container(
                          constraints: BoxConstraints(
                            maxHeight: 250.0,
                          ),
                          decoration: BoxDecoration(),
                          child: Builder(
                            builder: (context) {
                              final lists =
                                  _model.compOptionsList.map((e) => e).toList();

                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: lists.length,
                                itemBuilder: (context, listsIndex) {
                                  final listsItem = lists[listsIndex];
                                  return Container(
                                    height: 50.0,
                                    decoration: BoxDecoration(),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        await widget.action?.call(
                                          listsItem,
                                        );
                                        Navigator.pop(context);
                                      },
                                      child: ComponentProfileTileWidget(
                                        key: Key(
                                            'Key6mw_${listsIndex}_of_${lists.length}'),
                                        display: listsItem.display,
                                        subtitle: listsItem.description,
                                        widget: () => EmptyWidget(),
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      );
                    } else {
                      return Container(
                        decoration: BoxDecoration(),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            wrapWithModel(
                              model: _model.loadingModel,
                              updateCallback: () => safeSetState(() {}),
                              child: LoadingWidget(),
                            ),
                          ],
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
