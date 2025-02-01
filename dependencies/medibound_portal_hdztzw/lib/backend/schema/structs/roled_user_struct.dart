// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RoledUserStruct extends FFFirebaseStruct {
  RoledUserStruct({
    DocumentReference? user,
    OrganizationRoleCode? role,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _user = user,
        _role = role,
        super(firestoreUtilData);

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  set user(DocumentReference? val) => _user = val;

  bool hasUser() => _user != null;

  // "role" field.
  OrganizationRoleCode? _role;
  OrganizationRoleCode get role => _role ?? OrganizationRoleCode.MEMBER;
  set role(OrganizationRoleCode? val) => _role = val;

  bool hasRole() => _role != null;

  static RoledUserStruct fromMap(Map<String, dynamic> data) => RoledUserStruct(
        user: data['user'] as DocumentReference?,
        role: data['role'] is OrganizationRoleCode
            ? data['role']
            : deserializeEnum<OrganizationRoleCode>(data['role']),
      );

  static RoledUserStruct? maybeFromMap(dynamic data) => data is Map
      ? RoledUserStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'user': _user,
        'role': _role?.serialize(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'user': serializeParam(
          _user,
          ParamType.DocumentReference,
        ),
        'role': serializeParam(
          _role,
          ParamType.Enum,
        ),
      }.withoutNulls;

  static RoledUserStruct fromSerializableMap(Map<String, dynamic> data) =>
      RoledUserStruct(
        user: deserializeParam(
          data['user'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['users'],
        ),
        role: deserializeParam<OrganizationRoleCode>(
          data['role'],
          ParamType.Enum,
          false,
        ),
      );

  static RoledUserStruct fromAlgoliaData(Map<String, dynamic> data) =>
      RoledUserStruct(
        user: convertAlgoliaParam(
          data['user'],
          ParamType.DocumentReference,
          false,
        ),
        role: convertAlgoliaParam<OrganizationRoleCode>(
          data['role'],
          ParamType.Enum,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'RoledUserStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is RoledUserStruct && user == other.user && role == other.role;
  }

  @override
  int get hashCode => const ListEquality().hash([user, role]);
}

RoledUserStruct createRoledUserStruct({
  DocumentReference? user,
  OrganizationRoleCode? role,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    RoledUserStruct(
      user: user,
      role: role,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

RoledUserStruct? updateRoledUserStruct(
  RoledUserStruct? roledUser, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    roledUser
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addRoledUserStructData(
  Map<String, dynamic> firestoreData,
  RoledUserStruct? roledUser,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (roledUser == null) {
    return;
  }
  if (roledUser.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && roledUser.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final roledUserData = getRoledUserFirestoreData(roledUser, forFieldValue);
  final nestedData = roledUserData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = roledUser.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getRoledUserFirestoreData(
  RoledUserStruct? roledUser, [
  bool forFieldValue = false,
]) {
  if (roledUser == null) {
    return {};
  }
  final firestoreData = mapToFirestore(roledUser.toMap());

  // Add any Firestore field values
  roledUser.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getRoledUserListFirestoreData(
  List<RoledUserStruct>? roledUsers,
) =>
    roledUsers?.map((e) => getRoledUserFirestoreData(e, true)).toList() ?? [];
