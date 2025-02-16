// Automatic FlutterFlow imports
import '/backend/backend.dart';
import "package:medibound_portal_hdztzw/backend/backend.dart"
    as medibound_portal_hdztzw_backend;
import "package:medibound_portal_hdztzw/backend/schema/structs/index.dart"
    as medibound_portal_hdztzw_data_schema;
import '/backend/schema/structs/index.dart';
import "package:medibound_portal_hdztzw/backend/schema/structs/index.dart"
    as medibound_portal_hdztzw_data_schema;
import "package:medibound_portal_hdztzw/backend/schema/enums/enums.dart"
    as medibound_portal_hdztzw_enums;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:cupertino_battery_indicator/cupertino_battery_indicator.dart';

class Battery extends StatefulWidget {
  const Battery({
    super.key,
    this.width,
    this.height,
    required this.value,
  });

  final double? width;
  final double? height;
  final int value;

  @override
  State<Battery> createState() => _BatteryState();
}

class _BatteryState extends State<Battery> {
  double _normalizeBatteryValue(int value) {
    int clippedValue = value.clamp(0, 100); // Clip value between 0 and 100
    return clippedValue / 100; // Convert to double between 0 and 1
  }

  @override
  Widget build(BuildContext context) {
    double normalizedValue = _normalizeBatteryValue(widget.value);

    return BatteryIndicator(
      value: normalizedValue,
    );
  }
}
