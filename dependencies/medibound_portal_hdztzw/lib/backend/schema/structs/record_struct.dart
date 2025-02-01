// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RecordStruct extends FFFirebaseStruct {
  RecordStruct({
    DropdownStruct? info,
    List<BlockComponentStruct>? header,
    List<BodySectionStruct>? sections,
    ProfileStruct? organization,
    ProfileStruct? user,
    ProfileStruct? device,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _info = info,
        _header = header,
        _sections = sections,
        _organization = organization,
        _user = user,
        _device = device,
        super(firestoreUtilData);

  // "info" field.
  DropdownStruct? _info;
  DropdownStruct get info => _info ?? DropdownStruct();
  set info(DropdownStruct? val) => _info = val;

  void updateInfo(Function(DropdownStruct) updateFn) {
    updateFn(_info ??= DropdownStruct());
  }

  bool hasInfo() => _info != null;

  // "header" field.
  List<BlockComponentStruct>? _header;
  List<BlockComponentStruct> get header => _header ?? const [];
  set header(List<BlockComponentStruct>? val) => _header = val;

  void updateHeader(Function(List<BlockComponentStruct>) updateFn) {
    updateFn(_header ??= []);
  }

  bool hasHeader() => _header != null;

  // "sections" field.
  List<BodySectionStruct>? _sections;
  List<BodySectionStruct> get sections => _sections ?? const [];
  set sections(List<BodySectionStruct>? val) => _sections = val;

  void updateSections(Function(List<BodySectionStruct>) updateFn) {
    updateFn(_sections ??= []);
  }

  bool hasSections() => _sections != null;

  // "organization" field.
  ProfileStruct? _organization;
  ProfileStruct get organization => _organization ?? ProfileStruct();
  set organization(ProfileStruct? val) => _organization = val;

  void updateOrganization(Function(ProfileStruct) updateFn) {
    updateFn(_organization ??= ProfileStruct());
  }

  bool hasOrganization() => _organization != null;

  // "user" field.
  ProfileStruct? _user;
  ProfileStruct get user => _user ?? ProfileStruct();
  set user(ProfileStruct? val) => _user = val;

  void updateUser(Function(ProfileStruct) updateFn) {
    updateFn(_user ??= ProfileStruct());
  }

  bool hasUser() => _user != null;

  // "device" field.
  ProfileStruct? _device;
  ProfileStruct get device => _device ?? ProfileStruct();
  set device(ProfileStruct? val) => _device = val;

  void updateDevice(Function(ProfileStruct) updateFn) {
    updateFn(_device ??= ProfileStruct());
  }

  bool hasDevice() => _device != null;

  static RecordStruct fromMap(Map<String, dynamic> data) => RecordStruct(
        info: data['info'] is DropdownStruct
            ? data['info']
            : DropdownStruct.maybeFromMap(data['info']),
        header: getStructList(
          data['header'],
          BlockComponentStruct.fromMap,
        ),
        sections: getStructList(
          data['sections'],
          BodySectionStruct.fromMap,
        ),
        organization: data['organization'] is ProfileStruct
            ? data['organization']
            : ProfileStruct.maybeFromMap(data['organization']),
        user: data['user'] is ProfileStruct
            ? data['user']
            : ProfileStruct.maybeFromMap(data['user']),
        device: data['device'] is ProfileStruct
            ? data['device']
            : ProfileStruct.maybeFromMap(data['device']),
      );

  static RecordStruct? maybeFromMap(dynamic data) =>
      data is Map ? RecordStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'info': _info?.toMap(),
        'header': _header?.map((e) => e.toMap()).toList(),
        'sections': _sections?.map((e) => e.toMap()).toList(),
        'organization': _organization?.toMap(),
        'user': _user?.toMap(),
        'device': _device?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'info': serializeParam(
          _info,
          ParamType.DataStruct,
        ),
        'header': serializeParam(
          _header,
          ParamType.DataStruct,
          isList: true,
        ),
        'sections': serializeParam(
          _sections,
          ParamType.DataStruct,
          isList: true,
        ),
        'organization': serializeParam(
          _organization,
          ParamType.DataStruct,
        ),
        'user': serializeParam(
          _user,
          ParamType.DataStruct,
        ),
        'device': serializeParam(
          _device,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static RecordStruct fromSerializableMap(Map<String, dynamic> data) =>
      RecordStruct(
        info: deserializeStructParam(
          data['info'],
          ParamType.DataStruct,
          false,
          structBuilder: DropdownStruct.fromSerializableMap,
        ),
        header: deserializeStructParam<BlockComponentStruct>(
          data['header'],
          ParamType.DataStruct,
          true,
          structBuilder: BlockComponentStruct.fromSerializableMap,
        ),
        sections: deserializeStructParam<BodySectionStruct>(
          data['sections'],
          ParamType.DataStruct,
          true,
          structBuilder: BodySectionStruct.fromSerializableMap,
        ),
        organization: deserializeStructParam(
          data['organization'],
          ParamType.DataStruct,
          false,
          structBuilder: ProfileStruct.fromSerializableMap,
        ),
        user: deserializeStructParam(
          data['user'],
          ParamType.DataStruct,
          false,
          structBuilder: ProfileStruct.fromSerializableMap,
        ),
        device: deserializeStructParam(
          data['device'],
          ParamType.DataStruct,
          false,
          structBuilder: ProfileStruct.fromSerializableMap,
        ),
      );

  static RecordStruct fromAlgoliaData(Map<String, dynamic> data) =>
      RecordStruct(
        info: convertAlgoliaParam(
          data['info'],
          ParamType.DataStruct,
          false,
          structBuilder: DropdownStruct.fromAlgoliaData,
        ),
        header: convertAlgoliaParam<BlockComponentStruct>(
          data['header'],
          ParamType.DataStruct,
          true,
          structBuilder: BlockComponentStruct.fromAlgoliaData,
        ),
        sections: convertAlgoliaParam<BodySectionStruct>(
          data['sections'],
          ParamType.DataStruct,
          true,
          structBuilder: BodySectionStruct.fromAlgoliaData,
        ),
        organization: convertAlgoliaParam(
          data['organization'],
          ParamType.DataStruct,
          false,
          structBuilder: ProfileStruct.fromAlgoliaData,
        ),
        user: convertAlgoliaParam(
          data['user'],
          ParamType.DataStruct,
          false,
          structBuilder: ProfileStruct.fromAlgoliaData,
        ),
        device: convertAlgoliaParam(
          data['device'],
          ParamType.DataStruct,
          false,
          structBuilder: ProfileStruct.fromAlgoliaData,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'RecordStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is RecordStruct &&
        info == other.info &&
        listEquality.equals(header, other.header) &&
        listEquality.equals(sections, other.sections) &&
        organization == other.organization &&
        user == other.user &&
        device == other.device;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([info, header, sections, organization, user, device]);
}

RecordStruct createRecordStruct({
  DropdownStruct? info,
  ProfileStruct? organization,
  ProfileStruct? user,
  ProfileStruct? device,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    RecordStruct(
      info: info ?? (clearUnsetFields ? DropdownStruct() : null),
      organization: organization ?? (clearUnsetFields ? ProfileStruct() : null),
      user: user ?? (clearUnsetFields ? ProfileStruct() : null),
      device: device ?? (clearUnsetFields ? ProfileStruct() : null),
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

RecordStruct? updateRecordStruct(
  RecordStruct? record, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    record
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addRecordStructData(
  Map<String, dynamic> firestoreData,
  RecordStruct? record,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (record == null) {
    return;
  }
  if (record.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && record.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final recordData = getRecordFirestoreData(record, forFieldValue);
  final nestedData = recordData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = record.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getRecordFirestoreData(
  RecordStruct? record, [
  bool forFieldValue = false,
]) {
  if (record == null) {
    return {};
  }
  final firestoreData = mapToFirestore(record.toMap());

  // Handle nested data for "info" field.
  addDropdownStructData(
    firestoreData,
    record.hasInfo() ? record.info : null,
    'info',
    forFieldValue,
  );

  // Handle nested data for "organization" field.
  addProfileStructData(
    firestoreData,
    record.hasOrganization() ? record.organization : null,
    'organization',
    forFieldValue,
  );

  // Handle nested data for "user" field.
  addProfileStructData(
    firestoreData,
    record.hasUser() ? record.user : null,
    'user',
    forFieldValue,
  );

  // Handle nested data for "device" field.
  addProfileStructData(
    firestoreData,
    record.hasDevice() ? record.device : null,
    'device',
    forFieldValue,
  );

  // Add any Firestore field values
  record.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getRecordListFirestoreData(
  List<RecordStruct>? records,
) =>
    records?.map((e) => getRecordFirestoreData(e, true)).toList() ?? [];
