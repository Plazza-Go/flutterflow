// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CurrentAddressStruct extends FFFirebaseStruct {
  CurrentAddressStruct({
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

  static CurrentAddressStruct fromMap(Map<String, dynamic> data) =>
      CurrentAddressStruct(
        lat: data['lat'] as String?,
        lng: data['lng'] as String?,
      );

  static CurrentAddressStruct? maybeFromMap(dynamic data) => data is Map
      ? CurrentAddressStruct.fromMap(data.cast<String, dynamic>())
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

  static CurrentAddressStruct fromSerializableMap(Map<String, dynamic> data) =>
      CurrentAddressStruct(
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

  static CurrentAddressStruct fromAlgoliaData(Map<String, dynamic> data) =>
      CurrentAddressStruct(
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
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'CurrentAddressStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CurrentAddressStruct &&
        lat == other.lat &&
        lng == other.lng;
  }

  @override
  int get hashCode => const ListEquality().hash([lat, lng]);
}

CurrentAddressStruct createCurrentAddressStruct({
  String? lat,
  String? lng,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CurrentAddressStruct(
      lat: lat,
      lng: lng,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CurrentAddressStruct? updateCurrentAddressStruct(
  CurrentAddressStruct? currentAddress, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    currentAddress
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCurrentAddressStructData(
  Map<String, dynamic> firestoreData,
  CurrentAddressStruct? currentAddress,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (currentAddress == null) {
    return;
  }
  if (currentAddress.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && currentAddress.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final currentAddressData =
      getCurrentAddressFirestoreData(currentAddress, forFieldValue);
  final nestedData =
      currentAddressData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = currentAddress.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCurrentAddressFirestoreData(
  CurrentAddressStruct? currentAddress, [
  bool forFieldValue = false,
]) {
  if (currentAddress == null) {
    return {};
  }
  final firestoreData = mapToFirestore(currentAddress.toMap());

  // Add any Firestore field values
  currentAddress.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCurrentAddressListFirestoreData(
  List<CurrentAddressStruct>? currentAddresss,
) =>
    currentAddresss
        ?.map((e) => getCurrentAddressFirestoreData(e, true))
        .toList() ??
    [];
