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

  // "record" field.
  DocumentReference? _record;
  DocumentReference? get record => _record;
  bool hasRecord() => _record != null;

  // "device_profile" field.
  DocumentReference? _deviceProfile;
  DocumentReference? get deviceProfile => _deviceProfile;
  bool hasDeviceProfile() => _deviceProfile != null;

  // "embed" field.
  MessageEmbedStruct? _embed;
  MessageEmbedStruct get embed => _embed ?? MessageEmbedStruct();
  bool hasEmbed() => _embed != null;

  // "sent_by" field.
  ProfileStruct? _sentBy;
  ProfileStruct get sentBy => _sentBy ?? ProfileStruct();
  bool hasSentBy() => _sentBy != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _message = snapshotData['message'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _record = snapshotData['record'] as DocumentReference?;
    _deviceProfile = snapshotData['device_profile'] as DocumentReference?;
    _embed = snapshotData['embed'] is MessageEmbedStruct
        ? snapshotData['embed']
        : MessageEmbedStruct.maybeFromMap(snapshotData['embed']);
    _sentBy = snapshotData['sent_by'] is ProfileStruct
        ? snapshotData['sent_by']
        : ProfileStruct.maybeFromMap(snapshotData['sent_by']);
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
  DocumentReference? record,
  DocumentReference? deviceProfile,
  MessageEmbedStruct? embed,
  ProfileStruct? sentBy,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'message': message,
      'created_time': createdTime,
      'record': record,
      'device_profile': deviceProfile,
      'embed': MessageEmbedStruct().toMap(),
      'sent_by': ProfileStruct().toMap(),
    }.withoutNulls,
  );

  // Handle nested data for "embed" field.
  addMessageEmbedStructData(firestoreData, embed, 'embed');

  // Handle nested data for "sent_by" field.
  addProfileStructData(firestoreData, sentBy, 'sent_by');

  return firestoreData;
}

class MessageRecordDocumentEquality implements Equality<MessageRecord> {
  const MessageRecordDocumentEquality();

  @override
  bool equals(MessageRecord? e1, MessageRecord? e2) {
    return e1?.message == e2?.message &&
        e1?.createdTime == e2?.createdTime &&
        e1?.record == e2?.record &&
        e1?.deviceProfile == e2?.deviceProfile &&
        e1?.embed == e2?.embed &&
        e1?.sentBy == e2?.sentBy;
  }

  @override
  int hash(MessageRecord? e) => const ListEquality().hash([
        e?.message,
        e?.createdTime,
        e?.record,
        e?.deviceProfile,
        e?.embed,
        e?.sentBy
      ]);

  @override
  bool isValidKey(Object? o) => o is MessageRecord;
}
