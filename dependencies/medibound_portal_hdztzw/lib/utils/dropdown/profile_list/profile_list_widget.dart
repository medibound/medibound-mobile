import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/utils/dropdown/component_profile_tile/component_profile_tile_widget.dart';
import '/utils/empty/empty_widget.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'profile_list_model.dart';
export 'profile_list_model.dart';

class ProfileListWidget extends StatefulWidget {
  const ProfileListWidget({
    super.key,
    required this.width,
    required this.collectionType,
    required this.action,
  });

  final double? width;
  final CollectionProfiles? collectionType;
  final Future Function(ProfileStruct profile)? action;

  @override
  State<ProfileListWidget> createState() => _ProfileListWidgetState();
}

class _ProfileListWidgetState extends State<ProfileListWidget> {
  late ProfileListModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfileListModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget!.collectionType == CollectionProfiles.USERS) {
      } else if (widget!.collectionType == CollectionProfiles.ORGANIZATIONS) {
        _model.organizations = await queryOrganizationsRecordOnce(
          queryBuilder: (organizationsRecord) =>
              organizationsRecord.whereArrayContainsAny(
                  'members',
                  getRoledUserListFirestoreData(
                    functions.allRoledUsers(currentUserReference!),
                  )),
        );
      }

      safeSetState(() {});
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
    context.watch<FFAppState>();

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: () {
            if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
              return widget!.width;
            } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
              return widget!.width;
            } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
              return widget!.width;
            } else {
              return 600.0;
            }
          }(),
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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                          if (widget!.collectionType ==
                              CollectionProfiles.USERS) {
                            safeSetState(
                                () => _model.algoliaSearchResults = null);
                            await UsersRecord.search(
                              term: _model.searchTextController.text,
                            )
                                .then((r) => _model.algoliaSearchResults = r)
                                .onError(
                                    (_, __) => _model.algoliaSearchResults = [])
                                .whenComplete(() => safeSetState(() {}));
                          } else if (widget!.collectionType ==
                              CollectionProfiles.ORGANIZATIONS) {
                            _model.organizationsCopy =
                                await queryOrganizationsRecordOnce(
                              queryBuilder: (organizationsRecord) =>
                                  organizationsRecord.whereArrayContainsAny(
                                      'members',
                                      getRoledUserListFirestoreData(
                                        functions.allRoledUsers(
                                            currentUserReference!),
                                      )),
                            );
                          }

                          safeSetState(() {});

                          safeSetState(() {});
                        },
                      ),
                      autofocus: false,
                      textInputAction: TextInputAction.search,
                      obscureText: false,
                      decoration: InputDecoration(
                        isDense: true,
                        labelStyle:
                            FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Rubik',
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.normal,
                          shadows: [
                            Shadow(
                              color: FlutterFlowTheme.of(context).customColor1,
                              offset: Offset(0.0, 2.0),
                              blurRadius: 40.0,
                            )
                          ],
                        ),
                        alignLabelWithHint: false,
                        hintText: 'Search...',
                        hintStyle:
                            FlutterFlowTheme.of(context).labelMedium.override(
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
                        hoverColor: FlutterFlowTheme.of(context).customColor1,
                        suffixIcon: _model.searchTextController!.text.isNotEmpty
                            ? InkWell(
                                onTap: () async {
                                  _model.searchTextController?.clear();
                                  if (widget!.collectionType ==
                                      CollectionProfiles.USERS) {
                                    safeSetState(() =>
                                        _model.algoliaSearchResults = null);
                                    await UsersRecord.search(
                                      term: _model.searchTextController.text,
                                    )
                                        .then((r) =>
                                            _model.algoliaSearchResults = r)
                                        .onError((_, __) =>
                                            _model.algoliaSearchResults = [])
                                        .whenComplete(
                                            () => safeSetState(() {}));
                                  } else if (widget!.collectionType ==
                                      CollectionProfiles.ORGANIZATIONS) {
                                    _model.organizationsCopy =
                                        await queryOrganizationsRecordOnce(
                                      queryBuilder: (organizationsRecord) =>
                                          organizationsRecord
                                              .whereArrayContainsAny(
                                                  'members',
                                                  getRoledUserListFirestoreData(
                                                    functions.allRoledUsers(
                                                        currentUserReference!),
                                                  )),
                                    );
                                  }

                                  safeSetState(() {});

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
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                child: Text(
                  () {
                    if (_model.searchTextController.text == null ||
                        _model.searchTextController.text == '') {
                      return 'Search to select';
                    } else if (!(_model.algoliaSearchResults != null &&
                        (_model.algoliaSearchResults)!.isNotEmpty)) {
                      return 'No options for query';
                    } else {
                      return 'Tap to select';
                    }
                  }(),
                  style: FlutterFlowTheme.of(context).labelSmall.override(
                        fontFamily: 'Rubik',
                        letterSpacing: 0.0,
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                child: Builder(
                  builder: (context) {
                    if (widget!.collectionType ==
                        CollectionProfiles.ORGANIZATIONS) {
                      return Builder(
                        builder: (context) {
                          final lists = (_model.organizations
                                      ?.map((e) => e)
                                      .toList()
                                      ?.where((e) => e.profile.displayName
                                          .toLowerCase()
                                          .contains(_model
                                              .searchTextController.text
                                              .toLowerCase()))
                                      .toList()
                                      ?.toList() ??
                                  [])
                              .take(5)
                              .toList();

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
                                      listsItem.profile,
                                    );
                                    Navigator.pop(context);
                                  },
                                  child: ComponentProfileTileWidget(
                                    key: Key(
                                        'Keyh8r_${listsIndex}_of_${lists.length}'),
                                    display: listsItem.profile.displayName,
                                    subtitle: FFAppState()
                                        .OrganizationTypes
                                        .where((e) => e.code == listsItem.type)
                                        .toList()
                                        .firstOrNull!
                                        .display,
                                    photoUrl: listsItem.profile.photoUrl,
                                    widget: () => EmptyWidget(),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      );
                    } else {
                      return Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Builder(
                            builder: (context) {
                              if (_model.algoliaSearchResults == null) {
                                return Center(
                                  child: SizedBox(
                                    width: 25.0,
                                    height: 25.0,
                                    child: SpinKitPulse(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 25.0,
                                    ),
                                  ),
                                );
                              }
                              final users =
                                  (_model.algoliaSearchResults?.toList() ?? [])
                                      .take(5)
                                      .toList();

                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: users.length,
                                itemBuilder: (context, usersIndex) {
                                  final usersItem = users[usersIndex];
                                  return Container(
                                    width: 100.0,
                                    height: 50.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        await widget.action?.call(
                                          usersItem.profile,
                                        );
                                        Navigator.pop(context);
                                      },
                                      child: ComponentProfileTileWidget(
                                        key: Key(
                                            'Keyqvo_${usersIndex}_of_${users.length}'),
                                        display: usersItem.profile.displayName,
                                        subtitle: usersItem.email,
                                        photoUrl: usersItem.photoUrl,
                                        widget: () => EmptyWidget(),
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ],
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
