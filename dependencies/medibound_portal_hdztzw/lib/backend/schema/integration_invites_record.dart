import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class IntegrationInvitesRecord extends FirestoreRecord {
  IntegrationInvitesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _status = snapshotData['status'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('integration_invites')
          : FirebaseFirestore.instance.collectionGroup('integration_invites');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('integration_invites').doc(id);

  static Stream<IntegrationInvitesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => IntegrationInvitesRecord.fromSnapshot(s));

  static Future<IntegrationInvitesRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => IntegrationInvitesRecord.fromSnapshot(s));

  static IntegrationInvitesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      IntegrationInvitesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static IntegrationInvitesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      IntegrationInvitesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'IntegrationInvitesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is IntegrationInvitesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createIntegrationInvitesRecordData({
  String? email,
  String? status,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'status': status,
    }.withoutNulls,
  );

  return firestoreData;
}

class IntegrationInvitesRecordDocumentEquality
    implements Equality<IntegrationInvitesRecord> {
  const IntegrationInvitesRecordDocumentEquality();

  @override
  bool equals(IntegrationInvitesRecord? e1, IntegrationInvitesRecord? e2) {
    return e1?.email == e2?.email && e1?.status == e2?.status;
  }

  @override
  int hash(IntegrationInvitesRecord? e) =>
      const ListEquality().hash([e?.email, e?.status]);

  @override
  bool isValidKey(Object? o) => o is IntegrationInvitesRecord;
}
