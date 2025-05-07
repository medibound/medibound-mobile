import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'auth_header_model.dart';
export 'auth_header_model.dart';

class AuthHeaderWidget extends StatefulWidget {
  const AuthHeaderWidget({super.key});

  @override
  State<AuthHeaderWidget> createState() => _AuthHeaderWidgetState();
}

class _AuthHeaderWidgetState extends State<AuthHeaderWidget> {
  late AuthHeaderModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AuthHeaderModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
      child: Visibility(
        visible: responsiveVisibility(
          context: context,
          phone: false,
          tablet: false,
        ),
        child: Padding(
          padding: EdgeInsets.all(30.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              MouseRegion(
                opaque: false,
                cursor: MouseCursor.defer ?? MouseCursor.defer,
                child: AnimatedOpacity(
                  opacity: _model.logoOpacity,
                  duration: 300.0.ms,
                  curve: Curves.easeInOut,
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      await launchURL('https://medibound.com');
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: SvgPicture.asset(
                        'packages/medibound_portal_hdztzw/assets/images/medibound.svg',
                        width: 30.0,
                        height: 32.5,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                onEnter: ((event) async {
                  safeSetState(() => _model.mouseRegionHovered = true);
                  _model.logoOpacity = 1.0;
                  safeSetState(() {});
                }),
                onExit: ((event) async {
                  safeSetState(() => _model.mouseRegionHovered = false);
                  _model.logoOpacity = 0.5;
                  safeSetState(() {});
                }),
              ),
              FaIcon(
                FontAwesomeIcons.chevronRight,
                color: FlutterFlowTheme.of(context).secondaryText,
                size: 16.0,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: SvgPicture.asset(
                  Theme.of(context).brightness == Brightness.dark
                      ? 'packages/medibound_portal_hdztzw/assets/images/darkmodecreator.svg'
                      : 'packages/medibound_portal_hdztzw/assets/images/lightmodecreator.svg',
                  width: 30.0,
                  height: 32.5,
                  fit: BoxFit.contain,
                ),
              ),
            ].divide(SizedBox(width: 15.0)),
          ),
        ),
      ),
    );
  }
}
