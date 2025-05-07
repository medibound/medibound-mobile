import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
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
        '{\"display\":\"Live Bluetooth Low Energy\",\"description\":\"Real-time, continuous data streaming for dynamic health monitoring.\",\"code\":\"LBLE\",\"color\":\"#1b9aaa\",\"icon\":\"repeat_rounded\"}')),
    CodedValueStruct.fromSerializableMap(jsonDecode(
        '{\"display\":\"Static Bluetooth Low Energy\",\"description\":\"One-time data transfer for intermittent diagnostics and results.\",\"code\":\"SBLE\",\"color\":\"#ffc43d\",\"icon\":\"repeat_one_rounded\"}'))
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
        '{\"display\":\"Production\",\"description\":\"Live environment for real-world use and operations.\",\"code\":\"PROD\",\"color\":\"#00d6a1\",\"icon\":\"rocket_launch_rounded\"}')),
    CodedValueStruct.fromSerializableMap(jsonDecode(
        '{\"display\":\"Development\",\"description\":\"Testing environment for development and debugging.\",\"code\":\"DEVM\",\"color\":\"#ffc43d\",\"icon\":\"construction_rounded\"}'))
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

  List<CodedValueStruct> _VariableTypes = [];
  List<CodedValueStruct> get VariableTypes => _VariableTypes;
  set VariableTypes(List<CodedValueStruct> value) {
    _VariableTypes = value;
  }

  void addToVariableTypes(CodedValueStruct value) {
    VariableTypes.add(value);
  }

  void removeFromVariableTypes(CodedValueStruct value) {
    VariableTypes.remove(value);
  }

  void removeAtIndexFromVariableTypes(int index) {
    VariableTypes.removeAt(index);
  }

  void updateVariableTypesAtIndex(
    int index,
    CodedValueStruct Function(CodedValueStruct) updateFn,
  ) {
    VariableTypes[index] = updateFn(_VariableTypes[index]);
  }

  void insertAtIndexInVariableTypes(int index, CodedValueStruct value) {
    VariableTypes.insert(index, value);
  }

  List<CodedValueStruct> _VariableForms = [];
  List<CodedValueStruct> get VariableForms => _VariableForms;
  set VariableForms(List<CodedValueStruct> value) {
    _VariableForms = value;
  }

  void addToVariableForms(CodedValueStruct value) {
    VariableForms.add(value);
  }

  void removeFromVariableForms(CodedValueStruct value) {
    VariableForms.remove(value);
  }

  void removeAtIndexFromVariableForms(int index) {
    VariableForms.removeAt(index);
  }

  void updateVariableFormsAtIndex(
    int index,
    CodedValueStruct Function(CodedValueStruct) updateFn,
  ) {
    VariableForms[index] = updateFn(_VariableForms[index]);
  }

  void insertAtIndexInVariableForms(int index, CodedValueStruct value) {
    VariableForms.insert(index, value);
  }

  List<CodedValueStruct> _GraphSizes = [];
  List<CodedValueStruct> get GraphSizes => _GraphSizes;
  set GraphSizes(List<CodedValueStruct> value) {
    _GraphSizes = value;
  }

  void addToGraphSizes(CodedValueStruct value) {
    GraphSizes.add(value);
  }

  void removeFromGraphSizes(CodedValueStruct value) {
    GraphSizes.remove(value);
  }

  void removeAtIndexFromGraphSizes(int index) {
    GraphSizes.removeAt(index);
  }

  void updateGraphSizesAtIndex(
    int index,
    CodedValueStruct Function(CodedValueStruct) updateFn,
  ) {
    GraphSizes[index] = updateFn(_GraphSizes[index]);
  }

  void insertAtIndexInGraphSizes(int index, CodedValueStruct value) {
    GraphSizes.insert(index, value);
  }

  List<BlockTypeStruct> _BlockTypes = [];
  List<BlockTypeStruct> get BlockTypes => _BlockTypes;
  set BlockTypes(List<BlockTypeStruct> value) {
    _BlockTypes = value;
  }

  void addToBlockTypes(BlockTypeStruct value) {
    BlockTypes.add(value);
  }

  void removeFromBlockTypes(BlockTypeStruct value) {
    BlockTypes.remove(value);
  }

  void removeAtIndexFromBlockTypes(int index) {
    BlockTypes.removeAt(index);
  }

  void updateBlockTypesAtIndex(
    int index,
    BlockTypeStruct Function(BlockTypeStruct) updateFn,
  ) {
    BlockTypes[index] = updateFn(_BlockTypes[index]);
  }

  void insertAtIndexInBlockTypes(int index, BlockTypeStruct value) {
    BlockTypes.insert(index, value);
  }

  List<CodedValueStruct> _TickerTypes = [];
  List<CodedValueStruct> get TickerTypes => _TickerTypes;
  set TickerTypes(List<CodedValueStruct> value) {
    _TickerTypes = value;
  }

  void addToTickerTypes(CodedValueStruct value) {
    TickerTypes.add(value);
  }

  void removeFromTickerTypes(CodedValueStruct value) {
    TickerTypes.remove(value);
  }

  void removeAtIndexFromTickerTypes(int index) {
    TickerTypes.removeAt(index);
  }

  void updateTickerTypesAtIndex(
    int index,
    CodedValueStruct Function(CodedValueStruct) updateFn,
  ) {
    TickerTypes[index] = updateFn(_TickerTypes[index]);
  }

  void insertAtIndexInTickerTypes(int index, CodedValueStruct value) {
    TickerTypes.insert(index, value);
  }

  List<CodedValueStruct> _TimeWindows = [];
  List<CodedValueStruct> get TimeWindows => _TimeWindows;
  set TimeWindows(List<CodedValueStruct> value) {
    _TimeWindows = value;
  }

  void addToTimeWindows(CodedValueStruct value) {
    TimeWindows.add(value);
  }

  void removeFromTimeWindows(CodedValueStruct value) {
    TimeWindows.remove(value);
  }

  void removeAtIndexFromTimeWindows(int index) {
    TimeWindows.removeAt(index);
  }

  void updateTimeWindowsAtIndex(
    int index,
    CodedValueStruct Function(CodedValueStruct) updateFn,
  ) {
    TimeWindows[index] = updateFn(_TimeWindows[index]);
  }

  void insertAtIndexInTimeWindows(int index, CodedValueStruct value) {
    TimeWindows.insert(index, value);
  }

  List<CodedValueStruct> _Colors = [];
  List<CodedValueStruct> get Colors => _Colors;
  set Colors(List<CodedValueStruct> value) {
    _Colors = value;
  }

  void addToColors(CodedValueStruct value) {
    Colors.add(value);
  }

  void removeFromColors(CodedValueStruct value) {
    Colors.remove(value);
  }

  void removeAtIndexFromColors(int index) {
    Colors.removeAt(index);
  }

  void updateColorsAtIndex(
    int index,
    CodedValueStruct Function(CodedValueStruct) updateFn,
  ) {
    Colors[index] = updateFn(_Colors[index]);
  }

  void insertAtIndexInColors(int index, CodedValueStruct value) {
    Colors.insert(index, value);
  }

  List<VariableStruct> _VariablePresets = [];
  List<VariableStruct> get VariablePresets => _VariablePresets;
  set VariablePresets(List<VariableStruct> value) {
    _VariablePresets = value;
  }

  void addToVariablePresets(VariableStruct value) {
    VariablePresets.add(value);
  }

  void removeFromVariablePresets(VariableStruct value) {
    VariablePresets.remove(value);
  }

  void removeAtIndexFromVariablePresets(int index) {
    VariablePresets.removeAt(index);
  }

  void updateVariablePresetsAtIndex(
    int index,
    VariableStruct Function(VariableStruct) updateFn,
  ) {
    VariablePresets[index] = updateFn(_VariablePresets[index]);
  }

  void insertAtIndexInVariablePresets(int index, VariableStruct value) {
    VariablePresets.insert(index, value);
  }

  List<CodedValueStruct> _OrganizationTypes = [];
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

  List<CodedValueStruct> _DeviceTypes = [];
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

  List<CodedValueStruct> _PatientStatus = [];
  List<CodedValueStruct> get PatientStatus => _PatientStatus;
  set PatientStatus(List<CodedValueStruct> value) {
    _PatientStatus = value;
  }

  void addToPatientStatus(CodedValueStruct value) {
    PatientStatus.add(value);
  }

  void removeFromPatientStatus(CodedValueStruct value) {
    PatientStatus.remove(value);
  }

  void removeAtIndexFromPatientStatus(int index) {
    PatientStatus.removeAt(index);
  }

  void updatePatientStatusAtIndex(
    int index,
    CodedValueStruct Function(CodedValueStruct) updateFn,
  ) {
    PatientStatus[index] = updateFn(_PatientStatus[index]);
  }

  void insertAtIndexInPatientStatus(int index, CodedValueStruct value) {
    PatientStatus.insert(index, value);
  }

  List<CodedValueStruct> _DeviceStatus = [];
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

  List<CodedValueStruct> _RegistrationStatus = [];
  List<CodedValueStruct> get RegistrationStatus => _RegistrationStatus;
  set RegistrationStatus(List<CodedValueStruct> value) {
    _RegistrationStatus = value;
  }

  void addToRegistrationStatus(CodedValueStruct value) {
    RegistrationStatus.add(value);
  }

  void removeFromRegistrationStatus(CodedValueStruct value) {
    RegistrationStatus.remove(value);
  }

  void removeAtIndexFromRegistrationStatus(int index) {
    RegistrationStatus.removeAt(index);
  }

  void updateRegistrationStatusAtIndex(
    int index,
    CodedValueStruct Function(CodedValueStruct) updateFn,
  ) {
    RegistrationStatus[index] = updateFn(_RegistrationStatus[index]);
  }

  void insertAtIndexInRegistrationStatus(int index, CodedValueStruct value) {
    RegistrationStatus.insert(index, value);
  }

  List<ProfileStruct> _IntegrationProfiles = [];
  List<ProfileStruct> get IntegrationProfiles => _IntegrationProfiles;
  set IntegrationProfiles(List<ProfileStruct> value) {
    _IntegrationProfiles = value;
  }

  void addToIntegrationProfiles(ProfileStruct value) {
    IntegrationProfiles.add(value);
  }

  void removeFromIntegrationProfiles(ProfileStruct value) {
    IntegrationProfiles.remove(value);
  }

  void removeAtIndexFromIntegrationProfiles(int index) {
    IntegrationProfiles.removeAt(index);
  }

  void updateIntegrationProfilesAtIndex(
    int index,
    ProfileStruct Function(ProfileStruct) updateFn,
  ) {
    IntegrationProfiles[index] = updateFn(_IntegrationProfiles[index]);
  }

  void insertAtIndexInIntegrationProfiles(int index, ProfileStruct value) {
    IntegrationProfiles.insert(index, value);
  }

  RouteStruct _currentRoute = RouteStruct.fromSerializableMap(
      jsonDecode('{\"display\":\"\",\"section\":\"\",\"page\":\"\"}'));
  RouteStruct get currentRoute => _currentRoute;
  set currentRoute(RouteStruct value) {
    _currentRoute = value;
  }

  void updateCurrentRouteStruct(Function(RouteStruct) updateFn) {
    updateFn(_currentRoute);
  }

  List<RouteStackStruct> _RouteStacks = [
    RouteStackStruct.fromSerializableMap(jsonDecode(
        '{\"section\":\"{\\\"display\\\":\\\"Dashboard\\\",\\\"description\\\":\\\"\\\",\\\"code\\\":\\\"dashboard\\\",\\\"color\\\":\\\"#0000\\\",\\\"icon\\\":\\\"dashboard_rounded\\\"}\",\"routes\":\"[\\\"{\\\\\\\"display\\\\\\\":\\\\\\\"My Organizations\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"organizations\\\\\\\"}\\\"]\"}')),
    RouteStackStruct.fromSerializableMap(jsonDecode(
        '{\"section\":\"{\\\"display\\\":\\\"Management\\\",\\\"description\\\":\\\"\\\",\\\"code\\\":\\\"management\\\",\\\"color\\\":\\\"#0000\\\",\\\"icon\\\":\\\"business_rounded\\\"}\",\"routes\":\"[\\\"{\\\\\\\"display\\\\\\\":\\\\\\\"Patient Suite\\\\\\\",\\\\\\\"description\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"patients\\\\\\\",\\\\\\\"color\\\\\\\":\\\\\\\"#0000\\\\\\\",\\\\\\\"icon\\\\\\\":\\\\\\\"\\\\\\\"}\\\",\\\"{\\\\\\\"display\\\\\\\":\\\\\\\"Plans & Billing\\\\\\\",\\\\\\\"description\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"billing\\\\\\\",\\\\\\\"color\\\\\\\":\\\\\\\"#0000\\\\\\\",\\\\\\\"icon\\\\\\\":\\\\\\\"\\\\\\\"}\\\"]\"}')),
    RouteStackStruct.fromSerializableMap(jsonDecode(
        '{\"section\":\"{\\\"display\\\":\\\"Developers\\\",\\\"description\\\":\\\"\\\",\\\"code\\\":\\\"developers\\\",\\\"color\\\":\\\"#0000\\\",\\\"icon\\\":\\\"code_rounded\\\"}\",\"routes\":\"[\\\"{\\\\\\\"display\\\\\\\":\\\\\\\"Device Studio\\\\\\\",\\\\\\\"description\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"device-studio\\\\\\\",\\\\\\\"color\\\\\\\":\\\\\\\"#0000\\\\\\\",\\\\\\\"icon\\\\\\\":\\\\\\\"\\\\\\\"}\\\",\\\"{\\\\\\\"display\\\\\\\":\\\\\\\"App Creator\\\\\\\",\\\\\\\"description\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"app-creator\\\\\\\",\\\\\\\"color\\\\\\\":\\\\\\\"#0000\\\\\\\",\\\\\\\"icon\\\\\\\":\\\\\\\"\\\\\\\"}\\\",\\\"{\\\\\\\"display\\\\\\\":\\\\\\\"Agent Builder\\\\\\\",\\\\\\\"description\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"agent-builder\\\\\\\",\\\\\\\"color\\\\\\\":\\\\\\\"#0000\\\\\\\",\\\\\\\"icon\\\\\\\":\\\\\\\"\\\\\\\"}\\\"]\"}'))
  ];
  List<RouteStackStruct> get RouteStacks => _RouteStacks;
  set RouteStacks(List<RouteStackStruct> value) {
    _RouteStacks = value;
  }

  void addToRouteStacks(RouteStackStruct value) {
    RouteStacks.add(value);
  }

  void removeFromRouteStacks(RouteStackStruct value) {
    RouteStacks.remove(value);
  }

  void removeAtIndexFromRouteStacks(int index) {
    RouteStacks.removeAt(index);
  }

  void updateRouteStacksAtIndex(
    int index,
    RouteStackStruct Function(RouteStackStruct) updateFn,
  ) {
    RouteStacks[index] = updateFn(_RouteStacks[index]);
  }

  void insertAtIndexInRouteStacks(int index, RouteStackStruct value) {
    RouteStacks.insert(index, value);
  }

  ProfileStruct _selectedOrganization = ProfileStruct();
  ProfileStruct get selectedOrganization => _selectedOrganization;
  set selectedOrganization(ProfileStruct value) {
    _selectedOrganization = value;
  }

  void updateSelectedOrganizationStruct(Function(ProfileStruct) updateFn) {
    updateFn(_selectedOrganization);
  }

  final _blockSuggestionsManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> blockSuggestions({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _blockSuggestionsManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearBlockSuggestionsCache() => _blockSuggestionsManager.clear();
  void clearBlockSuggestionsCacheKey(String? uniqueKey) =>
      _blockSuggestionsManager.clearRequest(uniqueKey);
}
