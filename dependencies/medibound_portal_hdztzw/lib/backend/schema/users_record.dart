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

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "birthDate" field.
  DateTime? _birthDate;
  DateTime? get birthDate => _birthDate;
  bool hasBirthDate() => _birthDate != null;

  // "familyName" field.
  String? _familyName;
  String get familyName => _familyName ?? '';
  bool hasFamilyName() => _familyName != null;

  // "givenNames" field.
  List<String>? _givenNames;
  List<String> get givenNames => _givenNames ?? const [];
  bool hasGivenNames() => _givenNames != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "gender" field.
  String? _gender;
  String get gender => _gender ?? '';
  bool hasGender() => _gender != null;

  // "profile" field.
  ProfileStruct? _profile;
  ProfileStruct get profile => _profile ?? ProfileStruct();
  bool hasProfile() => _profile != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "organizations" field.
  List<DocumentReference>? _organizations;
  List<DocumentReference> get organizations => _organizations ?? const [];
  bool hasOrganizations() => _organizations != null;

  // "clinical_mode" field.
  bool? _clinicalMode;
  bool get clinicalMode => _clinicalMode ?? false;
  bool hasClinicalMode() => _clinicalMode != null;

  // "integration" field.
  IntegrationStruct? _integration;
  IntegrationStruct get integration => _integration ?? IntegrationStruct();
  bool hasIntegration() => _integration != null;

  // "whitelisted" field.
  bool? _whitelisted;
  bool get whitelisted => _whitelisted ?? false;
  bool hasWhitelisted() => _whitelisted != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _birthDate = snapshotData['birthDate'] as DateTime?;
    _familyName = snapshotData['familyName'] as String?;
    _givenNames = getDataList(snapshotData['givenNames']);
    _phoneNumber = snapshotData['phone_number'] as String?;
    _gender = snapshotData['gender'] as String?;
    _profile = snapshotData['profile'] is ProfileStruct
        ? snapshotData['profile']
        : ProfileStruct.maybeFromMap(snapshotData['profile']);
    _displayName = snapshotData['display_name'] as String?;
    _uid = snapshotData['uid'] as String?;
    _organizations = getDataList(snapshotData['organizations']);
    _clinicalMode = snapshotData['clinical_mode'] as bool?;
    _integration = snapshotData['integration'] is IntegrationStruct
        ? snapshotData['integration']
        : IntegrationStruct.maybeFromMap(snapshotData['integration']);
    _whitelisted = snapshotData['whitelisted'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  static UsersRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      UsersRecord.getDocumentFromData(
        {
          'email': snapshot.data['email'],
          'photo_url': snapshot.data['photo_url'],
          'created_time': convertAlgoliaParam(
            snapshot.data['created_time'],
            ParamType.DateTime,
            false,
          ),
          'birthDate': convertAlgoliaParam(
            snapshot.data['birthDate'],
            ParamType.DateTime,
            false,
          ),
          'familyName': snapshot.data['familyName'],
          'givenNames': safeGet(
            () => snapshot.data['givenNames'].toList(),
          ),
          'phone_number': snapshot.data['phone_number'],
          'gender': snapshot.data['gender'],
          'profile':
              ProfileStruct.fromAlgoliaData(snapshot.data['profile'] ?? {})
                  .toMap(),
          'display_name': snapshot.data['display_name'],
          'uid': snapshot.data['uid'],
          'organizations': safeGet(
            () => convertAlgoliaParam<DocumentReference>(
              snapshot.data['organizations'],
              ParamType.DocumentReference,
              true,
            ).toList(),
          ),
          'clinical_mode': snapshot.data['clinical_mode'],
          'integration': IntegrationStruct.fromAlgoliaData(
                  snapshot.data['integration'] ?? {})
              .toMap(),
          'whitelisted': snapshot.data['whitelisted'],
        },
        UsersRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<UsersRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'users',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? photoUrl,
  DateTime? createdTime,
  DateTime? birthDate,
  String? familyName,
  String? phoneNumber,
  String? gender,
  ProfileStruct? profile,
  String? displayName,
  String? uid,
  bool? clinicalMode,
  IntegrationStruct? integration,
  bool? whitelisted,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'photo_url': photoUrl,
      'created_time': createdTime,
      'birthDate': birthDate,
      'familyName': familyName,
      'phone_number': phoneNumber,
      'gender': gender,
      'profile': ProfileStruct().toMap(),
      'display_name': displayName,
      'uid': uid,
      'clinical_mode': clinicalMode,
      'integration': IntegrationStruct().toMap(),
      'whitelisted': whitelisted,
    }.withoutNulls,
  );

  // Handle nested data for "profile" field.
  addProfileStructData(firestoreData, profile, 'profile');

  // Handle nested data for "integration" field.
  addIntegrationStructData(firestoreData, integration, 'integration');

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.createdTime == e2?.createdTime &&
        e1?.birthDate == e2?.birthDate &&
        e1?.familyName == e2?.familyName &&
        listEquality.equals(e1?.givenNames, e2?.givenNames) &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.gender == e2?.gender &&
        e1?.profile == e2?.profile &&
        e1?.displayName == e2?.displayName &&
        e1?.uid == e2?.uid &&
        listEquality.equals(e1?.organizations, e2?.organizations) &&
        e1?.clinicalMode == e2?.clinicalMode &&
        e1?.integration == e2?.integration &&
        e1?.whitelisted == e2?.whitelisted;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.photoUrl,
        e?.createdTime,
        e?.birthDate,
        e?.familyName,
        e?.givenNames,
        e?.phoneNumber,
        e?.gender,
        e?.profile,
        e?.displayName,
        e?.uid,
        e?.organizations,
        e?.clinicalMode,
        e?.integration,
        e?.whitelisted
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
