// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class AppAddressStruct extends FFFirebaseStruct {
  AppAddressStruct({
    String? lat,
    String? lng,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _lat = lat,
        _lng = lng,
        super(firestoreUtilData);

  // "lat" field.
  String? _lat;
  String get lat => _lat ?? '';
  set lat(String? val) => _lat = val;

  bool hasLat() => _lat != null;

  // "lng" field.
  String? _lng;
  String get lng => _lng ?? '';
  set lng(String? val) => _lng = val;

  bool hasLng() => _lng != null;

  static AppAddressStruct fromMap(Map<String, dynamic> data) =>
      AppAddressStruct(
        lat: data['lat'] as String?,
        lng: data['lng'] as String?,
      );

  static AppAddressStruct? maybeFromMap(dynamic data) => data is Map
      ? AppAddressStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'lat': _lat,
        'lng': _lng,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'lat': serializeParam(
          _lat,
          ParamType.String,
        ),
        'lng': serializeParam(
          _lng,
          ParamType.String,
        ),
      }.withoutNulls;

  static AppAddressStruct fromSerializableMap(Map<String, dynamic> data) =>
      AppAddressStruct(
        lat: deserializeParam(
          data['lat'],
          ParamType.String,
          false,
        ),
        lng: deserializeParam(
          data['lng'],
          ParamType.String,
          false,
        ),
      );

  static AppAddressStruct fromAlgoliaData(Map<String, dynamic> data) =>
      AppAddressStruct(
        lat: convertAlgoliaParam(
          data['lat'],
          ParamType.String,
          false,
        ),
        lng: convertAlgoliaParam(
          data['lng'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: const FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'AppAddressStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AppAddressStruct && lat == other.lat && lng == other.lng;
  }

  @override
  int get hashCode => const ListEquality().hash([lat, lng]);
}

AppAddressStruct createAppAddressStruct({
  String? lat,
  String? lng,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    AppAddressStruct(
      lat: lat,
      lng: lng,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

AppAddressStruct? updateAppAddressStruct(
  AppAddressStruct? appAddress, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    appAddress
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addAppAddressStructData(
  Map<String, dynamic> firestoreData,
  AppAddressStruct? appAddress,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (appAddress == null) {
    return;
  }
  if (appAddress.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && appAddress.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final appAddressData = getAppAddressFirestoreData(appAddress, forFieldValue);
  final nestedData = appAddressData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = appAddress.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getAppAddressFirestoreData(
  AppAddressStruct? appAddress, [
  bool forFieldValue = false,
]) {
  if (appAddress == null) {
    return {};
  }
  final firestoreData = mapToFirestore(appAddress.toMap());

  // Add any Firestore field values
  appAddress.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getAppAddressListFirestoreData(
  List<AppAddressStruct>? appAddresss,
) =>
    appAddresss?.map((e) => getAppAddressFirestoreData(e, true)).toList() ?? [];
