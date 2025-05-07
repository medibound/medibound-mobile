import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RoomsRecord extends FirestoreRecord {
  RoomsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "info" field.
  CodedValueStruct? _info;
  CodedValueStruct get info => _info ?? CodedValueStruct();
  bool hasInfo() => _info != null;

  // "organization" field.
  DocumentReference? _organization;
  DocumentReference? get organization => _organization;
  bool hasOrganization() => _organization != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _info = snapshotData['info'] is CodedValueStruct
        ? snapshotData['info']
        : CodedValueStruct.maybeFromMap(snapshotData['info']);
    _organization = snapshotData['organization'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('rooms')
          : FirebaseFirestore.instance.collectionGroup('rooms');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('rooms').doc(id);

  static Stream<RoomsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RoomsRecord.fromSnapshot(s));

  static Future<RoomsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RoomsRecord.fromSnapshot(s));

  static RoomsRecord fromSnapshot(DocumentSnapshot snapshot) => RoomsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RoomsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RoomsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RoomsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RoomsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRoomsRecordData({
  CodedValueStruct? info,
  DocumentReference? organization,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'info': CodedValueStruct().toMap(),
      'organization': organization,
    }.withoutNulls,
  );

  // Handle nested data for "info" field.
  addCodedValueStructData(firestoreData, info, 'info');

  return firestoreData;
}

class RoomsRecordDocumentEquality implements Equality<RoomsRecord> {
  const RoomsRecordDocumentEquality();

  @override
  bool equals(RoomsRecord? e1, RoomsRecord? e2) {
    return e1?.info == e2?.info && e1?.organization == e2?.organization;
  }

  @override
  int hash(RoomsRecord? e) =>
      const ListEquality().hash([e?.info, e?.organization]);

  @override
  bool isValidKey(Object? o) => o is RoomsRecord;
}
