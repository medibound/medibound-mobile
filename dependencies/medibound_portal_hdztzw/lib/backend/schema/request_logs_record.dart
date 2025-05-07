import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RequestLogsRecord extends FirestoreRecord {
  RequestLogsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "endpoint" field.
  String? _endpoint;
  String get endpoint => _endpoint ?? '';
  bool hasEndpoint() => _endpoint != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  // "identifier" field.
  int? _identifier;
  int get identifier => _identifier ?? 0;
  bool hasIdentifier() => _identifier != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _endpoint = snapshotData['endpoint'] as String?;
    _timestamp = snapshotData['timestamp'] as DateTime?;
    _identifier = castToType<int>(snapshotData['identifier']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('request_logs')
          : FirebaseFirestore.instance.collectionGroup('request_logs');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('request_logs').doc(id);

  static Stream<RequestLogsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RequestLogsRecord.fromSnapshot(s));

  static Future<RequestLogsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RequestLogsRecord.fromSnapshot(s));

  static RequestLogsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RequestLogsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RequestLogsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RequestLogsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RequestLogsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RequestLogsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRequestLogsRecordData({
  String? endpoint,
  DateTime? timestamp,
  int? identifier,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'endpoint': endpoint,
      'timestamp': timestamp,
      'identifier': identifier,
    }.withoutNulls,
  );

  return firestoreData;
}

class RequestLogsRecordDocumentEquality implements Equality<RequestLogsRecord> {
  const RequestLogsRecordDocumentEquality();

  @override
  bool equals(RequestLogsRecord? e1, RequestLogsRecord? e2) {
    return e1?.endpoint == e2?.endpoint &&
        e1?.timestamp == e2?.timestamp &&
        e1?.identifier == e2?.identifier;
  }

  @override
  int hash(RequestLogsRecord? e) =>
      const ListEquality().hash([e?.endpoint, e?.timestamp, e?.identifier]);

  @override
  bool isValidKey(Object? o) => o is RequestLogsRecord;
}
