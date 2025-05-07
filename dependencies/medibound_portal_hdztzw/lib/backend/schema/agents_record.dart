import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AgentsRecord extends FirestoreRecord {
  AgentsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "profile" field.
  ProfileStruct? _profile;
  ProfileStruct get profile => _profile ?? ProfileStruct();
  bool hasProfile() => _profile != null;

  // "organization" field.
  DocumentReference? _organization;
  DocumentReference? get organization => _organization;
  bool hasOrganization() => _organization != null;

  // "edited_time" field.
  DateTime? _editedTime;
  DateTime? get editedTime => _editedTime;
  bool hasEditedTime() => _editedTime != null;

  // "webhookUrl" field.
  String? _webhookUrl;
  String get webhookUrl => _webhookUrl ?? '';
  bool hasWebhookUrl() => _webhookUrl != null;

  void _initializeFields() {
    _createdTime = snapshotData['created_time'] as DateTime?;
    _profile = snapshotData['profile'] is ProfileStruct
        ? snapshotData['profile']
        : ProfileStruct.maybeFromMap(snapshotData['profile']);
    _organization = snapshotData['organization'] as DocumentReference?;
    _editedTime = snapshotData['edited_time'] as DateTime?;
    _webhookUrl = snapshotData['webhookUrl'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('agents');

  static Stream<AgentsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AgentsRecord.fromSnapshot(s));

  static Future<AgentsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AgentsRecord.fromSnapshot(s));

  static AgentsRecord fromSnapshot(DocumentSnapshot snapshot) => AgentsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AgentsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AgentsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AgentsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AgentsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAgentsRecordData({
  DateTime? createdTime,
  ProfileStruct? profile,
  DocumentReference? organization,
  DateTime? editedTime,
  String? webhookUrl,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_time': createdTime,
      'profile': ProfileStruct().toMap(),
      'organization': organization,
      'edited_time': editedTime,
      'webhookUrl': webhookUrl,
    }.withoutNulls,
  );

  // Handle nested data for "profile" field.
  addProfileStructData(firestoreData, profile, 'profile');

  return firestoreData;
}

class AgentsRecordDocumentEquality implements Equality<AgentsRecord> {
  const AgentsRecordDocumentEquality();

  @override
  bool equals(AgentsRecord? e1, AgentsRecord? e2) {
    return e1?.createdTime == e2?.createdTime &&
        e1?.profile == e2?.profile &&
        e1?.organization == e2?.organization &&
        e1?.editedTime == e2?.editedTime &&
        e1?.webhookUrl == e2?.webhookUrl;
  }

  @override
  int hash(AgentsRecord? e) => const ListEquality().hash([
        e?.createdTime,
        e?.profile,
        e?.organization,
        e?.editedTime,
        e?.webhookUrl
      ]);

  @override
  bool isValidKey(Object? o) => o is AgentsRecord;
}
