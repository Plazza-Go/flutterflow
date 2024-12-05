// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GeometryStruct extends FFFirebaseStruct {
  GeometryStruct({
    LocationStruct? location,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _location = location,
        super(firestoreUtilData);

  // "location" field.
  LocationStruct? _location;
  LocationStruct get location => _location ?? LocationStruct();
  set location(LocationStruct? val) => _location = val;

  void updateLocation(Function(LocationStruct) updateFn) {
    updateFn(_location ??= LocationStruct());
  }

  bool hasLocation() => _location != null;

  static GeometryStruct fromMap(Map<String, dynamic> data) => GeometryStruct(
        location: LocationStruct.maybeFromMap(data['location']),
      );

  static GeometryStruct? maybeFromMap(dynamic data) =>
      data is Map ? GeometryStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'location': _location?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'location': serializeParam(
          _location,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static GeometryStruct fromSerializableMap(Map<String, dynamic> data) =>
      GeometryStruct(
        location: deserializeStructParam(
          data['location'],
          ParamType.DataStruct,
          false,
          structBuilder: LocationStruct.fromSerializableMap,
        ),
      );

  static GeometryStruct fromAlgoliaData(Map<String, dynamic> data) =>
      GeometryStruct(
        location: convertAlgoliaParam(
          data['location'],
          ParamType.DataStruct,
          false,
          structBuilder: LocationStruct.fromAlgoliaData,
        ),
        firestoreUtilData: const FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'GeometryStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is GeometryStruct && location == other.location;
  }

  @override
  int get hashCode => const ListEquality().hash([location]);
}

GeometryStruct createGeometryStruct({
  LocationStruct? location,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    GeometryStruct(
      location: location ?? (clearUnsetFields ? LocationStruct() : null),
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

GeometryStruct? updateGeometryStruct(
  GeometryStruct? geometry, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    geometry
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addGeometryStructData(
  Map<String, dynamic> firestoreData,
  GeometryStruct? geometry,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (geometry == null) {
    return;
  }
  if (geometry.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && geometry.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final geometryData = getGeometryFirestoreData(geometry, forFieldValue);
  final nestedData = geometryData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = geometry.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getGeometryFirestoreData(
  GeometryStruct? geometry, [
  bool forFieldValue = false,
]) {
  if (geometry == null) {
    return {};
  }
  final firestoreData = mapToFirestore(geometry.toMap());

  // Handle nested data for "location" field.
  addLocationStructData(
    firestoreData,
    geometry.hasLocation() ? geometry.location : null,
    'location',
    forFieldValue,
  );

  // Add any Firestore field values
  geometry.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getGeometryListFirestoreData(
  List<GeometryStruct>? geometrys,
) =>
    geometrys?.map((e) => getGeometryFirestoreData(e, true)).toList() ?? [];
