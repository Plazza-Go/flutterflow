// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AddresslistStruct extends FFFirebaseStruct {
  AddresslistStruct({
    List<PredictionsStruct>? predictions,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _predictions = predictions,
        super(firestoreUtilData);

  // "predictions" field.
  List<PredictionsStruct>? _predictions;
  List<PredictionsStruct> get predictions => _predictions ?? const [];
  set predictions(List<PredictionsStruct>? val) => _predictions = val;

  void updatePredictions(Function(List<PredictionsStruct>) updateFn) {
    updateFn(_predictions ??= []);
  }

  bool hasPredictions() => _predictions != null;

  static AddresslistStruct fromMap(Map<String, dynamic> data) =>
      AddresslistStruct(
        predictions: getStructList(
          data['predictions'],
          PredictionsStruct.fromMap,
        ),
      );

  static AddresslistStruct? maybeFromMap(dynamic data) => data is Map
      ? AddresslistStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'predictions': _predictions?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'predictions': serializeParam(
          _predictions,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static AddresslistStruct fromSerializableMap(Map<String, dynamic> data) =>
      AddresslistStruct(
        predictions: deserializeStructParam<PredictionsStruct>(
          data['predictions'],
          ParamType.DataStruct,
          true,
          structBuilder: PredictionsStruct.fromSerializableMap,
        ),
      );

  static AddresslistStruct fromAlgoliaData(Map<String, dynamic> data) =>
      AddresslistStruct(
        predictions: convertAlgoliaParam<PredictionsStruct>(
          data['predictions'],
          ParamType.DataStruct,
          true,
          structBuilder: PredictionsStruct.fromAlgoliaData,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'AddresslistStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is AddresslistStruct &&
        listEquality.equals(predictions, other.predictions);
  }

  @override
  int get hashCode => const ListEquality().hash([predictions]);
}

AddresslistStruct createAddresslistStruct({
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    AddresslistStruct(
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

AddresslistStruct? updateAddresslistStruct(
  AddresslistStruct? addresslist, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    addresslist
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addAddresslistStructData(
  Map<String, dynamic> firestoreData,
  AddresslistStruct? addresslist,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (addresslist == null) {
    return;
  }
  if (addresslist.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && addresslist.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final addresslistData =
      getAddresslistFirestoreData(addresslist, forFieldValue);
  final nestedData =
      addresslistData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = addresslist.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getAddresslistFirestoreData(
  AddresslistStruct? addresslist, [
  bool forFieldValue = false,
]) {
  if (addresslist == null) {
    return {};
  }
  final firestoreData = mapToFirestore(addresslist.toMap());

  // Add any Firestore field values
  addresslist.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getAddresslistListFirestoreData(
  List<AddresslistStruct>? addresslists,
) =>
    addresslists?.map((e) => getAddresslistFirestoreData(e, true)).toList() ??
    [];
