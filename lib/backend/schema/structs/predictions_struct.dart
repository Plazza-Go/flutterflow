// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PredictionsStruct extends FFFirebaseStruct {
  PredictionsStruct({
    StructuredFormattingStruct? structuredFormatting,
    String? description,
    GeometryStruct? geometry,
    String? placeId,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _structuredFormatting = structuredFormatting,
        _description = description,
        _geometry = geometry,
        _placeId = placeId,
        super(firestoreUtilData);

  // "structured_formatting" field.
  StructuredFormattingStruct? _structuredFormatting;
  StructuredFormattingStruct get structuredFormatting =>
      _structuredFormatting ?? StructuredFormattingStruct();
  set structuredFormatting(StructuredFormattingStruct? val) =>
      _structuredFormatting = val;

  void updateStructuredFormatting(
      Function(StructuredFormattingStruct) updateFn) {
    updateFn(_structuredFormatting ??= StructuredFormattingStruct());
  }

  bool hasStructuredFormatting() => _structuredFormatting != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  // "geometry" field.
  GeometryStruct? _geometry;
  GeometryStruct get geometry => _geometry ?? GeometryStruct();
  set geometry(GeometryStruct? val) => _geometry = val;

  void updateGeometry(Function(GeometryStruct) updateFn) {
    updateFn(_geometry ??= GeometryStruct());
  }

  bool hasGeometry() => _geometry != null;

  // "place_id" field.
  String? _placeId;
  String get placeId => _placeId ?? '';
  set placeId(String? val) => _placeId = val;

  bool hasPlaceId() => _placeId != null;

  static PredictionsStruct fromMap(Map<String, dynamic> data) =>
      PredictionsStruct(
        structuredFormatting: StructuredFormattingStruct.maybeFromMap(
            data['structured_formatting']),
        description: data['description'] as String?,
        geometry: GeometryStruct.maybeFromMap(data['geometry']),
        placeId: data['place_id'] as String?,
      );

  static PredictionsStruct? maybeFromMap(dynamic data) => data is Map
      ? PredictionsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'structured_formatting': _structuredFormatting?.toMap(),
        'description': _description,
        'geometry': _geometry?.toMap(),
        'place_id': _placeId,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'structured_formatting': serializeParam(
          _structuredFormatting,
          ParamType.DataStruct,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'geometry': serializeParam(
          _geometry,
          ParamType.DataStruct,
        ),
        'place_id': serializeParam(
          _placeId,
          ParamType.String,
        ),
      }.withoutNulls;

  static PredictionsStruct fromSerializableMap(Map<String, dynamic> data) =>
      PredictionsStruct(
        structuredFormatting: deserializeStructParam(
          data['structured_formatting'],
          ParamType.DataStruct,
          false,
          structBuilder: StructuredFormattingStruct.fromSerializableMap,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        geometry: deserializeStructParam(
          data['geometry'],
          ParamType.DataStruct,
          false,
          structBuilder: GeometryStruct.fromSerializableMap,
        ),
        placeId: deserializeParam(
          data['place_id'],
          ParamType.String,
          false,
        ),
      );

  static PredictionsStruct fromAlgoliaData(Map<String, dynamic> data) =>
      PredictionsStruct(
        structuredFormatting: convertAlgoliaParam(
          data['structured_formatting'],
          ParamType.DataStruct,
          false,
          structBuilder: StructuredFormattingStruct.fromAlgoliaData,
        ),
        description: convertAlgoliaParam(
          data['description'],
          ParamType.String,
          false,
        ),
        geometry: convertAlgoliaParam(
          data['geometry'],
          ParamType.DataStruct,
          false,
          structBuilder: GeometryStruct.fromAlgoliaData,
        ),
        placeId: convertAlgoliaParam(
          data['place_id'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: const FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'PredictionsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PredictionsStruct &&
        structuredFormatting == other.structuredFormatting &&
        description == other.description &&
        geometry == other.geometry &&
        placeId == other.placeId;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([structuredFormatting, description, geometry, placeId]);
}

PredictionsStruct createPredictionsStruct({
  StructuredFormattingStruct? structuredFormatting,
  String? description,
  GeometryStruct? geometry,
  String? placeId,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PredictionsStruct(
      structuredFormatting: structuredFormatting ??
          (clearUnsetFields ? StructuredFormattingStruct() : null),
      description: description,
      geometry: geometry ?? (clearUnsetFields ? GeometryStruct() : null),
      placeId: placeId,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PredictionsStruct? updatePredictionsStruct(
  PredictionsStruct? predictions, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    predictions
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPredictionsStructData(
  Map<String, dynamic> firestoreData,
  PredictionsStruct? predictions,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (predictions == null) {
    return;
  }
  if (predictions.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && predictions.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final predictionsData =
      getPredictionsFirestoreData(predictions, forFieldValue);
  final nestedData =
      predictionsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = predictions.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPredictionsFirestoreData(
  PredictionsStruct? predictions, [
  bool forFieldValue = false,
]) {
  if (predictions == null) {
    return {};
  }
  final firestoreData = mapToFirestore(predictions.toMap());

  // Handle nested data for "structured_formatting" field.
  addStructuredFormattingStructData(
    firestoreData,
    predictions.hasStructuredFormatting()
        ? predictions.structuredFormatting
        : null,
    'structured_formatting',
    forFieldValue,
  );

  // Handle nested data for "geometry" field.
  addGeometryStructData(
    firestoreData,
    predictions.hasGeometry() ? predictions.geometry : null,
    'geometry',
    forFieldValue,
  );

  // Add any Firestore field values
  predictions.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPredictionsListFirestoreData(
  List<PredictionsStruct>? predictionss,
) =>
    predictionss?.map((e) => getPredictionsFirestoreData(e, true)).toList() ??
    [];
