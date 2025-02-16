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
  CodedValueStruct? _info;
  CodedValueStruct get info => _info ?? CodedValueStruct();
  bool hasInfo() => _info != null;

  // "owner" field.
  DocumentReference? _owner;
  DocumentReference? get owner => _owner;
  bool hasOwner() => _owner != null;

  // "template" field.
  DocumentReference? _template;
  DocumentReference? get template => _template;
  bool hasTemplate() => _template != null;

  // "data" field.
  List<DeviceVariableStruct>? _data;
  List<DeviceVariableStruct> get data => _data ?? const [];
  bool hasData() => _data != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _info = snapshotData['info'] is CodedValueStruct
        ? snapshotData['info']
        : CodedValueStruct.maybeFromMap(snapshotData['info']);
    _owner = snapshotData['owner'] as DocumentReference?;
    _template = snapshotData['template'] as DocumentReference?;
    _data = getStructList(
      snapshotData['data'],
      DeviceVariableStruct.fromMap,
    );
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('records')
          : FirebaseFirestore.instance.collectionGroup('records');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('records').doc(id);

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
  CodedValueStruct? info,
  DocumentReference? owner,
  DocumentReference? template,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'info': CodedValueStruct().toMap(),
      'owner': owner,
      'template': template,
    }.withoutNulls,
  );

  // Handle nested data for "info" field.
  addCodedValueStructData(firestoreData, info, 'info');

  return firestoreData;
}

class RecordsRecordDocumentEquality implements Equality<RecordsRecord> {
  const RecordsRecordDocumentEquality();

  @override
  bool equals(RecordsRecord? e1, RecordsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.info == e2?.info &&
        e1?.owner == e2?.owner &&
        e1?.template == e2?.template &&
        listEquality.equals(e1?.data, e2?.data);
  }

  @override
  int hash(RecordsRecord? e) =>
      const ListEquality().hash([e?.info, e?.owner, e?.template, e?.data]);

  @override
  bool isValidKey(Object? o) => o is RecordsRecord;
}
