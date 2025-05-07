// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RangeStruct extends FFFirebaseStruct {
  RangeStruct({
    double? upper,
    double? lower,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _upper = upper,
        _lower = lower,
        super(firestoreUtilData);

  // "upper" field.
  double? _upper;
  double get upper => _upper ?? 0.0;
  set upper(double? val) => _upper = val;

  void incrementUpper(double amount) => upper = upper + amount;

  bool hasUpper() => _upper != null;

  // "lower" field.
  double? _lower;
  double get lower => _lower ?? 0.0;
  set lower(double? val) => _lower = val;

  void incrementLower(double amount) => lower = lower + amount;

  bool hasLower() => _lower != null;

  static RangeStruct fromMap(Map<String, dynamic> data) => RangeStruct(
        upper: castToType<double>(data['upper']),
        lower: castToType<double>(data['lower']),
      );

  static RangeStruct? maybeFromMap(dynamic data) =>
      data is Map ? RangeStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'upper': _upper,
        'lower': _lower,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'upper': serializeParam(
          _upper,
          ParamType.double,
        ),
        'lower': serializeParam(
          _lower,
          ParamType.double,
        ),
      }.withoutNulls;

  static RangeStruct fromSerializableMap(Map<String, dynamic> data) =>
      RangeStruct(
        upper: deserializeParam(
          data['upper'],
          ParamType.double,
          false,
        ),
        lower: deserializeParam(
          data['lower'],
          ParamType.double,
          false,
        ),
      );

  static RangeStruct fromAlgoliaData(Map<String, dynamic> data) => RangeStruct(
        upper: convertAlgoliaParam(
          data['upper'],
          ParamType.double,
          false,
        ),
        lower: convertAlgoliaParam(
          data['lower'],
          ParamType.double,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'RangeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is RangeStruct && upper == other.upper && lower == other.lower;
  }

  @override
  int get hashCode => const ListEquality().hash([upper, lower]);
}

RangeStruct createRangeStruct({
  double? upper,
  double? lower,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    RangeStruct(
      upper: upper,
      lower: lower,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

RangeStruct? updateRangeStruct(
  RangeStruct? range, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    range
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addRangeStructData(
  Map<String, dynamic> firestoreData,
  RangeStruct? range,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (range == null) {
    return;
  }
  if (range.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && range.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final rangeData = getRangeFirestoreData(range, forFieldValue);
  final nestedData = rangeData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = range.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getRangeFirestoreData(
  RangeStruct? range, [
  bool forFieldValue = false,
]) {
  if (range == null) {
    return {};
  }
  final firestoreData = mapToFirestore(range.toMap());

  // Add any Firestore field values
  range.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getRangeListFirestoreData(
  List<RangeStruct>? ranges,
) =>
    ranges?.map((e) => getRangeFirestoreData(e, true)).toList() ?? [];
