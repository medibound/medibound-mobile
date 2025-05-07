// Automatic FlutterFlow imports
import '/backend/backend.dart';
import "package:medibound_portal_hdztzw/backend/backend.dart"
    as medibound_portal_hdztzw_backend;
import "package:medibound_portal_hdztzw/backend/schema/structs/index.dart"
    as medibound_portal_hdztzw_data_schema;
import '/backend/schema/structs/index.dart';
import "package:medibound_portal_hdztzw/backend/schema/structs/index.dart"
    as medibound_portal_hdztzw_data_schema;
import "package:medibound_portal_hdztzw/backend/schema/enums/enums.dart"
    as medibound_portal_hdztzw_enums;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:medibound_mobile/components/mobile_auth_page_widget.dart';
import 'package:medibound_mobile/components/tab_page_model.dart';
import 'package:medibound_mobile/components/tab_page_widget.dart';
import 'package:medibound_mobile/pages/insights_page/insights_page_widget.dart';
import 'package:medibound_mobile/pages/overview_page/overview_page_widget.dart';
import 'package:medibound_mobile/pages/profile_page/profile_page_widget.dart';
import 'package:medibound_mobile/pages/records_list_page/records_list_page_widget.dart';
import 'package:medibound_mobile/pages/streams_page/streams_page_widget.dart';
import 'package:medibound_mobile/pages/wellness_page/wellness_page_widget.dart';
import 'package:medibound_portal_hdztzw/auth/firebase_auth/auth_util.dart';
import 'package:medibound_portal_hdztzw/backend/schema/index.dart';
import 'package:medibound_portal_hdztzw/components/auth_page_widget.dart';
import 'package:medibound_portal_hdztzw/components/home_page_model.dart';
import 'package:medibound_portal_hdztzw/custom_code/actions/index.dart';
import 'package:medibound_portal_hdztzw/custom_code/widgets/auth_gate_widget.dart';
import 'package:medibound_portal_hdztzw/index.dart';
import 'package:medibound_portal_hdztzw/pages/auth/forms/login_page/login_page_widget.dart';
import 'package:medibound_portal_hdztzw/pages/auth/forms/lost_password_page/lost_password_page_widget.dart';
import 'package:medibound_portal_hdztzw/pages/auth/forms/signup_page/signup_page_widget.dart';
import 'package:medibound_portal_hdztzw/pages/auth/forms/verify_email_page/verify_email_page_widget.dart';
import 'package:medibound_portal_hdztzw/pages/auth/forms/waitlist_page/waitlist_page_widget.dart';
import 'package:provider/provider.dart';

import "package:medibound_portal_hdztzw/app_state.dart"
    as medibound_portal_hdztzw_app_state;

class MobileAuthGate extends StatefulWidget {
  final String? section;
  final String? page;
  final String? id;
  final String? tab;
  final double? width;
  final double? height;

  const MobileAuthGate({
    Key? key,
    this.section,
    this.page,
    this.id,
    this.tab,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  _MobileAuthGateState createState() => _MobileAuthGateState();
}

class _MobileAuthGateState extends State<MobileAuthGate> {
  late Stream<User?> _authStateChanges;

  late MobileAuthGateModel _model;

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
    _model = createModel(context, () => MobileAuthGateModel());

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
        if (!snapshot.hasData) {
          // Not signed in

          //

          return wrapWithModel(
            model: _model.mobileAuthPageModel,
            updateCallback: () => {},
            updateOnChange: true,
            child: MobileAuthPageWidget(
              pageWidget: () {
                switch (medibound_portal_hdztzw_app_state.FFAppState()
                    .currentRoute
                    .section) {
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
            model: _model.mobileAuthPageModel,
            updateCallback: () => {},
            updateOnChange: true,
            child: AuthPageWidget(
              pageWidget: () {
                return VerifyEmailPageWidget();
              },
            ),
          );
        } else {
          // Signed in
          return wrapWithModel(
            model: _model.tabPageModel,
            updateCallback: () => {},
            updateOnChange: true,
            child: TabPageWidget(
              pageWidget: () {
                switch (FFAppState().currentRoute.section) {
                  case 'overview':
                    switch (FFAppState().currentRoute.page) {
                      case 'records':
                        return RecordsListPageWidget();
                      default:
                        break;
                    }

                  case 'streams':
                    return StreamsPageWidget();
                  case 'insights':
                    return InsightsPageWidget();
                  case 'wellness':
                    return WellnessPageWidget();
                  case 'profile':
                    return ProfilePageWidget();
                  case 'onboarding':
                    return LoginPageWidget();
                }

                return OverviewPageWidget();
              },
            ),
          );
        }
      },
    );
  }
}

class MobileAuthGateModel extends FlutterFlowModel<MobileAuthGate> {
  ///  State fields for stateful widgets in this component.

  // Model for CreatorLogo component.
  late MobileAuthPageModel mobileAuthPageModel;
  // Models for MenuTile dynamic component.
  late TabPageModel tabPageModel;

  @override
  void initState(BuildContext context) {
    mobileAuthPageModel = createModel(context, () => MobileAuthPageModel());
    tabPageModel = createModel(context, () => TabPageModel());
  }

  @override
  void dispose() {
    mobileAuthPageModel.dispose();
    tabPageModel.dispose();
  }
}
