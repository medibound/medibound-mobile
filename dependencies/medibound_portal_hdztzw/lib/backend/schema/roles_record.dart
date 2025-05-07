import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RolesRecord extends FirestoreRecord {
  RolesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "role" field.
  String? _role;
  String get role => _role ?? '';
  bool hasRole() => _role != null;

  // "linked_user" field.
  DocumentReference? _linkedUser;
  DocumentReference? get linkedUser => _linkedUser;
  bool hasLinkedUser() => _linkedUser != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _role = snapshotData['role'] as String?;
    _linkedUser = snapshotData['linked_user'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('roles')
          : FirebaseFirestore.instance.collectionGroup('roles');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('roles').doc(id);

  static Stream<RolesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RolesRecord.fromSnapshot(s));

  static Future<RolesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RolesRecord.fromSnapshot(s));

  static RolesRecord fromSnapshot(DocumentSnapshot snapshot) => RolesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RolesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RolesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RolesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RolesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRolesRecordData({
  String? email,
  String? role,
  DocumentReference? linkedUser,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'role': role,
      'linked_user': linkedUser,
    }.withoutNulls,
  );

  return firestoreData;
}

class RolesRecordDocumentEquality implements Equality<RolesRecord> {
  const RolesRecordDocumentEquality();

  @override
  bool equals(RolesRecord? e1, RolesRecord? e2) {
    return e1?.email == e2?.email &&
        e1?.role == e2?.role &&
        e1?.linkedUser == e2?.linkedUser;
  }

  @override
  int hash(RolesRecord? e) =>
      const ListEquality().hash([e?.email, e?.role, e?.linkedUser]);

  @override
  bool isValidKey(Object? o) => o is RolesRecord;
}
