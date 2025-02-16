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
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import '/custom_code/actions/index.dart' as actions;
import 'package:medibound_portal_hdztzw/app_constants.dart'
    as medibound_portal_hdztzw_app_constant;
import 'package:medibound_portal_hdztzw/app_state.dart'
    as medibound_portal_hdztzw_app_state;
import 'package:medibound_portal_hdztzw/flutter_flow/custom_functions.dart'
    as medibound_portal_hdztzw_functions;
import 'package:medibound_portal_hdztzw/flutter_flow/flutter_flow_util.dart'
    as medibound_portal_hdztzw_util
    show wrapWithModel, createModel, FlutterFlowDynamicModels;
import 'package:medibound_portal_hdztzw/utils/desc_token/desc_token_widget.dart'
    as medibound_portal_hdztzw;
import 'package:medibound_portal_hdztzw/utils/dropdown/component_profile_tile/component_profile_tile_widget.dart'
    as medibound_portal_hdztzw;
import 'package:medibound_portal_hdztzw/utils/empty/empty_widget.dart'
    as medibound_portal_hdztzw;
import 'package:medibound_portal_hdztzw/auth/firebase_auth/auth_util.dart';

Future<DocumentReference> createRecord(
  medibound_portal_hdztzw_data_schema.CodedValueStruct info,
  DocumentReference owner,
  DocumentReference template,
  List<medibound_portal_hdztzw_data_schema.DeviceVariableStruct> data,
) async {
  var recordsRecordReference =
      medibound_portal_hdztzw_backend.RecordsRecord.collection.doc();

  final recordData = {
    ...medibound_portal_hdztzw_backend.createRecordsRecordData(
      info: medibound_portal_hdztzw_data_schema.updateCodedValueStruct(
        info,
        clearUnsetFields: false,
        create: true,
      ),
      owner: owner, // Use provided owner reference
      template: template,
    ),
    'observation': medibound_portal_hdztzw_backend
        .getDeviceVariableListFirestoreData(data),
  };

  await recordsRecordReference.set(recordData);

  return medibound_portal_hdztzw_backend.RecordsRecord.getDocumentFromData(
    recordData,
    recordsRecordReference,
  ).reference;
}
