// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:medibound_ui/medibound_ui.dart';

Future<void> getComponentInfo() async {
  List<BlockTypeStruct> blockList =
      widgetRegistry.entries.map<BlockTypeStruct>((entry) {
    String name = entry.key; // ✅ Get graph name
    GraphBuilderFunction builder = entry.value; // ✅ Get builder function

    // ✅ Ensure context is handled properly
    final GraphWidget graph = builder({}, Colors.blue, MBTimeWindow.auto,
        MBTickerType.last, MBGraphSize.half, 100, DateTime.now());

    return BlockTypeStruct(
      info: CodedValueStruct(display: name, code: name),
      allowedSizes:
          graph.allowedSizes.map((e) => e.toString().split('.').last).toList(),
      allowedVariableTypes: graph.allowedVariableTypes
          .map((e) => e.toString().split('.').last)
          .toList(),
      allowedVariableForms: graph.allowedVariableForms
          .map((e) => e.toString().split('.').last)
          .toList(),
    );
  }).toList(); // ✅ Ensure the map result is converted to List<BlockTypeStruct>

  // ✅ Update FlutterFlow App State
  FFAppState().BlockTypes = blockList;

  List<CodedValueStruct> graphSizeList = MBGraphSize.values
      .map((e) => CodedValueStruct(
          display: e.value.display,
          code: e.value.code,
          description: e.value.description,
          icon: e.value.icon,
          color: e.value.color))
      .toList();

  FFAppState().GraphSizes = graphSizeList;

  List<CodedValueStruct> tickerTypesList = MBTickerType.values
      .map((e) => CodedValueStruct(
          display: e.value.display,
          code: e.value.code,
          description: e.value.description,
          icon: e.value.icon,
          color: e.value.color))
      .toList();

  FFAppState().TickerTypes = tickerTypesList;

  List<CodedValueStruct> timeWindowList = MBTimeWindow.values
      .map((e) => CodedValueStruct(
          display: e.value.display,
          code: e.value.code,
          description: e.value.description,
          icon: e.value.icon,
          color: e.value.color))
      .toList();

  FFAppState().TimeWindows = timeWindowList;

  FFAppState().update(() {});
}
