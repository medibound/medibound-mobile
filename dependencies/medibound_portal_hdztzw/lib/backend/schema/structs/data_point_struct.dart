// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DataPointStruct extends FFFirebaseStruct {
  DataPointStruct({
    DateTime? timestamp,
    String? data,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _timestamp = timestamp,
        _data = data,
        super(firestoreUtilData);

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  set timestamp(DateTime? val) => _timestamp = val;

  bool hasTimestamp() => _timestamp != null;

  // "data" field.
  String? _data;
  String get data => _data ?? '';
  set data(String? val) => _data = val;

  bool hasData() => _data != null;

  static DataPointStruct fromMap(Map<String, dynamic> data) => DataPointStruct(
        timestamp: data['timestamp'] as DateTime?,
        data: data['data'] as String?,
      );

  static DataPointStruct? maybeFromMap(dynamic data) => data is Map
      ? DataPointStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'timestamp': _timestamp,
        'data': _data,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'timestamp': serializeParam(
          _timestamp,
          ParamType.DateTime,
        ),
        'data': serializeParam(
          _data,
          ParamType.String,
        ),
      }.withoutNulls;

  static DataPointStruct fromSerializableMap(Map<String, dynamic> data) =>
      DataPointStruct(
        timestamp: deserializeParam(
          data['timestamp'],
          ParamType.DateTime,
          false,
        ),
        data: deserializeParam(
          data['data'],
          ParamType.String,
          false,
        ),
      );

  static DataPointStruct fromAlgoliaData(Map<String, dynamic> data) =>
      DataPointStruct(
        timestamp: convertAlgoliaParam(
          data['timestamp'],
          ParamType.DateTime,
          false,
        ),
        data: convertAlgoliaParam(
          data['data'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'DataPointStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DataPointStruct &&
        timestamp == other.timestamp &&
        data == other.data;
  }

  @override
  int get hashCode => const ListEquality().hash([timestamp, data]);
}

DataPointStruct createDataPointStruct({
  DateTime? timestamp,
  String? data,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DataPointStruct(
      timestamp: timestamp,
      data: data,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

DataPointStruct? updateDataPointStruct(
  DataPointStruct? dataPoint, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    dataPoint
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addDataPointStructData(
  Map<String, dynamic> firestoreData,
  DataPointStruct? dataPoint,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (dataPoint == null) {
    return;
  }
  if (dataPoint.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && dataPoint.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final dataPointData = getDataPointFirestoreData(dataPoint, forFieldValue);
  final nestedData = dataPointData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = dataPoint.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getDataPointFirestoreData(
  DataPointStruct? dataPoint, [
  bool forFieldValue = false,
]) {
  if (dataPoint == null) {
    return {};
  }
  final firestoreData = mapToFirestore(dataPoint.toMap());

  // Add any Firestore field values
  dataPoint.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDataPointListFirestoreData(
  List<DataPointStruct>? dataPoints,
) =>
    dataPoints?.map((e) => getDataPointFirestoreData(e, true)).toList() ?? [];
