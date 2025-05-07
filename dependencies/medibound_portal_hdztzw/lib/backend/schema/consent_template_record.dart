import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ConsentTemplateRecord extends FirestoreRecord {
  ConsentTemplateRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "info" field.
  CodedValueStruct? _info;
  CodedValueStruct get info => _info ?? CodedValueStruct();
  bool hasInfo() => _info != null;

  // "attachment_url" field.
  String? _attachmentUrl;
  String get attachmentUrl => _attachmentUrl ?? '';
  bool hasAttachmentUrl() => _attachmentUrl != null;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  // "action" field.
  String? _action;
  String get action => _action ?? '';
  bool hasAction() => _action != null;

  void _initializeFields() {
    _info = snapshotData['info'] is CodedValueStruct
        ? snapshotData['info']
        : CodedValueStruct.maybeFromMap(snapshotData['info']);
    _attachmentUrl = snapshotData['attachment_url'] as String?;
    _category = snapshotData['category'] as String?;
    _action = snapshotData['action'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('consent_template');

  static Stream<ConsentTemplateRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ConsentTemplateRecord.fromSnapshot(s));

  static Future<ConsentTemplateRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ConsentTemplateRecord.fromSnapshot(s));

  static ConsentTemplateRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ConsentTemplateRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ConsentTemplateRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ConsentTemplateRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ConsentTemplateRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ConsentTemplateRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createConsentTemplateRecordData({
  CodedValueStruct? info,
  String? attachmentUrl,
  String? category,
  String? action,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'info': CodedValueStruct().toMap(),
      'attachment_url': attachmentUrl,
      'category': category,
      'action': action,
    }.withoutNulls,
  );

  // Handle nested data for "info" field.
  addCodedValueStructData(firestoreData, info, 'info');

  return firestoreData;
}

class ConsentTemplateRecordDocumentEquality
    implements Equality<ConsentTemplateRecord> {
  const ConsentTemplateRecordDocumentEquality();

  @override
  bool equals(ConsentTemplateRecord? e1, ConsentTemplateRecord? e2) {
    return e1?.info == e2?.info &&
        e1?.attachmentUrl == e2?.attachmentUrl &&
        e1?.category == e2?.category &&
        e1?.action == e2?.action;
  }

  @override
  int hash(ConsentTemplateRecord? e) => const ListEquality()
      .hash([e?.info, e?.attachmentUrl, e?.category, e?.action]);

  @override
  bool isValidKey(Object? o) => o is ConsentTemplateRecord;
}
