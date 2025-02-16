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

  List<CodedValueStruct> _Genders = [
    CodedValueStruct.fromSerializableMap(jsonDecode(
        '{\"display\":\"Male\",\"description\":\"he/him\",\"code\":\"male\"}')),
    CodedValueStruct.fromSerializableMap(jsonDecode(
        '{\"display\":\"Female\",\"description\":\"she/her\",\"code\":\"female\"}')),
    CodedValueStruct.fromSerializableMap(
        jsonDecode('{\"display\":\"Other\",\"code\":\"other\"}'))
  ];
  List<CodedValueStruct> get Genders => _Genders;
  set Genders(List<CodedValueStruct> value) {
    _Genders = value;
  }

  void addToGenders(CodedValueStruct value) {
    Genders.add(value);
  }

  void removeFromGenders(CodedValueStruct value) {
    Genders.remove(value);
  }

  void removeAtIndexFromGenders(int index) {
    Genders.removeAt(index);
  }

  void updateGendersAtIndex(
    int index,
    CodedValueStruct Function(CodedValueStruct) updateFn,
  ) {
    Genders[index] = updateFn(_Genders[index]);
  }

  void insertAtIndexInGenders(int index, CodedValueStruct value) {
    Genders.insert(index, value);
  }

  List<CodedValueStruct> _OrganizationTypes = [
    CodedValueStruct.fromSerializableMap(jsonDecode(
        '{\"display\":\"Manufacturer\",\"description\":\"production and assembly of physical goods or devices\",\"code\":\"OT01\"}')),
    CodedValueStruct.fromSerializableMap(jsonDecode(
        '{\"display\":\"Software Developer\",\"description\":\"creating and maintaining software applications and systems\",\"code\":\"OT02\"}')),
    CodedValueStruct.fromSerializableMap(jsonDecode(
        '{\"display\":\"Health and Wellness\",\"description\":\"physical and mental well-being, often through products, services, or programs\",\"code\":\"OT03\"}')),
    CodedValueStruct.fromSerializableMap(jsonDecode(
        '{\"display\":\"Fitness and Sports\",\"description\":\"athletic performance, exercise equipment, sports training, or related services\",\"code\":\"OT04\"}')),
    CodedValueStruct.fromSerializableMap(jsonDecode(
        '{\"display\":\"Research and Development\",\"description\":\"innovation, experimentation, and the development of new technologies or products\",\"code\":\"OT05\"}')),
    CodedValueStruct.fromSerializableMap(jsonDecode(
        '{\"display\":\"Security and Privacy\",\"description\":\"protection of data, devices, or physical environments through advanced security measures\",\"code\":\"OT06\"}')),
    CodedValueStruct.fromSerializableMap(jsonDecode(
        '{\"display\":\"Fashion and Design\",\"description\":\"apparel, accessories, and aesthetic-focused design solutions\",\"code\":\"OT07\"}')),
    CodedValueStruct.fromSerializableMap(jsonDecode(
        '{\"display\":\"Retail and Distribution\",\"description\":\"sale, delivery, and logistics of products to end-users or other businesses\",\"code\":\"OT08\"}')),
    CodedValueStruct.fromSerializableMap(jsonDecode(
        '{\"display\":\"Education\",\"description\":\"learning, teaching, and knowledge dissemination through programs, tools, or platforms\",\"code\":\"OT09\"}'))
  ];
  List<CodedValueStruct> get OrganizationTypes => _OrganizationTypes;
  set OrganizationTypes(List<CodedValueStruct> value) {
    _OrganizationTypes = value;
  }

  void addToOrganizationTypes(CodedValueStruct value) {
    OrganizationTypes.add(value);
  }

  void removeFromOrganizationTypes(CodedValueStruct value) {
    OrganizationTypes.remove(value);
  }

  void removeAtIndexFromOrganizationTypes(int index) {
    OrganizationTypes.removeAt(index);
  }

  void updateOrganizationTypesAtIndex(
    int index,
    CodedValueStruct Function(CodedValueStruct) updateFn,
  ) {
    OrganizationTypes[index] = updateFn(_OrganizationTypes[index]);
  }

  void insertAtIndexInOrganizationTypes(int index, CodedValueStruct value) {
    OrganizationTypes.insert(index, value);
  }

  List<CodedValueStruct> _DeviceTypes = [
    CodedValueStruct.fromSerializableMap(jsonDecode(
        '{\"display\":\"Health Rings\",\"description\":\"Wearables\",\"code\":\"DT01\"}')),
    CodedValueStruct.fromSerializableMap(jsonDecode(
        '{\"display\":\"Smart Watches\",\"description\":\"Wearables\",\"code\":\"DT02\"}')),
    CodedValueStruct.fromSerializableMap(jsonDecode(
        '{\"display\":\"Fitness Bands\",\"description\":\"Wearables\",\"code\":\"DT03\"}')),
    CodedValueStruct.fromSerializableMap(jsonDecode(
        '{\"display\":\"Smart Glasses\",\"description\":\"Wearables\",\"code\":\"DT04\"}')),
    CodedValueStruct.fromSerializableMap(jsonDecode(
        '{\"display\":\"Activity Trackers\",\"description\":\"Wearables\",\"code\":\"DT05\"}')),
    CodedValueStruct.fromSerializableMap(jsonDecode(
        '{\"display\":\"Sleep Monitors\",\"description\":\"Wearables\",\"code\":\"DT06\"}')),
    CodedValueStruct.fromSerializableMap(jsonDecode(
        '{\"display\":\"Heart Rate Monitors\",\"description\":\"Wearables\",\"code\":\"DT07\"}')),
    CodedValueStruct.fromSerializableMap(jsonDecode(
        '{\"display\":\"Smart Clothing\",\"description\":\"Wearables\",\"code\":\"DT08\"}')),
    CodedValueStruct.fromSerializableMap(jsonDecode(
        '{\"display\":\"GPS Trackers\",\"description\":\"Wearables\",\"code\":\"DT09\"}')),
    CodedValueStruct.fromSerializableMap(jsonDecode(
        '{\"display\":\"UV Sensors\",\"description\":\"Wearables\",\"code\":\"DT10\"}')),
    CodedValueStruct.fromSerializableMap(jsonDecode(
        '{\"display\":\"Other\",\"description\":\"Other\",\"code\":\"OTHER\"}'))
  ];
  List<CodedValueStruct> get DeviceTypes => _DeviceTypes;
  set DeviceTypes(List<CodedValueStruct> value) {
    _DeviceTypes = value;
  }

  void addToDeviceTypes(CodedValueStruct value) {
    DeviceTypes.add(value);
  }

  void removeFromDeviceTypes(CodedValueStruct value) {
    DeviceTypes.remove(value);
  }

  void removeAtIndexFromDeviceTypes(int index) {
    DeviceTypes.removeAt(index);
  }

  void updateDeviceTypesAtIndex(
    int index,
    CodedValueStruct Function(CodedValueStruct) updateFn,
  ) {
    DeviceTypes[index] = updateFn(_DeviceTypes[index]);
  }

  void insertAtIndexInDeviceTypes(int index, CodedValueStruct value) {
    DeviceTypes.insert(index, value);
  }

  List<CodedValueStruct> _UserRoles = [
    CodedValueStruct.fromSerializableMap(jsonDecode(
        '{\"display\":\"Owner\",\"description\":\"\",\"code\":\"OWNER\"}')),
    CodedValueStruct.fromSerializableMap(jsonDecode(
        '{\"display\":\"Admin\",\"description\":\"\",\"code\":\"ADMIN\"}')),
    CodedValueStruct.fromSerializableMap(jsonDecode(
        '{\"display\":\"Member\",\"description\":\"\",\"code\":\"MEMBER\"}'))
  ];
  List<CodedValueStruct> get UserRoles => _UserRoles;
  set UserRoles(List<CodedValueStruct> value) {
    _UserRoles = value;
  }

  void addToUserRoles(CodedValueStruct value) {
    UserRoles.add(value);
  }

  void removeFromUserRoles(CodedValueStruct value) {
    UserRoles.remove(value);
  }

  void removeAtIndexFromUserRoles(int index) {
    UserRoles.removeAt(index);
  }

  void updateUserRolesAtIndex(
    int index,
    CodedValueStruct Function(CodedValueStruct) updateFn,
  ) {
    UserRoles[index] = updateFn(_UserRoles[index]);
  }

  void insertAtIndexInUserRoles(int index, CodedValueStruct value) {
    UserRoles.insert(index, value);
  }

  List<CodedValueStruct> _DeviceTransferTypes = [
    CodedValueStruct.fromSerializableMap(jsonDecode(
        '{\"display\":\"Live Bluetooth Low Energy\",\"description\":\"Real-time, continuous data streaming for dynamic health monitoring.\",\"code\":\"LBLE\"}')),
    CodedValueStruct.fromSerializableMap(jsonDecode(
        '{\"display\":\"Static Bluetooth Low Energy\",\"description\":\"One-time data transfer for intermittent diagnostics and results.\",\"code\":\"SBLE\"}')),
    CodedValueStruct.fromSerializableMap(jsonDecode(
        '{\"display\":\"Static NFC\",\"description\":\"Quick, contactless data exchange for static health information.\",\"code\":\"SNFC\"}'))
  ];
  List<CodedValueStruct> get DeviceTransferTypes => _DeviceTransferTypes;
  set DeviceTransferTypes(List<CodedValueStruct> value) {
    _DeviceTransferTypes = value;
  }

  void addToDeviceTransferTypes(CodedValueStruct value) {
    DeviceTransferTypes.add(value);
  }

  void removeFromDeviceTransferTypes(CodedValueStruct value) {
    DeviceTransferTypes.remove(value);
  }

  void removeAtIndexFromDeviceTransferTypes(int index) {
    DeviceTransferTypes.removeAt(index);
  }

  void updateDeviceTransferTypesAtIndex(
    int index,
    CodedValueStruct Function(CodedValueStruct) updateFn,
  ) {
    DeviceTransferTypes[index] = updateFn(_DeviceTransferTypes[index]);
  }

  void insertAtIndexInDeviceTransferTypes(int index, CodedValueStruct value) {
    DeviceTransferTypes.insert(index, value);
  }

  List<CodedValueStruct> _DeviceProfileModes = [
    CodedValueStruct.fromSerializableMap(jsonDecode(
        '{\"display\":\"Production\",\"description\":\"Live environment for real-world use and operations.\",\"code\":\"PROD\"}')),
    CodedValueStruct.fromSerializableMap(jsonDecode(
        '{\"display\":\"Development\",\"description\":\"Testing environment for development and debugging.\",\"code\":\"DEVM\"}'))
  ];
  List<CodedValueStruct> get DeviceProfileModes => _DeviceProfileModes;
  set DeviceProfileModes(List<CodedValueStruct> value) {
    _DeviceProfileModes = value;
  }

  void addToDeviceProfileModes(CodedValueStruct value) {
    DeviceProfileModes.add(value);
  }

  void removeFromDeviceProfileModes(CodedValueStruct value) {
    DeviceProfileModes.remove(value);
  }

  void removeAtIndexFromDeviceProfileModes(int index) {
    DeviceProfileModes.removeAt(index);
  }

  void updateDeviceProfileModesAtIndex(
    int index,
    CodedValueStruct Function(CodedValueStruct) updateFn,
  ) {
    DeviceProfileModes[index] = updateFn(_DeviceProfileModes[index]);
  }

  void insertAtIndexInDeviceProfileModes(int index, CodedValueStruct value) {
    DeviceProfileModes.insert(index, value);
  }

  List<CodedValueStruct> _DeviceVariableTypes = [
    CodedValueStruct.fromSerializableMap(jsonDecode(
        '{\"display\":\"String\",\"description\":\"A series of characters\",\"code\":\"STRING\"}')),
    CodedValueStruct.fromSerializableMap(jsonDecode(
        '{\"display\":\"Number\",\"description\":\"A series of decimal numbers\",\"code\":\"NUMBER\"}'))
  ];
  List<CodedValueStruct> get DeviceVariableTypes => _DeviceVariableTypes;
  set DeviceVariableTypes(List<CodedValueStruct> value) {
    _DeviceVariableTypes = value;
  }

  void addToDeviceVariableTypes(CodedValueStruct value) {
    DeviceVariableTypes.add(value);
  }

  void removeFromDeviceVariableTypes(CodedValueStruct value) {
    DeviceVariableTypes.remove(value);
  }

  void removeAtIndexFromDeviceVariableTypes(int index) {
    DeviceVariableTypes.removeAt(index);
  }

  void updateDeviceVariableTypesAtIndex(
    int index,
    CodedValueStruct Function(CodedValueStruct) updateFn,
  ) {
    DeviceVariableTypes[index] = updateFn(_DeviceVariableTypes[index]);
  }

  void insertAtIndexInDeviceVariableTypes(int index, CodedValueStruct value) {
    DeviceVariableTypes.insert(index, value);
  }

  List<CodedValueStruct> _EmptyDropdown = [];
  List<CodedValueStruct> get EmptyDropdown => _EmptyDropdown;
  set EmptyDropdown(List<CodedValueStruct> value) {
    _EmptyDropdown = value;
  }

  void addToEmptyDropdown(CodedValueStruct value) {
    EmptyDropdown.add(value);
  }

  void removeFromEmptyDropdown(CodedValueStruct value) {
    EmptyDropdown.remove(value);
  }

  void removeAtIndexFromEmptyDropdown(int index) {
    EmptyDropdown.removeAt(index);
  }

  void updateEmptyDropdownAtIndex(
    int index,
    CodedValueStruct Function(CodedValueStruct) updateFn,
  ) {
    EmptyDropdown[index] = updateFn(_EmptyDropdown[index]);
  }

  void insertAtIndexInEmptyDropdown(int index, CodedValueStruct value) {
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

  List<CodedValueStruct> _BlockSize = [
    CodedValueStruct.fromSerializableMap(jsonDecode(
        '{\"display\":\"Quarter Block\",\"description\":\"Quarter-Sized Block Component\",\"code\":\"QUARTER\"}')),
    CodedValueStruct.fromSerializableMap(jsonDecode(
        '{\"display\":\"Half Block\",\"description\":\"Half-Sized Block Component\",\"code\":\"HALF\"}')),
    CodedValueStruct.fromSerializableMap(jsonDecode(
        '{\"display\":\"FULL BLOCK\",\"description\":\"Full-Sized Block Component\",\"code\":\"FULL\"}'))
  ];
  List<CodedValueStruct> get BlockSize => _BlockSize;
  set BlockSize(List<CodedValueStruct> value) {
    _BlockSize = value;
  }

  void addToBlockSize(CodedValueStruct value) {
    BlockSize.add(value);
  }

  void removeFromBlockSize(CodedValueStruct value) {
    BlockSize.remove(value);
  }

  void removeAtIndexFromBlockSize(int index) {
    BlockSize.removeAt(index);
  }

  void updateBlockSizeAtIndex(
    int index,
    CodedValueStruct Function(CodedValueStruct) updateFn,
  ) {
    BlockSize[index] = updateFn(_BlockSize[index]);
  }

  void insertAtIndexInBlockSize(int index, CodedValueStruct value) {
    BlockSize.insert(index, value);
  }

  List<CodedValueStruct> _BlockColors = [
    CodedValueStruct.fromSerializableMap(jsonDecode(
        '{\"display\":\"Crayola\",\"description\":\"Bright Pink\",\"code\":\"EF476F\",\"color\":\"#ef476f\"}')),
    CodedValueStruct.fromSerializableMap(jsonDecode(
        '{\"display\":\"Amber\",\"description\":\"Sunset Orange\",\"code\":\"FFC43D\",\"color\":\"#ffc43d\"}')),
    CodedValueStruct.fromSerializableMap(jsonDecode(
        '{\"display\":\"Emerald\",\"description\":\"Medibound Green\",\"code\":\"00D6A1\",\"color\":\"#00d6a1\"}')),
    CodedValueStruct.fromSerializableMap(jsonDecode(
        '{\"display\":\"Munsell\",\"description\":\"Blue\",\"code\":\"1B9AAA\",\"color\":\"#1b9aaa\"}')),
    CodedValueStruct.fromSerializableMap(jsonDecode(
        '{\"display\":\"Murrey\",\"description\":\"Purple\",\"code\":\"87255B\",\"color\":\"#87255b\"}'))
  ];
  List<CodedValueStruct> get BlockColors => _BlockColors;
  set BlockColors(List<CodedValueStruct> value) {
    _BlockColors = value;
  }

  void addToBlockColors(CodedValueStruct value) {
    BlockColors.add(value);
  }

  void removeFromBlockColors(CodedValueStruct value) {
    BlockColors.remove(value);
  }

  void removeAtIndexFromBlockColors(int index) {
    BlockColors.removeAt(index);
  }

  void updateBlockColorsAtIndex(
    int index,
    CodedValueStruct Function(CodedValueStruct) updateFn,
  ) {
    BlockColors[index] = updateFn(_BlockColors[index]);
  }

  void insertAtIndexInBlockColors(int index, CodedValueStruct value) {
    BlockColors.insert(index, value);
  }

  List<CodedValueStruct> _DeviceStatus = [
    CodedValueStruct.fromSerializableMap(jsonDecode(
        '{\"display\":\"Active\",\"description\":\"The device is fully functional and actively transmitting data.\",\"code\":\"ACTIVE\",\"color\":\"#01775a\"}')),
    CodedValueStruct.fromSerializableMap(jsonDecode(
        '{\"display\":\"Inactive\",\"description\":\"The device is not currently in use but is available for activation.\",\"code\":\"INACTIVE\",\"color\":\"#d9fff67f\"}')),
    CodedValueStruct.fromSerializableMap(jsonDecode(
        '{\"display\":\"Running\",\"description\":\"The device is actively operating and transmitting data in real time.\",\"code\":\"RUNNING\",\"color\":\"#f9cf58\"}')),
    CodedValueStruct.fromSerializableMap(jsonDecode(
        '{\"display\":\"Error\",\"description\":\"The device has encountered an issue that requires attention.\",\"code\":\"ERROR\",\"color\":\"#ff5963\"}'))
  ];
  List<CodedValueStruct> get DeviceStatus => _DeviceStatus;
  set DeviceStatus(List<CodedValueStruct> value) {
    _DeviceStatus = value;
  }

  void addToDeviceStatus(CodedValueStruct value) {
    DeviceStatus.add(value);
  }

  void removeFromDeviceStatus(CodedValueStruct value) {
    DeviceStatus.remove(value);
  }

  void removeAtIndexFromDeviceStatus(int index) {
    DeviceStatus.removeAt(index);
  }

  void updateDeviceStatusAtIndex(
    int index,
    CodedValueStruct Function(CodedValueStruct) updateFn,
  ) {
    DeviceStatus[index] = updateFn(_DeviceStatus[index]);
  }

  void insertAtIndexInDeviceStatus(int index, CodedValueStruct value) {
    DeviceStatus.insert(index, value);
  }
}
