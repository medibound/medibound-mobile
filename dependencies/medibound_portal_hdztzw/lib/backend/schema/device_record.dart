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
  DropdownStruct? _info;
  DropdownStruct get info => _info ?? DropdownStruct();
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

  // "key" field.
  KeyStruct? _key;
  KeyStruct get key => _key ?? KeyStruct();
  bool hasKey() => _key != null;

  // "storedId" field.
  String? _storedId;
  String get storedId => _storedId ?? '';
  bool hasStoredId() => _storedId != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _info = snapshotData['info'] is DropdownStruct
        ? snapshotData['info']
        : DropdownStruct.maybeFromMap(snapshotData['info']);
    _profile = snapshotData['profile'] as DocumentReference?;
    _status = snapshotData['status'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _lastUpdated = snapshotData['last_updated'] as DateTime?;
    _owner = snapshotData['owner'] as DocumentReference?;
    _key = snapshotData['key'] is KeyStruct
        ? snapshotData['key']
        : KeyStruct.maybeFromMap(snapshotData['key']);
    _storedId = snapshotData['storedId'] as String?;
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
  DropdownStruct? info,
  DocumentReference? profile,
  String? status,
  DateTime? createdTime,
  DateTime? lastUpdated,
  DocumentReference? owner,
  KeyStruct? key,
  String? storedId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'info': DropdownStruct().toMap(),
      'profile': profile,
      'status': status,
      'created_time': createdTime,
      'last_updated': lastUpdated,
      'owner': owner,
      'key': KeyStruct().toMap(),
      'storedId': storedId,
    }.withoutNulls,
  );

  // Handle nested data for "info" field.
  addDropdownStructData(firestoreData, info, 'info');

  // Handle nested data for "key" field.
  addKeyStructData(firestoreData, key, 'key');

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
        e1?.key == e2?.key &&
        e1?.storedId == e2?.storedId;
  }

  @override
  int hash(DeviceRecord? e) => const ListEquality().hash([
        e?.info,
        e?.profile,
        e?.status,
        e?.createdTime,
        e?.lastUpdated,
        e?.owner,
        e?.key,
        e?.storedId
      ]);

  @override
  bool isValidKey(Object? o) => o is DeviceRecord;
}
