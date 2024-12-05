// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class CoordinateStruct extends FFFirebaseStruct {
  CoordinateStruct({
    double? latitude,
    double? longitude,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _latitude = latitude,
        _longitude = longitude,
        super(firestoreUtilData);

  // "latitude" field.
  double? _latitude;
  double get latitude => _latitude ?? 0.0;
  set latitude(double? val) => _latitude = val;

  void incrementLatitude(double amount) => latitude = latitude + amount;

  bool hasLatitude() => _latitude != null;

  // "longitude" field.
  double? _longitude;
  double get longitude => _longitude ?? 0.0;
  set longitude(double? val) => _longitude = val;

  void incrementLongitude(double amount) => longitude = longitude + amount;

  bool hasLongitude() => _longitude != null;

  static CoordinateStruct fromMap(Map<String, dynamic> data) =>
      CoordinateStruct(
        latitude: castToType<double>(data['latitude']),
        longitude: castToType<double>(data['longitude']),
      );

  static CoordinateStruct? maybeFromMap(dynamic data) => data is Map
      ? CoordinateStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'latitude': _latitude,
        'longitude': _longitude,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'latitude': serializeParam(
          _latitude,
          ParamType.double,
        ),
        'longitude': serializeParam(
          _longitude,
          ParamType.double,
        ),
      }.withoutNulls;

  static CoordinateStruct fromSerializableMap(Map<String, dynamic> data) =>
      CoordinateStruct(
        latitude: deserializeParam(
          data['latitude'],
          ParamType.double,
          false,
        ),
        longitude: deserializeParam(
          data['longitude'],
          ParamType.double,
          false,
        ),
      );

  static CoordinateStruct fromAlgoliaData(Map<String, dynamic> data) =>
      CoordinateStruct(
        latitude: convertAlgoliaParam(
          data['latitude'],
          ParamType.double,
          false,
        ),
        longitude: convertAlgoliaParam(
          data['longitude'],
          ParamType.double,
          false,
        ),
        firestoreUtilData: const FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'CoordinateStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CoordinateStruct &&
        latitude == other.latitude &&
        longitude == other.longitude;
  }

  @override
  int get hashCode => const ListEquality().hash([latitude, longitude]);
}

CoordinateStruct createCoordinateStruct({
  double? latitude,
  double? longitude,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CoordinateStruct(
      latitude: latitude,
      longitude: longitude,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CoordinateStruct? updateCoordinateStruct(
  CoordinateStruct? coordinate, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    coordinate
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCoordinateStructData(
  Map<String, dynamic> firestoreData,
  CoordinateStruct? coordinate,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (coordinate == null) {
    return;
  }
  if (coordinate.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && coordinate.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final coordinateData = getCoordinateFirestoreData(coordinate, forFieldValue);
  final nestedData = coordinateData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = coordinate.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCoordinateFirestoreData(
  CoordinateStruct? coordinate, [
  bool forFieldValue = false,
]) {
  if (coordinate == null) {
    return {};
  }
  final firestoreData = mapToFirestore(coordinate.toMap());

  // Add any Firestore field values
  coordinate.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCoordinateListFirestoreData(
  List<CoordinateStruct>? coordinates,
) =>
    coordinates?.map((e) => getCoordinateFirestoreData(e, true)).toList() ?? [];
