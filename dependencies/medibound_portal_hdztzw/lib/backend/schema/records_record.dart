import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RecordsRecord extends FirestoreRecord {
  RecordsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "info" field.
  DropdownStruct? _info;
  DropdownStruct get info => _info ?? DropdownStruct();
  bool hasInfo() => _info != null;

  void _initializeFields() {
    _info = snapshotData['info'] is DropdownStruct
        ? snapshotData['info']
        : DropdownStruct.maybeFromMap(snapshotData['info']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('records');

  static Stream<RecordsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RecordsRecord.fromSnapshot(s));

  static Future<RecordsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RecordsRecord.fromSnapshot(s));

  static RecordsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RecordsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RecordsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RecordsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RecordsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RecordsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRecordsRecordData({
  DropdownStruct? info,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'info': DropdownStruct().toMap(),
    }.withoutNulls,
  );

  // Handle nested data for "info" field.
  addDropdownStructData(firestoreData, info, 'info');

  return firestoreData;
}

class RecordsRecordDocumentEquality implements Equality<RecordsRecord> {
  const RecordsRecordDocumentEquality();

  @override
  bool equals(RecordsRecord? e1, RecordsRecord? e2) {
    return e1?.info == e2?.info;
  }

  @override
  int hash(RecordsRecord? e) => const ListEquality().hash([e?.info]);

  @override
  bool isValidKey(Object? o) => o is RecordsRecord;
}
