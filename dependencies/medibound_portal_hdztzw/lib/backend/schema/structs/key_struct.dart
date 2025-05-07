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
    DateTime? createdTime,
    String? hintKey,
    String? secret,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _createdTime = createdTime,
        _hintKey = hintKey,
        _secret = secret,
        super(firestoreUtilData);

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  set createdTime(DateTime? val) => _createdTime = val;

  bool hasCreatedTime() => _createdTime != null;

  // "hint_key" field.
  String? _hintKey;
  String get hintKey => _hintKey ?? '';
  set hintKey(String? val) => _hintKey = val;

  bool hasHintKey() => _hintKey != null;

  // "secret" field.
  String? _secret;
  String get secret => _secret ?? '';
  set secret(String? val) => _secret = val;

  bool hasSecret() => _secret != null;

  static KeyStruct fromMap(Map<String, dynamic> data) => KeyStruct(
        createdTime: data['created_time'] as DateTime?,
        hintKey: data['hint_key'] as String?,
        secret: data['secret'] as String?,
      );

  static KeyStruct? maybeFromMap(dynamic data) =>
      data is Map ? KeyStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'created_time': _createdTime,
        'hint_key': _hintKey,
        'secret': _secret,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'created_time': serializeParam(
          _createdTime,
          ParamType.DateTime,
        ),
        'hint_key': serializeParam(
          _hintKey,
          ParamType.String,
        ),
        'secret': serializeParam(
          _secret,
          ParamType.String,
        ),
      }.withoutNulls;

  static KeyStruct fromSerializableMap(Map<String, dynamic> data) => KeyStruct(
        createdTime: deserializeParam(
          data['created_time'],
          ParamType.DateTime,
          false,
        ),
        hintKey: deserializeParam(
          data['hint_key'],
          ParamType.String,
          false,
        ),
        secret: deserializeParam(
          data['secret'],
          ParamType.String,
          false,
        ),
      );

  static KeyStruct fromAlgoliaData(Map<String, dynamic> data) => KeyStruct(
        createdTime: convertAlgoliaParam(
          data['created_time'],
          ParamType.DateTime,
          false,
        ),
        hintKey: convertAlgoliaParam(
          data['hint_key'],
          ParamType.String,
          false,
        ),
        secret: convertAlgoliaParam(
          data['secret'],
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
        createdTime == other.createdTime &&
        hintKey == other.hintKey &&
        secret == other.secret;
  }

  @override
  int get hashCode => const ListEquality().hash([createdTime, hintKey, secret]);
}

KeyStruct createKeyStruct({
  DateTime? createdTime,
  String? hintKey,
  String? secret,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    KeyStruct(
      createdTime: createdTime,
      hintKey: hintKey,
      secret: secret,
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
