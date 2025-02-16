// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CodedValueStruct extends FFFirebaseStruct {
  CodedValueStruct({
    String? display,
    String? description,
    String? code,
    Color? color,
    String? icon,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _display = display,
        _description = description,
        _code = code,
        _color = color,
        _icon = icon,
        super(firestoreUtilData);

  // "display" field.
  String? _display;
  String get display => _display ?? '';
  set display(String? val) => _display = val;

  bool hasDisplay() => _display != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  // "code" field.
  String? _code;
  String get code => _code ?? '';
  set code(String? val) => _code = val;

  bool hasCode() => _code != null;

  // "color" field.
  Color? _color;
  Color? get color => _color;
  set color(Color? val) => _color = val;

  bool hasColor() => _color != null;

  // "icon" field.
  String? _icon;
  String get icon => _icon ?? '';
  set icon(String? val) => _icon = val;

  bool hasIcon() => _icon != null;

  static CodedValueStruct fromMap(Map<String, dynamic> data) =>
      CodedValueStruct(
        display: data['display'] as String?,
        description: data['description'] as String?,
        code: data['code'] as String?,
        color: getSchemaColor(data['color']),
        icon: data['icon'] as String?,
      );

  static CodedValueStruct? maybeFromMap(dynamic data) => data is Map
      ? CodedValueStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'display': _display,
        'description': _description,
        'code': _code,
        'color': _color,
        'icon': _icon,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'display': serializeParam(
          _display,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'code': serializeParam(
          _code,
          ParamType.String,
        ),
        'color': serializeParam(
          _color,
          ParamType.Color,
        ),
        'icon': serializeParam(
          _icon,
          ParamType.String,
        ),
      }.withoutNulls;

  static CodedValueStruct fromSerializableMap(Map<String, dynamic> data) =>
      CodedValueStruct(
        display: deserializeParam(
          data['display'],
          ParamType.String,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        code: deserializeParam(
          data['code'],
          ParamType.String,
          false,
        ),
        color: deserializeParam(
          data['color'],
          ParamType.Color,
          false,
        ),
        icon: deserializeParam(
          data['icon'],
          ParamType.String,
          false,
        ),
      );

  static CodedValueStruct fromAlgoliaData(Map<String, dynamic> data) =>
      CodedValueStruct(
        display: convertAlgoliaParam(
          data['display'],
          ParamType.String,
          false,
        ),
        description: convertAlgoliaParam(
          data['description'],
          ParamType.String,
          false,
        ),
        code: convertAlgoliaParam(
          data['code'],
          ParamType.String,
          false,
        ),
        color: convertAlgoliaParam(
          data['color'],
          ParamType.Color,
          false,
        ),
        icon: convertAlgoliaParam(
          data['icon'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'CodedValueStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CodedValueStruct &&
        display == other.display &&
        description == other.description &&
        code == other.code &&
        color == other.color &&
        icon == other.icon;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([display, description, code, color, icon]);
}

CodedValueStruct createCodedValueStruct({
  String? display,
  String? description,
  String? code,
  Color? color,
  String? icon,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CodedValueStruct(
      display: display,
      description: description,
      code: code,
      color: color,
      icon: icon,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CodedValueStruct? updateCodedValueStruct(
  CodedValueStruct? codedValue, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    codedValue
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCodedValueStructData(
  Map<String, dynamic> firestoreData,
  CodedValueStruct? codedValue,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (codedValue == null) {
    return;
  }
  if (codedValue.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && codedValue.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final codedValueData = getCodedValueFirestoreData(codedValue, forFieldValue);
  final nestedData = codedValueData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = codedValue.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCodedValueFirestoreData(
  CodedValueStruct? codedValue, [
  bool forFieldValue = false,
]) {
  if (codedValue == null) {
    return {};
  }
  final firestoreData = mapToFirestore(codedValue.toMap());

  // Add any Firestore field values
  codedValue.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCodedValueListFirestoreData(
  List<CodedValueStruct>? codedValues,
) =>
    codedValues?.map((e) => getCodedValueFirestoreData(e, true)).toList() ?? [];
