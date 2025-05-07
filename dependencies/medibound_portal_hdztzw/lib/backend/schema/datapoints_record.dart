import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DatapointsRecord extends FirestoreRecord {
  DatapointsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "data" field.
  VariableStruct? _data;
  VariableStruct get data => _data ?? VariableStruct();
  bool hasData() => _data != null;

  // "preset" field.
  String? _preset;
  String get preset => _preset ?? '';
  bool hasPreset() => _preset != null;

  // "owner" field.
  DocumentReference? _owner;
  DocumentReference? get owner => _owner;
  bool hasOwner() => _owner != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _data = snapshotData['data'] is VariableStruct
        ? snapshotData['data']
        : VariableStruct.maybeFromMap(snapshotData['data']);
    _preset = snapshotData['preset'] as String?;
    _owner = snapshotData['owner'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('datapoints')
          : FirebaseFirestore.instance.collectionGroup('datapoints');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('datapoints').doc(id);

  static Stream<DatapointsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DatapointsRecord.fromSnapshot(s));

  static Future<DatapointsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DatapointsRecord.fromSnapshot(s));

  static DatapointsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DatapointsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DatapointsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DatapointsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DatapointsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DatapointsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDatapointsRecordData({
  VariableStruct? data,
  String? preset,
  DocumentReference? owner,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'data': VariableStruct().toMap(),
      'preset': preset,
      'owner': owner,
    }.withoutNulls,
  );

  // Handle nested data for "data" field.
  addVariableStructData(firestoreData, data, 'data');

  return firestoreData;
}

class DatapointsRecordDocumentEquality implements Equality<DatapointsRecord> {
  const DatapointsRecordDocumentEquality();

  @override
  bool equals(DatapointsRecord? e1, DatapointsRecord? e2) {
    return e1?.data == e2?.data &&
        e1?.preset == e2?.preset &&
        e1?.owner == e2?.owner;
  }

  @override
  int hash(DatapointsRecord? e) =>
      const ListEquality().hash([e?.data, e?.preset, e?.owner]);

  @override
  bool isValidKey(Object? o) => o is DatapointsRecord;
}
