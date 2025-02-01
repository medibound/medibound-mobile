// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:syncfusion_flutter_gauges/gauges.dart';

class RadialGraph extends StatefulWidget {
  const RadialGraph({
    super.key,
    this.width,
    this.height,
    required this.variable,
    required this.color,
  });

  final double? width;
  final double? height;
  final DeviceVariableStruct variable;
  final Color color;

  @override
  State<RadialGraph> createState() => _RadialGraphState();
}

class _RadialGraphState extends State<RadialGraph> {
  @override
  Widget build(BuildContext context) {
    // Extract the numbers array
    final List<double> numbers =
        widget.variable?.data?.number ?? [0]; // Fallback to 0 if no data

    // Get the last value from the list (or fallback to 0 if the list is empty)
    final double lastNumber = numbers.isNotEmpty ? numbers.last : 0;

    // Calculate the percentage to display
    final double percentage = (lastNumber.clamp(0, 100)).toDouble();

    return SfRadialGauge(
      axes: <RadialAxis>[
        RadialAxis(
          minimum: 0,
          maximum: 100,
          startAngle: 270,
          endAngle: 270,
          showTicks: false,
          radiusFactor: 1,
          canScaleToFit: true,
          showLabels: false,
          axisLineStyle: AxisLineStyle(
            thickness: 0.2,
            thicknessUnit: GaugeSizeUnit.factor,
            color: widget.color.withOpacity(0.2), // Background color
          ),
          pointers: <GaugePointer>[
            RangePointer(
              value: percentage,
              cornerStyle: CornerStyle.bothCurve,
              width: 0.2,
              sizeUnit: GaugeSizeUnit.factor,
              gradient: SweepGradient(
                colors: [widget.color, widget.color.withOpacity(0.5)],
                stops: [0.2, 1.0],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
