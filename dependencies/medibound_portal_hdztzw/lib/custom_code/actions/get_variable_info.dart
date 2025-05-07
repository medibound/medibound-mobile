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

Future<void> getVariableInfo() async {
  List<CodedValueStruct> variableFormList = MBVariableForm.values
      .map((e) => CodedValueStruct(
          display: e.value.display,
          code: e.value.code,
          description: e.value.description,
          icon: e.value.icon,
          color: e.value.color))
      .toList();

  FFAppState().VariableForms = variableFormList;

  List<CodedValueStruct> variableTypeList = MBVariableType.values
      .map((e) => CodedValueStruct(
          display: e.value.display,
          code: e.value.code,
          description: e.value.description,
          icon: e.value.icon,
          color: e.value.color))
      .toList();

  FFAppState().VariableTypes = variableTypeList;

  List<VariableStruct> variablePresetList = mBVariablePresets
      .map((e) => VariableStruct(
          info: CodedValueStruct(
              display: e.display,
              description: e.description,
              code: e.code,
              color: e.color,
              icon: e.icon),
          type: e.type,
          unit: e.unit,
          isRanged: e.options != null,
          options: e.options != null
              ? VariableOptionsStruct(
                  range: RangeStruct(
                      lower: e.options!['range']!['lower'],
                      upper: e.options!['range']!['upper']))
              : null))
      .toList();

  FFAppState().VariablePresets = variablePresetList;

  FFAppState().update(() {});
}
