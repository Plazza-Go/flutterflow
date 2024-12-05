// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CurrentUsersAddressStruct extends FFFirebaseStruct {
  CurrentUsersAddressStruct({
    LatLng? lat,
    LatLng? lan,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _lat = lat,
        _lan = lan,
        super(firestoreUtilData);

  // "lat" field.
  LatLng? _lat;
  LatLng? get lat => _lat;
  set lat(LatLng? val) => _lat = val;

  bool hasLat() => _lat != null;

  // "lan" field.
  LatLng? _lan;
  LatLng? get lan => _lan;
  set lan(LatLng? val) => _lan = val;

  bool hasLan() => _lan != null;

  static CurrentUsersAddressStruct fromMap(Map<String, dynamic> data) =>
      CurrentUsersAddressStruct(
        lat: data['lat'] as LatLng?,
        lan: data['lan'] as LatLng?,
      );

  static CurrentUsersAddressStruct? maybeFromMap(dynamic data) => data is Map
      ? CurrentUsersAddressStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'lat': _lat,
        'lan': _lan,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'lat': serializeParam(
          _lat,
          ParamType.LatLng,
        ),
        'lan': serializeParam(
          _lan,
          ParamType.LatLng,
        ),
      }.withoutNulls;

  static CurrentUsersAddressStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      CurrentUsersAddressStruct(
        lat: deserializeParam(
          data['lat'],
          ParamType.LatLng,
          false,
        ),
        lan: deserializeParam(
          data['lan'],
          ParamType.LatLng,
          false,
        ),
      );

  static CurrentUsersAddressStruct fromAlgoliaData(Map<String, dynamic> data) =>
      CurrentUsersAddressStruct(
        lat: convertAlgoliaParam(
          data,
          ParamType.LatLng,
          false,
        ),
        lan: convertAlgoliaParam(
          data,
          ParamType.LatLng,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'CurrentUsersAddressStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CurrentUsersAddressStruct &&
        lat == other.lat &&
        lan == other.lan;
  }

  @override
  int get hashCode => const ListEquality().hash([lat, lan]);
}

CurrentUsersAddressStruct createCurrentUsersAddressStruct({
  LatLng? lat,
  LatLng? lan,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CurrentUsersAddressStruct(
      lat: lat,
      lan: lan,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CurrentUsersAddressStruct? updateCurrentUsersAddressStruct(
  CurrentUsersAddressStruct? currentUsersAddress, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    currentUsersAddress
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCurrentUsersAddressStructData(
  Map<String, dynamic> firestoreData,
  CurrentUsersAddressStruct? currentUsersAddress,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (currentUsersAddress == null) {
    return;
  }
  if (currentUsersAddress.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && currentUsersAddress.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final currentUsersAddressData =
      getCurrentUsersAddressFirestoreData(currentUsersAddress, forFieldValue);
  final nestedData =
      currentUsersAddressData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      currentUsersAddress.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCurrentUsersAddressFirestoreData(
  CurrentUsersAddressStruct? currentUsersAddress, [
  bool forFieldValue = false,
]) {
  if (currentUsersAddress == null) {
    return {};
  }
  final firestoreData = mapToFirestore(currentUsersAddress.toMap());

  // Add any Firestore field values
  currentUsersAddress.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCurrentUsersAddressListFirestoreData(
  List<CurrentUsersAddressStruct>? currentUsersAddresss,
) =>
    currentUsersAddresss
        ?.map((e) => getCurrentUsersAddressFirestoreData(e, true))
        .toList() ??
    [];
