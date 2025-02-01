// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ConstraintStruct extends FFFirebaseStruct {
  ConstraintStruct({
    String? link,
    List<String>? requires,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _link = link,
        _requires = requires,
        super(firestoreUtilData);

  // "link" field.
  String? _link;
  String get link => _link ?? '';
  set link(String? val) => _link = val;

  bool hasLink() => _link != null;

  // "requires" field.
  List<String>? _requires;
  List<String> get requires => _requires ?? const [];
  set requires(List<String>? val) => _requires = val;

  void updateRequires(Function(List<String>) updateFn) {
    updateFn(_requires ??= []);
  }

  bool hasRequires() => _requires != null;

  static ConstraintStruct fromMap(Map<String, dynamic> data) =>
      ConstraintStruct(
        link: data['link'] as String?,
        requires: getDataList(data['requires']),
      );

  static ConstraintStruct? maybeFromMap(dynamic data) => data is Map
      ? ConstraintStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'link': _link,
        'requires': _requires,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'link': serializeParam(
          _link,
          ParamType.String,
        ),
        'requires': serializeParam(
          _requires,
          ParamType.String,
          isList: true,
        ),
      }.withoutNulls;

  static ConstraintStruct fromSerializableMap(Map<String, dynamic> data) =>
      ConstraintStruct(
        link: deserializeParam(
          data['link'],
          ParamType.String,
          false,
        ),
        requires: deserializeParam<String>(
          data['requires'],
          ParamType.String,
          true,
        ),
      );

  static ConstraintStruct fromAlgoliaData(Map<String, dynamic> data) =>
      ConstraintStruct(
        link: convertAlgoliaParam(
          data['link'],
          ParamType.String,
          false,
        ),
        requires: convertAlgoliaParam<String>(
          data['requires'],
          ParamType.String,
          true,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'ConstraintStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ConstraintStruct &&
        link == other.link &&
        listEquality.equals(requires, other.requires);
  }

  @override
  int get hashCode => const ListEquality().hash([link, requires]);
}

ConstraintStruct createConstraintStruct({
  String? link,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ConstraintStruct(
      link: link,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ConstraintStruct? updateConstraintStruct(
  ConstraintStruct? constraint, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    constraint
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addConstraintStructData(
  Map<String, dynamic> firestoreData,
  ConstraintStruct? constraint,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (constraint == null) {
    return;
  }
  if (constraint.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && constraint.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final constraintData = getConstraintFirestoreData(constraint, forFieldValue);
  final nestedData = constraintData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = constraint.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getConstraintFirestoreData(
  ConstraintStruct? constraint, [
  bool forFieldValue = false,
]) {
  if (constraint == null) {
    return {};
  }
  final firestoreData = mapToFirestore(constraint.toMap());

  // Add any Firestore field values
  constraint.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getConstraintListFirestoreData(
  List<ConstraintStruct>? constraints,
) =>
    constraints?.map((e) => getConstraintFirestoreData(e, true)).toList() ?? [];
