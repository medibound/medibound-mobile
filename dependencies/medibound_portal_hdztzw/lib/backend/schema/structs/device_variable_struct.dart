// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DeviceVariableStruct extends FFFirebaseStruct {
  DeviceVariableStruct({
    DropdownStruct? info,
    bool? isList,
    bool? isRanged,
    RangeStruct? range,
    String? type,
    String? unit,
    VariableDataStruct? data,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _info = info,
        _isList = isList,
        _isRanged = isRanged,
        _range = range,
        _type = type,
        _unit = unit,
        _data = data,
        super(firestoreUtilData);

  // "info" field.
  DropdownStruct? _info;
  DropdownStruct get info => _info ?? DropdownStruct();
  set info(DropdownStruct? val) => _info = val;

  void updateInfo(Function(DropdownStruct) updateFn) {
    updateFn(_info ??= DropdownStruct());
  }

  bool hasInfo() => _info != null;

  // "is_list" field.
  bool? _isList;
  bool get isList => _isList ?? false;
  set isList(bool? val) => _isList = val;

  bool hasIsList() => _isList != null;

  // "is_ranged" field.
  bool? _isRanged;
  bool get isRanged => _isRanged ?? false;
  set isRanged(bool? val) => _isRanged = val;

  bool hasIsRanged() => _isRanged != null;

  // "range" field.
  RangeStruct? _range;
  RangeStruct get range => _range ?? RangeStruct();
  set range(RangeStruct? val) => _range = val;

  void updateRange(Function(RangeStruct) updateFn) {
    updateFn(_range ??= RangeStruct());
  }

  bool hasRange() => _range != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  set type(String? val) => _type = val;

  bool hasType() => _type != null;

  // "unit" field.
  String? _unit;
  String get unit => _unit ?? '';
  set unit(String? val) => _unit = val;

  bool hasUnit() => _unit != null;

  // "data" field.
  VariableDataStruct? _data;
  VariableDataStruct get data => _data ?? VariableDataStruct();
  set data(VariableDataStruct? val) => _data = val;

  void updateData(Function(VariableDataStruct) updateFn) {
    updateFn(_data ??= VariableDataStruct());
  }

  bool hasData() => _data != null;

  static DeviceVariableStruct fromMap(Map<String, dynamic> data) =>
      DeviceVariableStruct(
        info: data['info'] is DropdownStruct
            ? data['info']
            : DropdownStruct.maybeFromMap(data['info']),
        isList: data['is_list'] as bool?,
        isRanged: data['is_ranged'] as bool?,
        range: data['range'] is RangeStruct
            ? data['range']
            : RangeStruct.maybeFromMap(data['range']),
        type: data['type'] as String?,
        unit: data['unit'] as String?,
        data: data['data'] is VariableDataStruct
            ? data['data']
            : VariableDataStruct.maybeFromMap(data['data']),
      );

  static DeviceVariableStruct? maybeFromMap(dynamic data) => data is Map
      ? DeviceVariableStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'info': _info?.toMap(),
        'is_list': _isList,
        'is_ranged': _isRanged,
        'range': _range?.toMap(),
        'type': _type,
        'unit': _unit,
        'data': _data?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'info': serializeParam(
          _info,
          ParamType.DataStruct,
        ),
        'is_list': serializeParam(
          _isList,
          ParamType.bool,
        ),
        'is_ranged': serializeParam(
          _isRanged,
          ParamType.bool,
        ),
        'range': serializeParam(
          _range,
          ParamType.DataStruct,
        ),
        'type': serializeParam(
          _type,
          ParamType.String,
        ),
        'unit': serializeParam(
          _unit,
          ParamType.String,
        ),
        'data': serializeParam(
          _data,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static DeviceVariableStruct fromSerializableMap(Map<String, dynamic> data) =>
      DeviceVariableStruct(
        info: deserializeStructParam(
          data['info'],
          ParamType.DataStruct,
          false,
          structBuilder: DropdownStruct.fromSerializableMap,
        ),
        isList: deserializeParam(
          data['is_list'],
          ParamType.bool,
          false,
        ),
        isRanged: deserializeParam(
          data['is_ranged'],
          ParamType.bool,
          false,
        ),
        range: deserializeStructParam(
          data['range'],
          ParamType.DataStruct,
          false,
          structBuilder: RangeStruct.fromSerializableMap,
        ),
        type: deserializeParam(
          data['type'],
          ParamType.String,
          false,
        ),
        unit: deserializeParam(
          data['unit'],
          ParamType.String,
          false,
        ),
        data: deserializeStructParam(
          data['data'],
          ParamType.DataStruct,
          false,
          structBuilder: VariableDataStruct.fromSerializableMap,
        ),
      );

  static DeviceVariableStruct fromAlgoliaData(Map<String, dynamic> data) =>
      DeviceVariableStruct(
        info: convertAlgoliaParam(
          data['info'],
          ParamType.DataStruct,
          false,
          structBuilder: DropdownStruct.fromAlgoliaData,
        ),
        isList: convertAlgoliaParam(
          data['is_list'],
          ParamType.bool,
          false,
        ),
        isRanged: convertAlgoliaParam(
          data['is_ranged'],
          ParamType.bool,
          false,
        ),
        range: convertAlgoliaParam(
          data['range'],
          ParamType.DataStruct,
          false,
          structBuilder: RangeStruct.fromAlgoliaData,
        ),
        type: convertAlgoliaParam(
          data['type'],
          ParamType.String,
          false,
        ),
        unit: convertAlgoliaParam(
          data['unit'],
          ParamType.String,
          false,
        ),
        data: convertAlgoliaParam(
          data['data'],
          ParamType.DataStruct,
          false,
          structBuilder: VariableDataStruct.fromAlgoliaData,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'DeviceVariableStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DeviceVariableStruct &&
        info == other.info &&
        isList == other.isList &&
        isRanged == other.isRanged &&
        range == other.range &&
        type == other.type &&
        unit == other.unit &&
        data == other.data;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([info, isList, isRanged, range, type, unit, data]);
}

DeviceVariableStruct createDeviceVariableStruct({
  DropdownStruct? info,
  bool? isList,
  bool? isRanged,
  RangeStruct? range,
  String? type,
  String? unit,
  VariableDataStruct? data,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DeviceVariableStruct(
      info: info ?? (clearUnsetFields ? DropdownStruct() : null),
      isList: isList,
      isRanged: isRanged,
      range: range ?? (clearUnsetFields ? RangeStruct() : null),
      type: type,
      unit: unit,
      data: data ?? (clearUnsetFields ? VariableDataStruct() : null),
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

DeviceVariableStruct? updateDeviceVariableStruct(
  DeviceVariableStruct? deviceVariable, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    deviceVariable
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addDeviceVariableStructData(
  Map<String, dynamic> firestoreData,
  DeviceVariableStruct? deviceVariable,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (deviceVariable == null) {
    return;
  }
  if (deviceVariable.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && deviceVariable.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final deviceVariableData =
      getDeviceVariableFirestoreData(deviceVariable, forFieldValue);
  final nestedData =
      deviceVariableData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = deviceVariable.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getDeviceVariableFirestoreData(
  DeviceVariableStruct? deviceVariable, [
  bool forFieldValue = false,
]) {
  if (deviceVariable == null) {
    return {};
  }
  final firestoreData = mapToFirestore(deviceVariable.toMap());

  // Handle nested data for "info" field.
  addDropdownStructData(
    firestoreData,
    deviceVariable.hasInfo() ? deviceVariable.info : null,
    'info',
    forFieldValue,
  );

  // Handle nested data for "range" field.
  addRangeStructData(
    firestoreData,
    deviceVariable.hasRange() ? deviceVariable.range : null,
    'range',
    forFieldValue,
  );

  // Handle nested data for "data" field.
  addVariableDataStructData(
    firestoreData,
    deviceVariable.hasData() ? deviceVariable.data : null,
    'data',
    forFieldValue,
  );

  // Add any Firestore field values
  deviceVariable.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDeviceVariableListFirestoreData(
  List<DeviceVariableStruct>? deviceVariables,
) =>
    deviceVariables
        ?.map((e) => getDeviceVariableFirestoreData(e, true))
        .toList() ??
    [];
