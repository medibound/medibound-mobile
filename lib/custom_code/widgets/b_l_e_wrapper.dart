// Automatic FlutterFlow imports
import '/backend/backend.dart';
import "package:medibound_portal_hdztzw/backend/backend.dart"
    as medibound_portal_hdztzw_backend;
import 'package:medibound_portal_hdztzw/backend/schema/structs/index.dart'
    as medibound_portal_hdztzw_data_schema;
import '/backend/schema/structs/index.dart';
import '/actions/actions.dart' as action_blocks;
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

import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class BLEWrapper extends StatefulWidget {
  const BLEWrapper({
    super.key,
    this.width,
    this.height,
    required this.widget,
    required this.loadingWidget,
  });

  final double? width;
  final double? height;
  final Widget Function() widget;
  final Widget Function() loadingWidget;

  @override
  State<BLEWrapper> createState() => _BLEWrapperState();
}

class _BLEWrapperState extends State<BLEWrapper> {
  BluetoothAdapterState _adapterState = BluetoothAdapterState.unknown;

  late StreamSubscription<BluetoothAdapterState> _adapterStateStateSubscription;

  @override
  void initState() {
    super.initState();
    _adapterStateStateSubscription =
        FlutterBluePlus.adapterState.listen((state) {
      _adapterState = state;
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _adapterStateStateSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget screen = _adapterState == BluetoothAdapterState.on
        ? widget.widget() // If Bluetooth is ON, show the passed-in widget
        : widget.loadingWidget();

    return Container(
      child: screen,
    );
  }
}
