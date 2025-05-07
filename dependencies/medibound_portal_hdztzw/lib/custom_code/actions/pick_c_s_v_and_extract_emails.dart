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

import 'package:csv/csv.dart';
import 'dart:convert';
import 'package:file_picker/file_picker.dart';

Future<List<String>?> pickCSVAndExtractEmails() async {
  try {
    // Step 1: Let user pick a CSV file
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['csv'],
    );

    if (result == null || result.files.single.bytes == null) {
      print("not working");
      return null; // User cancelled or file empty
    }

    // Step 2: Read file content as UTF-8 string
    final csvContent = utf8.decode(result.files.single.bytes!);

    // Step 3: Parse CSV rows
    final rows = const CsvToListConverter(
      eol: '\n',
      shouldParseNumbers: false,
    ).convert(csvContent);

    if (rows.isEmpty) return [];

    final headers =
        rows.first.map((e) => e.toString().trim().toLowerCase()).toList();
    final emailIndex = headers.indexOf('email');

    print("Headers found: $headers");

    if (emailIndex == -1) {
      print("No 'email' column found.");
      return [];
    }

    // Step 5: Extract and clean emails
    final List<String> emails = [];
    for (int i = 1; i < rows.length; i++) {
      final email = rows[i][emailIndex]?.toString().trim();
      if (email != null && email.contains('@')) {
        emails.add(email);
      }
    }

    return emails;
  } catch (e) {
    print("Error processing CSV: $e");
    return [];
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
