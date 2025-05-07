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

class IconFromText extends StatefulWidget {
  const IconFromText({
    super.key,
    this.width,
    this.height,
    required this.name,
    required this.size,
    required this.color,
  });

  final double? width;
  final double? height;
  final String name;
  final double size;
  final Color color;

  @override
  State<IconFromText> createState() => _IconFromTextState();
}

class _IconFromTextState extends State<IconFromText> {
  @override
  Widget build(BuildContext context) {
    return Icon(
        iconsMap[widget.name] ??
            Icons.help_outline, // Default icon if not found
        size: widget.size ?? 24.0,
        color: widget.color);
  }
}
