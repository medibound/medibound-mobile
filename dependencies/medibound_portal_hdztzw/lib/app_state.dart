import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import 'package:ff_commons/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  List<DropdownStruct> _Genders = [
    DropdownStruct.fromSerializableMap(jsonDecode(
        '{\"display\":\"Male\",\"description\":\"he/him\",\"code\":\"male\"}')),
    DropdownStruct.fromSerializableMap(jsonDecode(
        '{\"display\":\"Female\",\"description\":\"she/her\",\"code\":\"female\"}')),
    DropdownStruct.fromSerializableMap(
        jsonDecode('{\"display\":\"Other\",\"code\":\"other\"}'))
  ];
  List<DropdownStruct> get Genders => _Genders;
  set Genders(List<DropdownStruct> value) {
    _Genders = value;
  }

  void addToGenders(DropdownStruct value) {
    Genders.add(value);
  }

  void removeFromGenders(DropdownStruct value) {
    Genders.remove(value);
  }

  void removeAtIndexFromGenders(int index) {
    Genders.removeAt(index);
  }

  void updateGendersAtIndex(
    int index,
    DropdownStruct Function(DropdownStruct) updateFn,
  ) {
    Genders[index] = updateFn(_Genders[index]);
  }

  void insertAtIndexInGenders(int index, DropdownStruct value) {
    Genders.insert(index, value);
  }

  List<DropdownStruct> _OrganizationTypes = [
    DropdownStruct.fromSerializableMap(jsonDecode(
        '{\"display\":\"Manufacturer\",\"description\":\"production and assembly of physical goods or devices\",\"code\":\"OT01\"}')),
    DropdownStruct.fromSerializableMap(jsonDecode(
        '{\"display\":\"Software Developer\",\"description\":\"creating and maintaining software applications and systems\",\"code\":\"OT02\"}')),
    DropdownStruct.fromSerializableMap(jsonDecode(
        '{\"display\":\"Health and Wellness\",\"description\":\"physical and mental well-being, often through products, services, or programs\",\"code\":\"OT03\"}')),
    DropdownStruct.fromSerializableMap(jsonDecode(
        '{\"display\":\"Fitness and Sports\",\"description\":\"athletic performance, exercise equipment, sports training, or related services\",\"code\":\"OT04\"}')),
    DropdownStruct.fromSerializableMap(jsonDecode(
        '{\"display\":\"Research and Development\",\"description\":\"innovation, experimentation, and the development of new technologies or products\",\"code\":\"OT05\"}')),
    DropdownStruct.fromSerializableMap(jsonDecode(
        '{\"display\":\"Security and Privacy\",\"description\":\"protection of data, devices, or physical environments through advanced security measures\",\"code\":\"OT06\"}')),
    DropdownStruct.fromSerializableMap(jsonDecode(
        '{\"display\":\"Fashion and Design\",\"description\":\"apparel, accessories, and aesthetic-focused design solutions\",\"code\":\"OT07\"}')),
    DropdownStruct.fromSerializableMap(jsonDecode(
        '{\"display\":\"Retail and Distribution\",\"description\":\"sale, delivery, and logistics of products to end-users or other businesses\",\"code\":\"OT08\"}')),
    DropdownStruct.fromSerializableMap(jsonDecode(
        '{\"display\":\"Education\",\"description\":\"learning, teaching, and knowledge dissemination through programs, tools, or platforms\",\"code\":\"OT09\"}'))
  ];
  List<DropdownStruct> get OrganizationTypes => _OrganizationTypes;
  set OrganizationTypes(List<DropdownStruct> value) {
    _OrganizationTypes = value;
  }

  void addToOrganizationTypes(DropdownStruct value) {
    OrganizationTypes.add(value);
  }

  void removeFromOrganizationTypes(DropdownStruct value) {
    OrganizationTypes.remove(value);
  }

  void removeAtIndexFromOrganizationTypes(int index) {
    OrganizationTypes.removeAt(index);
  }

  void updateOrganizationTypesAtIndex(
    int index,
    DropdownStruct Function(DropdownStruct) updateFn,
  ) {
    OrganizationTypes[index] = updateFn(_OrganizationTypes[index]);
  }

  void insertAtIndexInOrganizationTypes(int index, DropdownStruct value) {
    OrganizationTypes.insert(index, value);
  }

  List<DropdownStruct> _DeviceTypes = [
    DropdownStruct.fromSerializableMap(jsonDecode(
        '{\"display\":\"Health Rings\",\"description\":\"Wearables\",\"code\":\"DT01\"}')),
    DropdownStruct.fromSerializableMap(jsonDecode(
        '{\"display\":\"Smart Watches\",\"description\":\"Wearables\",\"code\":\"DT02\"}')),
    DropdownStruct.fromSerializableMap(jsonDecode(
        '{\"display\":\"Fitness Bands\",\"description\":\"Wearables\",\"code\":\"DT03\"}')),
    DropdownStruct.fromSerializableMap(jsonDecode(
        '{\"display\":\"Smart Glasses\",\"description\":\"Wearables\",\"code\":\"DT04\"}')),
    DropdownStruct.fromSerializableMap(jsonDecode(
        '{\"display\":\"Activity Trackers\",\"description\":\"Wearables\",\"code\":\"DT05\"}')),
    DropdownStruct.fromSerializableMap(jsonDecode(
        '{\"display\":\"Sleep Monitors\",\"description\":\"Wearables\",\"code\":\"DT06\"}')),
    DropdownStruct.fromSerializableMap(jsonDecode(
        '{\"display\":\"Heart Rate Monitors\",\"description\":\"Wearables\",\"code\":\"DT07\"}')),
    DropdownStruct.fromSerializableMap(jsonDecode(
        '{\"display\":\"Smart Clothing\",\"description\":\"Wearables\",\"code\":\"DT08\"}')),
    DropdownStruct.fromSerializableMap(jsonDecode(
        '{\"display\":\"GPS Trackers\",\"description\":\"Wearables\",\"code\":\"DT09\"}')),
    DropdownStruct.fromSerializableMap(jsonDecode(
        '{\"display\":\"UV Sensors\",\"description\":\"Wearables\",\"code\":\"DT10\"}')),
    DropdownStruct.fromSerializableMap(jsonDecode(
        '{\"display\":\"Other\",\"description\":\"Other\",\"code\":\"OTHER\"}'))
  ];
  List<DropdownStruct> get DeviceTypes => _DeviceTypes;
  set DeviceTypes(List<DropdownStruct> value) {
    _DeviceTypes = value;
  }

  void addToDeviceTypes(DropdownStruct value) {
    DeviceTypes.add(value);
  }

  void removeFromDeviceTypes(DropdownStruct value) {
    DeviceTypes.remove(value);
  }

  void removeAtIndexFromDeviceTypes(int index) {
    DeviceTypes.removeAt(index);
  }

  void updateDeviceTypesAtIndex(
    int index,
    DropdownStruct Function(DropdownStruct) updateFn,
  ) {
    DeviceTypes[index] = updateFn(_DeviceTypes[index]);
  }

  void insertAtIndexInDeviceTypes(int index, DropdownStruct value) {
    DeviceTypes.insert(index, value);
  }

  List<DropdownStruct> _UserRoles = [
    DropdownStruct.fromSerializableMap(jsonDecode(
        '{\"display\":\"Owner\",\"description\":\"\",\"code\":\"OWNER\"}')),
    DropdownStruct.fromSerializableMap(jsonDecode(
        '{\"display\":\"Admin\",\"description\":\"\",\"code\":\"ADMIN\"}')),
    DropdownStruct.fromSerializableMap(jsonDecode(
        '{\"display\":\"Member\",\"description\":\"\",\"code\":\"MEMBER\"}'))
  ];
  List<DropdownStruct> get UserRoles => _UserRoles;
  set UserRoles(List<DropdownStruct> value) {
    _UserRoles = value;
  }

  void addToUserRoles(DropdownStruct value) {
    UserRoles.add(value);
  }

  void removeFromUserRoles(DropdownStruct value) {
    UserRoles.remove(value);
  }

  void removeAtIndexFromUserRoles(int index) {
    UserRoles.removeAt(index);
  }

  void updateUserRolesAtIndex(
    int index,
    DropdownStruct Function(DropdownStruct) updateFn,
  ) {
    UserRoles[index] = updateFn(_UserRoles[index]);
  }

  void insertAtIndexInUserRoles(int index, DropdownStruct value) {
    UserRoles.insert(index, value);
  }

  List<DropdownStruct> _DeviceTransferTypes = [
    DropdownStruct.fromSerializableMap(jsonDecode(
        '{\"display\":\"Live Bluetooth Low Energy\",\"description\":\"Real-time, continuous data streaming for dynamic health monitoring.\",\"code\":\"LBLE\"}')),
    DropdownStruct.fromSerializableMap(jsonDecode(
        '{\"display\":\"Static Bluetooth Low Energy\",\"description\":\"One-time data transfer for intermittent diagnostics and results.\",\"code\":\"SBLE\"}')),
    DropdownStruct.fromSerializableMap(jsonDecode(
        '{\"display\":\"Static NFC\",\"description\":\"Quick, contactless data exchange for static health information.\",\"code\":\"SNFC\"}'))
  ];
  List<DropdownStruct> get DeviceTransferTypes => _DeviceTransferTypes;
  set DeviceTransferTypes(List<DropdownStruct> value) {
    _DeviceTransferTypes = value;
  }

  void addToDeviceTransferTypes(DropdownStruct value) {
    DeviceTransferTypes.add(value);
  }

  void removeFromDeviceTransferTypes(DropdownStruct value) {
    DeviceTransferTypes.remove(value);
  }

  void removeAtIndexFromDeviceTransferTypes(int index) {
    DeviceTransferTypes.removeAt(index);
  }

  void updateDeviceTransferTypesAtIndex(
    int index,
    DropdownStruct Function(DropdownStruct) updateFn,
  ) {
    DeviceTransferTypes[index] = updateFn(_DeviceTransferTypes[index]);
  }

  void insertAtIndexInDeviceTransferTypes(int index, DropdownStruct value) {
    DeviceTransferTypes.insert(index, value);
  }

  List<DropdownStruct> _DeviceProfileModes = [
    DropdownStruct.fromSerializableMap(jsonDecode(
        '{\"display\":\"Production\",\"description\":\"Live environment for real-world use and operations.\",\"code\":\"PROD\"}')),
    DropdownStruct.fromSerializableMap(jsonDecode(
        '{\"display\":\"Development\",\"description\":\"Testing environment for development and debugging.\",\"code\":\"DEVM\"}'))
  ];
  List<DropdownStruct> get DeviceProfileModes => _DeviceProfileModes;
  set DeviceProfileModes(List<DropdownStruct> value) {
    _DeviceProfileModes = value;
  }

  void addToDeviceProfileModes(DropdownStruct value) {
    DeviceProfileModes.add(value);
  }

  void removeFromDeviceProfileModes(DropdownStruct value) {
    DeviceProfileModes.remove(value);
  }

  void removeAtIndexFromDeviceProfileModes(int index) {
    DeviceProfileModes.removeAt(index);
  }

  void updateDeviceProfileModesAtIndex(
    int index,
    DropdownStruct Function(DropdownStruct) updateFn,
  ) {
    DeviceProfileModes[index] = updateFn(_DeviceProfileModes[index]);
  }

  void insertAtIndexInDeviceProfileModes(int index, DropdownStruct value) {
    DeviceProfileModes.insert(index, value);
  }

  List<DropdownStruct> _DeviceVariableTypes = [
    DropdownStruct.fromSerializableMap(jsonDecode(
        '{\"display\":\"String\",\"description\":\"A series of characters\",\"code\":\"STRING\"}')),
    DropdownStruct.fromSerializableMap(jsonDecode(
        '{\"display\":\"Number\",\"description\":\"A series of decimal numbers\",\"code\":\"NUMBER\"}'))
  ];
  List<DropdownStruct> get DeviceVariableTypes => _DeviceVariableTypes;
  set DeviceVariableTypes(List<DropdownStruct> value) {
    _DeviceVariableTypes = value;
  }

  void addToDeviceVariableTypes(DropdownStruct value) {
    DeviceVariableTypes.add(value);
  }

  void removeFromDeviceVariableTypes(DropdownStruct value) {
    DeviceVariableTypes.remove(value);
  }

  void removeAtIndexFromDeviceVariableTypes(int index) {
    DeviceVariableTypes.removeAt(index);
  }

  void updateDeviceVariableTypesAtIndex(
    int index,
    DropdownStruct Function(DropdownStruct) updateFn,
  ) {
    DeviceVariableTypes[index] = updateFn(_DeviceVariableTypes[index]);
  }

  void insertAtIndexInDeviceVariableTypes(int index, DropdownStruct value) {
    DeviceVariableTypes.insert(index, value);
  }

  List<DropdownStruct> _EmptyDropdown = [];
  List<DropdownStruct> get EmptyDropdown => _EmptyDropdown;
  set EmptyDropdown(List<DropdownStruct> value) {
    _EmptyDropdown = value;
  }

  void addToEmptyDropdown(DropdownStruct value) {
    EmptyDropdown.add(value);
  }

  void removeFromEmptyDropdown(DropdownStruct value) {
    EmptyDropdown.remove(value);
  }

  void removeAtIndexFromEmptyDropdown(int index) {
    EmptyDropdown.removeAt(index);
  }

  void updateEmptyDropdownAtIndex(
    int index,
    DropdownStruct Function(DropdownStruct) updateFn,
  ) {
    EmptyDropdown[index] = updateFn(_EmptyDropdown[index]);
  }

  void insertAtIndexInEmptyDropdown(int index, DropdownStruct value) {
    EmptyDropdown.insert(index, value);
  }

  List<DeviceVariableStruct> _DeviceVariablePresetIntegrations = [
    DeviceVariableStruct.fromSerializableMap(jsonDecode(
        '{\"info\":\"{\\\"display\\\":\\\"Active Energy Burned\\\",\\\"description\\\":\\\"The amount of active energy burned.\\\",\\\"code\\\":\\\"ACTIVE_ENERGY_BURNED\\\"}\",\"is_list\":\"false\",\"range\":\"{\\\"upper_bound\\\":\\\"0.0\\\",\\\"lower_bound\\\":\\\"0.0\\\"}\",\"type\":\"NUMBER\",\"unit\":\"cal\"}')),
    DeviceVariableStruct.fromSerializableMap(jsonDecode(
        '{\"info\":\"{\\\"display\\\":\\\"Basal Energy Burned\\\",\\\"description\\\":\\\"The amount of basal energy burned.\\\",\\\"code\\\":\\\"BASAL_ENERGY_BURNED\\\"}\",\"is_list\":\"false\",\"is_ranged\":\"false\",\"range\":\"{\\\"upper_bound\\\":\\\"0.0\\\",\\\"lower_bound\\\":\\\"0.0\\\"}\",\"type\":\"NUMBER\",\"unit\":\"cal\"}')),
    DeviceVariableStruct.fromSerializableMap(jsonDecode(
        '{\"info\":\"{\\\"display\\\":\\\"Blood Glucose\\\",\\\"description\\\":\\\"The user\'s blood glucose level.\\\",\\\"code\\\":\\\"BLOOD_GLUCOSE\\\"}\",\"is_list\":\"false\",\"is_ranged\":\"true\",\"range\":\"{\\\"upper_bound\\\":\\\"200.0\\\",\\\"lower_bound\\\":\\\"70.0\\\"}\",\"type\":\"NUMBER\",\"unit\":\"mg/dL\"}')),
    DeviceVariableStruct.fromSerializableMap(jsonDecode(
        '{\"info\":\"{\\\"display\\\":\\\"Blood Oxygen\\\",\\\"description\\\":\\\"The user\'s blood oxygen level.\\\",\\\"code\\\":\\\"BLOOD_OXYGEN\\\"}\",\"is_list\":\"false\",\"is_ranged\":\"true\",\"range\":\"{\\\"upper_bound\\\":\\\"100.0\\\",\\\"lower_bound\\\":\\\"0.0\\\"}\",\"type\":\"NUMBER\",\"unit\":\"%\"}')),
    DeviceVariableStruct.fromSerializableMap(jsonDecode(
        '{\"info\":\"{\\\"display\\\":\\\"Blood Pressure Diastolic\\\",\\\"description\\\":\\\"The user\'s diastolic blood pressure.\\\",\\\"code\\\":\\\"BLOOD_PRESSURE_DIASTOLIC\\\"}\",\"is_list\":\"false\",\"is_ranged\":\"true\",\"range\":\"{\\\"upper_bound\\\":\\\"90.0\\\",\\\"lower_bound\\\":\\\"60.0\\\"}\",\"type\":\"NUMBER\",\"unit\":\"mm[Hg]\"}')),
    DeviceVariableStruct.fromSerializableMap(jsonDecode(
        '{\"info\":\"{\\\"display\\\":\\\"Blood Pressure Systolic\\\",\\\"description\\\":\\\"The user\'s systolic blood pressure.\\\",\\\"code\\\":\\\"BLOOD_PRESSURE_SYSTOLIC\\\"}\",\"is_list\":\"false\",\"is_ranged\":\"true\",\"range\":\"{\\\"upper_bound\\\":\\\"140.0\\\",\\\"lower_bound\\\":\\\"90.0\\\"}\",\"type\":\"NUMBER\",\"unit\":\"mm[Hg]\"}')),
    DeviceVariableStruct.fromSerializableMap(jsonDecode(
        '{\"info\":\"{\\\"display\\\":\\\"Body Fat Percentage\\\",\\\"description\\\":\\\"The user\'s body fat percentage.\\\",\\\"code\\\":\\\"BODY_FAT_PERCENTAGE\\\"}\",\"is_list\":\"false\",\"is_ranged\":\"true\",\"range\":\"{\\\"upper_bound\\\":\\\"100.0\\\",\\\"lower_bound\\\":\\\"0.0\\\"}\",\"type\":\"NUMBER\",\"unit\":\"%\"}')),
    DeviceVariableStruct.fromSerializableMap(jsonDecode(
        '{\"info\":\"{\\\"display\\\":\\\"Body Mass Index\\\",\\\"description\\\":\\\"The user\'s body mass index (BMI).\\\",\\\"code\\\":\\\"BODY_MASS_INDEX\\\"}\",\"is_list\":\"false\",\"is_ranged\":\"true\",\"range\":\"{\\\"upper_bound\\\":\\\"30.0\\\",\\\"lower_bound\\\":\\\"18.5\\\"}\",\"type\":\"NUMBER\",\"unit\":\"{none}\"}')),
    DeviceVariableStruct.fromSerializableMap(jsonDecode(
        '{\"info\":\"{\\\"display\\\":\\\"Body Temperature\\\",\\\"description\\\":\\\"The user\'s body temperature.\\\",\\\"code\\\":\\\"BODY_TEMPERATURE\\\"}\",\"is_list\":\"false\",\"is_ranged\":\"true\",\"range\":\"{\\\"upper_bound\\\":\\\"50.0\\\",\\\"lower_bound\\\":\\\"30.0\\\"}\",\"type\":\"NUMBER\",\"unit\":\"Cel\"}')),
    DeviceVariableStruct.fromSerializableMap(jsonDecode(
        '{\"info\":\"{\\\"display\\\":\\\"Flights Climbed\\\",\\\"description\\\":\\\"The number of flights of stairs climbed.\\\",\\\"code\\\":\\\"FLIGHTS_CLIMBED\\\"}\",\"is_list\":\"false\",\"is_ranged\":\"false\",\"range\":\"{\\\"upper_bound\\\":\\\"0.0\\\",\\\"lower_bound\\\":\\\"0.0\\\"}\",\"type\":\"NUMBER\",\"unit\":\"{count}\"}')),
    DeviceVariableStruct.fromSerializableMap(jsonDecode(
        '{\"info\":\"{\\\"display\\\":\\\"Heart Rate\\\",\\\"description\\\":\\\"The user\'s heart rate.\\\",\\\"code\\\":\\\"HEART_RATE\\\"}\",\"is_list\":\"false\",\"is_ranged\":\"true\",\"range\":\"{\\\"upper_bound\\\":\\\"180.0\\\",\\\"lower_bound\\\":\\\"40.0\\\"}\",\"type\":\"NUMBER\",\"unit\":\"/min\"}')),
    DeviceVariableStruct.fromSerializableMap(jsonDecode(
        '{\"info\":\"{\\\"display\\\":\\\"Height\\\",\\\"description\\\":\\\"The user\'s height.\\\",\\\"code\\\":\\\"HEIGHT\\\"}\",\"is_list\":\"false\",\"is_ranged\":\"false\",\"range\":\"{\\\"upper_bound\\\":\\\"0.0\\\",\\\"lower_bound\\\":\\\"0.0\\\"}\",\"type\":\"NUMBER\",\"unit\":\"m\"}')),
    DeviceVariableStruct.fromSerializableMap(jsonDecode(
        '{\"info\":\"{\\\"display\\\":\\\"Nutrition\\\",\\\"description\\\":\\\"The user\'s nutrition data.\\\",\\\"code\\\":\\\"NUTRITION\\\"}\",\"is_list\":\"false\",\"is_ranged\":\"false\",\"range\":\"{\\\"upper_bound\\\":\\\"0.0\\\",\\\"lower_bound\\\":\\\"0.0\\\"}\",\"type\":\"NUMBER\",\"unit\":\"{none}\"}')),
    DeviceVariableStruct.fromSerializableMap(jsonDecode(
        '{\"info\":\"{\\\"display\\\":\\\"Respiratory Rate\\\",\\\"description\\\":\\\"The user\'s respiratory rate.\\\",\\\"code\\\":\\\"RESPIRATORY_RATE\\\"}\",\"is_list\":\"false\",\"is_ranged\":\"true\",\"range\":\"{\\\"upper_bound\\\":\\\"30.0\\\",\\\"lower_bound\\\":\\\"10.0\\\"}\",\"type\":\"NUMBER\",\"unit\":\"res/min\"}')),
    DeviceVariableStruct.fromSerializableMap(jsonDecode(
        '{\"info\":\"{\\\"display\\\":\\\"Resting Heart Rate\\\",\\\"description\\\":\\\"The user\'s resting heart rate.\\\",\\\"code\\\":\\\"RESTING_HEART_RATE\\\"}\",\"is_list\":\"false\",\"is_ranged\":\"true\",\"range\":\"{\\\"upper_bound\\\":\\\"100.0\\\",\\\"lower_bound\\\":\\\"40.0\\\"}\",\"type\":\"NUMBER\",\"unit\":\"/min\"}')),
    DeviceVariableStruct.fromSerializableMap(jsonDecode(
        '{\"info\":\"{\\\"display\\\":\\\"Sleep Asleep\\\",\\\"description\\\":\\\"The time spent asleep.\\\",\\\"code\\\":\\\"SLEEP_ASLEEP\\\"}\",\"is_list\":\"false\",\"is_ranged\":\"false\",\"range\":\"{\\\"upper_bound\\\":\\\"0.0\\\",\\\"lower_bound\\\":\\\"0.0\\\"}\",\"type\":\"NUMBER\",\"unit\":\"min\"}')),
    DeviceVariableStruct.fromSerializableMap(jsonDecode(
        '{\"info\":\"{\\\"display\\\":\\\"Sleep Awake\\\",\\\"description\\\":\\\"The time spent awake.\\\",\\\"code\\\":\\\"SLEEP_AWAKE\\\"}\",\"is_list\":\"false\",\"is_ranged\":\"false\",\"range\":\"{\\\"upper_bound\\\":\\\"0.0\\\",\\\"lower_bound\\\":\\\"0.0\\\"}\",\"type\":\"NUMBER\",\"unit\":\"min\"}')),
    DeviceVariableStruct.fromSerializableMap(jsonDecode(
        '{\"info\":\"{\\\"display\\\":\\\"Sleep Deep\\\",\\\"description\\\":\\\"The time spent in deep sleep.\\\",\\\"code\\\":\\\"SLEEP_DEEP\\\"}\",\"is_list\":\"false\",\"is_ranged\":\"false\",\"range\":\"{\\\"upper_bound\\\":\\\"0.0\\\",\\\"lower_bound\\\":\\\"0.0\\\"}\",\"type\":\"NUMBER\",\"unit\":\"min\"}')),
    DeviceVariableStruct.fromSerializableMap(jsonDecode(
        '{\"info\":\"{\\\"display\\\":\\\"Sleep REM\\\",\\\"description\\\":\\\"The time spent in REM sleep.\\\",\\\"code\\\":\\\"SLEEP_REM\\\"}\",\"is_list\":\"false\",\"is_ranged\":\"false\",\"range\":\"{\\\"upper_bound\\\":\\\"0.0\\\",\\\"lower_bound\\\":\\\"0.0\\\"}\",\"type\":\"NUMBER\",\"unit\":\"min\"}')),
    DeviceVariableStruct.fromSerializableMap(jsonDecode(
        '{\"info\":\"{\\\"display\\\":\\\"Steps\\\",\\\"description\\\":\\\"The number of steps taken.\\\",\\\"code\\\":\\\"STEPS\\\"}\",\"is_list\":\"false\",\"is_ranged\":\"false\",\"range\":\"{\\\"upper_bound\\\":\\\"0.0\\\",\\\"lower_bound\\\":\\\"0.0\\\"}\",\"type\":\"NUMBER\",\"unit\":\"{count}\"}')),
    DeviceVariableStruct.fromSerializableMap(jsonDecode(
        '{\"info\":\"{\\\"display\\\":\\\"Water\\\",\\\"description\\\":\\\"The amount of water consumed.\\\",\\\"code\\\":\\\"WATER\\\"}\",\"is_list\":\"false\",\"is_ranged\":\"false\",\"range\":\"{\\\"upper_bound\\\":\\\"0.0\\\",\\\"lower_bound\\\":\\\"0.0\\\"}\",\"type\":\"NUMBER\",\"unit\":\"L\"}')),
    DeviceVariableStruct.fromSerializableMap(jsonDecode(
        '{\"info\":\"{\\\"display\\\":\\\"Weight\\\",\\\"description\\\":\\\"The user\'s weight.\\\",\\\"code\\\":\\\"WEIGHT\\\"}\",\"is_list\":\"false\",\"is_ranged\":\"false\",\"range\":\"{\\\"upper_bound\\\":\\\"0.0\\\",\\\"lower_bound\\\":\\\"0.0\\\"}\",\"type\":\"NUMBER\",\"unit\":\"kg\"}')),
    DeviceVariableStruct.fromSerializableMap(jsonDecode(
        '{\"info\":\"{\\\"display\\\":\\\"Workout\\\",\\\"description\\\":\\\"The user\'s workout data.\\\",\\\"code\\\":\\\"WORKOUT\\\"}\",\"is_list\":\"false\",\"is_ranged\":\"false\",\"range\":\"{\\\"upper_bound\\\":\\\"0.0\\\",\\\"lower_bound\\\":\\\"0.0\\\"}\",\"type\":\"NUMBER\",\"unit\":\"{none}\"}')),
    DeviceVariableStruct.fromSerializableMap(jsonDecode(
        '{\"info\":\"{\\\"display\\\":\\\"Custom Profile\\\",\\\"description\\\":\\\"The user\'s custom data with more options.\\\",\\\"code\\\":\\\"CUSTOM_PROFILE\\\"}\",\"is_list\":\"false\",\"is_ranged\":\"false\",\"range\":\"{\\\"upper_bound\\\":\\\"0.0\\\",\\\"lower_bound\\\":\\\"0.0\\\"}\",\"type\":\"CUSTOM\",\"unit\":\"{none}\"}'))
  ];
  List<DeviceVariableStruct> get DeviceVariablePresetIntegrations =>
      _DeviceVariablePresetIntegrations;
  set DeviceVariablePresetIntegrations(List<DeviceVariableStruct> value) {
    _DeviceVariablePresetIntegrations = value;
  }

  void addToDeviceVariablePresetIntegrations(DeviceVariableStruct value) {
    DeviceVariablePresetIntegrations.add(value);
  }

  void removeFromDeviceVariablePresetIntegrations(DeviceVariableStruct value) {
    DeviceVariablePresetIntegrations.remove(value);
  }

  void removeAtIndexFromDeviceVariablePresetIntegrations(int index) {
    DeviceVariablePresetIntegrations.removeAt(index);
  }

  void updateDeviceVariablePresetIntegrationsAtIndex(
    int index,
    DeviceVariableStruct Function(DeviceVariableStruct) updateFn,
  ) {
    DeviceVariablePresetIntegrations[index] =
        updateFn(_DeviceVariablePresetIntegrations[index]);
  }

  void insertAtIndexInDeviceVariablePresetIntegrations(
      int index, DeviceVariableStruct value) {
    DeviceVariablePresetIntegrations.insert(index, value);
  }

  List<DropdownStruct> _BlockSize = [
    DropdownStruct.fromSerializableMap(jsonDecode(
        '{\"display\":\"Quarter Block\",\"description\":\"Quarter-Sized Block Component\",\"code\":\"QUARTER\"}')),
    DropdownStruct.fromSerializableMap(jsonDecode(
        '{\"display\":\"Half Block\",\"description\":\"Half-Sized Block Component\",\"code\":\"HALF\"}')),
    DropdownStruct.fromSerializableMap(jsonDecode(
        '{\"display\":\"FULL BLOCK\",\"description\":\"Full-Sized Block Component\",\"code\":\"FULL\"}'))
  ];
  List<DropdownStruct> get BlockSize => _BlockSize;
  set BlockSize(List<DropdownStruct> value) {
    _BlockSize = value;
  }

  void addToBlockSize(DropdownStruct value) {
    BlockSize.add(value);
  }

  void removeFromBlockSize(DropdownStruct value) {
    BlockSize.remove(value);
  }

  void removeAtIndexFromBlockSize(int index) {
    BlockSize.removeAt(index);
  }

  void updateBlockSizeAtIndex(
    int index,
    DropdownStruct Function(DropdownStruct) updateFn,
  ) {
    BlockSize[index] = updateFn(_BlockSize[index]);
  }

  void insertAtIndexInBlockSize(int index, DropdownStruct value) {
    BlockSize.insert(index, value);
  }

  List<DropdownStruct> _BlockColors = [
    DropdownStruct.fromSerializableMap(jsonDecode(
        '{\"display\":\"Crayola\",\"description\":\"Bright Pink #EF476F\",\"code\":\"EF476F\"}')),
    DropdownStruct.fromSerializableMap(jsonDecode(
        '{\"display\":\"Amber\",\"description\":\"Sunset Orange #FFC43D\",\"code\":\"FFC43D\"}')),
    DropdownStruct.fromSerializableMap(jsonDecode(
        '{\"display\":\"Emerald\",\"description\":\"Medibound Green #00D6A1\",\"code\":\"00D6A1\"}')),
    DropdownStruct.fromSerializableMap(jsonDecode(
        '{\"display\":\"Munsell\",\"description\":\"Blue #1B9AAA\",\"code\":\"1B9AAA\"}')),
    DropdownStruct.fromSerializableMap(jsonDecode(
        '{\"display\":\"Murrey\",\"description\":\"Purple #87255B\",\"code\":\"87255B\"}'))
  ];
  List<DropdownStruct> get BlockColors => _BlockColors;
  set BlockColors(List<DropdownStruct> value) {
    _BlockColors = value;
  }

  void addToBlockColors(DropdownStruct value) {
    BlockColors.add(value);
  }

  void removeFromBlockColors(DropdownStruct value) {
    BlockColors.remove(value);
  }

  void removeAtIndexFromBlockColors(int index) {
    BlockColors.removeAt(index);
  }

  void updateBlockColorsAtIndex(
    int index,
    DropdownStruct Function(DropdownStruct) updateFn,
  ) {
    BlockColors[index] = updateFn(_BlockColors[index]);
  }

  void insertAtIndexInBlockColors(int index, DropdownStruct value) {
    BlockColors.insert(index, value);
  }

  List<SubblockComponentStruct> _Subblocks = [
    SubblockComponentStruct.fromSerializableMap(jsonDecode(
        '{\"info\":\"{\\\"display\\\":\\\"Column Graph\\\",\\\"description\\\":\\\"\\\",\\\"code\\\":\\\"GRAPH_COLUMN\\\"}\",\"sizes\":\"[\\\"HALF\\\"]\",\"types\":\"[\\\"NUMBER_ARRAY\\\"]\"}')),
    SubblockComponentStruct.fromSerializableMap(jsonDecode(
        '{\"info\":\"{\\\"display\\\":\\\"Line Graph\\\",\\\"description\\\":\\\"\\\",\\\"code\\\":\\\"GRAPH_LINE\\\"}\",\"sizes\":\"[\\\"HALF\\\"]\",\"types\":\"[\\\"NUMBER_ARRAY\\\"]\"}')),
    SubblockComponentStruct.fromSerializableMap(jsonDecode(
        '{\"info\":\"{\\\"display\\\":\\\"Radial Graph\\\",\\\"description\\\":\\\"\\\",\\\"code\\\":\\\"GRAPH_RADIAL\\\"}\",\"sizes\":\"[\\\"QUARTER\\\"]\",\"types\":\"[\\\"NUMBER\\\",\\\"NUMBER_ARRAY\\\"]\"}')),
    SubblockComponentStruct.fromSerializableMap(jsonDecode(
        '{\"info\":\"{\\\"display\\\":\\\"Numerical Value\\\",\\\"description\\\":\\\"\\\",\\\"code\\\":\\\"VALUE_NUM\\\"}\",\"sizes\":\"[\\\"QUARTER\\\",\\\"HALF\\\"]\",\"types\":\"[\\\"NUMBER\\\",\\\"NUMBER_ARRAY\\\"]\"}')),
    SubblockComponentStruct.fromSerializableMap(jsonDecode(
        '{\"info\":\"{\\\"display\\\":\\\"String Value\\\",\\\"description\\\":\\\"\\\",\\\"code\\\":\\\"VALUE_STRING\\\"}\",\"sizes\":\"[\\\"QUARTER\\\",\\\"HALF\\\"]\",\"types\":\"[\\\"STRING\\\",\\\"STRING_ARRAY\\\"]\"}')),
    SubblockComponentStruct.fromSerializableMap(jsonDecode(
        '{\"info\":\"{\\\"display\\\":\\\"Trend Value\\\",\\\"description\\\":\\\"\\\",\\\"code\\\":\\\"VALUE_TREND\\\"}\",\"sizes\":\"[\\\"QUARTER\\\",\\\"HALF\\\"]\",\"types\":\"[\\\"NUMBER_ARRAY\\\"]\"}'))
  ];
  List<SubblockComponentStruct> get Subblocks => _Subblocks;
  set Subblocks(List<SubblockComponentStruct> value) {
    _Subblocks = value;
  }

  void addToSubblocks(SubblockComponentStruct value) {
    Subblocks.add(value);
  }

  void removeFromSubblocks(SubblockComponentStruct value) {
    Subblocks.remove(value);
  }

  void removeAtIndexFromSubblocks(int index) {
    Subblocks.removeAt(index);
  }

  void updateSubblocksAtIndex(
    int index,
    SubblockComponentStruct Function(SubblockComponentStruct) updateFn,
  ) {
    Subblocks[index] = updateFn(_Subblocks[index]);
  }

  void insertAtIndexInSubblocks(int index, SubblockComponentStruct value) {
    Subblocks.insert(index, value);
  }

  List<DropdownStruct> _DeviceStatus = [
    DropdownStruct.fromSerializableMap(jsonDecode(
        '{\"display\":\"Active\",\"description\":\"The device is fully functional and actively transmitting data.\",\"code\":\"ACTIVE\",\"color\":\"#01775a\"}')),
    DropdownStruct.fromSerializableMap(jsonDecode(
        '{\"display\":\"Inactive\",\"description\":\"The device is not currently in use but is available for activation.\",\"code\":\"INACTIVE\",\"color\":\"#d9fff67f\"}')),
    DropdownStruct.fromSerializableMap(jsonDecode(
        '{\"display\":\"Running\",\"description\":\"The device is actively operating and transmitting data in real time.\",\"code\":\"RUNNING\",\"color\":\"#f9cf58\"}')),
    DropdownStruct.fromSerializableMap(jsonDecode(
        '{\"display\":\"Error\",\"description\":\"The device has encountered an issue that requires attention.\",\"code\":\"ERROR\",\"color\":\"#ff5963\"}'))
  ];
  List<DropdownStruct> get DeviceStatus => _DeviceStatus;
  set DeviceStatus(List<DropdownStruct> value) {
    _DeviceStatus = value;
  }

  void addToDeviceStatus(DropdownStruct value) {
    DeviceStatus.add(value);
  }

  void removeFromDeviceStatus(DropdownStruct value) {
    DeviceStatus.remove(value);
  }

  void removeAtIndexFromDeviceStatus(int index) {
    DeviceStatus.removeAt(index);
  }

  void updateDeviceStatusAtIndex(
    int index,
    DropdownStruct Function(DropdownStruct) updateFn,
  ) {
    DeviceStatus[index] = updateFn(_DeviceStatus[index]);
  }

  void insertAtIndexInDeviceStatus(int index, DropdownStruct value) {
    DeviceStatus.insert(index, value);
  }
}
