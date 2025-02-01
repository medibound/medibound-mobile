// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProfileStruct extends FFFirebaseStruct {
  ProfileStruct({
    String? displayName,
    String? photoUrl,
    CollectionProfiles? profileType,
    String? uid,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _displayName = displayName,
        _photoUrl = photoUrl,
        _profileType = profileType,
        _uid = uid,
        super(firestoreUtilData);

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  set displayName(String? val) => _displayName = val;

  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  set photoUrl(String? val) => _photoUrl = val;

  bool hasPhotoUrl() => _photoUrl != null;

  // "profile_type" field.
  CollectionProfiles? _profileType;
  CollectionProfiles? get profileType => _profileType;
  set profileType(CollectionProfiles? val) => _profileType = val;

  bool hasProfileType() => _profileType != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  set uid(String? val) => _uid = val;

  bool hasUid() => _uid != null;

  static ProfileStruct fromMap(Map<String, dynamic> data) => ProfileStruct(
        displayName: data['display_name'] as String?,
        photoUrl: data['photo_url'] as String?,
        profileType: data['profile_type'] is CollectionProfiles
            ? data['profile_type']
            : deserializeEnum<CollectionProfiles>(data['profile_type']),
        uid: data['uid'] as String?,
      );

  static ProfileStruct? maybeFromMap(dynamic data) =>
      data is Map ? ProfileStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'display_name': _displayName,
        'photo_url': _photoUrl,
        'profile_type': _profileType?.serialize(),
        'uid': _uid,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'display_name': serializeParam(
          _displayName,
          ParamType.String,
        ),
        'photo_url': serializeParam(
          _photoUrl,
          ParamType.String,
        ),
        'profile_type': serializeParam(
          _profileType,
          ParamType.Enum,
        ),
        'uid': serializeParam(
          _uid,
          ParamType.String,
        ),
      }.withoutNulls;

  static ProfileStruct fromSerializableMap(Map<String, dynamic> data) =>
      ProfileStruct(
        displayName: deserializeParam(
          data['display_name'],
          ParamType.String,
          false,
        ),
        photoUrl: deserializeParam(
          data['photo_url'],
          ParamType.String,
          false,
        ),
        profileType: deserializeParam<CollectionProfiles>(
          data['profile_type'],
          ParamType.Enum,
          false,
        ),
        uid: deserializeParam(
          data['uid'],
          ParamType.String,
          false,
        ),
      );

  static ProfileStruct fromAlgoliaData(Map<String, dynamic> data) =>
      ProfileStruct(
        displayName: convertAlgoliaParam(
          data['display_name'],
          ParamType.String,
          false,
        ),
        photoUrl: convertAlgoliaParam(
          data['photo_url'],
          ParamType.String,
          false,
        ),
        profileType: convertAlgoliaParam<CollectionProfiles>(
          data['profile_type'],
          ParamType.Enum,
          false,
        ),
        uid: convertAlgoliaParam(
          data['uid'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'ProfileStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ProfileStruct &&
        displayName == other.displayName &&
        photoUrl == other.photoUrl &&
        profileType == other.profileType &&
        uid == other.uid;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([displayName, photoUrl, profileType, uid]);
}

ProfileStruct createProfileStruct({
  String? displayName,
  String? photoUrl,
  CollectionProfiles? profileType,
  String? uid,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ProfileStruct(
      displayName: displayName,
      photoUrl: photoUrl,
      profileType: profileType,
      uid: uid,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ProfileStruct? updateProfileStruct(
  ProfileStruct? profile, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    profile
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addProfileStructData(
  Map<String, dynamic> firestoreData,
  ProfileStruct? profile,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (profile == null) {
    return;
  }
  if (profile.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && profile.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final profileData = getProfileFirestoreData(profile, forFieldValue);
  final nestedData = profileData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = profile.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getProfileFirestoreData(
  ProfileStruct? profile, [
  bool forFieldValue = false,
]) {
  if (profile == null) {
    return {};
  }
  final firestoreData = mapToFirestore(profile.toMap());

  // Add any Firestore field values
  profile.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getProfileListFirestoreData(
  List<ProfileStruct>? profiles,
) =>
    profiles?.map((e) => getProfileFirestoreData(e, true)).toList() ?? [];
