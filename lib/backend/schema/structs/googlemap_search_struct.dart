// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GooglemapSearchStruct extends FFFirebaseStruct {
  GooglemapSearchStruct({
    List<PredictionsStruct>? predictions,
    String? status,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _predictions = predictions,
        _status = status,
        super(firestoreUtilData);

  // "predictions" field.
  List<PredictionsStruct>? _predictions;
  List<PredictionsStruct> get predictions => _predictions ?? const [];
  set predictions(List<PredictionsStruct>? val) => _predictions = val;

  void updatePredictions(Function(List<PredictionsStruct>) updateFn) {
    updateFn(_predictions ??= []);
  }

  bool hasPredictions() => _predictions != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  set status(String? val) => _status = val;

  bool hasStatus() => _status != null;

  static GooglemapSearchStruct fromMap(Map<String, dynamic> data) =>
      GooglemapSearchStruct(
        predictions: getStructList(
          data['predictions'],
          PredictionsStruct.fromMap,
        ),
        status: data['status'] as String?,
      );

  static GooglemapSearchStruct? maybeFromMap(dynamic data) => data is Map
      ? GooglemapSearchStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'predictions': _predictions?.map((e) => e.toMap()).toList(),
        'status': _status,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'predictions': serializeParam(
          _predictions,
          ParamType.DataStruct,
          isList: true,
        ),
        'status': serializeParam(
          _status,
          ParamType.String,
        ),
      }.withoutNulls;

  static GooglemapSearchStruct fromSerializableMap(Map<String, dynamic> data) =>
      GooglemapSearchStruct(
        predictions: deserializeStructParam<PredictionsStruct>(
          data['predictions'],
          ParamType.DataStruct,
          true,
          structBuilder: PredictionsStruct.fromSerializableMap,
        ),
        status: deserializeParam(
          data['status'],
          ParamType.String,
          false,
        ),
      );

  static GooglemapSearchStruct fromAlgoliaData(Map<String, dynamic> data) =>
      GooglemapSearchStruct(
        predictions: convertAlgoliaParam<PredictionsStruct>(
          data['predictions'],
          ParamType.DataStruct,
          true,
          structBuilder: PredictionsStruct.fromAlgoliaData,
        ),
        status: convertAlgoliaParam(
          data['status'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: const FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'GooglemapSearchStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is GooglemapSearchStruct &&
        listEquality.equals(predictions, other.predictions) &&
        status == other.status;
  }

  @override
  int get hashCode => const ListEquality().hash([predictions, status]);
}

GooglemapSearchStruct createGooglemapSearchStruct({
  String? status,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    GooglemapSearchStruct(
      status: status,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

GooglemapSearchStruct? updateGooglemapSearchStruct(
  GooglemapSearchStruct? googlemapSearch, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    googlemapSearch
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addGooglemapSearchStructData(
  Map<String, dynamic> firestoreData,
  GooglemapSearchStruct? googlemapSearch,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (googlemapSearch == null) {
    return;
  }
  if (googlemapSearch.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && googlemapSearch.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final googlemapSearchData =
      getGooglemapSearchFirestoreData(googlemapSearch, forFieldValue);
  final nestedData =
      googlemapSearchData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = googlemapSearch.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getGooglemapSearchFirestoreData(
  GooglemapSearchStruct? googlemapSearch, [
  bool forFieldValue = false,
]) {
  if (googlemapSearch == null) {
    return {};
  }
  final firestoreData = mapToFirestore(googlemapSearch.toMap());

  // Add any Firestore field values
  googlemapSearch.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getGooglemapSearchListFirestoreData(
  List<GooglemapSearchStruct>? googlemapSearchs,
) =>
    googlemapSearchs
        ?.map((e) => getGooglemapSearchFirestoreData(e, true))
        .toList() ??
    [];
