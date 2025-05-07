// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VariableOptionsStruct extends FFFirebaseStruct {
  VariableOptionsStruct({
    RangeStruct? range,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _range = range,
        super(firestoreUtilData);

  // "range" field.
  RangeStruct? _range;
  RangeStruct get range => _range ?? RangeStruct();
  set range(RangeStruct? val) => _range = val;

  void updateRange(Function(RangeStruct) updateFn) {
    updateFn(_range ??= RangeStruct());
  }

  bool hasRange() => _range != null;

  static VariableOptionsStruct fromMap(Map<String, dynamic> data) =>
      VariableOptionsStruct(
        range: data['range'] is RangeStruct
            ? data['range']
            : RangeStruct.maybeFromMap(data['range']),
      );

  static VariableOptionsStruct? maybeFromMap(dynamic data) => data is Map
      ? VariableOptionsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'range': _range?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'range': serializeParam(
          _range,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static VariableOptionsStruct fromSerializableMap(Map<String, dynamic> data) =>
      VariableOptionsStruct(
        range: deserializeStructParam(
          data['range'],
          ParamType.DataStruct,
          false,
          structBuilder: RangeStruct.fromSerializableMap,
        ),
      );

  static VariableOptionsStruct fromAlgoliaData(Map<String, dynamic> data) =>
      VariableOptionsStruct(
        range: convertAlgoliaParam(
          data['range'],
          ParamType.DataStruct,
          false,
          structBuilder: RangeStruct.fromAlgoliaData,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'VariableOptionsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is VariableOptionsStruct && range == other.range;
  }

  @override
  int get hashCode => const ListEquality().hash([range]);
}

VariableOptionsStruct createVariableOptionsStruct({
  RangeStruct? range,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    VariableOptionsStruct(
      range: range ?? (clearUnsetFields ? RangeStruct() : null),
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

VariableOptionsStruct? updateVariableOptionsStruct(
  VariableOptionsStruct? variableOptions, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    variableOptions
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addVariableOptionsStructData(
  Map<String, dynamic> firestoreData,
  VariableOptionsStruct? variableOptions,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (variableOptions == null) {
    return;
  }
  if (variableOptions.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && variableOptions.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final variableOptionsData =
      getVariableOptionsFirestoreData(variableOptions, forFieldValue);
  final nestedData =
      variableOptionsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = variableOptions.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getVariableOptionsFirestoreData(
  VariableOptionsStruct? variableOptions, [
  bool forFieldValue = false,
]) {
  if (variableOptions == null) {
    return {};
  }
  final firestoreData = mapToFirestore(variableOptions.toMap());

  // Handle nested data for "range" field.
  addRangeStructData(
    firestoreData,
    variableOptions.hasRange() ? variableOptions.range : null,
    'range',
    forFieldValue,
  );

  // Add any Firestore field values
  variableOptions.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getVariableOptionsListFirestoreData(
  List<VariableOptionsStruct>? variableOptionss,
) =>
    variableOptionss
        ?.map((e) => getVariableOptionsFirestoreData(e, true))
        .toList() ??
    [];
