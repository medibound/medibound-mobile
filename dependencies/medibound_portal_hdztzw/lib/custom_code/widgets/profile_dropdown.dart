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

class ProfileDropdown extends StatefulWidget {
  const ProfileDropdown({
    super.key,
    this.width,
    this.height,
    required this.items,
    required this.hintText,
    required this.onChanged,
    this.initialItem,
    this.circle = false,
  });

  final double? width;
  final double? height;
  final List<ProfileStruct> items;
  final String hintText;
  final Future Function(ProfileStruct item) onChanged;
  final ProfileStruct? initialItem;
  final bool circle;

  @override
  State<ProfileDropdown> createState() => _ProfileDropdownState();
}

class _ProfileDropdownState extends State<ProfileDropdown> {
  MBProfile? selectedItem;

  @override
  void initState() {
    super.initState();
    if (widget.initialItem != null) {
      selectedItem = transformProfile(widget.initialItem!);
    }
  }

  MBProfile transformProfile(ProfileStruct profile) {
    return MBProfile(
        display: profile.displayName,
        description: profile.uid, // Using uid as description
        photoUrl: profile.photoUrl,
        uid: profile.uid);
  }

  ProfileStruct transformMBProfile(MBProfile profile) {
    return ProfileStruct(
      displayName: profile.display,
      uid: profile.description, // Using description as uid
      photoUrl: profile.photoUrl,
    );
  }

  Future<void> handleOnChanged(MBProfile? value) async {
    if (value != null) {
      print(value!.display);
      setState(() {
        selectedItem = value;
      });
      // Wait for the onChanged callback to complete
      await widget.onChanged(transformMBProfile(value!));
    } else {
      setState(() {
        selectedItem = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MbProfileDropdown(
      items: widget.items.map((profile) => transformProfile(profile)).toList(),
      selectedItem: selectedItem,
      onChanged: (value) => handleOnChanged(value),
      hintText: widget.hintText,
      circle: widget.circle,
    );
  }
}
