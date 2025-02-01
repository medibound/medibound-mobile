// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VariableDataStruct extends FFFirebaseStruct {
  VariableDataStruct({
    List<String>? string,
    List<double>? number,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _string = string,
        _number = number,
        super(firestoreUtilData);

  // "string" field.
  List<String>? _string;
  List<String> get string => _string ?? const [];
  set string(List<String>? val) => _string = val;

  void updateString(Function(List<String>) updateFn) {
    updateFn(_string ??= []);
  }

  bool hasString() => _string != null;

  // "number" field.
  List<double>? _number;
  List<double> get number => _number ?? const [];
  set number(List<double>? val) => _number = val;

  void updateNumber(Function(List<double>) updateFn) {
    updateFn(_number ??= []);
  }

  bool hasNumber() => _number != null;

  static VariableDataStruct fromMap(Map<String, dynamic> data) =>
      VariableDataStruct(
        string: getDataList(data['string']),
        number: getDataList(data['number']),
      );

  static VariableDataStruct? maybeFromMap(dynamic data) => data is Map
      ? VariableDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'string': _string,
        'number': _number,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'string': serializeParam(
          _string,
          ParamType.String,
          isList: true,
        ),
        'number': serializeParam(
          _number,
          ParamType.double,
          isList: true,
        ),
      }.withoutNulls;

  static VariableDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      VariableDataStruct(
        string: deserializeParam<String>(
          data['string'],
          ParamType.String,
          true,
        ),
        number: deserializeParam<double>(
          data['number'],
          ParamType.double,
          true,
        ),
      );

  static VariableDataStruct fromAlgoliaData(Map<String, dynamic> data) =>
      VariableDataStruct(
        string: convertAlgoliaParam<String>(
          data['string'],
          ParamType.String,
          true,
        ),
        number: convertAlgoliaParam<double>(
          data['number'],
          ParamType.double,
          true,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'VariableDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is VariableDataStruct &&
        listEquality.equals(string, other.string) &&
        listEquality.equals(number, other.number);
  }

  @override
  int get hashCode => const ListEquality().hash([string, number]);
}

VariableDataStruct createVariableDataStruct({
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    VariableDataStruct(
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

VariableDataStruct? updateVariableDataStruct(
  VariableDataStruct? variableData, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    variableData
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addVariableDataStructData(
  Map<String, dynamic> firestoreData,
  VariableDataStruct? variableData,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (variableData == null) {
    return;
  }
  if (variableData.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && variableData.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final variableDataData =
      getVariableDataFirestoreData(variableData, forFieldValue);
  final nestedData =
      variableDataData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = variableData.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getVariableDataFirestoreData(
  VariableDataStruct? variableData, [
  bool forFieldValue = false,
]) {
  if (variableData == null) {
    return {};
  }
  final firestoreData = mapToFirestore(variableData.toMap());

  // Add any Firestore field values
  variableData.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getVariableDataListFirestoreData(
  List<VariableDataStruct>? variableDatas,
) =>
    variableDatas?.map((e) => getVariableDataFirestoreData(e, true)).toList() ??
    [];
