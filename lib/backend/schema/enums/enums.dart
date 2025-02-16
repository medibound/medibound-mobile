import 'package:collection/collection.dart';
import "package:medibound_portal_hdztzw/backend/schema/enums/enums.dart"
    as medibound_portal_hdztzw_enums
    hide FFEnumExtensions, FFEnumListExtensions;

extension FFEnumExtensions<T extends Enum> on T {
  String serialize() => name;
}

extension FFEnumListExtensions<T extends Enum> on Iterable<T> {
  T? deserialize(String? value) =>
      firstWhereOrNull((e) => e.serialize() == value);
}

T? deserializeEnum<T>(String? value) {
  switch (T) {
    case (medibound_portal_hdztzw_enums.OrganizationRoleCode):
      return medibound_portal_hdztzw_enums.OrganizationRoleCode.values
          .deserialize(value) as T?;
    case (medibound_portal_hdztzw_enums.DeviceModeCode):
      return medibound_portal_hdztzw_enums.DeviceModeCode.values
          .deserialize(value) as T?;
    case (medibound_portal_hdztzw_enums.CollectionProfiles):
      return medibound_portal_hdztzw_enums.CollectionProfiles.values
          .deserialize(value) as T?;
    case (medibound_portal_hdztzw_enums.Options):
      return medibound_portal_hdztzw_enums.Options.values.deserialize(value)
          as T?;
    case (medibound_portal_hdztzw_enums.GraphOrientation):
      return medibound_portal_hdztzw_enums.GraphOrientation.values
          .deserialize(value) as T?;
    case (medibound_portal_hdztzw_enums.CollectionSources):
      return medibound_portal_hdztzw_enums.CollectionSources.values
          .deserialize(value) as T?;
    default:
      return null;
  }
}
