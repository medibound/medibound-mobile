// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class KeyStruct extends FFFirebaseStruct {
  KeyStruct({
    String? privateWrappedKey,
    String? privateRawKey,
    DateTime? createdTime,
    String? publicWrappedKey,
    String? publicRawKey,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _privateWrappedKey = privateWrappedKey,
        _privateRawKey = privateRawKey,
        _createdTime = createdTime,
        _publicWrappedKey = publicWrappedKey,
        _publicRawKey = publicRawKey,
        super(firestoreUtilData);

  // "privateWrappedKey" field.
  String? _privateWrappedKey;
  String get privateWrappedKey => _privateWrappedKey ?? '';
  set privateWrappedKey(String? val) => _privateWrappedKey = val;

  bool hasPrivateWrappedKey() => _privateWrappedKey != null;

  // "privateRawKey" field.
  String? _privateRawKey;
  String get privateRawKey => _privateRawKey ?? '';
  set privateRawKey(String? val) => _privateRawKey = val;

  bool hasPrivateRawKey() => _privateRawKey != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  set createdTime(DateTime? val) => _createdTime = val;

  bool hasCreatedTime() => _createdTime != null;

  // "publicWrappedKey" field.
  String? _publicWrappedKey;
  String get publicWrappedKey => _publicWrappedKey ?? '';
  set publicWrappedKey(String? val) => _publicWrappedKey = val;

  bool hasPublicWrappedKey() => _publicWrappedKey != null;

  // "publicRawKey" field.
  String? _publicRawKey;
  String get publicRawKey => _publicRawKey ?? '';
  set publicRawKey(String? val) => _publicRawKey = val;

  bool hasPublicRawKey() => _publicRawKey != null;

  static KeyStruct fromMap(Map<String, dynamic> data) => KeyStruct(
        privateWrappedKey: data['privateWrappedKey'] as String?,
        privateRawKey: data['privateRawKey'] as String?,
        createdTime: data['created_time'] as DateTime?,
        publicWrappedKey: data['publicWrappedKey'] as String?,
        publicRawKey: data['publicRawKey'] as String?,
      );

  static KeyStruct? maybeFromMap(dynamic data) =>
      data is Map ? KeyStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'privateWrappedKey': _privateWrappedKey,
        'privateRawKey': _privateRawKey,
        'created_time': _createdTime,
        'publicWrappedKey': _publicWrappedKey,
        'publicRawKey': _publicRawKey,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'privateWrappedKey': serializeParam(
          _privateWrappedKey,
          ParamType.String,
        ),
        'privateRawKey': serializeParam(
          _privateRawKey,
          ParamType.String,
        ),
        'created_time': serializeParam(
          _createdTime,
          ParamType.DateTime,
        ),
        'publicWrappedKey': serializeParam(
          _publicWrappedKey,
          ParamType.String,
        ),
        'publicRawKey': serializeParam(
          _publicRawKey,
          ParamType.String,
        ),
      }.withoutNulls;

  static KeyStruct fromSerializableMap(Map<String, dynamic> data) => KeyStruct(
        privateWrappedKey: deserializeParam(
          data['privateWrappedKey'],
          ParamType.String,
          false,
        ),
        privateRawKey: deserializeParam(
          data['privateRawKey'],
          ParamType.String,
          false,
        ),
        createdTime: deserializeParam(
          data['created_time'],
          ParamType.DateTime,
          false,
        ),
        publicWrappedKey: deserializeParam(
          data['publicWrappedKey'],
          ParamType.String,
          false,
        ),
        publicRawKey: deserializeParam(
          data['publicRawKey'],
          ParamType.String,
          false,
        ),
      );

  static KeyStruct fromAlgoliaData(Map<String, dynamic> data) => KeyStruct(
        privateWrappedKey: convertAlgoliaParam(
          data['privateWrappedKey'],
          ParamType.String,
          false,
        ),
        privateRawKey: convertAlgoliaParam(
          data['privateRawKey'],
          ParamType.String,
          false,
        ),
        createdTime: convertAlgoliaParam(
          data['created_time'],
          ParamType.DateTime,
          false,
        ),
        publicWrappedKey: convertAlgoliaParam(
          data['publicWrappedKey'],
          ParamType.String,
          false,
        ),
        publicRawKey: convertAlgoliaParam(
          data['publicRawKey'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'KeyStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is KeyStruct &&
        privateWrappedKey == other.privateWrappedKey &&
        privateRawKey == other.privateRawKey &&
        createdTime == other.createdTime &&
        publicWrappedKey == other.publicWrappedKey &&
        publicRawKey == other.publicRawKey;
  }

  @override
  int get hashCode => const ListEquality().hash([
        privateWrappedKey,
        privateRawKey,
        createdTime,
        publicWrappedKey,
        publicRawKey
      ]);
}

KeyStruct createKeyStruct({
  String? privateWrappedKey,
  String? privateRawKey,
  DateTime? createdTime,
  String? publicWrappedKey,
  String? publicRawKey,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    KeyStruct(
      privateWrappedKey: privateWrappedKey,
      privateRawKey: privateRawKey,
      createdTime: createdTime,
      publicWrappedKey: publicWrappedKey,
      publicRawKey: publicRawKey,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

KeyStruct? updateKeyStruct(
  KeyStruct? key, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    key
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addKeyStructData(
  Map<String, dynamic> firestoreData,
  KeyStruct? key,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (key == null) {
    return;
  }
  if (key.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue && key.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final keyData = getKeyFirestoreData(key, forFieldValue);
  final nestedData = keyData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = key.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getKeyFirestoreData(
  KeyStruct? key, [
  bool forFieldValue = false,
]) {
  if (key == null) {
    return {};
  }
  final firestoreData = mapToFirestore(key.toMap());

  // Add any Firestore field values
  key.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getKeyListFirestoreData(
  List<KeyStruct>? keys,
) =>
    keys?.map((e) => getKeyFirestoreData(e, true)).toList() ?? [];
