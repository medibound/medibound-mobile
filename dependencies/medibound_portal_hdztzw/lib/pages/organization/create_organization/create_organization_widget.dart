import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/utils/dropdown/option_dropdown/option_dropdown_widget.dart';
import '/utils/image_picker/image_picker_widget.dart';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'create_organization_model.dart';
export 'create_organization_model.dart';

class CreateOrganizationWidget extends StatefulWidget {
  const CreateOrganizationWidget({super.key});

  @override
  State<CreateOrganizationWidget> createState() =>
      _CreateOrganizationWidgetState();
}

class _CreateOrganizationWidgetState extends State<CreateOrganizationWidget> {
  late CreateOrganizationModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreateOrganizationModel());

    _model.organizationNameTextController ??= TextEditingController();
    _model.organizationNameFocusNode ??= FocusNode();
    _model.organizationNameFocusNode!.addListener(() => safeSetState(() {}));
    _model.websiteTextController ??= TextEditingController();
    _model.websiteFocusNode ??= FocusNode();
    _model.websiteFocusNode!.addListener(() => safeSetState(() {}));
    _model.addressTextController ??= TextEditingController();
    _model.addressFocusNode ??= FocusNode();
    _model.addressFocusNode!.addListener(() => safeSetState(() {}));
    _model.supportEmailTextController ??= TextEditingController();
    _model.supportEmailFocusNode ??= FocusNode();
    _model.supportEmailFocusNode!.addListener(() => safeSetState(() {}));
    _model.privacyPolicyTextController ??= TextEditingController();
    _model.privacyPolicyFocusNode ??= FocusNode();
    _model.privacyPolicyFocusNode!.addListener(() => safeSetState(() {}));
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

    return Stack(
      children: [
        Align(
          alignment: AlignmentDirectional(0.0, 0.0),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 25.0, 0.0, 0.0),
            child: Container(
              width: double.infinity,
              child: PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: _model.pageViewController ??=
                    PageController(initialPage: 0),
                scrollDirection: Axis.horizontal,
                children: [
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Form(
                      key: _model.formKey2,
                      autovalidateMode: AutovalidateMode.disabled,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Wrap(
                            spacing: 0.0,
                            runSpacing: 0.0,
                            alignment: WrapAlignment.start,
                            crossAxisAlignment: WrapCrossAlignment.start,
                            direction: Axis.vertical,
                            runAlignment: WrapAlignment.start,
                            verticalDirection: VerticalDirection.down,
                            clipBehavior: Clip.none,
                            children: [
                              Text(
                                'Basic Information',
                                textAlign: TextAlign.start,
                                style: FlutterFlowTheme.of(context)
                                    .headlineMedium
                                    .override(
                                      fontFamily: 'Rubik',
                                      letterSpacing: 0.0,
                                    ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 4.0, 0.0, 24.0),
                                child: Text(
                                  'Let\'s get started by filling out the form below.',
                                  textAlign: TextAlign.start,
                                  style: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Rubik',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                            ],
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: wrapWithModel(
                              model: _model.imagePickerModel,
                              updateCallback: () => safeSetState(() {}),
                              child: ImagePickerWidget(
                                defaultImage: FFAppConstants.orgProfile,
                                size: 100.0,
                                uploadedImage: _model.uploadedLocalFile1,
                                uploadAction: () async {
                                  final selectedMedia =
                                      await selectMediaWithSourceBottomSheet(
                                    context: context,
                                    maxWidth: 256.00,
                                    maxHeight: 256.00,
                                    allowPhoto: true,
                                    includeDimensions: true,
                                    includeBlurHash: true,
                                    backgroundColor:
                                        FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                    textColor: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    pickerFontFamily: 'Rubik',
                                  );
                                  if (selectedMedia != null &&
                                      selectedMedia.every((m) =>
                                          validateFileFormat(
                                              m.storagePath, context))) {
                                    safeSetState(
                                        () => _model.isDataUploading1 = true);
                                    var selectedUploadedFiles =
                                        <FFUploadedFile>[];

                                    try {
                                      selectedUploadedFiles = selectedMedia
                                          .map((m) => FFUploadedFile(
                                                name: m.storagePath
                                                    .split('/')
                                                    .last,
                                                bytes: m.bytes,
                                                height: m.dimensions?.height,
                                                width: m.dimensions?.width,
                                                blurHash: m.blurHash,
                                              ))
                                          .toList();
                                    } finally {
                                      _model.isDataUploading1 = false;
                                    }
                                    if (selectedUploadedFiles.length ==
                                        selectedMedia.length) {
                                      safeSetState(() {
                                        _model.uploadedLocalFile1 =
                                            selectedUploadedFiles.first;
                                      });
                                    } else {
                                      safeSetState(() {});
                                      return;
                                    }
                                  }
                                },
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 3,
                            child: Wrap(
                              spacing: 0.0,
                              runSpacing: 10.0,
                              alignment: WrapAlignment.start,
                              crossAxisAlignment: WrapCrossAlignment.start,
                              direction: Axis.horizontal,
                              runAlignment: WrapAlignment.start,
                              verticalDirection: VerticalDirection.down,
                              clipBehavior: Clip.none,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 0.0),
                                  child: TextFormField(
                                    controller:
                                        _model.organizationNameTextController,
                                    focusNode: _model.organizationNameFocusNode,
                                    autofocus: false,
                                    textInputAction: TextInputAction.next,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      isDense: false,
                                      labelText: 'Organization Name',
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
                                      hintText: 'Time Machine, Inc.',
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
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      filled: true,
                                      fillColor: FlutterFlowTheme.of(context)
                                          .alternate,
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
                                    keyboardType: TextInputType.name,
                                    cursorColor: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    validator: _model
                                        .organizationNameTextControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 0.0),
                                  child: TextFormField(
                                    controller: _model.websiteTextController,
                                    focusNode: _model.websiteFocusNode,
                                    autofocus: false,
                                    textInputAction: TextInputAction.next,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      isDense: false,
                                      labelText: 'Website',
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
                                      hintText: 'https://outtatime1985.com',
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
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      filled: true,
                                      fillColor: FlutterFlowTheme.of(context)
                                          .alternate,
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
                                    keyboardType: TextInputType.url,
                                    cursorColor: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    validator: _model
                                        .websiteTextControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                                wrapWithModel(
                                  model: _model.organizationCategoryModel,
                                  updateCallback: () => safeSetState(() {}),
                                  child: OptionDropdownWidget(
                                    width: MediaQuery.sizeOf(context).width,
                                    label: 'Organization Category',
                                    optionsList: FFAppState().OrganizationTypes,
                                    onSelected: (optionSelected) async {},
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 20.0, 0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      if (_model.formKey2.currentState ==
                                              null ||
                                          !_model.formKey2.currentState!
                                              .validate()) {
                                        return;
                                      }
                                      await _model.pageViewController?.nextPage(
                                        duration: Duration(milliseconds: 300),
                                        curve: Curves.ease,
                                      );
                                    },
                                    text: 'Next',
                                    options: FFButtonOptions(
                                      height: 40.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 16.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Rubik',
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                          ),
                                      elevation: 0.0,
                                      borderRadius: BorderRadius.circular(10.0),
                                      hoverColor: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      hoverTextColor:
                                          FlutterFlowTheme.of(context)
                                              .secondary,
                                      hoverElevation: 0.0,
                                    ),
                                  ),
                                ),
                              ].divide(SizedBox(width: 10.0)),
                            ),
                          ),
                        ].divide(SizedBox(height: 10.0)),
                      ),
                    ),
                  ),
                  Form(
                    key: _model.formKey1,
                    autovalidateMode: AutovalidateMode.disabled,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Wrap(
                          spacing: 0.0,
                          runSpacing: 0.0,
                          alignment: WrapAlignment.start,
                          crossAxisAlignment: WrapCrossAlignment.start,
                          direction: Axis.vertical,
                          runAlignment: WrapAlignment.start,
                          verticalDirection: VerticalDirection.down,
                          clipBehavior: Clip.none,
                          children: [
                            Text(
                              'Contact Information',
                              textAlign: TextAlign.start,
                              style: FlutterFlowTheme.of(context)
                                  .headlineMedium
                                  .override(
                                    fontFamily: 'Rubik',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 4.0, 0.0, 24.0),
                              child: Text(
                                'Expand how users can reach your organization',
                                textAlign: TextAlign.start,
                                style: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'Rubik',
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                          ],
                        ),
                        Wrap(
                          spacing: 0.0,
                          runSpacing: 10.0,
                          alignment: WrapAlignment.start,
                          crossAxisAlignment: WrapCrossAlignment.start,
                          direction: Axis.horizontal,
                          runAlignment: WrapAlignment.start,
                          verticalDirection: VerticalDirection.down,
                          clipBehavior: Clip.none,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 0.0),
                              child: TextFormField(
                                controller: _model.addressTextController,
                                focusNode: _model.addressFocusNode,
                                autofocus: false,
                                textInputAction: TextInputAction.next,
                                obscureText: false,
                                decoration: InputDecoration(
                                  isDense: false,
                                  labelText: 'Organization Address',
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
                                  hintText:
                                      '1327 Railroad St, Hill Valley, CA, USA',
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
                                      color:
                                          FlutterFlowTheme.of(context).primary,
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
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Rubik',
                                      letterSpacing: 0.0,
                                    ),
                                keyboardType: TextInputType.streetAddress,
                                cursorColor:
                                    FlutterFlowTheme.of(context).primaryText,
                                validator: _model.addressTextControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 0.0),
                              child: TextFormField(
                                controller: _model.supportEmailTextController,
                                focusNode: _model.supportEmailFocusNode,
                                autofocus: false,
                                textInputAction: TextInputAction.next,
                                obscureText: false,
                                decoration: InputDecoration(
                                  isDense: false,
                                  labelText: 'Support Email',
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
                                  hintText: 'support@outtatime1985.com',
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
                                      color:
                                          FlutterFlowTheme.of(context).primary,
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
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Rubik',
                                      letterSpacing: 0.0,
                                    ),
                                keyboardType: TextInputType.emailAddress,
                                cursorColor:
                                    FlutterFlowTheme.of(context).primaryText,
                                validator: _model
                                    .supportEmailTextControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 0.0),
                              child: TextFormField(
                                controller: _model.privacyPolicyTextController,
                                focusNode: _model.privacyPolicyFocusNode,
                                autofocus: false,
                                textInputAction: TextInputAction.done,
                                obscureText: false,
                                decoration: InputDecoration(
                                  isDense: false,
                                  labelText: 'Privacy Policy',
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
                                  hintText:
                                      'https://outtatime1985.com/privacy-policy',
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
                                      color:
                                          FlutterFlowTheme.of(context).primary,
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
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Rubik',
                                      letterSpacing: 0.0,
                                    ),
                                keyboardType: TextInputType.url,
                                cursorColor:
                                    FlutterFlowTheme.of(context).primaryText,
                                validator: _model
                                    .privacyPolicyTextControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 20.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    await _model.pageViewController
                                        ?.previousPage(
                                      duration: Duration(milliseconds: 300),
                                      curve: Curves.ease,
                                    );
                                  },
                                  text: 'Back',
                                  options: FFButtonOptions(
                                    height: 40.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: Color(0x00E0E3E7),
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Rubik',
                                          color: FlutterFlowTheme.of(context)
                                              .secondary,
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                        ),
                                    elevation: 0.0,
                                    borderRadius: BorderRadius.circular(10.0),
                                    hoverColor: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    hoverTextColor:
                                        FlutterFlowTheme.of(context).secondary,
                                    hoverElevation: 0.0,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    final firestoreBatch =
                                        FirebaseFirestore.instance.batch();
                                    try {
                                      if (_model.formKey1.currentState ==
                                              null ||
                                          !_model.formKey1.currentState!
                                              .validate()) {
                                        return;
                                      }
                                      if (_model.uploadedLocalFile1 != null &&
                                          (_model.uploadedLocalFile1.bytes
                                                  ?.isNotEmpty ??
                                              false)) {
                                        {
                                          safeSetState(() =>
                                              _model.isDataUploading2 = true);
                                          var selectedUploadedFiles =
                                              <FFUploadedFile>[];
                                          var selectedMedia = <SelectedFile>[];
                                          var downloadUrls = <String>[];
                                          try {
                                            selectedUploadedFiles = _model
                                                    .uploadedLocalFile1
                                                    .bytes!
                                                    .isNotEmpty
                                                ? [_model.uploadedLocalFile1]
                                                : <FFUploadedFile>[];
                                            selectedMedia =
                                                selectedFilesFromUploadedFiles(
                                              selectedUploadedFiles,
                                            );
                                            downloadUrls = (await Future.wait(
                                              selectedMedia.map(
                                                (m) async => await uploadData(
                                                    m.storagePath, m.bytes),
                                              ),
                                            ))
                                                .where((u) => u != null)
                                                .map((u) => u!)
                                                .toList();
                                          } finally {
                                            _model.isDataUploading2 = false;
                                          }
                                          if (selectedUploadedFiles.length ==
                                                  selectedMedia.length &&
                                              downloadUrls.length ==
                                                  selectedMedia.length) {
                                            safeSetState(() {
                                              _model.uploadedLocalFile2 =
                                                  selectedUploadedFiles.first;
                                              _model.uploadedFileUrl2 =
                                                  downloadUrls.first;
                                            });
                                          } else {
                                            safeSetState(() {});
                                            return;
                                          }
                                        }

                                        safeSetState(() {
                                          _model.isDataUploading1 = false;
                                          _model.uploadedLocalFile1 =
                                              FFUploadedFile(
                                                  bytes:
                                                      Uint8List.fromList([]));
                                        });
                                      }

                                      var organizationsRecordReference =
                                          OrganizationsRecord.collection.doc();
                                      firestoreBatch
                                          .set(organizationsRecordReference, {
                                        ...createOrganizationsRecordData(
                                          email: _model
                                              .supportEmailTextController.text,
                                          address:
                                              _model.addressTextController.text,
                                          website:
                                              _model.websiteTextController.text,
                                          privacyPolicy: _model
                                              .privacyPolicyTextController.text,
                                          type: _model.organizationCategoryModel
                                              .option?.code,
                                          profile: createProfileStruct(
                                            displayName: _model
                                                .organizationNameTextController
                                                .text,
                                            photoUrl: _model.uploadedFileUrl2,
                                            profileType: CollectionProfiles
                                                .ORGANIZATIONS,
                                            clearUnsetFields: false,
                                            create: true,
                                          ),
                                        ),
                                        ...mapToFirestore(
                                          {
                                            'created_time':
                                                FieldValue.serverTimestamp(),
                                            'edited_time':
                                                FieldValue.serverTimestamp(),
                                            'members': [
                                              getRoledUserFirestoreData(
                                                updateRoledUserStruct(
                                                  RoledUserStruct(
                                                    user: currentUserReference,
                                                    role: OrganizationRoleCode
                                                        .OWNER,
                                                  ),
                                                  clearUnsetFields: false,
                                                  create: true,
                                                ),
                                                true,
                                              )
                                            ],
                                          },
                                        ),
                                      });
                                      _model.organization = OrganizationsRecord
                                          .getDocumentFromData({
                                        ...createOrganizationsRecordData(
                                          email: _model
                                              .supportEmailTextController.text,
                                          address:
                                              _model.addressTextController.text,
                                          website:
                                              _model.websiteTextController.text,
                                          privacyPolicy: _model
                                              .privacyPolicyTextController.text,
                                          type: _model.organizationCategoryModel
                                              .option?.code,
                                          profile: createProfileStruct(
                                            displayName: _model
                                                .organizationNameTextController
                                                .text,
                                            photoUrl: _model.uploadedFileUrl2,
                                            profileType: CollectionProfiles
                                                .ORGANIZATIONS,
                                            clearUnsetFields: false,
                                            create: true,
                                          ),
                                        ),
                                        ...mapToFirestore(
                                          {
                                            'created_time': DateTime.now(),
                                            'edited_time': DateTime.now(),
                                            'members': [
                                              getRoledUserFirestoreData(
                                                updateRoledUserStruct(
                                                  RoledUserStruct(
                                                    user: currentUserReference,
                                                    role: OrganizationRoleCode
                                                        .OWNER,
                                                  ),
                                                  clearUnsetFields: false,
                                                  create: true,
                                                ),
                                                true,
                                              )
                                            ],
                                          },
                                        ),
                                      }, organizationsRecordReference);

                                      firestoreBatch.update(
                                          _model.organization!.reference,
                                          createOrganizationsRecordData(
                                            profile: createProfileStruct(
                                              uid: _model
                                                  .organization?.reference.id,
                                              clearUnsetFields: false,
                                            ),
                                          ));
                                      Navigator.pop(context);
                                    } finally {
                                      await firestoreBatch.commit();
                                    }

                                    safeSetState(() {});
                                  },
                                  text: 'Create Organization',
                                  options: FFButtonOptions(
                                    height: 40.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context).primary,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Rubik',
                                          color: Colors.white,
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                        ),
                                    elevation: 0.0,
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                              ),
                            ].divide(SizedBox(width: 10.0)),
                          ),
                        ),
                      ].divide(SizedBox(height: 10.0)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
          child: Text(
            'New Organization',
            textAlign: TextAlign.start,
            style: FlutterFlowTheme.of(context).labelMedium.override(
                  fontFamily: 'Rubik',
                  color: FlutterFlowTheme.of(context).secondary,
                  letterSpacing: 0.0,
                ),
          ),
        ),
      ],
    );
  }
}
