import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'creator_logo_model.dart';
export 'creator_logo_model.dart';

class CreatorLogoWidget extends StatefulWidget {
  const CreatorLogoWidget({
    super.key,
    bool? textVisible,
  }) : this.textVisible = textVisible ?? true;

  final bool textVisible;

  @override
  State<CreatorLogoWidget> createState() => _CreatorLogoWidgetState();
}

class _CreatorLogoWidgetState extends State<CreatorLogoWidget> {
  late CreatorLogoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreatorLogoModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10.0,
      runSpacing: 0.0,
      alignment: WrapAlignment.start,
      crossAxisAlignment: WrapCrossAlignment.center,
      direction: Axis.horizontal,
      runAlignment: WrapAlignment.start,
      verticalDirection: VerticalDirection.down,
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 40.0,
          height: 50.0,
          decoration: BoxDecoration(),
          alignment: AlignmentDirectional(0.0, 0.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: SvgPicture.asset(
              Theme.of(context).brightness == Brightness.dark
                  ? 'dependencies/medibound_portal_hdztzw/assets/images/darkmodecreator.svg'
                  : 'dependencies/medibound_portal_hdztzw/assets/images/lightmodecreator.svg',
              width: 45.0,
              height: 40.0,
              fit: BoxFit.contain,
            ),
          ),
        ),
        if (valueOrDefault<bool>(
          widget!.textVisible == true,
          false,
        ))
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'medibound',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Rubik',
                      fontSize: 18.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.bold,
                      lineHeight: 1.0,
                    ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    child: GradientText(
                      'creator',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Rubik',
                            color: FlutterFlowTheme.of(context).secondary,
                            fontSize: 34.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                            lineHeight: 1.0,
                          ),
                      colors: [
                        FlutterFlowTheme.of(context).primary,
                        FlutterFlowTheme.of(context).secondary
                      ],
                      gradientDirection: GradientDirection.ttb,
                      gradientType: GradientType.linear,
                    ),
                  ),
                ],
              ),
            ].divide(SizedBox(height: 0.0)),
          ),
      ],
    );
  }
}
