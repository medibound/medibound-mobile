import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class IntegrationProvidersRecord extends FirestoreRecord {
  IntegrationProvidersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "info" field.
  CodedValueStruct? _info;
  CodedValueStruct get info => _info ?? CodedValueStruct();
  bool hasInfo() => _info != null;

  // "client_id" field.
  String? _clientId;
  String get clientId => _clientId ?? '';
  bool hasClientId() => _clientId != null;

  // "client_secret" field.
  String? _clientSecret;
  String get clientSecret => _clientSecret ?? '';
  bool hasClientSecret() => _clientSecret != null;

  void _initializeFields() {
    _info = snapshotData['info'] is CodedValueStruct
        ? snapshotData['info']
        : CodedValueStruct.maybeFromMap(snapshotData['info']);
    _clientId = snapshotData['client_id'] as String?;
    _clientSecret = snapshotData['client_secret'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('integration_providers');

  static Stream<IntegrationProvidersRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => IntegrationProvidersRecord.fromSnapshot(s));

  static Future<IntegrationProvidersRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => IntegrationProvidersRecord.fromSnapshot(s));

  static IntegrationProvidersRecord fromSnapshot(DocumentSnapshot snapshot) =>
      IntegrationProvidersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static IntegrationProvidersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      IntegrationProvidersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'IntegrationProvidersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is IntegrationProvidersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createIntegrationProvidersRecordData({
  CodedValueStruct? info,
  String? clientId,
  String? clientSecret,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'info': CodedValueStruct().toMap(),
      'client_id': clientId,
      'client_secret': clientSecret,
    }.withoutNulls,
  );

  // Handle nested data for "info" field.
  addCodedValueStructData(firestoreData, info, 'info');

  return firestoreData;
}

class IntegrationProvidersRecordDocumentEquality
    implements Equality<IntegrationProvidersRecord> {
  const IntegrationProvidersRecordDocumentEquality();

  @override
  bool equals(IntegrationProvidersRecord? e1, IntegrationProvidersRecord? e2) {
    return e1?.info == e2?.info &&
        e1?.clientId == e2?.clientId &&
        e1?.clientSecret == e2?.clientSecret;
  }

  @override
  int hash(IntegrationProvidersRecord? e) =>
      const ListEquality().hash([e?.info, e?.clientId, e?.clientSecret]);

  @override
  bool isValidKey(Object? o) => o is IntegrationProvidersRecord;
}
