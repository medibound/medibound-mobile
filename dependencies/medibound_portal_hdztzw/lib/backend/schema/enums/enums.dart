import 'package:collection/collection.dart';

enum OrganizationRoleCode {
  MEMBER,
  ADMIN,
  OWNER,
}

enum DeviceModeCode {
  PROD,
  DEVM,
}

enum CollectionProfiles {
  USERS,
  ORGANIZATIONS,
}

enum Options {
  UNITS,
}

enum GraphOrientation {
  VERTICAL,
  HORIZONTAL,
}

enum CollectionSources {
  DEVICES,
}

extension FFEnumExtensions<T extends Enum> on T {
  String serialize() => name;
}

extension FFEnumListExtensions<T extends Enum> on Iterable<T> {
  T? deserialize(String? value) =>
      firstWhereOrNull((e) => e.serialize() == value);
}

T? deserializeEnum<T>(String? value) {
  switch (T) {
    case (OrganizationRoleCode):
      return OrganizationRoleCode.values.deserialize(value) as T?;
    case (DeviceModeCode):
      return DeviceModeCode.values.deserialize(value) as T?;
    case (CollectionProfiles):
      return CollectionProfiles.values.deserialize(value) as T?;
    case (Options):
      return Options.values.deserialize(value) as T?;
    case (GraphOrientation):
      return GraphOrientation.values.deserialize(value) as T?;
    case (CollectionSources):
      return CollectionSources.values.deserialize(value) as T?;
    default:
      return null;
  }
}
