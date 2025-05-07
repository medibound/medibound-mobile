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

List<CodedValueStruct> arraysToDropdown(
  List<String> displays,
  List<String> descriptions,
  List<String> codes,
) {
  // take three arrays of strings and combine them into a list of dropdown datatypes
  List<CodedValueStruct> dropdownList = [];

  for (int i = 0; i < displays.length; i++) {
    CodedValueStruct dropdown = CodedValueStruct(
      display: toTitleCase(displays[i]),
      description: descriptions[i],
      code: codes[i],
    );
    dropdownList.add(dropdown);
  }

  return dropdownList;
}

String toCamelCase(String input) {
  List<String> words = input.split(RegExp(r'\s+'));

  if (words.isEmpty) return '';

  words[0] = words[0].toLowerCase();
  for (int i = 1; i < words.length; i++) {
    words[i] = words[i].replaceFirst(
      RegExp(r'^.'),
      words[i][0].toUpperCase(),
    );
  }

  return words.join('');
}

List<CodedValueStruct> deviceVariablesToDropdowns(List<VariableStruct> vars) {
  if (vars == null) return []; // Handle null input

  return vars.map((variable) {
    return CodedValueStruct(
      display: variable.info?.display ??
          "", // Assuming 'display' exists in the struct
      description:
          variable.info?.description ?? "", // Assuming 'description' exists
      code: variable.info?.code ?? "",
      color: variable.info?.color ?? null,
      icon: variable.info?.icon ?? "", // Assuming 'code' exists
    );
  }).toList();
}

List<VariableStruct> insertVarListData(
  List<VariableStruct> varList,
  dynamic json,
) {
  List<VariableStruct> returnValue = [];
  final now = DateTime.now(); // Reference timestamp

  for (var variable in varList) {
    if (!json.containsKey(variable.info.code)) continue;

    var value = json[variable.info.code];
    print(value);

    // Handling Number Type Variables
    if (variable.type == 'number') {
      if (value is List) {
        // Create ordered DataPointStruct list with sequential timestamps
        variable.data = List<DataPointStruct>.generate(value.length, (index) {
          return DataPointStruct(
            data: value[index] is num
                ? value[index].toString()
                : (double.tryParse(value[index].toString()) ?? 0.0).toString(),
            timestamp: now.subtract(Duration(minutes: index)),
          );
        });
      } else if (value is num) {
        // Store a single value with latest timestamp
        variable.data = [
          DataPointStruct(
            data: value.toString(),
            timestamp: now,
          ),
        ];
      } else {
        variable.data = [];
      }
      variable.editedTime = DateTime.now();

      returnValue.add(variable);
      continue; // Move to the next variable
    }

    // Handling String Type Variables
    if (variable.type == 'string') {
      if (value is List) {
        // Create ordered DataPointStruct list with sequential timestamps
        variable.data = List<DataPointStruct>.generate(value.length, (index) {
          return DataPointStruct(
            data: value[index].toString(),
            timestamp: now.subtract(Duration(minutes: index)),
          );
        });
      } else {
        // Store a single value with latest timestamp
        variable.data = [
          DataPointStruct(
            data: value.toString(),
            timestamp: now,
          ),
        ];
      }
      variable.editedTime = DateTime.now();

      returnValue.add(variable);
      continue; // Move to the next variable
    }
  }

  print(returnValue);
  return returnValue;
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

List<DataPointStruct> generateSampleData(
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

  final now = DateTime.now();
  final random = math.Random();

  // Helper function to generate a random number within the range
  double generateRandomNumber() {
    return minBound + random.nextDouble() * (maxBound - minBound);
  }

  // Function to generate a timestamp with equal intervals over 365 days
  DateTime generateEqualIntervalTimestamp(
      int index, int totalPoints, Duration interval) {
    return now.subtract(
        interval * (totalPoints - index - 1)); // Spread across the total range
  }

  // Function to generate a single DataPointStruct instance
  DataPointStruct generateSingleDataPoint(
      int index, int totalPoints, Duration interval) {
    return DataPointStruct(
      data: generateRandomNumber().toString(),
      timestamp: generateEqualIntervalTimestamp(index, totalPoints, interval),
    );
  }

  List<DataPointStruct> generateDataForTimeSpan(
      int totalPoints, Duration interval) {
    return List.generate(totalPoints,
        (index) => generateSingleDataPoint(index, totalPoints, interval));
  }

  // 365 points from the past year, spaced by days
  List<DataPointStruct> yearData =
      generateDataForTimeSpan(72, Duration(days: 5));

  // 24 points from the last 24 hours, spaced by hours
  List<DataPointStruct> last24HoursData =
      generateDataForTimeSpan(6, Duration(hours: 4));

  // 60 points from the last hour, spaced by minutes
  List<DataPointStruct> lastHourData =
      generateDataForTimeSpan(6, Duration(minutes: 10));

  // 60 points from the last minute, spaced by seconds
  List<DataPointStruct> lastMinuteData =
      generateDataForTimeSpan(4, Duration(seconds: 15));

  // Combine all data points
  List<DataPointStruct> allData = []
    ..addAll(yearData)
    ..addAll(last24HoursData)
    ..addAll(lastHourData)
    ..addAll(lastMinuteData);

  return allData;
}

bool acceptBlock(
  BlockComponentStruct block,
  List<BlockComponentStruct> blockList,
) {
  int total = 0;

  for (BlockComponentStruct b in blockList) {
    if (b.graphSize == "quarter") {
      total++;
    } else if (b.graphSize == "half") {
      total += 2;
    } else {
      return false;
    }
  }
  if (block.graphSize == "quarter") {
    total++;
  } else if (block.graphSize == "half") {
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

bool checkVarListAgainstData(
  List<VariableStruct> varList,
  dynamic json,
) {
  bool returnValue = true;

  for (var variable in varList) {
    if (!json.containsKey(variable.info.code)) {
      returnValue = false;
    }
  }
  return returnValue;
}

dynamic convertStringToJson(String data) {
  try {
    // Decode the JSON string
    Map<String, dynamic> jsonData = jsonDecode(data);

    // Return the JSON map
    return jsonData;
  } catch (e) {
    // Handle error if the string is not a valid JSON
    print('Error converting string to JSON: $e');
    return {}; // Return an empty map in case oferror
  }
}

String toTitleCase(String input) {
  return input.split(' ').map((word) {
    return word[0].toUpperCase() + word.substring(1).toLowerCase();
  }).join(' ');
}

List<DatapointsRecord>? getEmptyDatapointsDocuments() {
  return [];
}

dynamic transformComponentToJson(
  VariableStruct variable,
  List<CodedValueStruct> colorCodes,
  List<CodedValueStruct> tickerCodes,
  List<CodedValueStruct> timewindowCodes,
  List<BlockTypeStruct> blocks,
) {
  List<dynamic> serializedColorCodes = colorCodes.map((color) {
    return color.toSerializableMap();
  }).toList();

  List<dynamic> serializedTickerCodes = tickerCodes.map((color) {
    return color.toSerializableMap();
  }).toList();

  List<dynamic> serializedTimewindowCodes = timewindowCodes.map((color) {
    return color.toSerializableMap();
  }).toList();

  List<dynamic> serializedBlocks = blocks.map((block) {
    return block.info.toSerializableMap();
  }).toList();

  dynamic serializedVariable = variable.toSerializableMap();

  return {
    'variable': {
      'info': variable.info.toSerializableMap(),
      'type': variable.type,
      'unit': variable.unit,
      'isRanged': variable.isRanged,
      'range': variable.options.range.toSerializableMap() ?? {},
    },
    'colorCodes': serializedColorCodes,
    'tickerCodes': serializedTickerCodes,
    'timewindowCodes': serializedTimewindowCodes,
    'blocks': serializedBlocks
  };
}
