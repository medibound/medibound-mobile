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

import '/custom_code/actions/index.dart'; // Imports other custom actions

import 'dart:html' as html;

// Add your function code here!

Future<void> updateBrowserUrlPath(RouteStruct route) async {
  final basePath = route.section != null && route.section.isNotEmpty
      ? '/${route.section}'
      : '/';

  final queryParams = <String, String>{};
  if (route.page != null && route.page.isNotEmpty)
    queryParams['page'] = route.page;
  if (route.id != null && route.id.isNotEmpty) queryParams['id'] = route.id;
  if (route.tab != null && route.tab.isNotEmpty) queryParams['tab'] = route.tab;

  final queryString = queryParams.entries
      .map((e) =>
          '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
      .join('&');

  final newPath = queryString.isNotEmpty ? '$basePath?$queryString' : basePath;

  html.window.history.pushState(null, '', newPath);
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
