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
    double? upperBound,
    double? lowerBound,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _upperBound = upperBound,
        _lowerBound = lowerBound,
        super(firestoreUtilData);

  // "upper_bound" field.
  double? _upperBound;
  double get upperBound => _upperBound ?? 0.0;
  set upperBound(double? val) => _upperBound = val;

  void incrementUpperBound(double amount) => upperBound = upperBound + amount;

  bool hasUpperBound() => _upperBound != null;

  // "lower_bound" field.
  double? _lowerBound;
  double get lowerBound => _lowerBound ?? 0.0;
  set lowerBound(double? val) => _lowerBound = val;

  void incrementLowerBound(double amount) => lowerBound = lowerBound + amount;

  bool hasLowerBound() => _lowerBound != null;

  static RangeStruct fromMap(Map<String, dynamic> data) => RangeStruct(
        upperBound: castToType<double>(data['upper_bound']),
        lowerBound: castToType<double>(data['lower_bound']),
      );

  static RangeStruct? maybeFromMap(dynamic data) =>
      data is Map ? RangeStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'upper_bound': _upperBound,
        'lower_bound': _lowerBound,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'upper_bound': serializeParam(
          _upperBound,
          ParamType.double,
        ),
        'lower_bound': serializeParam(
          _lowerBound,
          ParamType.double,
        ),
      }.withoutNulls;

  static RangeStruct fromSerializableMap(Map<String, dynamic> data) =>
      RangeStruct(
        upperBound: deserializeParam(
          data['upper_bound'],
          ParamType.double,
          false,
        ),
        lowerBound: deserializeParam(
          data['lower_bound'],
          ParamType.double,
          false,
        ),
      );

  static RangeStruct fromAlgoliaData(Map<String, dynamic> data) => RangeStruct(
        upperBound: convertAlgoliaParam(
          data['upper_bound'],
          ParamType.double,
          false,
        ),
        lowerBound: convertAlgoliaParam(
          data['lower_bound'],
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
    return other is RangeStruct &&
        upperBound == other.upperBound &&
        lowerBound == other.lowerBound;
  }

  @override
  int get hashCode => const ListEquality().hash([upperBound, lowerBound]);
}

RangeStruct createRangeStruct({
  double? upperBound,
  double? lowerBound,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    RangeStruct(
      upperBound: upperBound,
      lowerBound: lowerBound,
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
