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

import 'package:medibound_ui/medibound_ui.dart';

Future<void> getTypes() async {
  List<CodedValueStruct> organizationTypesList = mBOrganizationTypes
      .map((e) => CodedValueStruct(
          display: e.display,
          description: e.description,
          code: e.code,
          color: e.color,
          icon: e.icon))
      .toList();

  FFAppState().OrganizationTypes = organizationTypesList;

  List<CodedValueStruct> deviceTypesList = mBDeviceTypes
      .map((e) => CodedValueStruct(
          display: e.display,
          description: e.description,
          code: e.code,
          color: e.color,
          icon: e.icon))
      .toList();

  FFAppState().DeviceTypes = deviceTypesList;

  List<CodedValueStruct> deviceStatusList = mBDeviceStatus
      .map((e) => CodedValueStruct(
          display: e.display,
          description: e.description,
          code: e.code,
          color: e.color,
          icon: e.icon))
      .toList();

  FFAppState().DeviceStatus = deviceStatusList;

  List<CodedValueStruct> patientStatusList = mBPatientStatus
      .map((e) => CodedValueStruct(
          display: e.display,
          description: e.description,
          code: e.code,
          color: e.color,
          icon: e.icon))
      .toList();

  FFAppState().PatientStatus = patientStatusList;

  List<CodedValueStruct> registrationStatusList = mBRegistrationStatus
      .map((e) => CodedValueStruct(
          display: e.display,
          description: e.description,
          code: e.code,
          color: e.color,
          icon: e.icon))
      .toList();

  FFAppState().RegistrationStatus = registrationStatusList;

  FFAppState().update(() {});
}
