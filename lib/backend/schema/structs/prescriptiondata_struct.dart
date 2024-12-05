// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class PrescriptiondataStruct extends FFFirebaseStruct {
  PrescriptiondataStruct({
    String? url,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _url = url,
        super(firestoreUtilData);

  // "url" field.
  String? _url;
  String get url => _url ?? '';
  set url(String? val) => _url = val;

  bool hasUrl() => _url != null;

  static PrescriptiondataStruct fromMap(Map<String, dynamic> data) =>
      PrescriptiondataStruct(
        url: data['url'] as String?,
      );

  static PrescriptiondataStruct? maybeFromMap(dynamic data) => data is Map
      ? PrescriptiondataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'url': _url,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'url': serializeParam(
          _url,
          ParamType.String,
        ),
      }.withoutNulls;

  static PrescriptiondataStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      PrescriptiondataStruct(
        url: deserializeParam(
          data['url'],
          ParamType.String,
          false,
        ),
      );

  static PrescriptiondataStruct fromAlgoliaData(Map<String, dynamic> data) =>
      PrescriptiondataStruct(
        url: convertAlgoliaParam(
          data['url'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: const FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'PrescriptiondataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PrescriptiondataStruct && url == other.url;
  }

  @override
  int get hashCode => const ListEquality().hash([url]);
}

PrescriptiondataStruct createPrescriptiondataStruct({
  String? url,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PrescriptiondataStruct(
      url: url,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PrescriptiondataStruct? updatePrescriptiondataStruct(
  PrescriptiondataStruct? prescriptiondata, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    prescriptiondata
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPrescriptiondataStructData(
  Map<String, dynamic> firestoreData,
  PrescriptiondataStruct? prescriptiondata,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (prescriptiondata == null) {
    return;
  }
  if (prescriptiondata.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && prescriptiondata.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final prescriptiondataData =
      getPrescriptiondataFirestoreData(prescriptiondata, forFieldValue);
  final nestedData =
      prescriptiondataData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = prescriptiondata.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPrescriptiondataFirestoreData(
  PrescriptiondataStruct? prescriptiondata, [
  bool forFieldValue = false,
]) {
  if (prescriptiondata == null) {
    return {};
  }
  final firestoreData = mapToFirestore(prescriptiondata.toMap());

  // Add any Firestore field values
  prescriptiondata.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPrescriptiondataListFirestoreData(
  List<PrescriptiondataStruct>? prescriptiondatas,
) =>
    prescriptiondatas
        ?.map((e) => getPrescriptiondataFirestoreData(e, true))
        .toList() ??
    [];
