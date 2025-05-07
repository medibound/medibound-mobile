// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BlockTypeStruct extends FFFirebaseStruct {
  BlockTypeStruct({
    CodedValueStruct? info,
    List<String>? allowedSizes,
    List<String>? allowedVariableTypes,
    List<String>? allowedVariableForms,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _info = info,
        _allowedSizes = allowedSizes,
        _allowedVariableTypes = allowedVariableTypes,
        _allowedVariableForms = allowedVariableForms,
        super(firestoreUtilData);

  // "info" field.
  CodedValueStruct? _info;
  CodedValueStruct get info => _info ?? CodedValueStruct();
  set info(CodedValueStruct? val) => _info = val;

  void updateInfo(Function(CodedValueStruct) updateFn) {
    updateFn(_info ??= CodedValueStruct());
  }

  bool hasInfo() => _info != null;

  // "allowed_sizes" field.
  List<String>? _allowedSizes;
  List<String> get allowedSizes => _allowedSizes ?? const [];
  set allowedSizes(List<String>? val) => _allowedSizes = val;

  void updateAllowedSizes(Function(List<String>) updateFn) {
    updateFn(_allowedSizes ??= []);
  }

  bool hasAllowedSizes() => _allowedSizes != null;

  // "allowed_variable_types" field.
  List<String>? _allowedVariableTypes;
  List<String> get allowedVariableTypes => _allowedVariableTypes ?? const [];
  set allowedVariableTypes(List<String>? val) => _allowedVariableTypes = val;

  void updateAllowedVariableTypes(Function(List<String>) updateFn) {
    updateFn(_allowedVariableTypes ??= []);
  }

  bool hasAllowedVariableTypes() => _allowedVariableTypes != null;

  // "allowed_variable_forms" field.
  List<String>? _allowedVariableForms;
  List<String> get allowedVariableForms => _allowedVariableForms ?? const [];
  set allowedVariableForms(List<String>? val) => _allowedVariableForms = val;

  void updateAllowedVariableForms(Function(List<String>) updateFn) {
    updateFn(_allowedVariableForms ??= []);
  }

  bool hasAllowedVariableForms() => _allowedVariableForms != null;

  static BlockTypeStruct fromMap(Map<String, dynamic> data) => BlockTypeStruct(
        info: data['info'] is CodedValueStruct
            ? data['info']
            : CodedValueStruct.maybeFromMap(data['info']),
        allowedSizes: getDataList(data['allowed_sizes']),
        allowedVariableTypes: getDataList(data['allowed_variable_types']),
        allowedVariableForms: getDataList(data['allowed_variable_forms']),
      );

  static BlockTypeStruct? maybeFromMap(dynamic data) => data is Map
      ? BlockTypeStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'info': _info?.toMap(),
        'allowed_sizes': _allowedSizes,
        'allowed_variable_types': _allowedVariableTypes,
        'allowed_variable_forms': _allowedVariableForms,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'info': serializeParam(
          _info,
          ParamType.DataStruct,
        ),
        'allowed_sizes': serializeParam(
          _allowedSizes,
          ParamType.String,
          isList: true,
        ),
        'allowed_variable_types': serializeParam(
          _allowedVariableTypes,
          ParamType.String,
          isList: true,
        ),
        'allowed_variable_forms': serializeParam(
          _allowedVariableForms,
          ParamType.String,
          isList: true,
        ),
      }.withoutNulls;

  static BlockTypeStruct fromSerializableMap(Map<String, dynamic> data) =>
      BlockTypeStruct(
        info: deserializeStructParam(
          data['info'],
          ParamType.DataStruct,
          false,
          structBuilder: CodedValueStruct.fromSerializableMap,
        ),
        allowedSizes: deserializeParam<String>(
          data['allowed_sizes'],
          ParamType.String,
          true,
        ),
        allowedVariableTypes: deserializeParam<String>(
          data['allowed_variable_types'],
          ParamType.String,
          true,
        ),
        allowedVariableForms: deserializeParam<String>(
          data['allowed_variable_forms'],
          ParamType.String,
          true,
        ),
      );

  static BlockTypeStruct fromAlgoliaData(Map<String, dynamic> data) =>
      BlockTypeStruct(
        info: convertAlgoliaParam(
          data['info'],
          ParamType.DataStruct,
          false,
          structBuilder: CodedValueStruct.fromAlgoliaData,
        ),
        allowedSizes: convertAlgoliaParam<String>(
          data['allowed_sizes'],
          ParamType.String,
          true,
        ),
        allowedVariableTypes: convertAlgoliaParam<String>(
          data['allowed_variable_types'],
          ParamType.String,
          true,
        ),
        allowedVariableForms: convertAlgoliaParam<String>(
          data['allowed_variable_forms'],
          ParamType.String,
          true,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'BlockTypeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is BlockTypeStruct &&
        info == other.info &&
        listEquality.equals(allowedSizes, other.allowedSizes) &&
        listEquality.equals(allowedVariableTypes, other.allowedVariableTypes) &&
        listEquality.equals(allowedVariableForms, other.allowedVariableForms);
  }

  @override
  int get hashCode => const ListEquality()
      .hash([info, allowedSizes, allowedVariableTypes, allowedVariableForms]);
}

BlockTypeStruct createBlockTypeStruct({
  CodedValueStruct? info,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    BlockTypeStruct(
      info: info ?? (clearUnsetFields ? CodedValueStruct() : null),
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

BlockTypeStruct? updateBlockTypeStruct(
  BlockTypeStruct? blockType, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    blockType
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addBlockTypeStructData(
  Map<String, dynamic> firestoreData,
  BlockTypeStruct? blockType,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (blockType == null) {
    return;
  }
  if (blockType.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && blockType.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final blockTypeData = getBlockTypeFirestoreData(blockType, forFieldValue);
  final nestedData = blockTypeData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = blockType.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getBlockTypeFirestoreData(
  BlockTypeStruct? blockType, [
  bool forFieldValue = false,
]) {
  if (blockType == null) {
    return {};
  }
  final firestoreData = mapToFirestore(blockType.toMap());

  // Handle nested data for "info" field.
  addCodedValueStructData(
    firestoreData,
    blockType.hasInfo() ? blockType.info : null,
    'info',
    forFieldValue,
  );

  // Add any Firestore field values
  blockType.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getBlockTypeListFirestoreData(
  List<BlockTypeStruct>? blockTypes,
) =>
    blockTypes?.map((e) => getBlockTypeFirestoreData(e, true)).toList() ?? [];
