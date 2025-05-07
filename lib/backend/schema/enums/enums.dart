import "package:medibound_portal_hdztzw/backend/schema/enums/enums.dart"
    as medibound_portal_hdztzw_enums;
import 'package:ff_commons/flutter_flow/enums.dart';
export 'package:ff_commons/flutter_flow/enums.dart';

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
    case (medibound_portal_hdztzw_enums.UserType):
      return medibound_portal_hdztzw_enums.UserType.values.deserialize(value)
          as T?;
    default:
      return null;
  }
}
