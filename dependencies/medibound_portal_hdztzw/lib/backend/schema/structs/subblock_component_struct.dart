// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SubblockComponentStruct extends FFFirebaseStruct {
  SubblockComponentStruct({
    DropdownStruct? info,
    List<String>? sizes,
    List<String>? types,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _info = info,
        _sizes = sizes,
        _types = types,
        super(firestoreUtilData);

  // "info" field.
  DropdownStruct? _info;
  DropdownStruct get info => _info ?? DropdownStruct();
  set info(DropdownStruct? val) => _info = val;

  void updateInfo(Function(DropdownStruct) updateFn) {
    updateFn(_info ??= DropdownStruct());
  }

  bool hasInfo() => _info != null;

  // "sizes" field.
  List<String>? _sizes;
  List<String> get sizes => _sizes ?? const [];
  set sizes(List<String>? val) => _sizes = val;

  void updateSizes(Function(List<String>) updateFn) {
    updateFn(_sizes ??= []);
  }

  bool hasSizes() => _sizes != null;

  // "types" field.
  List<String>? _types;
  List<String> get types => _types ?? const [];
  set types(List<String>? val) => _types = val;

  void updateTypes(Function(List<String>) updateFn) {
    updateFn(_types ??= []);
  }

  bool hasTypes() => _types != null;

  static SubblockComponentStruct fromMap(Map<String, dynamic> data) =>
      SubblockComponentStruct(
        info: data['info'] is DropdownStruct
            ? data['info']
            : DropdownStruct.maybeFromMap(data['info']),
        sizes: getDataList(data['sizes']),
        types: getDataList(data['types']),
      );

  static SubblockComponentStruct? maybeFromMap(dynamic data) => data is Map
      ? SubblockComponentStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'info': _info?.toMap(),
        'sizes': _sizes,
        'types': _types,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'info': serializeParam(
          _info,
          ParamType.DataStruct,
        ),
        'sizes': serializeParam(
          _sizes,
          ParamType.String,
          isList: true,
        ),
        'types': serializeParam(
          _types,
          ParamType.String,
          isList: true,
        ),
      }.withoutNulls;

  static SubblockComponentStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      SubblockComponentStruct(
        info: deserializeStructParam(
          data['info'],
          ParamType.DataStruct,
          false,
          structBuilder: DropdownStruct.fromSerializableMap,
        ),
        sizes: deserializeParam<String>(
          data['sizes'],
          ParamType.String,
          true,
        ),
        types: deserializeParam<String>(
          data['types'],
          ParamType.String,
          true,
        ),
      );

  static SubblockComponentStruct fromAlgoliaData(Map<String, dynamic> data) =>
      SubblockComponentStruct(
        info: convertAlgoliaParam(
          data['info'],
          ParamType.DataStruct,
          false,
          structBuilder: DropdownStruct.fromAlgoliaData,
        ),
        sizes: convertAlgoliaParam<String>(
          data['sizes'],
          ParamType.String,
          true,
        ),
        types: convertAlgoliaParam<String>(
          data['types'],
          ParamType.String,
          true,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'SubblockComponentStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is SubblockComponentStruct &&
        info == other.info &&
        listEquality.equals(sizes, other.sizes) &&
        listEquality.equals(types, other.types);
  }

  @override
  int get hashCode => const ListEquality().hash([info, sizes, types]);
}

SubblockComponentStruct createSubblockComponentStruct({
  DropdownStruct? info,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SubblockComponentStruct(
      info: info ?? (clearUnsetFields ? DropdownStruct() : null),
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SubblockComponentStruct? updateSubblockComponentStruct(
  SubblockComponentStruct? subblockComponent, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    subblockComponent
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSubblockComponentStructData(
  Map<String, dynamic> firestoreData,
  SubblockComponentStruct? subblockComponent,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (subblockComponent == null) {
    return;
  }
  if (subblockComponent.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && subblockComponent.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final subblockComponentData =
      getSubblockComponentFirestoreData(subblockComponent, forFieldValue);
  final nestedData =
      subblockComponentData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = subblockComponent.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSubblockComponentFirestoreData(
  SubblockComponentStruct? subblockComponent, [
  bool forFieldValue = false,
]) {
  if (subblockComponent == null) {
    return {};
  }
  final firestoreData = mapToFirestore(subblockComponent.toMap());

  // Handle nested data for "info" field.
  addDropdownStructData(
    firestoreData,
    subblockComponent.hasInfo() ? subblockComponent.info : null,
    'info',
    forFieldValue,
  );

  // Add any Firestore field values
  subblockComponent.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSubblockComponentListFirestoreData(
  List<SubblockComponentStruct>? subblockComponents,
) =>
    subblockComponents
        ?.map((e) => getSubblockComponentFirestoreData(e, true))
        .toList() ??
    [];
