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

class Dropdown extends StatefulWidget {
  const Dropdown({
    super.key,
    this.width,
    this.height,
    required this.items,
    required this.hintText,
    required this.onChanged,
    this.initialItem,
  });

  final double? width;
  final double? height;
  final List<CodedValueStruct> items;
  final String hintText;
  final Future Function(CodedValueStruct item) onChanged;
  final CodedValueStruct? initialItem;

  @override
  State<Dropdown> createState() => _DropdownState();
}

class _DropdownState extends State<Dropdown> {
  MBInfo? selectedItem;

  @override
  void initState() {
    super.initState();
    if (widget.initialItem != null) {
      selectedItem = transformCoded(widget.initialItem!);
    }
  }

  MBInfo transformCoded(CodedValueStruct info) {
    return MBInfo(
        display: info.display,
        description: info.description,
        code: info.code,
        color: info.color,
        icon: info.icon);
  }

  CodedValueStruct transformMBInfo(MBInfo info) {
    return CodedValueStruct(
        display: info.display,
        description: info.description,
        code: info.code,
        color: info.color,
        icon: info.icon);
  }

  Future<void> handleOnChanged(MBInfo? value) async {
    setState(() {
      selectedItem = value;
    });
    if (value != null) {
      // Only call parent callback when a value is selected
      await widget.onChanged(transformMBInfo(value));
    }
  }

  @override
  void didUpdateWidget(Dropdown oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Handle initialItem changes from parent
    if (widget.initialItem != oldWidget.initialItem) {
      setState(() {
        selectedItem = widget.initialItem != null
            ? transformCoded(widget.initialItem!)
            : null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final itemsKey = widget.items.map((i) => i.code).join('_');

    return MBDropdown(
      key: ValueKey(itemsKey),
      items: widget.items.map((info) => transformCoded(info)).toList(),
      selectedItem: selectedItem,
      onChanged: (value) => handleOnChanged(value),
      hintText: widget.hintText,
    );
  }
}
