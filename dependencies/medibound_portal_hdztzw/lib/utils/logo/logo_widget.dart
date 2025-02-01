import '/flutter_flow/flutter_flow_util.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'logo_model.dart';
export 'logo_model.dart';

class LogoWidget extends StatefulWidget {
  const LogoWidget({
    super.key,
    bool? textVisible,
  }) : this.textVisible = textVisible ?? true;

  final bool textVisible;

  @override
  State<LogoWidget> createState() => _LogoWidgetState();
}

class _LogoWidgetState extends State<LogoWidget> {
  late LogoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LogoModel());

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
      child: Container(
        decoration: BoxDecoration(),
        child: Wrap(
          spacing: 7.5,
          runSpacing: 0.0,
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          direction: Axis.horizontal,
          runAlignment: WrapAlignment.center,
          verticalDirection: VerticalDirection.down,
          clipBehavior: Clip.none,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: SvgPicture.asset(
                'dependencies/medibound_portal_hdztzw/assets/images/medibound.svg',
                width: 24.0,
                height: 24.0,
                fit: BoxFit.contain,
              ),
            ),
            GradientText(
              'medibound',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Rubik',
                    fontSize: 18.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.bold,
                    lineHeight: 1.0,
                  ),
              colors: [
                FlutterFlowTheme.of(context).customColor3,
                FlutterFlowTheme.of(context).primaryText
              ],
              gradientDirection: GradientDirection.ttb,
              gradientType: GradientType.linear,
            ),
          ],
        ),
      ),
    );
  }
}
