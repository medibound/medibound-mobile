// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class BluetoothDeviceStruct extends FFFirebaseStruct {
  BluetoothDeviceStruct({
    String? name,
    String? id,
    String? deviceId,
    DocumentReference? ref,
    String? status,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _id = id,
        _deviceId = deviceId,
        _ref = ref,
        _status = status,
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

  // "ref" field.
  DocumentReference? _ref;
  DocumentReference? get ref => _ref;
  set ref(DocumentReference? val) => _ref = val;

  bool hasRef() => _ref != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  set status(String? val) => _status = val;

  bool hasStatus() => _status != null;

  static BluetoothDeviceStruct fromMap(Map<String, dynamic> data) =>
      BluetoothDeviceStruct(
        name: data['name'] as String?,
        id: data['id'] as String?,
        deviceId: data['deviceId'] as String?,
        ref: data['ref'] as DocumentReference?,
        status: data['status'] as String?,
      );

  static BluetoothDeviceStruct? maybeFromMap(dynamic data) => data is Map
      ? BluetoothDeviceStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'id': _id,
        'deviceId': _deviceId,
        'ref': _ref,
        'status': _status,
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
        'ref': serializeParam(
          _ref,
          ParamType.DocumentReference,
        ),
        'status': serializeParam(
          _status,
          ParamType.String,
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
        ref: deserializeParam(
          data['ref'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['device_profiles', 'device'],
        ),
        status: deserializeParam(
          data['status'],
          ParamType.String,
          false,
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
        ref == other.ref &&
        status == other.status;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([name, id, deviceId, ref, status]);
}

BluetoothDeviceStruct createBluetoothDeviceStruct({
  String? name,
  String? id,
  String? deviceId,
  DocumentReference? ref,
  String? status,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    BluetoothDeviceStruct(
      name: name,
      id: id,
      deviceId: deviceId,
      ref: ref,
      status: status,
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
