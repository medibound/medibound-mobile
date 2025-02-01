import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/utils/dropdown/profile_list/profile_list_widget.dart';
import 'dart:ui';
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'profile_dropdown_model.dart';
export 'profile_dropdown_model.dart';

class ProfileDropdownWidget extends StatefulWidget {
  const ProfileDropdownWidget({
    super.key,
    required this.width,
    required this.label,
    required this.collectionType,
  });

  final double? width;
  final String? label;
  final CollectionProfiles? collectionType;

  @override
  State<ProfileDropdownWidget> createState() => _ProfileDropdownWidgetState();
}

class _ProfileDropdownWidgetState extends State<ProfileDropdownWidget> {
  late ProfileDropdownModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfileDropdownModel());

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
          child: Container(
            width: widget!.width,
            child: TextFormField(
              controller: _model.textController,
              focusNode: _model.textFieldFocusNode,
              autofocus: false,
              readOnly: true,
              obscureText: false,
              decoration: InputDecoration(
                isDense: true,
                labelText: widget!.label,
                labelStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Rubik',
                      letterSpacing: 0.0,
                    ),
                alignLabelWithHint: true,
                hintText: 'Select ${widget!.label}',
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
                contentPadding:
                    EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
                hoverColor: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Rubik',
                    letterSpacing: 0.0,
                  ),
              textAlign: TextAlign.start,
              keyboardType: TextInputType.datetime,
              cursorColor: FlutterFlowTheme.of(context).primaryText,
              validator: _model.textControllerValidator.asValidator(context),
            ),
          ),
        ),
        Builder(
          builder: (context) => Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
            child: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                await showAlignedDialog(
                  context: context,
                  isGlobal: false,
                  avoidOverflow: true,
                  targetAnchor: AlignmentDirectional(-1.0, 1.0)
                      .resolve(Directionality.of(context)),
                  followerAnchor: AlignmentDirectional(-1.0, -1.0)
                      .resolve(Directionality.of(context)),
                  builder: (dialogContext) {
                    return Material(
                      color: Colors.transparent,
                      child: ProfileListWidget(
                        width: widget!.width!,
                        collectionType: widget!.collectionType!,
                        action: (profile) async {
                          _model.profile = profile;
                          safeSetState(() {});
                        },
                      ),
                    );
                  },
                );

                if (_model.profile != null) {
                  safeSetState(() {
                    _model.textController?.text = ' ';
                    _model.textFieldFocusNode?.requestFocus();
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      _model.textController?.selection =
                          TextSelection.collapsed(
                        offset: _model.textController!.text.length,
                      );
                    });
                  });
                }
              },
              child: Container(
                width: double.infinity,
                height: 50.0,
                decoration: BoxDecoration(),
                alignment: AlignmentDirectional(-1.0, 0.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 10.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      if (_model.profile != null)
                        Wrap(
                          spacing: 10.0,
                          runSpacing: 0.0,
                          alignment: WrapAlignment.center,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          direction: Axis.horizontal,
                          runAlignment: WrapAlignment.center,
                          verticalDirection: VerticalDirection.down,
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                              width: 32.0,
                              height: 32.0,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: CachedNetworkImage(
                                fadeInDuration: Duration(milliseconds: 500),
                                fadeOutDuration: Duration(milliseconds: 500),
                                imageUrl: _model.profile != null
                                    ? _model.profile!.photoUrl
                                    : '',
                                fit: BoxFit.cover,
                              ),
                            ),
                            Text(
                              valueOrDefault<String>(
                                _model.profile != null
                                    ? _model.profile?.displayName
                                    : ' ',
                                'Name',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Rubik',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ],
                        ),
                      Spacer(),
                      Builder(
                        builder: (context) {
                          if (_model.profile != null) {
                            return FlutterFlowIconButton(
                              borderRadius: 8.0,
                              buttonSize: 40.0,
                              hoverColor: Colors.transparent,
                              icon: Icon(
                                Icons.close,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 16.0,
                              ),
                              onPressed: () async {
                                _model.profile = null;
                                safeSetState(() {});
                                safeSetState(() {
                                  _model.textController?.clear();
                                });
                              },
                            );
                          } else {
                            return Container(
                              width: 40.0,
                              decoration: BoxDecoration(),
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: FaIcon(
                                FontAwesomeIcons.caretDown,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 16.0,
                              ),
                            );
                          }
                        },
                      ),
                    ].divide(SizedBox(width: 10.0)),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
