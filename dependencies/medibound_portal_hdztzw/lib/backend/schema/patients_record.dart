import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PatientsRecord extends FirestoreRecord {
  PatientsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "last_resend" field.
  DateTime? _lastResend;
  DateTime? get lastResend => _lastResend;
  bool hasLastResend() => _lastResend != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _user = snapshotData['user'] as DocumentReference?;
    _email = snapshotData['email'] as String?;
    _status = snapshotData['status'] as String?;
    _lastResend = snapshotData['last_resend'] as DateTime?;
    _uid = snapshotData['uid'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('patients')
          : FirebaseFirestore.instance.collectionGroup('patients');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('patients').doc(id);

  static Stream<PatientsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PatientsRecord.fromSnapshot(s));

  static Future<PatientsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PatientsRecord.fromSnapshot(s));

  static PatientsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PatientsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PatientsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PatientsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PatientsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PatientsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPatientsRecordData({
  DocumentReference? user,
  String? email,
  String? status,
  DateTime? lastResend,
  String? uid,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user': user,
      'email': email,
      'status': status,
      'last_resend': lastResend,
      'uid': uid,
    }.withoutNulls,
  );

  return firestoreData;
}

class PatientsRecordDocumentEquality implements Equality<PatientsRecord> {
  const PatientsRecordDocumentEquality();

  @override
  bool equals(PatientsRecord? e1, PatientsRecord? e2) {
    return e1?.user == e2?.user &&
        e1?.email == e2?.email &&
        e1?.status == e2?.status &&
        e1?.lastResend == e2?.lastResend &&
        e1?.uid == e2?.uid;
  }

  @override
  int hash(PatientsRecord? e) => const ListEquality()
      .hash([e?.user, e?.email, e?.status, e?.lastResend, e?.uid]);

  @override
  bool isValidKey(Object? o) => o is PatientsRecord;
}
