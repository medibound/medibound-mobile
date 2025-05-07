import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DeviceRecord extends FirestoreRecord {
  DeviceRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "info" field.
  CodedValueStruct? _info;
  CodedValueStruct get info => _info ?? CodedValueStruct();
  bool hasInfo() => _info != null;

  // "profile" field.
  DocumentReference? _profile;
  DocumentReference? get profile => _profile;
  bool hasProfile() => _profile != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "last_updated" field.
  DateTime? _lastUpdated;
  DateTime? get lastUpdated => _lastUpdated;
  bool hasLastUpdated() => _lastUpdated != null;

  // "owner" field.
  DocumentReference? _owner;
  DocumentReference? get owner => _owner;
  bool hasOwner() => _owner != null;

  // "room" field.
  DocumentReference? _room;
  DocumentReference? get room => _room;
  bool hasRoom() => _room != null;

  // "online" field.
  bool? _online;
  bool get online => _online ?? false;
  bool hasOnline() => _online != null;

  // "assigned_user" field.
  DocumentReference? _assignedUser;
  DocumentReference? get assignedUser => _assignedUser;
  bool hasAssignedUser() => _assignedUser != null;

  // "battery" field.
  int? _battery;
  int get battery => _battery ?? 0;
  bool hasBattery() => _battery != null;

  // "attached_record" field.
  DocumentReference? _attachedRecord;
  DocumentReference? get attachedRecord => _attachedRecord;
  bool hasAttachedRecord() => _attachedRecord != null;

  // "action" field.
  String? _action;
  String get action => _action ?? '';
  bool hasAction() => _action != null;

  // "secret_key" field.
  KeyStruct? _secretKey;
  KeyStruct get secretKey => _secretKey ?? KeyStruct();
  bool hasSecretKey() => _secretKey != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _info = snapshotData['info'] is CodedValueStruct
        ? snapshotData['info']
        : CodedValueStruct.maybeFromMap(snapshotData['info']);
    _profile = snapshotData['profile'] as DocumentReference?;
    _status = snapshotData['status'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _lastUpdated = snapshotData['last_updated'] as DateTime?;
    _owner = snapshotData['owner'] as DocumentReference?;
    _room = snapshotData['room'] as DocumentReference?;
    _online = snapshotData['online'] as bool?;
    _assignedUser = snapshotData['assigned_user'] as DocumentReference?;
    _battery = castToType<int>(snapshotData['battery']);
    _attachedRecord = snapshotData['attached_record'] as DocumentReference?;
    _action = snapshotData['action'] as String?;
    _secretKey = snapshotData['secret_key'] is KeyStruct
        ? snapshotData['secret_key']
        : KeyStruct.maybeFromMap(snapshotData['secret_key']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('device')
          : FirebaseFirestore.instance.collectionGroup('device');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('device').doc(id);

  static Stream<DeviceRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DeviceRecord.fromSnapshot(s));

  static Future<DeviceRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DeviceRecord.fromSnapshot(s));

  static DeviceRecord fromSnapshot(DocumentSnapshot snapshot) => DeviceRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DeviceRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DeviceRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DeviceRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DeviceRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDeviceRecordData({
  CodedValueStruct? info,
  DocumentReference? profile,
  String? status,
  DateTime? createdTime,
  DateTime? lastUpdated,
  DocumentReference? owner,
  DocumentReference? room,
  bool? online,
  DocumentReference? assignedUser,
  int? battery,
  DocumentReference? attachedRecord,
  String? action,
  KeyStruct? secretKey,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'info': CodedValueStruct().toMap(),
      'profile': profile,
      'status': status,
      'created_time': createdTime,
      'last_updated': lastUpdated,
      'owner': owner,
      'room': room,
      'online': online,
      'assigned_user': assignedUser,
      'battery': battery,
      'attached_record': attachedRecord,
      'action': action,
      'secret_key': KeyStruct().toMap(),
    }.withoutNulls,
  );

  // Handle nested data for "info" field.
  addCodedValueStructData(firestoreData, info, 'info');

  // Handle nested data for "secret_key" field.
  addKeyStructData(firestoreData, secretKey, 'secret_key');

  return firestoreData;
}

class DeviceRecordDocumentEquality implements Equality<DeviceRecord> {
  const DeviceRecordDocumentEquality();

  @override
  bool equals(DeviceRecord? e1, DeviceRecord? e2) {
    return e1?.info == e2?.info &&
        e1?.profile == e2?.profile &&
        e1?.status == e2?.status &&
        e1?.createdTime == e2?.createdTime &&
        e1?.lastUpdated == e2?.lastUpdated &&
        e1?.owner == e2?.owner &&
        e1?.room == e2?.room &&
        e1?.online == e2?.online &&
        e1?.assignedUser == e2?.assignedUser &&
        e1?.battery == e2?.battery &&
        e1?.attachedRecord == e2?.attachedRecord &&
        e1?.action == e2?.action &&
        e1?.secretKey == e2?.secretKey;
  }

  @override
  int hash(DeviceRecord? e) => const ListEquality().hash([
        e?.info,
        e?.profile,
        e?.status,
        e?.createdTime,
        e?.lastUpdated,
        e?.owner,
        e?.room,
        e?.online,
        e?.assignedUser,
        e?.battery,
        e?.attachedRecord,
        e?.action,
        e?.secretKey
      ]);

  @override
  bool isValidKey(Object? o) => o is DeviceRecord;
}
