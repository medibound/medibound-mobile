import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MessageRecord extends FirestoreRecord {
  MessageRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "message" field.
  String? _message;
  String get message => _message ?? '';
  bool hasMessage() => _message != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "sent_by" field.
  DocumentReference? _sentBy;
  DocumentReference? get sentBy => _sentBy;
  bool hasSentBy() => _sentBy != null;

  // "attachment" field.
  DocumentReference? _attachment;
  DocumentReference? get attachment => _attachment;
  bool hasAttachment() => _attachment != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _message = snapshotData['message'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _sentBy = snapshotData['sent_by'] as DocumentReference?;
    _attachment = snapshotData['attachment'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('message')
          : FirebaseFirestore.instance.collectionGroup('message');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('message').doc(id);

  static Stream<MessageRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MessageRecord.fromSnapshot(s));

  static Future<MessageRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MessageRecord.fromSnapshot(s));

  static MessageRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MessageRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MessageRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MessageRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MessageRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MessageRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMessageRecordData({
  String? message,
  DateTime? createdTime,
  DocumentReference? sentBy,
  DocumentReference? attachment,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'message': message,
      'created_time': createdTime,
      'sent_by': sentBy,
      'attachment': attachment,
    }.withoutNulls,
  );

  return firestoreData;
}

class MessageRecordDocumentEquality implements Equality<MessageRecord> {
  const MessageRecordDocumentEquality();

  @override
  bool equals(MessageRecord? e1, MessageRecord? e2) {
    return e1?.message == e2?.message &&
        e1?.createdTime == e2?.createdTime &&
        e1?.sentBy == e2?.sentBy &&
        e1?.attachment == e2?.attachment;
  }

  @override
  int hash(MessageRecord? e) => const ListEquality()
      .hash([e?.message, e?.createdTime, e?.sentBy, e?.attachment]);

  @override
  bool isValidKey(Object? o) => o is MessageRecord;
}
