import 'dart:async';

import 'package:from_css_color/from_css_color.dart';
import '/backend/algolia/serialization_util.dart';
import '/backend/algolia/algolia_manager.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class IntegrationsRecord extends FirestoreRecord {
  IntegrationsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "profile" field.
  ProfileStruct? _profile;
  ProfileStruct get profile => _profile ?? ProfileStruct();
  bool hasProfile() => _profile != null;

  // "type" field.
  DocumentReference? _type;
  DocumentReference? get type => _type;
  bool hasType() => _type != null;

  // "auth_uri" field.
  String? _authUri;
  String get authUri => _authUri ?? '';
  bool hasAuthUri() => _authUri != null;

  // "fhir_endpoint" field.
  String? _fhirEndpoint;
  String get fhirEndpoint => _fhirEndpoint ?? '';
  bool hasFhirEndpoint() => _fhirEndpoint != null;

  // "token_uri" field.
  String? _tokenUri;
  String get tokenUri => _tokenUri ?? '';
  bool hasTokenUri() => _tokenUri != null;

  void _initializeFields() {
    _profile = snapshotData['profile'] is ProfileStruct
        ? snapshotData['profile']
        : ProfileStruct.maybeFromMap(snapshotData['profile']);
    _type = snapshotData['type'] as DocumentReference?;
    _authUri = snapshotData['auth_uri'] as String?;
    _fhirEndpoint = snapshotData['fhir_endpoint'] as String?;
    _tokenUri = snapshotData['token_uri'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('integrations');

  static Stream<IntegrationsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => IntegrationsRecord.fromSnapshot(s));

  static Future<IntegrationsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => IntegrationsRecord.fromSnapshot(s));

  static IntegrationsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      IntegrationsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static IntegrationsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      IntegrationsRecord._(reference, mapFromFirestore(data));

  static IntegrationsRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      IntegrationsRecord.getDocumentFromData(
        {
          'profile':
              ProfileStruct.fromAlgoliaData(snapshot.data['profile'] ?? {})
                  .toMap(),
          'type': convertAlgoliaParam(
            snapshot.data['type'],
            ParamType.DocumentReference,
            false,
          ),
          'auth_uri': snapshot.data['auth_uri'],
          'fhir_endpoint': snapshot.data['fhir_endpoint'],
          'token_uri': snapshot.data['token_uri'],
        },
        IntegrationsRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<IntegrationsRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'integrations',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'IntegrationsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is IntegrationsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createIntegrationsRecordData({
  ProfileStruct? profile,
  DocumentReference? type,
  String? authUri,
  String? fhirEndpoint,
  String? tokenUri,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'profile': ProfileStruct().toMap(),
      'type': type,
      'auth_uri': authUri,
      'fhir_endpoint': fhirEndpoint,
      'token_uri': tokenUri,
    }.withoutNulls,
  );

  // Handle nested data for "profile" field.
  addProfileStructData(firestoreData, profile, 'profile');

  return firestoreData;
}

class IntegrationsRecordDocumentEquality
    implements Equality<IntegrationsRecord> {
  const IntegrationsRecordDocumentEquality();

  @override
  bool equals(IntegrationsRecord? e1, IntegrationsRecord? e2) {
    return e1?.profile == e2?.profile &&
        e1?.type == e2?.type &&
        e1?.authUri == e2?.authUri &&
        e1?.fhirEndpoint == e2?.fhirEndpoint &&
        e1?.tokenUri == e2?.tokenUri;
  }

  @override
  int hash(IntegrationsRecord? e) => const ListEquality()
      .hash([e?.profile, e?.type, e?.authUri, e?.fhirEndpoint, e?.tokenUri]);

  @override
  bool isValidKey(Object? o) => o is IntegrationsRecord;
}
