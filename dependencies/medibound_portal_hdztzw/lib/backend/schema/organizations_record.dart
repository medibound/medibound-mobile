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

class OrganizationsRecord extends FirestoreRecord {
  OrganizationsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "edited_time" field.
  DateTime? _editedTime;
  DateTime? get editedTime => _editedTime;
  bool hasEditedTime() => _editedTime != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  bool hasAddress() => _address != null;

  // "website" field.
  String? _website;
  String get website => _website ?? '';
  bool hasWebsite() => _website != null;

  // "privacyPolicy" field.
  String? _privacyPolicy;
  String get privacyPolicy => _privacyPolicy ?? '';
  bool hasPrivacyPolicy() => _privacyPolicy != null;

  // "members" field.
  List<RoledUserStruct>? _members;
  List<RoledUserStruct> get members => _members ?? const [];
  bool hasMembers() => _members != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "profile" field.
  ProfileStruct? _profile;
  ProfileStruct get profile => _profile ?? ProfileStruct();
  bool hasProfile() => _profile != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _editedTime = snapshotData['edited_time'] as DateTime?;
    _address = snapshotData['address'] as String?;
    _website = snapshotData['website'] as String?;
    _privacyPolicy = snapshotData['privacyPolicy'] as String?;
    _members = getStructList(
      snapshotData['members'],
      RoledUserStruct.fromMap,
    );
    _type = snapshotData['type'] as String?;
    _profile = snapshotData['profile'] is ProfileStruct
        ? snapshotData['profile']
        : ProfileStruct.maybeFromMap(snapshotData['profile']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('organizations');

  static Stream<OrganizationsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OrganizationsRecord.fromSnapshot(s));

  static Future<OrganizationsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => OrganizationsRecord.fromSnapshot(s));

  static OrganizationsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      OrganizationsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OrganizationsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OrganizationsRecord._(reference, mapFromFirestore(data));

  static OrganizationsRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      OrganizationsRecord.getDocumentFromData(
        {
          'email': snapshot.data['email'],
          'created_time': convertAlgoliaParam(
            snapshot.data['created_time'],
            ParamType.DateTime,
            false,
          ),
          'edited_time': convertAlgoliaParam(
            snapshot.data['edited_time'],
            ParamType.DateTime,
            false,
          ),
          'address': snapshot.data['address'],
          'website': snapshot.data['website'],
          'privacyPolicy': snapshot.data['privacyPolicy'],
          'members': safeGet(
            () => (snapshot.data['members'] as Iterable)
                .map((d) => RoledUserStruct.fromAlgoliaData(d).toMap())
                .toList(),
          ),
          'type': snapshot.data['type'],
          'profile':
              ProfileStruct.fromAlgoliaData(snapshot.data['profile'] ?? {})
                  .toMap(),
        },
        OrganizationsRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<OrganizationsRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'organizations',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'OrganizationsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OrganizationsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOrganizationsRecordData({
  String? email,
  DateTime? createdTime,
  DateTime? editedTime,
  String? address,
  String? website,
  String? privacyPolicy,
  String? type,
  ProfileStruct? profile,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'created_time': createdTime,
      'edited_time': editedTime,
      'address': address,
      'website': website,
      'privacyPolicy': privacyPolicy,
      'type': type,
      'profile': ProfileStruct().toMap(),
    }.withoutNulls,
  );

  // Handle nested data for "profile" field.
  addProfileStructData(firestoreData, profile, 'profile');

  return firestoreData;
}

class OrganizationsRecordDocumentEquality
    implements Equality<OrganizationsRecord> {
  const OrganizationsRecordDocumentEquality();

  @override
  bool equals(OrganizationsRecord? e1, OrganizationsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.createdTime == e2?.createdTime &&
        e1?.editedTime == e2?.editedTime &&
        e1?.address == e2?.address &&
        e1?.website == e2?.website &&
        e1?.privacyPolicy == e2?.privacyPolicy &&
        listEquality.equals(e1?.members, e2?.members) &&
        e1?.type == e2?.type &&
        e1?.profile == e2?.profile;
  }

  @override
  int hash(OrganizationsRecord? e) => const ListEquality().hash([
        e?.email,
        e?.createdTime,
        e?.editedTime,
        e?.address,
        e?.website,
        e?.privacyPolicy,
        e?.members,
        e?.type,
        e?.profile
      ]);

  @override
  bool isValidKey(Object? o) => o is OrganizationsRecord;
}
