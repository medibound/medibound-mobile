// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BodySectionStruct extends FFFirebaseStruct {
  BodySectionStruct({
    String? title,
    String? subtitle,
    String? body,
    List<BlockComponentStruct>? components,
    String? id,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _title = title,
        _subtitle = subtitle,
        _body = body,
        _components = components,
        _id = id,
        super(firestoreUtilData);

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  // "subtitle" field.
  String? _subtitle;
  String get subtitle => _subtitle ?? '';
  set subtitle(String? val) => _subtitle = val;

  bool hasSubtitle() => _subtitle != null;

  // "body" field.
  String? _body;
  String get body => _body ?? '';
  set body(String? val) => _body = val;

  bool hasBody() => _body != null;

  // "components" field.
  List<BlockComponentStruct>? _components;
  List<BlockComponentStruct> get components => _components ?? const [];
  set components(List<BlockComponentStruct>? val) => _components = val;

  void updateComponents(Function(List<BlockComponentStruct>) updateFn) {
    updateFn(_components ??= []);
  }

  bool hasComponents() => _components != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  static BodySectionStruct fromMap(Map<String, dynamic> data) =>
      BodySectionStruct(
        title: data['title'] as String?,
        subtitle: data['subtitle'] as String?,
        body: data['body'] as String?,
        components: getStructList(
          data['components'],
          BlockComponentStruct.fromMap,
        ),
        id: data['id'] as String?,
      );

  static BodySectionStruct? maybeFromMap(dynamic data) => data is Map
      ? BodySectionStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'title': _title,
        'subtitle': _subtitle,
        'body': _body,
        'components': _components?.map((e) => e.toMap()).toList(),
        'id': _id,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'subtitle': serializeParam(
          _subtitle,
          ParamType.String,
        ),
        'body': serializeParam(
          _body,
          ParamType.String,
        ),
        'components': serializeParam(
          _components,
          ParamType.DataStruct,
          isList: true,
        ),
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
      }.withoutNulls;

  static BodySectionStruct fromSerializableMap(Map<String, dynamic> data) =>
      BodySectionStruct(
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        subtitle: deserializeParam(
          data['subtitle'],
          ParamType.String,
          false,
        ),
        body: deserializeParam(
          data['body'],
          ParamType.String,
          false,
        ),
        components: deserializeStructParam<BlockComponentStruct>(
          data['components'],
          ParamType.DataStruct,
          true,
          structBuilder: BlockComponentStruct.fromSerializableMap,
        ),
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
      );

  static BodySectionStruct fromAlgoliaData(Map<String, dynamic> data) =>
      BodySectionStruct(
        title: convertAlgoliaParam(
          data['title'],
          ParamType.String,
          false,
        ),
        subtitle: convertAlgoliaParam(
          data['subtitle'],
          ParamType.String,
          false,
        ),
        body: convertAlgoliaParam(
          data['body'],
          ParamType.String,
          false,
        ),
        components: convertAlgoliaParam<BlockComponentStruct>(
          data['components'],
          ParamType.DataStruct,
          true,
          structBuilder: BlockComponentStruct.fromAlgoliaData,
        ),
        id: convertAlgoliaParam(
          data['id'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'BodySectionStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is BodySectionStruct &&
        title == other.title &&
        subtitle == other.subtitle &&
        body == other.body &&
        listEquality.equals(components, other.components) &&
        id == other.id;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([title, subtitle, body, components, id]);
}

BodySectionStruct createBodySectionStruct({
  String? title,
  String? subtitle,
  String? body,
  String? id,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    BodySectionStruct(
      title: title,
      subtitle: subtitle,
      body: body,
      id: id,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

BodySectionStruct? updateBodySectionStruct(
  BodySectionStruct? bodySection, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    bodySection
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addBodySectionStructData(
  Map<String, dynamic> firestoreData,
  BodySectionStruct? bodySection,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (bodySection == null) {
    return;
  }
  if (bodySection.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && bodySection.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final bodySectionData =
      getBodySectionFirestoreData(bodySection, forFieldValue);
  final nestedData =
      bodySectionData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = bodySection.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getBodySectionFirestoreData(
  BodySectionStruct? bodySection, [
  bool forFieldValue = false,
]) {
  if (bodySection == null) {
    return {};
  }
  final firestoreData = mapToFirestore(bodySection.toMap());

  // Add any Firestore field values
  bodySection.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getBodySectionListFirestoreData(
  List<BodySectionStruct>? bodySections,
) =>
    bodySections?.map((e) => getBodySectionFirestoreData(e, true)).toList() ??
    [];
