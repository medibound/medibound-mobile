import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DeviceProfilesRecord extends FirestoreRecord {
  DeviceProfilesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "manual_path" field.
  String? _manualPath;
  String get manualPath => _manualPath ?? '';
  bool hasManualPath() => _manualPath != null;

  // "model_number" field.
  String? _modelNumber;
  String get modelNumber => _modelNumber ?? '';
  bool hasModelNumber() => _modelNumber != null;

  // "unique_device_identifier" field.
  String? _uniqueDeviceIdentifier;
  String get uniqueDeviceIdentifier => _uniqueDeviceIdentifier ?? '';
  bool hasUniqueDeviceIdentifier() => _uniqueDeviceIdentifier != null;

  // "transfer_type" field.
  String? _transferType;
  String get transferType => _transferType ?? '';
  bool hasTransferType() => _transferType != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "edited_time" field.
  DateTime? _editedTime;
  DateTime? get editedTime => _editedTime;
  bool hasEditedTime() => _editedTime != null;

  // "mode" field.
  String? _mode;
  String get mode => _mode ?? '';
  bool hasMode() => _mode != null;

  // "info" field.
  CodedValueStruct? _info;
  CodedValueStruct get info => _info ?? CodedValueStruct();
  bool hasInfo() => _info != null;

  // "organization" field.
  DocumentReference? _organization;
  DocumentReference? get organization => _organization;
  bool hasOrganization() => _organization != null;

  // "record_template" field.
  DocumentReference? _recordTemplate;
  DocumentReference? get recordTemplate => _recordTemplate;
  bool hasRecordTemplate() => _recordTemplate != null;

  void _initializeFields() {
    _manualPath = snapshotData['manual_path'] as String?;
    _modelNumber = snapshotData['model_number'] as String?;
    _uniqueDeviceIdentifier =
        snapshotData['unique_device_identifier'] as String?;
    _transferType = snapshotData['transfer_type'] as String?;
    _type = snapshotData['type'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _editedTime = snapshotData['edited_time'] as DateTime?;
    _mode = snapshotData['mode'] as String?;
    _info = snapshotData['info'] is CodedValueStruct
        ? snapshotData['info']
        : CodedValueStruct.maybeFromMap(snapshotData['info']);
    _organization = snapshotData['organization'] as DocumentReference?;
    _recordTemplate = snapshotData['record_template'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('device_profiles');

  static Stream<DeviceProfilesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DeviceProfilesRecord.fromSnapshot(s));

  static Future<DeviceProfilesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DeviceProfilesRecord.fromSnapshot(s));

  static DeviceProfilesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DeviceProfilesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DeviceProfilesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DeviceProfilesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DeviceProfilesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DeviceProfilesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDeviceProfilesRecordData({
  String? manualPath,
  String? modelNumber,
  String? uniqueDeviceIdentifier,
  String? transferType,
  String? type,
  DateTime? createdTime,
  DateTime? editedTime,
  String? mode,
  CodedValueStruct? info,
  DocumentReference? organization,
  DocumentReference? recordTemplate,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'manual_path': manualPath,
      'model_number': modelNumber,
      'unique_device_identifier': uniqueDeviceIdentifier,
      'transfer_type': transferType,
      'type': type,
      'created_time': createdTime,
      'edited_time': editedTime,
      'mode': mode,
      'info': CodedValueStruct().toMap(),
      'organization': organization,
      'record_template': recordTemplate,
    }.withoutNulls,
  );

  // Handle nested data for "info" field.
  addCodedValueStructData(firestoreData, info, 'info');

  return firestoreData;
}

class DeviceProfilesRecordDocumentEquality
    implements Equality<DeviceProfilesRecord> {
  const DeviceProfilesRecordDocumentEquality();

  @override
  bool equals(DeviceProfilesRecord? e1, DeviceProfilesRecord? e2) {
    return e1?.manualPath == e2?.manualPath &&
        e1?.modelNumber == e2?.modelNumber &&
        e1?.uniqueDeviceIdentifier == e2?.uniqueDeviceIdentifier &&
        e1?.transferType == e2?.transferType &&
        e1?.type == e2?.type &&
        e1?.createdTime == e2?.createdTime &&
        e1?.editedTime == e2?.editedTime &&
        e1?.mode == e2?.mode &&
        e1?.info == e2?.info &&
        e1?.organization == e2?.organization &&
        e1?.recordTemplate == e2?.recordTemplate;
  }

  @override
  int hash(DeviceProfilesRecord? e) => const ListEquality().hash([
        e?.manualPath,
        e?.modelNumber,
        e?.uniqueDeviceIdentifier,
        e?.transferType,
        e?.type,
        e?.createdTime,
        e?.editedTime,
        e?.mode,
        e?.info,
        e?.organization,
        e?.recordTemplate
      ]);

  @override
  bool isValidKey(Object? o) => o is DeviceProfilesRecord;
}
