// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RouteStruct extends FFFirebaseStruct {
  RouteStruct({
    String? display,
    String? section,
    String? page,
    String? id,
    String? tab,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _display = display,
        _section = section,
        _page = page,
        _id = id,
        _tab = tab,
        super(firestoreUtilData);

  // "display" field.
  String? _display;
  String get display => _display ?? '';
  set display(String? val) => _display = val;

  bool hasDisplay() => _display != null;

  // "section" field.
  String? _section;
  String get section => _section ?? '';
  set section(String? val) => _section = val;

  bool hasSection() => _section != null;

  // "page" field.
  String? _page;
  String get page => _page ?? '';
  set page(String? val) => _page = val;

  bool hasPage() => _page != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "tab" field.
  String? _tab;
  String get tab => _tab ?? '';
  set tab(String? val) => _tab = val;

  bool hasTab() => _tab != null;

  static RouteStruct fromMap(Map<String, dynamic> data) => RouteStruct(
        display: data['display'] as String?,
        section: data['section'] as String?,
        page: data['page'] as String?,
        id: data['id'] as String?,
        tab: data['tab'] as String?,
      );

  static RouteStruct? maybeFromMap(dynamic data) =>
      data is Map ? RouteStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'display': _display,
        'section': _section,
        'page': _page,
        'id': _id,
        'tab': _tab,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'display': serializeParam(
          _display,
          ParamType.String,
        ),
        'section': serializeParam(
          _section,
          ParamType.String,
        ),
        'page': serializeParam(
          _page,
          ParamType.String,
        ),
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'tab': serializeParam(
          _tab,
          ParamType.String,
        ),
      }.withoutNulls;

  static RouteStruct fromSerializableMap(Map<String, dynamic> data) =>
      RouteStruct(
        display: deserializeParam(
          data['display'],
          ParamType.String,
          false,
        ),
        section: deserializeParam(
          data['section'],
          ParamType.String,
          false,
        ),
        page: deserializeParam(
          data['page'],
          ParamType.String,
          false,
        ),
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        tab: deserializeParam(
          data['tab'],
          ParamType.String,
          false,
        ),
      );

  static RouteStruct fromAlgoliaData(Map<String, dynamic> data) => RouteStruct(
        display: convertAlgoliaParam(
          data['display'],
          ParamType.String,
          false,
        ),
        section: convertAlgoliaParam(
          data['section'],
          ParamType.String,
          false,
        ),
        page: convertAlgoliaParam(
          data['page'],
          ParamType.String,
          false,
        ),
        id: convertAlgoliaParam(
          data['id'],
          ParamType.String,
          false,
        ),
        tab: convertAlgoliaParam(
          data['tab'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'RouteStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is RouteStruct &&
        display == other.display &&
        section == other.section &&
        page == other.page &&
        id == other.id &&
        tab == other.tab;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([display, section, page, id, tab]);
}

RouteStruct createRouteStruct({
  String? display,
  String? section,
  String? page,
  String? id,
  String? tab,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    RouteStruct(
      display: display,
      section: section,
      page: page,
      id: id,
      tab: tab,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

RouteStruct? updateRouteStruct(
  RouteStruct? route, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    route
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addRouteStructData(
  Map<String, dynamic> firestoreData,
  RouteStruct? route,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (route == null) {
    return;
  }
  if (route.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && route.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final routeData = getRouteFirestoreData(route, forFieldValue);
  final nestedData = routeData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = route.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getRouteFirestoreData(
  RouteStruct? route, [
  bool forFieldValue = false,
]) {
  if (route == null) {
    return {};
  }
  final firestoreData = mapToFirestore(route.toMap());

  // Add any Firestore field values
  route.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getRouteListFirestoreData(
  List<RouteStruct>? routes,
) =>
    routes?.map((e) => getRouteFirestoreData(e, true)).toList() ?? [];
