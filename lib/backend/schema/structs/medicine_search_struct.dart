// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MedicineSearchStruct extends FFFirebaseStruct {
  MedicineSearchStruct({
    List<String>? facetCounts,
    List<HitsStruct>? hits,
    double? found,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _facetCounts = facetCounts,
        _hits = hits,
        _found = found,
        super(firestoreUtilData);

  // "facet_counts" field.
  List<String>? _facetCounts;
  List<String> get facetCounts => _facetCounts ?? const [];
  set facetCounts(List<String>? val) => _facetCounts = val;

  void updateFacetCounts(Function(List<String>) updateFn) {
    updateFn(_facetCounts ??= []);
  }

  bool hasFacetCounts() => _facetCounts != null;

  // "hits" field.
  List<HitsStruct>? _hits;
  List<HitsStruct> get hits => _hits ?? const [];
  set hits(List<HitsStruct>? val) => _hits = val;

  void updateHits(Function(List<HitsStruct>) updateFn) {
    updateFn(_hits ??= []);
  }

  bool hasHits() => _hits != null;

  // "found" field.
  double? _found;
  double get found => _found ?? 0.0;
  set found(double? val) => _found = val;

  void incrementFound(double amount) => found = found + amount;

  bool hasFound() => _found != null;

  static MedicineSearchStruct fromMap(Map<String, dynamic> data) =>
      MedicineSearchStruct(
        facetCounts: getDataList(data['facet_counts']),
        hits: getStructList(
          data['hits'],
          HitsStruct.fromMap,
        ),
        found: castToType<double>(data['found']),
      );

  static MedicineSearchStruct? maybeFromMap(dynamic data) => data is Map
      ? MedicineSearchStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'facet_counts': _facetCounts,
        'hits': _hits?.map((e) => e.toMap()).toList(),
        'found': _found,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'facet_counts': serializeParam(
          _facetCounts,
          ParamType.String,
          isList: true,
        ),
        'hits': serializeParam(
          _hits,
          ParamType.DataStruct,
          isList: true,
        ),
        'found': serializeParam(
          _found,
          ParamType.double,
        ),
      }.withoutNulls;

  static MedicineSearchStruct fromSerializableMap(Map<String, dynamic> data) =>
      MedicineSearchStruct(
        facetCounts: deserializeParam<String>(
          data['facet_counts'],
          ParamType.String,
          true,
        ),
        hits: deserializeStructParam<HitsStruct>(
          data['hits'],
          ParamType.DataStruct,
          true,
          structBuilder: HitsStruct.fromSerializableMap,
        ),
        found: deserializeParam(
          data['found'],
          ParamType.double,
          false,
        ),
      );

  static MedicineSearchStruct fromAlgoliaData(Map<String, dynamic> data) =>
      MedicineSearchStruct(
        facetCounts: convertAlgoliaParam<String>(
          data['facet_counts'],
          ParamType.String,
          true,
        ),
        hits: convertAlgoliaParam<HitsStruct>(
          data['hits'],
          ParamType.DataStruct,
          true,
          structBuilder: HitsStruct.fromAlgoliaData,
        ),
        found: convertAlgoliaParam(
          data['found'],
          ParamType.double,
          false,
        ),
        firestoreUtilData: const FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'MedicineSearchStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is MedicineSearchStruct &&
        listEquality.equals(facetCounts, other.facetCounts) &&
        listEquality.equals(hits, other.hits) &&
        found == other.found;
  }

  @override
  int get hashCode => const ListEquality().hash([facetCounts, hits, found]);
}

MedicineSearchStruct createMedicineSearchStruct({
  double? found,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    MedicineSearchStruct(
      found: found,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

MedicineSearchStruct? updateMedicineSearchStruct(
  MedicineSearchStruct? medicineSearch, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    medicineSearch
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addMedicineSearchStructData(
  Map<String, dynamic> firestoreData,
  MedicineSearchStruct? medicineSearch,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (medicineSearch == null) {
    return;
  }
  if (medicineSearch.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && medicineSearch.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final medicineSearchData =
      getMedicineSearchFirestoreData(medicineSearch, forFieldValue);
  final nestedData =
      medicineSearchData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = medicineSearch.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getMedicineSearchFirestoreData(
  MedicineSearchStruct? medicineSearch, [
  bool forFieldValue = false,
]) {
  if (medicineSearch == null) {
    return {};
  }
  final firestoreData = mapToFirestore(medicineSearch.toMap());

  // Add any Firestore field values
  medicineSearch.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getMedicineSearchListFirestoreData(
  List<MedicineSearchStruct>? medicineSearchs,
) =>
    medicineSearchs
        ?.map((e) => getMedicineSearchFirestoreData(e, true))
        .toList() ??
    [];
