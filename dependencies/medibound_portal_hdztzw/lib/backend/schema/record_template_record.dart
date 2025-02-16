import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RecordTemplateRecord extends FirestoreRecord {
  RecordTemplateRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "info" field.
  CodedValueStruct? _info;
  CodedValueStruct get info => _info ?? CodedValueStruct();
  bool hasInfo() => _info != null;

  // "header" field.
  List<BlockComponentStruct>? _header;
  List<BlockComponentStruct> get header => _header ?? const [];
  bool hasHeader() => _header != null;

  // "sections" field.
  List<BodySectionStruct>? _sections;
  List<BodySectionStruct> get sections => _sections ?? const [];
  bool hasSections() => _sections != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "edited_time" field.
  DateTime? _editedTime;
  DateTime? get editedTime => _editedTime;
  bool hasEditedTime() => _editedTime != null;

  // "variables" field.
  List<DeviceVariableStruct>? _variables;
  List<DeviceVariableStruct> get variables => _variables ?? const [];
  bool hasVariables() => _variables != null;

  // "source" field.
  SourceStruct? _source;
  SourceStruct get source => _source ?? SourceStruct();
  bool hasSource() => _source != null;

  void _initializeFields() {
    _info = snapshotData['info'] is CodedValueStruct
        ? snapshotData['info']
        : CodedValueStruct.maybeFromMap(snapshotData['info']);
    _header = getStructList(
      snapshotData['header'],
      BlockComponentStruct.fromMap,
    );
    _sections = getStructList(
      snapshotData['sections'],
      BodySectionStruct.fromMap,
    );
    _createdTime = snapshotData['created_time'] as DateTime?;
    _editedTime = snapshotData['edited_time'] as DateTime?;
    _variables = getStructList(
      snapshotData['variables'],
      DeviceVariableStruct.fromMap,
    );
    _source = snapshotData['source'] is SourceStruct
        ? snapshotData['source']
        : SourceStruct.maybeFromMap(snapshotData['source']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('record_template');

  static Stream<RecordTemplateRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RecordTemplateRecord.fromSnapshot(s));

  static Future<RecordTemplateRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RecordTemplateRecord.fromSnapshot(s));

  static RecordTemplateRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RecordTemplateRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RecordTemplateRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RecordTemplateRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RecordTemplateRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RecordTemplateRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRecordTemplateRecordData({
  CodedValueStruct? info,
  DateTime? createdTime,
  DateTime? editedTime,
  SourceStruct? source,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'info': CodedValueStruct().toMap(),
      'created_time': createdTime,
      'edited_time': editedTime,
      'source': SourceStruct().toMap(),
    }.withoutNulls,
  );

  // Handle nested data for "info" field.
  addCodedValueStructData(firestoreData, info, 'info');

  // Handle nested data for "source" field.
  addSourceStructData(firestoreData, source, 'source');

  return firestoreData;
}

class RecordTemplateRecordDocumentEquality
    implements Equality<RecordTemplateRecord> {
  const RecordTemplateRecordDocumentEquality();

  @override
  bool equals(RecordTemplateRecord? e1, RecordTemplateRecord? e2) {
    const listEquality = ListEquality();
    return e1?.info == e2?.info &&
        listEquality.equals(e1?.header, e2?.header) &&
        listEquality.equals(e1?.sections, e2?.sections) &&
        e1?.createdTime == e2?.createdTime &&
        e1?.editedTime == e2?.editedTime &&
        listEquality.equals(e1?.variables, e2?.variables) &&
        e1?.source == e2?.source;
  }

  @override
  int hash(RecordTemplateRecord? e) => const ListEquality().hash([
        e?.info,
        e?.header,
        e?.sections,
        e?.createdTime,
        e?.editedTime,
        e?.variables,
        e?.source
      ]);

  @override
  bool isValidKey(Object? o) => o is RecordTemplateRecord;
}
