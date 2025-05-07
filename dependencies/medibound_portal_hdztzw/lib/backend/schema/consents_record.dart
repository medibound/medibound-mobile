import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ConsentsRecord extends FirestoreRecord {
  ConsentsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "template" field.
  DocumentReference? _template;
  DocumentReference? get template => _template;
  bool hasTemplate() => _template != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "date_signed" field.
  DateTime? _dateSigned;
  DateTime? get dateSigned => _dateSigned;
  bool hasDateSigned() => _dateSigned != null;

  // "decision" field.
  String? _decision;
  String get decision => _decision ?? '';
  bool hasDecision() => _decision != null;

  void _initializeFields() {
    _template = snapshotData['template'] as DocumentReference?;
    _status = snapshotData['status'] as String?;
    _dateSigned = snapshotData['date_signed'] as DateTime?;
    _decision = snapshotData['decision'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('consents');

  static Stream<ConsentsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ConsentsRecord.fromSnapshot(s));

  static Future<ConsentsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ConsentsRecord.fromSnapshot(s));

  static ConsentsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ConsentsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ConsentsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ConsentsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ConsentsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ConsentsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createConsentsRecordData({
  DocumentReference? template,
  String? status,
  DateTime? dateSigned,
  String? decision,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'template': template,
      'status': status,
      'date_signed': dateSigned,
      'decision': decision,
    }.withoutNulls,
  );

  return firestoreData;
}

class ConsentsRecordDocumentEquality implements Equality<ConsentsRecord> {
  const ConsentsRecordDocumentEquality();

  @override
  bool equals(ConsentsRecord? e1, ConsentsRecord? e2) {
    return e1?.template == e2?.template &&
        e1?.status == e2?.status &&
        e1?.dateSigned == e2?.dateSigned &&
        e1?.decision == e2?.decision;
  }

  @override
  int hash(ConsentsRecord? e) => const ListEquality()
      .hash([e?.template, e?.status, e?.dateSigned, e?.decision]);

  @override
  bool isValidKey(Object? o) => o is ConsentsRecord;
}
