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
    String? graphSize,
    Color? color,
    String? blockType,
    List<String>? variableIds,
    String? timeWindow,
    String? tickerType,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _info = info,
        _graphSize = graphSize,
        _color = color,
        _blockType = blockType,
        _variableIds = variableIds,
        _timeWindow = timeWindow,
        _tickerType = tickerType,
        super(firestoreUtilData);

  // "info" field.
  CodedValueStruct? _info;
  CodedValueStruct get info => _info ?? CodedValueStruct();
  set info(CodedValueStruct? val) => _info = val;

  void updateInfo(Function(CodedValueStruct) updateFn) {
    updateFn(_info ??= CodedValueStruct());
  }

  bool hasInfo() => _info != null;

  // "graphSize" field.
  String? _graphSize;
  String get graphSize => _graphSize ?? '';
  set graphSize(String? val) => _graphSize = val;

  bool hasGraphSize() => _graphSize != null;

  // "color" field.
  Color? _color;
  Color? get color => _color;
  set color(Color? val) => _color = val;

  bool hasColor() => _color != null;

  // "blockType" field.
  String? _blockType;
  String get blockType => _blockType ?? '';
  set blockType(String? val) => _blockType = val;

  bool hasBlockType() => _blockType != null;

  // "variable_ids" field.
  List<String>? _variableIds;
  List<String> get variableIds => _variableIds ?? const [];
  set variableIds(List<String>? val) => _variableIds = val;

  void updateVariableIds(Function(List<String>) updateFn) {
    updateFn(_variableIds ??= []);
  }

  bool hasVariableIds() => _variableIds != null;

  // "timeWindow" field.
  String? _timeWindow;
  String get timeWindow => _timeWindow ?? '';
  set timeWindow(String? val) => _timeWindow = val;

  bool hasTimeWindow() => _timeWindow != null;

  // "tickerType" field.
  String? _tickerType;
  String get tickerType => _tickerType ?? '';
  set tickerType(String? val) => _tickerType = val;

  bool hasTickerType() => _tickerType != null;

  static BlockComponentStruct fromMap(Map<String, dynamic> data) =>
      BlockComponentStruct(
        info: data['info'] is CodedValueStruct
            ? data['info']
            : CodedValueStruct.maybeFromMap(data['info']),
        graphSize: data['graphSize'] as String?,
        color: getSchemaColor(data['color']),
        blockType: data['blockType'] as String?,
        variableIds: getDataList(data['variable_ids']),
        timeWindow: data['timeWindow'] as String?,
        tickerType: data['tickerType'] as String?,
      );

  static BlockComponentStruct? maybeFromMap(dynamic data) => data is Map
      ? BlockComponentStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'info': _info?.toMap(),
        'graphSize': _graphSize,
        'color': _color,
        'blockType': _blockType,
        'variable_ids': _variableIds,
        'timeWindow': _timeWindow,
        'tickerType': _tickerType,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'info': serializeParam(
          _info,
          ParamType.DataStruct,
        ),
        'graphSize': serializeParam(
          _graphSize,
          ParamType.String,
        ),
        'color': serializeParam(
          _color,
          ParamType.Color,
        ),
        'blockType': serializeParam(
          _blockType,
          ParamType.String,
        ),
        'variable_ids': serializeParam(
          _variableIds,
          ParamType.String,
          isList: true,
        ),
        'timeWindow': serializeParam(
          _timeWindow,
          ParamType.String,
        ),
        'tickerType': serializeParam(
          _tickerType,
          ParamType.String,
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
        graphSize: deserializeParam(
          data['graphSize'],
          ParamType.String,
          false,
        ),
        color: deserializeParam(
          data['color'],
          ParamType.Color,
          false,
        ),
        blockType: deserializeParam(
          data['blockType'],
          ParamType.String,
          false,
        ),
        variableIds: deserializeParam<String>(
          data['variable_ids'],
          ParamType.String,
          true,
        ),
        timeWindow: deserializeParam(
          data['timeWindow'],
          ParamType.String,
          false,
        ),
        tickerType: deserializeParam(
          data['tickerType'],
          ParamType.String,
          false,
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
        graphSize: convertAlgoliaParam(
          data['graphSize'],
          ParamType.String,
          false,
        ),
        color: convertAlgoliaParam(
          data['color'],
          ParamType.Color,
          false,
        ),
        blockType: convertAlgoliaParam(
          data['blockType'],
          ParamType.String,
          false,
        ),
        variableIds: convertAlgoliaParam<String>(
          data['variable_ids'],
          ParamType.String,
          true,
        ),
        timeWindow: convertAlgoliaParam(
          data['timeWindow'],
          ParamType.String,
          false,
        ),
        tickerType: convertAlgoliaParam(
          data['tickerType'],
          ParamType.String,
          false,
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
        graphSize == other.graphSize &&
        color == other.color &&
        blockType == other.blockType &&
        listEquality.equals(variableIds, other.variableIds) &&
        timeWindow == other.timeWindow &&
        tickerType == other.tickerType;
  }

  @override
  int get hashCode => const ListEquality().hash(
      [info, graphSize, color, blockType, variableIds, timeWindow, tickerType]);
}

BlockComponentStruct createBlockComponentStruct({
  CodedValueStruct? info,
  String? graphSize,
  Color? color,
  String? blockType,
  String? timeWindow,
  String? tickerType,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    BlockComponentStruct(
      info: info ?? (clearUnsetFields ? CodedValueStruct() : null),
      graphSize: graphSize,
      color: color,
      blockType: blockType,
      timeWindow: timeWindow,
      tickerType: tickerType,
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
