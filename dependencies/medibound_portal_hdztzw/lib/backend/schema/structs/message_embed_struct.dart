// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MessageEmbedStruct extends FFFirebaseStruct {
  MessageEmbedStruct({
    List<CodedValueStruct>? list,
    List<CodedValueStruct>? actions,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _list = list,
        _actions = actions,
        super(firestoreUtilData);

  // "list" field.
  List<CodedValueStruct>? _list;
  List<CodedValueStruct> get list => _list ?? const [];
  set list(List<CodedValueStruct>? val) => _list = val;

  void updateList(Function(List<CodedValueStruct>) updateFn) {
    updateFn(_list ??= []);
  }

  bool hasList() => _list != null;

  // "actions" field.
  List<CodedValueStruct>? _actions;
  List<CodedValueStruct> get actions => _actions ?? const [];
  set actions(List<CodedValueStruct>? val) => _actions = val;

  void updateActions(Function(List<CodedValueStruct>) updateFn) {
    updateFn(_actions ??= []);
  }

  bool hasActions() => _actions != null;

  static MessageEmbedStruct fromMap(Map<String, dynamic> data) =>
      MessageEmbedStruct(
        list: getStructList(
          data['list'],
          CodedValueStruct.fromMap,
        ),
        actions: getStructList(
          data['actions'],
          CodedValueStruct.fromMap,
        ),
      );

  static MessageEmbedStruct? maybeFromMap(dynamic data) => data is Map
      ? MessageEmbedStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'list': _list?.map((e) => e.toMap()).toList(),
        'actions': _actions?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'list': serializeParam(
          _list,
          ParamType.DataStruct,
          isList: true,
        ),
        'actions': serializeParam(
          _actions,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static MessageEmbedStruct fromSerializableMap(Map<String, dynamic> data) =>
      MessageEmbedStruct(
        list: deserializeStructParam<CodedValueStruct>(
          data['list'],
          ParamType.DataStruct,
          true,
          structBuilder: CodedValueStruct.fromSerializableMap,
        ),
        actions: deserializeStructParam<CodedValueStruct>(
          data['actions'],
          ParamType.DataStruct,
          true,
          structBuilder: CodedValueStruct.fromSerializableMap,
        ),
      );

  static MessageEmbedStruct fromAlgoliaData(Map<String, dynamic> data) =>
      MessageEmbedStruct(
        list: convertAlgoliaParam<CodedValueStruct>(
          data['list'],
          ParamType.DataStruct,
          true,
          structBuilder: CodedValueStruct.fromAlgoliaData,
        ),
        actions: convertAlgoliaParam<CodedValueStruct>(
          data['actions'],
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
  String toString() => 'MessageEmbedStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is MessageEmbedStruct &&
        listEquality.equals(list, other.list) &&
        listEquality.equals(actions, other.actions);
  }

  @override
  int get hashCode => const ListEquality().hash([list, actions]);
}

MessageEmbedStruct createMessageEmbedStruct({
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    MessageEmbedStruct(
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

MessageEmbedStruct? updateMessageEmbedStruct(
  MessageEmbedStruct? messageEmbed, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    messageEmbed
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addMessageEmbedStructData(
  Map<String, dynamic> firestoreData,
  MessageEmbedStruct? messageEmbed,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (messageEmbed == null) {
    return;
  }
  if (messageEmbed.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && messageEmbed.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final messageEmbedData =
      getMessageEmbedFirestoreData(messageEmbed, forFieldValue);
  final nestedData =
      messageEmbedData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = messageEmbed.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getMessageEmbedFirestoreData(
  MessageEmbedStruct? messageEmbed, [
  bool forFieldValue = false,
]) {
  if (messageEmbed == null) {
    return {};
  }
  final firestoreData = mapToFirestore(messageEmbed.toMap());

  // Add any Firestore field values
  messageEmbed.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getMessageEmbedListFirestoreData(
  List<MessageEmbedStruct>? messageEmbeds,
) =>
    messageEmbeds?.map((e) => getMessageEmbedFirestoreData(e, true)).toList() ??
    [];
