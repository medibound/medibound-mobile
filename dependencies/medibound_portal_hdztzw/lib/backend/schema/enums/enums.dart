import 'package:collection/collection.dart';
import 'package:ff_commons/flutter_flow/enums.dart';
export 'package:ff_commons/flutter_flow/enums.dart';

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
  AGENTS,
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

enum UserType {
  WAITLIST,
  USER,
  ADMIN,
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
    case (UserType):
      return UserType.values.deserialize(value) as T?;
    default:
      return null;
  }
}
