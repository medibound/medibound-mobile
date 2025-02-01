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

import '../../utils/loading/loading_widget.dart';
import '../../pages/device_profiles/components/subblocks/graph_line/graph_line_widget.dart';
import '../../pages/device_profiles/components/subblocks/graph_radial/graph_radial_widget.dart';
import '../../pages/device_profiles/components/subblocks/graph_column/graph_column_widget.dart';
import '../../pages/device_profiles/components/subblocks/value_num/value_num_widget.dart';
import '../../pages/device_profiles/components/subblocks/value_string/value_string_widget.dart';
import '../../pages/device_profiles/components/subblocks/value_trend/value_trend_widget.dart';

class SubblockSelector extends StatefulWidget {
  const SubblockSelector({
    super.key,
    this.width,
    this.height,
    required this.block,
    required this.color,
  });

  final double? width;
  final double? height;
  final BlockComponentStruct block;
  final Color color;

  @override
  State<SubblockSelector> createState() => _SubblockSelectorState();
}

class _SubblockSelectorState extends State<SubblockSelector> {
  @override
  Widget build(BuildContext context) {
    // Ensure block and required variables exist
    if (widget.block.variables.isEmpty) {
      return LoadingWidget();
    }

    // Get the required variable type and graph type
    final requiredVar = twoToArrayString(
        widget.block.variables[0].type, widget.block.variables[0].isList);
    final graphType = widget.block.subBlock;

    // Return the appropriate widget based on the variable and graph type
    switch (requiredVar) {
      case "NUMBER":
        switch (graphType) {
          case "VALUE_NUM":
            return ValueNumWidget(
                variable: widget.block.variables[0], color: widget.color);
          case "GRAPH_RADIAL":
            return GraphRadialWidget(
                variable: widget.block.variables[0], color: widget.color);
          default:
            return LoadingWidget();
        }

      case "NUMBER_ARRAY":
        switch (graphType) {
          case "GRAPH_LINE":
            return GraphLineWidget(
                variable: widget.block.variables[0], color: widget.color);
          case "GRAPH_COLUMN":
            return GraphColumnWidget(
                variable: widget.block.variables[0], color: widget.color);
          case "GRAPH_RADIAL":
            return GraphRadialWidget(
                variable: widget.block.variables[0], color: widget.color);
          case "VALUE_TREND":
            return ValueTrendWidget(
                variable: widget.block.variables[0], color: widget.color);
          case "VALUE_NUM":
            return ValueNumWidget(
                variable: widget.block.variables[0], color: widget.color);
          default:
            return LoadingWidget();
        }

      case "STRING":
        switch (graphType) {
          case "VALUE_STRING":
            return ValueStringWidget(
                variable: widget.block.variables[0], color: widget.color);
          default:
            return LoadingWidget();
        }

      case "STRING_ARRAY":
        switch (graphType) {
          case "VALUE_STRING":
            return ValueStringWidget(
                variable: widget.block.variables[0], color: widget.color);
          default:
            return LoadingWidget();
        }

      default:
        return LoadingWidget();
    }
  }
}
