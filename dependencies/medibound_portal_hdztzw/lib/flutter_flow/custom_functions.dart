import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:ff_commons/flutter_flow/lat_lng.dart';
import 'package:ff_commons/flutter_flow/place.dart';
import 'package:ff_commons/flutter_flow/uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/auth/firebase_auth/auth_util.dart';

List<RoledUserStruct> allRoledUsers(DocumentReference doc) {
  // Returns a list of3 Roled Users (all with the roles of MEMBER,ADMIN, OWNER) that all use the same user document reference
  return [
    createRoledUserStruct(user: doc, role: OrganizationRoleCode.MEMBER),
    createRoledUserStruct(user: doc, role: OrganizationRoleCode.ADMIN),
    createRoledUserStruct(user: doc, role: OrganizationRoleCode.OWNER),
  ];
}

List<DropdownStruct> arraysToDropdown(
  List<String> displays,
  List<String> descriptions,
  List<String> codes,
) {
  // take three arrays of strings and combine them into a list of dropdown datatypes
  List<DropdownStruct> dropdownList = [];

  for (int i = 0; i < displays.length; i++) {
    DropdownStruct dropdown = DropdownStruct(
      display: toTitleCase(displays[i]),
      description: descriptions[i],
      code: codes[i],
    );
    dropdownList.add(dropdown);
  }

  return dropdownList;
}

String? toTitleCase(String input) {
  // convert a string to title case
  if (input.isEmpty) {
    return input;
  }

  List<String> words = input.split(' ');
  List<String> titleCaseWords = [];

  for (String word in words) {
    String firstLetter = word.substring(0, 1).toUpperCase();
    String restOfWord = word.substring(1).toLowerCase();
    titleCaseWords.add('$firstLetter$restOfWord');
  }

  return titleCaseWords.join(' ');
}

List<DropdownStruct>? deviceVariablesToDropdowns(
    List<DeviceVariableStruct>? vars) {
  if (vars == null) return null; // Handle null input

  return vars.map((variable) {
    return DropdownStruct(
      display: variable.info?.display ??
          "", // Assuming 'display' exists in the struct
      description:
          variable.info?.description ?? "", // Assuming 'description' exists
      code: variable.info?.code ?? "", // Assuming 'code' exists
    );
  }).toList();
}

double getBlockWidth(
  double fullHeight,
  String blockType,
  double spacing,
) {
  if (blockType == "SECTION") {
    return (fullHeight * 4) + (spacing * 5) + 4;
  } else if (blockType == "FULL") {
    return (fullHeight * 4) + (spacing * 3) + 6;
  } else if (blockType == "HALF") {
    return (fullHeight * 2) + (spacing);
  } else {
    return fullHeight;
  }
}

String twoToArrayString(
  String type,
  bool isList,
) {
  return type + (isList ? "_ARRAY" : "");
}

VariableDataStruct generateSampleData(
  String type,
  bool isList,
  bool isRanged,
  double? upperBound,
  double? lowerBound,
) {
  // Ensure bounds are valid, fallback to default range (0 to 100.0) if improper
  final double minBound =
      (lowerBound != null && upperBound != null && lowerBound < upperBound)
          ? lowerBound
          : 0.0;
  final double maxBound =
      (lowerBound != null && upperBound != null && lowerBound < upperBound)
          ? upperBound
          : 100.0;

  // Helper function to generate a random number within the range
  double generateRandomNumber() {
    return minBound + math.Random().nextDouble() * (maxBound - minBound);
  }

  // Helper function to generate a list of random numbers
  List<double> generateNumberList(int count) {
    return List.generate(count, (_) => generateRandomNumber());
  }

  // Helper function to generate a list of strings
  List<String> generateStringList(int count) {
    return List.generate(count, (index) => 'String${index + 1}');
  }

  // Generate data based on type
  if (type == "NUMBER") {
    if (isList) {
      return VariableDataStruct(
        number: generateNumberList(20),
        string: [],
      );
    } else {
      return VariableDataStruct(
        number: [generateRandomNumber()],
        string: [],
      );
    }
  } else if (type == "STRING") {
    if (isList) {
      return VariableDataStruct(
        number: [],
        string: generateStringList(20),
      );
    } else {
      return VariableDataStruct(
        number: [],
        string: ["String"],
      );
    }
  } else {
    // Default empty data if the type is unrecognized
    return VariableDataStruct(
      number: [],
      string: [],
    );
  }
}

bool acceptBlock(
  BlockComponentStruct block,
  List<BlockComponentStruct> blockList,
) {
  int total = 0;

  for (BlockComponentStruct b in blockList) {
    if (b.size == "QUARTER") {
      total++;
    } else if (b.size == "HALF") {
      total += 2;
    } else {
      return false;
    }
  }
  if (block.size == "QUARTER") {
    total++;
  } else if (block.size == "HALF") {
    total += 2;
  } else {
    return false;
  }

  if (total <= 4) {
    return true;
  } else {
    return false;
  }
}
