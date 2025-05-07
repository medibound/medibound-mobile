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

import 'package:medibound_ui/medibound_ui.dart';

class Component extends StatefulWidget {
  const Component({
    super.key,
    this.width,
    this.height,
    this.totalHeight,
    this.variable,
    required this.block,
  });

  final double? width;
  final double? height;
  final double? totalHeight;
  final VariableStruct? variable;
  final BlockComponentStruct block;

  @override
  State<Component> createState() => _ComponentState();
}

class _ComponentState extends State<Component> {
  @override
  Widget build(BuildContext context) {
    return getWidget(
      widget.block.blockType,
      widget.block.color ?? Colors.blue,
      widget.block!.graphSize,
      widget.variable!.editedTime ?? DateTime.now(),
      widget.variable?.toMap() ?? mockVariable,
      timeWindowStr: widget.block.timeWindow ?? 'auto',
      tickerTypeStr: widget.block.tickerType ?? 'last',
      height: widget.totalHeight ?? 100,
    );
  }
}
