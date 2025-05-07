// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class IntegrationStruct extends FFFirebaseStruct {
  IntegrationStruct({
    String? id,
    String? accessToken,
    String? refreshToken,
    DateTime? expirationTime,
    String? patientId,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _accessToken = accessToken,
        _refreshToken = refreshToken,
        _expirationTime = expirationTime,
        _patientId = patientId,
        super(firestoreUtilData);

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "access_token" field.
  String? _accessToken;
  String get accessToken => _accessToken ?? '';
  set accessToken(String? val) => _accessToken = val;

  bool hasAccessToken() => _accessToken != null;

  // "refresh_token" field.
  String? _refreshToken;
  String get refreshToken => _refreshToken ?? '';
  set refreshToken(String? val) => _refreshToken = val;

  bool hasRefreshToken() => _refreshToken != null;

  // "expiration_time" field.
  DateTime? _expirationTime;
  DateTime? get expirationTime => _expirationTime;
  set expirationTime(DateTime? val) => _expirationTime = val;

  bool hasExpirationTime() => _expirationTime != null;

  // "patientId" field.
  String? _patientId;
  String get patientId => _patientId ?? '';
  set patientId(String? val) => _patientId = val;

  bool hasPatientId() => _patientId != null;

  static IntegrationStruct fromMap(Map<String, dynamic> data) =>
      IntegrationStruct(
        id: data['id'] as String?,
        accessToken: data['access_token'] as String?,
        refreshToken: data['refresh_token'] as String?,
        expirationTime: data['expiration_time'] as DateTime?,
        patientId: data['patientId'] as String?,
      );

  static IntegrationStruct? maybeFromMap(dynamic data) => data is Map
      ? IntegrationStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'access_token': _accessToken,
        'refresh_token': _refreshToken,
        'expiration_time': _expirationTime,
        'patientId': _patientId,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'access_token': serializeParam(
          _accessToken,
          ParamType.String,
        ),
        'refresh_token': serializeParam(
          _refreshToken,
          ParamType.String,
        ),
        'expiration_time': serializeParam(
          _expirationTime,
          ParamType.DateTime,
        ),
        'patientId': serializeParam(
          _patientId,
          ParamType.String,
        ),
      }.withoutNulls;

  static IntegrationStruct fromSerializableMap(Map<String, dynamic> data) =>
      IntegrationStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        accessToken: deserializeParam(
          data['access_token'],
          ParamType.String,
          false,
        ),
        refreshToken: deserializeParam(
          data['refresh_token'],
          ParamType.String,
          false,
        ),
        expirationTime: deserializeParam(
          data['expiration_time'],
          ParamType.DateTime,
          false,
        ),
        patientId: deserializeParam(
          data['patientId'],
          ParamType.String,
          false,
        ),
      );

  static IntegrationStruct fromAlgoliaData(Map<String, dynamic> data) =>
      IntegrationStruct(
        id: convertAlgoliaParam(
          data['id'],
          ParamType.String,
          false,
        ),
        accessToken: convertAlgoliaParam(
          data['access_token'],
          ParamType.String,
          false,
        ),
        refreshToken: convertAlgoliaParam(
          data['refresh_token'],
          ParamType.String,
          false,
        ),
        expirationTime: convertAlgoliaParam(
          data['expiration_time'],
          ParamType.DateTime,
          false,
        ),
        patientId: convertAlgoliaParam(
          data['patientId'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'IntegrationStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is IntegrationStruct &&
        id == other.id &&
        accessToken == other.accessToken &&
        refreshToken == other.refreshToken &&
        expirationTime == other.expirationTime &&
        patientId == other.patientId;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([id, accessToken, refreshToken, expirationTime, patientId]);
}

IntegrationStruct createIntegrationStruct({
  String? id,
  String? accessToken,
  String? refreshToken,
  DateTime? expirationTime,
  String? patientId,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    IntegrationStruct(
      id: id,
      accessToken: accessToken,
      refreshToken: refreshToken,
      expirationTime: expirationTime,
      patientId: patientId,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

IntegrationStruct? updateIntegrationStruct(
  IntegrationStruct? integration, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    integration
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addIntegrationStructData(
  Map<String, dynamic> firestoreData,
  IntegrationStruct? integration,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (integration == null) {
    return;
  }
  if (integration.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && integration.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final integrationData =
      getIntegrationFirestoreData(integration, forFieldValue);
  final nestedData =
      integrationData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = integration.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getIntegrationFirestoreData(
  IntegrationStruct? integration, [
  bool forFieldValue = false,
]) {
  if (integration == null) {
    return {};
  }
  final firestoreData = mapToFirestore(integration.toMap());

  // Add any Firestore field values
  integration.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getIntegrationListFirestoreData(
  List<IntegrationStruct>? integrations,
) =>
    integrations?.map((e) => getIntegrationFirestoreData(e, true)).toList() ??
    [];
