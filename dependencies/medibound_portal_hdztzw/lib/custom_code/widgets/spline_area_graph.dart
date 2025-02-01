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

import 'package:syncfusion_flutter_charts/charts.dart';

class SplineAreaGraph extends StatefulWidget {
  const SplineAreaGraph({
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
  State<SplineAreaGraph> createState() => _SplineAreaGraphState();
}

class _SplineAreaGraphState extends State<SplineAreaGraph> {
  @override
  Widget build(BuildContext context) {
    // Extract the numbers array
    final List<double> numbers =
        widget.variable?.data?.number ?? [1, 2, 3, 4, 5];

    // Take the latest 20 points (or fewer if the array is smaller)
    final List<double> latestNumbers =
        numbers.length > 20 ? numbers.sublist(numbers.length - 20) : numbers;

    // Map the filtered data into ChartData points
    final List<ChartData> chartData = latestNumbers
        .asMap()
        .entries
        .map((entry) => ChartData('Point ${entry.key + 1}', entry.value))
        .toList();

    // Build spline area series
    List<CartesianSeries<ChartData, String>> _buildSplineAreaSeries() {
      return <CartesianSeries<ChartData, String>>[
        SplineAreaSeries<ChartData, String>(
          dataSource: chartData,
          xValueMapper: (ChartData data, _) => data.x,
          yValueMapper: (ChartData data, _) => data.y,
          name: 'Values',
          borderColor: widget.color,
          borderWidth: 1.5, // Border thickness for the line
          gradient: LinearGradient(
            colors: [
              widget.color.withOpacity(0.5),
              widget.color.withOpacity(0)
            ], // Gradient fill
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          splineType: SplineType.cardinal,
          cardinalSplineTension: 0.7,
          markerSettings: MarkerSettings(
            isVisible: true, // Show markers at data points
            height: 3,
            width: 3,
            shape: DataMarkerType.circle,
            borderWidth: 0,
            color: widget.color,
          ),
        ),
      ];
    }

    return SfCartesianChart(
      primaryXAxis: CategoryAxis(
        isVisible: false, // Hide the x-axis
      ),
      primaryYAxis: NumericAxis(
        isVisible: true,
        axisLine: AxisLine(width: 0),
        labelStyle: TextStyle(fontSize: 8),
        rangePadding: ChartRangePadding.round,
        edgeLabelPlacement: EdgeLabelPlacement.shift,
        labelIntersectAction: AxisLabelIntersectAction.none,
        labelAlignment: LabelAlignment.start,
        plotOffset: 0,
        opposedPosition: true,
        majorTickLines: MajorTickLines(width: 0),
        majorGridLines: MajorGridLines(width: 0), // Remove grid lines
        minorGridLines: MinorGridLines(width: 0),
      ),
      plotAreaBorderWidth: 0, // Remove border around the chart area
      margin: EdgeInsets.zero, // Remove outer margin
      series: _buildSplineAreaSeries(),
      legend: Legend(isVisible: false), // Remove the legend
    );
  }
}

// Helper class for chart data
class ChartData {
  ChartData(this.x, this.y);
  final String x;
  final double y;
}
