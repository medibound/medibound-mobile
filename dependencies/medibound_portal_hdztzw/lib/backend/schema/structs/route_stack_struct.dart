// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RouteStackStruct extends FFFirebaseStruct {
  RouteStackStruct({
    CodedValueStruct? section,
    List<CodedValueStruct>? routes,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _section = section,
        _routes = routes,
        super(firestoreUtilData);

  // "section" field.
  CodedValueStruct? _section;
  CodedValueStruct get section => _section ?? CodedValueStruct();
  set section(CodedValueStruct? val) => _section = val;

  void updateSection(Function(CodedValueStruct) updateFn) {
    updateFn(_section ??= CodedValueStruct());
  }

  bool hasSection() => _section != null;

  // "routes" field.
  List<CodedValueStruct>? _routes;
  List<CodedValueStruct> get routes => _routes ?? const [];
  set routes(List<CodedValueStruct>? val) => _routes = val;

  void updateRoutes(Function(List<CodedValueStruct>) updateFn) {
    updateFn(_routes ??= []);
  }

  bool hasRoutes() => _routes != null;

  static RouteStackStruct fromMap(Map<String, dynamic> data) =>
      RouteStackStruct(
        section: data['section'] is CodedValueStruct
            ? data['section']
            : CodedValueStruct.maybeFromMap(data['section']),
        routes: getStructList(
          data['routes'],
          CodedValueStruct.fromMap,
        ),
      );

  static RouteStackStruct? maybeFromMap(dynamic data) => data is Map
      ? RouteStackStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'section': _section?.toMap(),
        'routes': _routes?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'section': serializeParam(
          _section,
          ParamType.DataStruct,
        ),
        'routes': serializeParam(
          _routes,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static RouteStackStruct fromSerializableMap(Map<String, dynamic> data) =>
      RouteStackStruct(
        section: deserializeStructParam(
          data['section'],
          ParamType.DataStruct,
          false,
          structBuilder: CodedValueStruct.fromSerializableMap,
        ),
        routes: deserializeStructParam<CodedValueStruct>(
          data['routes'],
          ParamType.DataStruct,
          true,
          structBuilder: CodedValueStruct.fromSerializableMap,
        ),
      );

  static RouteStackStruct fromAlgoliaData(Map<String, dynamic> data) =>
      RouteStackStruct(
        section: convertAlgoliaParam(
          data['section'],
          ParamType.DataStruct,
          false,
          structBuilder: CodedValueStruct.fromAlgoliaData,
        ),
        routes: convertAlgoliaParam<CodedValueStruct>(
          data['routes'],
          ParamType.DataStruct,
          true,
          structBuilder: CodedValueStruct.fromAlgoliaData,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'RouteStackStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is RouteStackStruct &&
        section == other.section &&
        listEquality.equals(routes, other.routes);
  }

  @override
  int get hashCode => const ListEquality().hash([section, routes]);
}

RouteStackStruct createRouteStackStruct({
  CodedValueStruct? section,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    RouteStackStruct(
      section: section ?? (clearUnsetFields ? CodedValueStruct() : null),
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

RouteStackStruct? updateRouteStackStruct(
  RouteStackStruct? routeStack, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    routeStack
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addRouteStackStructData(
  Map<String, dynamic> firestoreData,
  RouteStackStruct? routeStack,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (routeStack == null) {
    return;
  }
  if (routeStack.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && routeStack.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final routeStackData = getRouteStackFirestoreData(routeStack, forFieldValue);
  final nestedData = routeStackData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = routeStack.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getRouteStackFirestoreData(
  RouteStackStruct? routeStack, [
  bool forFieldValue = false,
]) {
  if (routeStack == null) {
    return {};
  }
  final firestoreData = mapToFirestore(routeStack.toMap());

  // Handle nested data for "section" field.
  addCodedValueStructData(
    firestoreData,
    routeStack.hasSection() ? routeStack.section : null,
    'section',
    forFieldValue,
  );

  // Add any Firestore field values
  routeStack.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getRouteStackListFirestoreData(
  List<RouteStackStruct>? routeStacks,
) =>
    routeStacks?.map((e) => getRouteStackFirestoreData(e, true)).toList() ?? [];
