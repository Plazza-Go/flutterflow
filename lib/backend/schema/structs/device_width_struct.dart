// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DeviceWidthStruct extends FFFirebaseStruct {
  DeviceWidthStruct({
    int? small,
    int? medium,
    int? large,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _small = small,
        _medium = medium,
        _large = large,
        super(firestoreUtilData);

  // "small" field.
  int? _small;
  int get small => _small ?? 0;
  set small(int? val) => _small = val;

  void incrementSmall(int amount) => small = small + amount;

  bool hasSmall() => _small != null;

  // "medium" field.
  int? _medium;
  int get medium => _medium ?? 0;
  set medium(int? val) => _medium = val;

  void incrementMedium(int amount) => medium = medium + amount;

  bool hasMedium() => _medium != null;

  // "large" field.
  int? _large;
  int get large => _large ?? 0;
  set large(int? val) => _large = val;

  void incrementLarge(int amount) => large = large + amount;

  bool hasLarge() => _large != null;

  static DeviceWidthStruct fromMap(Map<String, dynamic> data) =>
      DeviceWidthStruct(
        small: castToType<int>(data['small']),
        medium: castToType<int>(data['medium']),
        large: castToType<int>(data['large']),
      );

  static DeviceWidthStruct? maybeFromMap(dynamic data) => data is Map
      ? DeviceWidthStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'small': _small,
        'medium': _medium,
        'large': _large,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'small': serializeParam(
          _small,
          ParamType.int,
        ),
        'medium': serializeParam(
          _medium,
          ParamType.int,
        ),
        'large': serializeParam(
          _large,
          ParamType.int,
        ),
      }.withoutNulls;

  static DeviceWidthStruct fromSerializableMap(Map<String, dynamic> data) =>
      DeviceWidthStruct(
        small: deserializeParam(
          data['small'],
          ParamType.int,
          false,
        ),
        medium: deserializeParam(
          data['medium'],
          ParamType.int,
          false,
        ),
        large: deserializeParam(
          data['large'],
          ParamType.int,
          false,
        ),
      );

  static DeviceWidthStruct fromAlgoliaData(Map<String, dynamic> data) =>
      DeviceWidthStruct(
        small: convertAlgoliaParam(
          data['small'],
          ParamType.int,
          false,
        ),
        medium: convertAlgoliaParam(
          data['medium'],
          ParamType.int,
          false,
        ),
        large: convertAlgoliaParam(
          data['large'],
          ParamType.int,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'DeviceWidthStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DeviceWidthStruct &&
        small == other.small &&
        medium == other.medium &&
        large == other.large;
  }

  @override
  int get hashCode => const ListEquality().hash([small, medium, large]);
}

DeviceWidthStruct createDeviceWidthStruct({
  int? small,
  int? medium,
  int? large,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DeviceWidthStruct(
      small: small,
      medium: medium,
      large: large,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

DeviceWidthStruct? updateDeviceWidthStruct(
  DeviceWidthStruct? deviceWidth, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    deviceWidth
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addDeviceWidthStructData(
  Map<String, dynamic> firestoreData,
  DeviceWidthStruct? deviceWidth,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (deviceWidth == null) {
    return;
  }
  if (deviceWidth.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && deviceWidth.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final deviceWidthData =
      getDeviceWidthFirestoreData(deviceWidth, forFieldValue);
  final nestedData =
      deviceWidthData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = deviceWidth.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getDeviceWidthFirestoreData(
  DeviceWidthStruct? deviceWidth, [
  bool forFieldValue = false,
]) {
  if (deviceWidth == null) {
    return {};
  }
  final firestoreData = mapToFirestore(deviceWidth.toMap());

  // Add any Firestore field values
  deviceWidth.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDeviceWidthListFirestoreData(
  List<DeviceWidthStruct>? deviceWidths,
) =>
    deviceWidths?.map((e) => getDeviceWidthFirestoreData(e, true)).toList() ??
    [];
