// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class BluetoothDeviceStruct extends FFFirebaseStruct {
  BluetoothDeviceStruct({
    String? name,
    String? id,
    String? deviceId,
    String? status,
    int? battery,
    DocumentReference? ref,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _id = id,
        _deviceId = deviceId,
        _status = status,
        _battery = battery,
        _ref = ref,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "deviceId" field.
  String? _deviceId;
  String get deviceId => _deviceId ?? '';
  set deviceId(String? val) => _deviceId = val;

  bool hasDeviceId() => _deviceId != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  set status(String? val) => _status = val;

  bool hasStatus() => _status != null;

  // "battery" field.
  int? _battery;
  int get battery => _battery ?? 0;
  set battery(int? val) => _battery = val;

  void incrementBattery(int amount) => battery = battery + amount;

  bool hasBattery() => _battery != null;

  // "ref" field.
  DocumentReference? _ref;
  DocumentReference? get ref => _ref;
  set ref(DocumentReference? val) => _ref = val;

  bool hasRef() => _ref != null;

  static BluetoothDeviceStruct fromMap(Map<String, dynamic> data) =>
      BluetoothDeviceStruct(
        name: data['name'] as String?,
        id: data['id'] as String?,
        deviceId: data['deviceId'] as String?,
        status: data['status'] as String?,
        battery: castToType<int>(data['battery']),
        ref: data['ref'] as DocumentReference?,
      );

  static BluetoothDeviceStruct? maybeFromMap(dynamic data) => data is Map
      ? BluetoothDeviceStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'id': _id,
        'deviceId': _deviceId,
        'status': _status,
        'battery': _battery,
        'ref': _ref,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'deviceId': serializeParam(
          _deviceId,
          ParamType.String,
        ),
        'status': serializeParam(
          _status,
          ParamType.String,
        ),
        'battery': serializeParam(
          _battery,
          ParamType.int,
        ),
        'ref': serializeParam(
          _ref,
          ParamType.DocumentReference,
        ),
      }.withoutNulls;

  static BluetoothDeviceStruct fromSerializableMap(Map<String, dynamic> data) =>
      BluetoothDeviceStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        deviceId: deserializeParam(
          data['deviceId'],
          ParamType.String,
          false,
        ),
        status: deserializeParam(
          data['status'],
          ParamType.String,
          false,
        ),
        battery: deserializeParam(
          data['battery'],
          ParamType.int,
          false,
        ),
        ref: deserializeParam(
          data['ref'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['device_profiles', 'device'],
        ),
      );

  @override
  String toString() => 'BluetoothDeviceStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is BluetoothDeviceStruct &&
        name == other.name &&
        id == other.id &&
        deviceId == other.deviceId &&
        status == other.status &&
        battery == other.battery &&
        ref == other.ref;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([name, id, deviceId, status, battery, ref]);
}

BluetoothDeviceStruct createBluetoothDeviceStruct({
  String? name,
  String? id,
  String? deviceId,
  String? status,
  int? battery,
  DocumentReference? ref,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    BluetoothDeviceStruct(
      name: name,
      id: id,
      deviceId: deviceId,
      status: status,
      battery: battery,
      ref: ref,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

BluetoothDeviceStruct? updateBluetoothDeviceStruct(
  BluetoothDeviceStruct? bluetoothDevice, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    bluetoothDevice
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addBluetoothDeviceStructData(
  Map<String, dynamic> firestoreData,
  BluetoothDeviceStruct? bluetoothDevice,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (bluetoothDevice == null) {
    return;
  }
  if (bluetoothDevice.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && bluetoothDevice.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final bluetoothDeviceData =
      getBluetoothDeviceFirestoreData(bluetoothDevice, forFieldValue);
  final nestedData =
      bluetoothDeviceData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = bluetoothDevice.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getBluetoothDeviceFirestoreData(
  BluetoothDeviceStruct? bluetoothDevice, [
  bool forFieldValue = false,
]) {
  if (bluetoothDevice == null) {
    return {};
  }
  final firestoreData = mapToFirestore(bluetoothDevice.toMap());

  // Add any Firestore field values
  bluetoothDevice.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getBluetoothDeviceListFirestoreData(
  List<BluetoothDeviceStruct>? bluetoothDevices,
) =>
    bluetoothDevices
        ?.map((e) => getBluetoothDeviceFirestoreData(e, true))
        .toList() ??
    [];
