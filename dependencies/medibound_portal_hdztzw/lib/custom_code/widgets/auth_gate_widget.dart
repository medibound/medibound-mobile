// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:async';

import '/auth/firebase_auth/auth_util.dart';
import '/pages/auth/forms/waitlist_page/waitlist_page_widget.dart';

import '/pages/auth/forms/verify_email_page/verify_email_page_widget.dart';

import 'package:provider/provider.dart';

import '/pages/agent_builder_page/agent_builder_page_widget.dart';

import '/pages/device_profiles/manage_device_profiles/manage_device_profiles_widget.dart';

import '/pages/device_studio_page/device_studio_page_widget.dart';
import '/pages/patients_page/patients_page_widget.dart';

import '/components/auth_page_widget.dart';
import '/components/home_page_widget.dart';
import '/pages/auth/forms/login_page/login_page_widget.dart';
import '/pages/auth/forms/lost_password_page/lost_password_page_widget.dart';
import '/pages/auth/forms/signup_page/signup_page_widget.dart';
import '/pages/organization/manage_organizations_page/manage_organizations_page_widget.dart';
import '/pages/organizations_page/organizations_page_widget.dart';

import '/index.dart';

import 'package:firebase_auth/firebase_auth.dart';
import '/auth/firebase_auth/auth_util.dart' as auth_util;

class AuthGateWidget extends StatefulWidget {
  final String? section;
  final String? page;
  final String? id;
  final String? tab;
  final double? width;
  final double? height;

  const AuthGateWidget({
    Key? key,
    this.section,
    this.page,
    this.id,
    this.tab,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  _AuthGateWidgetState createState() => _AuthGateWidgetState();
}

class _AuthGateWidgetState extends State<AuthGateWidget> {
  late Stream<User?> _authStateChanges;

  late AuthGateModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _authStateChanges = FirebaseAuth.instance.authStateChanges();

    // Set initial route
    FFAppState().currentRoute = RouteStruct(
      section: widget.section ?? '',
      page: widget.page ?? '',
      id: widget.id ?? '',
      tab: widget.tab ?? '',
    );

    FFAppState().update(() {});
    _model = createModel(context, () => AuthGateModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Listen to currentRoute changes by accessing it directly in build

    context.watch<FFAppState>();

    return StreamBuilder<User?>(
      stream: _authStateChanges,
      builder: (context, snapshot) {
        if (!snapshot.hasData ||
            snapshot.connectionState == ConnectionState.waiting ||
            snapshot.data == null ||
            currentUserDocument == null) {
          // Not signed in

          WidgetsBinding.instance.addPostFrameCallback((_) {
            // call setState() or notifyListeners() here
            FFAppState().update(
                () => {FFAppState().selectedOrganization = ProfileStruct()});
          });
          //

          return wrapWithModel(
            model: _model.authPageModel,
            updateCallback: () => {},
            updateOnChange: true,
            child: AuthPageWidget(
              pageWidget: () {
                switch (FFAppState().currentRoute.section) {
                  case 'login':
                    return LoginPageWidget();
                  case 'register':
                    return SignupPageWidget();
                  case 'forgot-password':
                    return LostPasswordPageWidget();
                  default:
                    return LoginPageWidget();
                }
              },
            ),
          );
        } else if (!snapshot.data!.emailVerified) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Timer.periodic(const Duration(seconds: 5), (timer) {
              if (currentUserEmailVerified) {
                timer.cancel();
                FFAppState().update(() {});
              }
            });
          });

          return wrapWithModel(
            model: _model.authPageModel,
            updateCallback: () => {},
            updateOnChange: true,
            child: AuthPageWidget(
              pageWidget: () {
                return VerifyEmailPageWidget();
              },
            ),
          );
        } else {
          if (!snapshot.data!.email!.endsWith(".edu") &&
              (currentUserDocument?.whitelisted ?? false) == false) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              FFAppState().update(() {});
            });

            return wrapWithModel(
              model: _model.authPageModel,
              updateCallback: () => {},
              updateOnChange: true,
              child: AuthPageWidget(
                pageWidget: () {
                  return const WaitlistPageWidget();
                },
              ),
            );
          }
          // Signed in
          return wrapWithModel(
            model: _model.homePageModel,
            updateCallback: () => {},
            updateOnChange: true,
            child: HomePageWidget(
              pageWidget: (organizations) {
                if ((!FFAppState().selectedOrganization.hasUid() ||
                        FFAppState().selectedOrganization.uid == "") &&
                    organizations.isNotEmpty) {
                  FFAppState().selectedOrganization =
                      organizations.first.profile;
                  FFAppState().update(() => {});
                }

                if ((organizations == [] || organizations.isEmpty) &&
                    FFAppState().currentRoute.section != 'dashboard' &&
                    FFAppState().currentRoute.page != 'organizations') {
                  return OrganizationsPageWidget(organizations: organizations);
                }

                switch (FFAppState().currentRoute.section) {
                  case 'dashboard':
                    switch (FFAppState().currentRoute.page) {
                      case 'organizations':
                        if (FFAppState().currentRoute.id != null &&
                            FFAppState().currentRoute.id != "") {
                          return ManageOrganizationsPageWidget(
                              organizations: organizations);
                        } else {
                          return OrganizationsPageWidget(
                              organizations: organizations);
                        }
                      default:
                        break;
                    }
                    break;
                  case 'management':
                    switch (FFAppState().currentRoute.page) {
                      case 'patients':
                        return PatientsPageWidget(organizations: organizations);
                      default:
                        break;
                    }
                    break;
                  case 'developers':
                    switch (FFAppState().currentRoute.page) {
                      case 'device-studio':
                        if (FFAppState().currentRoute.id != null &&
                            FFAppState().currentRoute.id != "") {
                          return ManageDeviceProfilesWidget(
                              organizations: organizations);
                        }
                        return DeviceStudioPageWidget(
                            organizations: organizations);
                      case 'agent-builder':
                        if (FFAppState().currentRoute.id != null &&
                            FFAppState().currentRoute.id != "") {
                          // Placeholder if you have a specific widget for ID-based agent builder
                        }
                        return AgentBuilderPageWidget(
                            organizations: organizations);
                      default:
                        break;
                    }
                    break;
                  case 'onboarding':
                    return LoginPageWidget();
                }

                // Fallback
                navigate(
                    context,
                    RouteStruct(section: 'dashboard', page: 'organizations'),
                    null,
                    null);
                return ManageOrganizationsPageWidget(
                    organizations: organizations);
              },
            ),
          );
        }
      },
    );
  }
}

class AuthGateModel extends FlutterFlowModel<AuthGateWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for CreatorLogo component.
  late AuthPageModel authPageModel;
  // Models for MenuTile dynamic component.
  late HomePageModel homePageModel;

  @override
  void initState(BuildContext context) {
    authPageModel = createModel(context, () => AuthPageModel());
    homePageModel = createModel(context, () => HomePageModel());
  }

  @override
  void dispose() {
    authPageModel.dispose();
    homePageModel.dispose();
  }
}
