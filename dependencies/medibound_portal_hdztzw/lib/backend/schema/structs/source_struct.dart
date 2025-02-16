// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SourceStruct extends FFFirebaseStruct {
  SourceStruct({
    CollectionSources? sourceType,
    String? uid,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _sourceType = sourceType,
        _uid = uid,
        super(firestoreUtilData);

  // "source_type" field.
  CollectionSources? _sourceType;
  CollectionSources? get sourceType => _sourceType;
  set sourceType(CollectionSources? val) => _sourceType = val;

  bool hasSourceType() => _sourceType != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  set uid(String? val) => _uid = val;

  bool hasUid() => _uid != null;

  static SourceStruct fromMap(Map<String, dynamic> data) => SourceStruct(
        sourceType: data['source_type'] is CollectionSources
            ? data['source_type']
            : deserializeEnum<CollectionSources>(data['source_type']),
        uid: data['uid'] as String?,
      );

  static SourceStruct? maybeFromMap(dynamic data) =>
      data is Map ? SourceStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'source_type': _sourceType?.serialize(),
        'uid': _uid,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'source_type': serializeParam(
          _sourceType,
          ParamType.Enum,
        ),
        'uid': serializeParam(
          _uid,
          ParamType.String,
        ),
      }.withoutNulls;

  static SourceStruct fromSerializableMap(Map<String, dynamic> data) =>
      SourceStruct(
        sourceType: deserializeParam<CollectionSources>(
          data['source_type'],
          ParamType.Enum,
          false,
        ),
        uid: deserializeParam(
          data['uid'],
          ParamType.String,
          false,
        ),
      );

  static SourceStruct fromAlgoliaData(Map<String, dynamic> data) =>
      SourceStruct(
        sourceType: convertAlgoliaParam<CollectionSources>(
          data['source_type'],
          ParamType.Enum,
          false,
        ),
        uid: convertAlgoliaParam(
          data['uid'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'SourceStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SourceStruct &&
        sourceType == other.sourceType &&
        uid == other.uid;
  }

  @override
  int get hashCode => const ListEquality().hash([sourceType, uid]);
}

SourceStruct createSourceStruct({
  CollectionSources? sourceType,
  String? uid,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SourceStruct(
      sourceType: sourceType,
      uid: uid,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SourceStruct? updateSourceStruct(
  SourceStruct? source, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    source
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSourceStructData(
  Map<String, dynamic> firestoreData,
  SourceStruct? source,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (source == null) {
    return;
  }
  if (source.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && source.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final sourceData = getSourceFirestoreData(source, forFieldValue);
  final nestedData = sourceData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = source.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSourceFirestoreData(
  SourceStruct? source, [
  bool forFieldValue = false,
]) {
  if (source == null) {
    return {};
  }
  final firestoreData = mapToFirestore(source.toMap());

  // Add any Firestore field values
  source.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSourceListFirestoreData(
  List<SourceStruct>? sources,
) =>
    sources?.map((e) => getSourceFirestoreData(e, true)).toList() ?? [];
