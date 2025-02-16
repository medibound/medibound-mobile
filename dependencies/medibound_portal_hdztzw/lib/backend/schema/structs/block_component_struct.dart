// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BlockComponentStruct extends FFFirebaseStruct {
  BlockComponentStruct({
    CodedValueStruct? info,
    String? size,
    Color? color,
    String? subBlock,
    List<String>? variableIds,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _info = info,
        _size = size,
        _color = color,
        _subBlock = subBlock,
        _variableIds = variableIds,
        super(firestoreUtilData);

  // "info" field.
  CodedValueStruct? _info;
  CodedValueStruct get info => _info ?? CodedValueStruct();
  set info(CodedValueStruct? val) => _info = val;

  void updateInfo(Function(CodedValueStruct) updateFn) {
    updateFn(_info ??= CodedValueStruct());
  }

  bool hasInfo() => _info != null;

  // "size" field.
  String? _size;
  String get size => _size ?? '';
  set size(String? val) => _size = val;

  bool hasSize() => _size != null;

  // "color" field.
  Color? _color;
  Color? get color => _color;
  set color(Color? val) => _color = val;

  bool hasColor() => _color != null;

  // "sub_block" field.
  String? _subBlock;
  String get subBlock => _subBlock ?? '';
  set subBlock(String? val) => _subBlock = val;

  bool hasSubBlock() => _subBlock != null;

  // "variable_ids" field.
  List<String>? _variableIds;
  List<String> get variableIds => _variableIds ?? const [];
  set variableIds(List<String>? val) => _variableIds = val;

  void updateVariableIds(Function(List<String>) updateFn) {
    updateFn(_variableIds ??= []);
  }

  bool hasVariableIds() => _variableIds != null;

  static BlockComponentStruct fromMap(Map<String, dynamic> data) =>
      BlockComponentStruct(
        info: data['info'] is CodedValueStruct
            ? data['info']
            : CodedValueStruct.maybeFromMap(data['info']),
        size: data['size'] as String?,
        color: getSchemaColor(data['color']),
        subBlock: data['sub_block'] as String?,
        variableIds: getDataList(data['variable_ids']),
      );

  static BlockComponentStruct? maybeFromMap(dynamic data) => data is Map
      ? BlockComponentStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'info': _info?.toMap(),
        'size': _size,
        'color': _color,
        'sub_block': _subBlock,
        'variable_ids': _variableIds,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'info': serializeParam(
          _info,
          ParamType.DataStruct,
        ),
        'size': serializeParam(
          _size,
          ParamType.String,
        ),
        'color': serializeParam(
          _color,
          ParamType.Color,
        ),
        'sub_block': serializeParam(
          _subBlock,
          ParamType.String,
        ),
        'variable_ids': serializeParam(
          _variableIds,
          ParamType.String,
          isList: true,
        ),
      }.withoutNulls;

  static BlockComponentStruct fromSerializableMap(Map<String, dynamic> data) =>
      BlockComponentStruct(
        info: deserializeStructParam(
          data['info'],
          ParamType.DataStruct,
          false,
          structBuilder: CodedValueStruct.fromSerializableMap,
        ),
        size: deserializeParam(
          data['size'],
          ParamType.String,
          false,
        ),
        color: deserializeParam(
          data['color'],
          ParamType.Color,
          false,
        ),
        subBlock: deserializeParam(
          data['sub_block'],
          ParamType.String,
          false,
        ),
        variableIds: deserializeParam<String>(
          data['variable_ids'],
          ParamType.String,
          true,
        ),
      );

  static BlockComponentStruct fromAlgoliaData(Map<String, dynamic> data) =>
      BlockComponentStruct(
        info: convertAlgoliaParam(
          data['info'],
          ParamType.DataStruct,
          false,
          structBuilder: CodedValueStruct.fromAlgoliaData,
        ),
        size: convertAlgoliaParam(
          data['size'],
          ParamType.String,
          false,
        ),
        color: convertAlgoliaParam(
          data['color'],
          ParamType.Color,
          false,
        ),
        subBlock: convertAlgoliaParam(
          data['sub_block'],
          ParamType.String,
          false,
        ),
        variableIds: convertAlgoliaParam<String>(
          data['variable_ids'],
          ParamType.String,
          true,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'BlockComponentStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is BlockComponentStruct &&
        info == other.info &&
        size == other.size &&
        color == other.color &&
        subBlock == other.subBlock &&
        listEquality.equals(variableIds, other.variableIds);
  }

  @override
  int get hashCode =>
      const ListEquality().hash([info, size, color, subBlock, variableIds]);
}

BlockComponentStruct createBlockComponentStruct({
  CodedValueStruct? info,
  String? size,
  Color? color,
  String? subBlock,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    BlockComponentStruct(
      info: info ?? (clearUnsetFields ? CodedValueStruct() : null),
      size: size,
      color: color,
      subBlock: subBlock,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

BlockComponentStruct? updateBlockComponentStruct(
  BlockComponentStruct? blockComponent, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    blockComponent
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addBlockComponentStructData(
  Map<String, dynamic> firestoreData,
  BlockComponentStruct? blockComponent,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (blockComponent == null) {
    return;
  }
  if (blockComponent.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && blockComponent.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final blockComponentData =
      getBlockComponentFirestoreData(blockComponent, forFieldValue);
  final nestedData =
      blockComponentData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = blockComponent.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getBlockComponentFirestoreData(
  BlockComponentStruct? blockComponent, [
  bool forFieldValue = false,
]) {
  if (blockComponent == null) {
    return {};
  }
  final firestoreData = mapToFirestore(blockComponent.toMap());

  // Handle nested data for "info" field.
  addCodedValueStructData(
    firestoreData,
    blockComponent.hasInfo() ? blockComponent.info : null,
    'info',
    forFieldValue,
  );

  // Add any Firestore field values
  blockComponent.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getBlockComponentListFirestoreData(
  List<BlockComponentStruct>? blockComponents,
) =>
    blockComponents
        ?.map((e) => getBlockComponentFirestoreData(e, true))
        .toList() ??
    [];
