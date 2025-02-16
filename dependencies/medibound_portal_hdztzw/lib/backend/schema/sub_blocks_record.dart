import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SubBlocksRecord extends FirestoreRecord {
  SubBlocksRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "info" field.
  CodedValueStruct? _info;
  CodedValueStruct get info => _info ?? CodedValueStruct();
  bool hasInfo() => _info != null;

  // "sizes" field.
  List<String>? _sizes;
  List<String> get sizes => _sizes ?? const [];
  bool hasSizes() => _sizes != null;

  // "types" field.
  List<String>? _types;
  List<String> get types => _types ?? const [];
  bool hasTypes() => _types != null;

  void _initializeFields() {
    _info = snapshotData['info'] is CodedValueStruct
        ? snapshotData['info']
        : CodedValueStruct.maybeFromMap(snapshotData['info']);
    _sizes = getDataList(snapshotData['sizes']);
    _types = getDataList(snapshotData['types']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('subBlocks');

  static Stream<SubBlocksRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SubBlocksRecord.fromSnapshot(s));

  static Future<SubBlocksRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SubBlocksRecord.fromSnapshot(s));

  static SubBlocksRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SubBlocksRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SubBlocksRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SubBlocksRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SubBlocksRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SubBlocksRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSubBlocksRecordData({
  CodedValueStruct? info,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'info': CodedValueStruct().toMap(),
    }.withoutNulls,
  );

  // Handle nested data for "info" field.
  addCodedValueStructData(firestoreData, info, 'info');

  return firestoreData;
}

class SubBlocksRecordDocumentEquality implements Equality<SubBlocksRecord> {
  const SubBlocksRecordDocumentEquality();

  @override
  bool equals(SubBlocksRecord? e1, SubBlocksRecord? e2) {
    const listEquality = ListEquality();
    return e1?.info == e2?.info &&
        listEquality.equals(e1?.sizes, e2?.sizes) &&
        listEquality.equals(e1?.types, e2?.types);
  }

  @override
  int hash(SubBlocksRecord? e) =>
      const ListEquality().hash([e?.info, e?.sizes, e?.types]);

  @override
  bool isValidKey(Object? o) => o is SubBlocksRecord;
}
