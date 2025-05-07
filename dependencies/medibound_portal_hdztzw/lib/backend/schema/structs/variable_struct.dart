// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VariableStruct extends FFFirebaseStruct {
  VariableStruct({
    CodedValueStruct? info,
    bool? isList,
    bool? isRanged,
    String? type,
    String? unit,
    List<DataPointStruct>? data,
    String? preset,
    DateTime? editedTime,
    VariableOptionsStruct? options,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _info = info,
        _isList = isList,
        _isRanged = isRanged,
        _type = type,
        _unit = unit,
        _data = data,
        _preset = preset,
        _editedTime = editedTime,
        _options = options,
        super(firestoreUtilData);

  // "info" field.
  CodedValueStruct? _info;
  CodedValueStruct get info => _info ?? CodedValueStruct();
  set info(CodedValueStruct? val) => _info = val;

  void updateInfo(Function(CodedValueStruct) updateFn) {
    updateFn(_info ??= CodedValueStruct());
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
  List<DataPointStruct>? _data;
  List<DataPointStruct> get data => _data ?? const [];
  set data(List<DataPointStruct>? val) => _data = val;

  void updateData(Function(List<DataPointStruct>) updateFn) {
    updateFn(_data ??= []);
  }

  bool hasData() => _data != null;

  // "preset" field.
  String? _preset;
  String get preset => _preset ?? '';
  set preset(String? val) => _preset = val;

  bool hasPreset() => _preset != null;

  // "edited_time" field.
  DateTime? _editedTime;
  DateTime? get editedTime => _editedTime;
  set editedTime(DateTime? val) => _editedTime = val;

  bool hasEditedTime() => _editedTime != null;

  // "options" field.
  VariableOptionsStruct? _options;
  VariableOptionsStruct get options => _options ?? VariableOptionsStruct();
  set options(VariableOptionsStruct? val) => _options = val;

  void updateOptions(Function(VariableOptionsStruct) updateFn) {
    updateFn(_options ??= VariableOptionsStruct());
  }

  bool hasOptions() => _options != null;

  static VariableStruct fromMap(Map<String, dynamic> data) => VariableStruct(
        info: data['info'] is CodedValueStruct
            ? data['info']
            : CodedValueStruct.maybeFromMap(data['info']),
        isList: data['is_list'] as bool?,
        isRanged: data['is_ranged'] as bool?,
        type: data['type'] as String?,
        unit: data['unit'] as String?,
        data: getStructList(
          data['data'],
          DataPointStruct.fromMap,
        ),
        preset: data['preset'] as String?,
        editedTime: data['edited_time'] as DateTime?,
        options: data['options'] is VariableOptionsStruct
            ? data['options']
            : VariableOptionsStruct.maybeFromMap(data['options']),
      );

  static VariableStruct? maybeFromMap(dynamic data) =>
      data is Map ? VariableStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'info': _info?.toMap(),
        'is_list': _isList,
        'is_ranged': _isRanged,
        'type': _type,
        'unit': _unit,
        'data': _data?.map((e) => e.toMap()).toList(),
        'preset': _preset,
        'edited_time': _editedTime,
        'options': _options?.toMap(),
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
          isList: true,
        ),
        'preset': serializeParam(
          _preset,
          ParamType.String,
        ),
        'edited_time': serializeParam(
          _editedTime,
          ParamType.DateTime,
        ),
        'options': serializeParam(
          _options,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static VariableStruct fromSerializableMap(Map<String, dynamic> data) =>
      VariableStruct(
        info: deserializeStructParam(
          data['info'],
          ParamType.DataStruct,
          false,
          structBuilder: CodedValueStruct.fromSerializableMap,
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
        data: deserializeStructParam<DataPointStruct>(
          data['data'],
          ParamType.DataStruct,
          true,
          structBuilder: DataPointStruct.fromSerializableMap,
        ),
        preset: deserializeParam(
          data['preset'],
          ParamType.String,
          false,
        ),
        editedTime: deserializeParam(
          data['edited_time'],
          ParamType.DateTime,
          false,
        ),
        options: deserializeStructParam(
          data['options'],
          ParamType.DataStruct,
          false,
          structBuilder: VariableOptionsStruct.fromSerializableMap,
        ),
      );

  static VariableStruct fromAlgoliaData(Map<String, dynamic> data) =>
      VariableStruct(
        info: convertAlgoliaParam(
          data['info'],
          ParamType.DataStruct,
          false,
          structBuilder: CodedValueStruct.fromAlgoliaData,
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
        data: convertAlgoliaParam<DataPointStruct>(
          data['data'],
          ParamType.DataStruct,
          true,
          structBuilder: DataPointStruct.fromAlgoliaData,
        ),
        preset: convertAlgoliaParam(
          data['preset'],
          ParamType.String,
          false,
        ),
        editedTime: convertAlgoliaParam(
          data['edited_time'],
          ParamType.DateTime,
          false,
        ),
        options: convertAlgoliaParam(
          data['options'],
          ParamType.DataStruct,
          false,
          structBuilder: VariableOptionsStruct.fromAlgoliaData,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'VariableStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is VariableStruct &&
        info == other.info &&
        isList == other.isList &&
        isRanged == other.isRanged &&
        type == other.type &&
        unit == other.unit &&
        listEquality.equals(data, other.data) &&
        preset == other.preset &&
        editedTime == other.editedTime &&
        options == other.options;
  }

  @override
  int get hashCode => const ListEquality().hash(
      [info, isList, isRanged, type, unit, data, preset, editedTime, options]);
}

VariableStruct createVariableStruct({
  CodedValueStruct? info,
  bool? isList,
  bool? isRanged,
  String? type,
  String? unit,
  String? preset,
  DateTime? editedTime,
  VariableOptionsStruct? options,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    VariableStruct(
      info: info ?? (clearUnsetFields ? CodedValueStruct() : null),
      isList: isList,
      isRanged: isRanged,
      type: type,
      unit: unit,
      preset: preset,
      editedTime: editedTime,
      options: options ?? (clearUnsetFields ? VariableOptionsStruct() : null),
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

VariableStruct? updateVariableStruct(
  VariableStruct? variable, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    variable
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addVariableStructData(
  Map<String, dynamic> firestoreData,
  VariableStruct? variable,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (variable == null) {
    return;
  }
  if (variable.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && variable.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final variableData = getVariableFirestoreData(variable, forFieldValue);
  final nestedData = variableData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = variable.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getVariableFirestoreData(
  VariableStruct? variable, [
  bool forFieldValue = false,
]) {
  if (variable == null) {
    return {};
  }
  final firestoreData = mapToFirestore(variable.toMap());

  // Handle nested data for "info" field.
  addCodedValueStructData(
    firestoreData,
    variable.hasInfo() ? variable.info : null,
    'info',
    forFieldValue,
  );

  // Handle nested data for "options" field.
  addVariableOptionsStructData(
    firestoreData,
    variable.hasOptions() ? variable.options : null,
    'options',
    forFieldValue,
  );

  // Add any Firestore field values
  variable.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getVariableListFirestoreData(
  List<VariableStruct>? variables,
) =>
    variables?.map((e) => getVariableFirestoreData(e, true)).toList() ?? [];
