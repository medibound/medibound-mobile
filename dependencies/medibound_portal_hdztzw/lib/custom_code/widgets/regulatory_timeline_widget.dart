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

import 'dart:convert';

class RegulatoryTimelineWidget extends StatefulWidget {
  const RegulatoryTimelineWidget({
    super.key,
    this.width,
    this.height,
    this.initialTimeline,
    required this.onUpdate,
  });

  final double? width;
  final double? height;
  final String? initialTimeline;
  final Future Function(String timeline) onUpdate;

  @override
  State<RegulatoryTimelineWidget> createState() =>
      _RegulatoryTimelineWidgetState();
}

class _RegulatoryTimelineWidgetState extends State<RegulatoryTimelineWidget> {
  @override
  Widget build(BuildContext context) {
    return RegulatoryTimeline(
        initialTimelineData: widget.initialTimeline ?? "",
        onUpdate: (timeline) => {
              widget.onUpdate(json.encode(timeline.toJson())),
            });
  }
}
