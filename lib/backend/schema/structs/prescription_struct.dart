// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PrescriptionStruct extends FFFirebaseStruct {
  PrescriptionStruct({
    String? imageurl,
    String? pdfurl,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _imageurl = imageurl,
        _pdfurl = pdfurl,
        super(firestoreUtilData);

  // "imageurl" field.
  String? _imageurl;
  String get imageurl => _imageurl ?? '';
  set imageurl(String? val) => _imageurl = val;

  bool hasImageurl() => _imageurl != null;

  // "pdfurl" field.
  String? _pdfurl;
  String get pdfurl => _pdfurl ?? '';
  set pdfurl(String? val) => _pdfurl = val;

  bool hasPdfurl() => _pdfurl != null;

  static PrescriptionStruct fromMap(Map<String, dynamic> data) =>
      PrescriptionStruct(
        imageurl: data['imageurl'] as String?,
        pdfurl: data['pdfurl'] as String?,
      );

  static PrescriptionStruct? maybeFromMap(dynamic data) => data is Map
      ? PrescriptionStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'imageurl': _imageurl,
        'pdfurl': _pdfurl,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'imageurl': serializeParam(
          _imageurl,
          ParamType.String,
        ),
        'pdfurl': serializeParam(
          _pdfurl,
          ParamType.String,
        ),
      }.withoutNulls;

  static PrescriptionStruct fromSerializableMap(Map<String, dynamic> data) =>
      PrescriptionStruct(
        imageurl: deserializeParam(
          data['imageurl'],
          ParamType.String,
          false,
        ),
        pdfurl: deserializeParam(
          data['pdfurl'],
          ParamType.String,
          false,
        ),
      );

  static PrescriptionStruct fromAlgoliaData(Map<String, dynamic> data) =>
      PrescriptionStruct(
        imageurl: convertAlgoliaParam(
          data['imageurl'],
          ParamType.String,
          false,
        ),
        pdfurl: convertAlgoliaParam(
          data['pdfurl'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'PrescriptionStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PrescriptionStruct &&
        imageurl == other.imageurl &&
        pdfurl == other.pdfurl;
  }

  @override
  int get hashCode => const ListEquality().hash([imageurl, pdfurl]);
}

PrescriptionStruct createPrescriptionStruct({
  String? imageurl,
  String? pdfurl,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PrescriptionStruct(
      imageurl: imageurl,
      pdfurl: pdfurl,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PrescriptionStruct? updatePrescriptionStruct(
  PrescriptionStruct? prescription, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    prescription
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPrescriptionStructData(
  Map<String, dynamic> firestoreData,
  PrescriptionStruct? prescription,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (prescription == null) {
    return;
  }
  if (prescription.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && prescription.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final prescriptionData =
      getPrescriptionFirestoreData(prescription, forFieldValue);
  final nestedData =
      prescriptionData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = prescription.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPrescriptionFirestoreData(
  PrescriptionStruct? prescription, [
  bool forFieldValue = false,
]) {
  if (prescription == null) {
    return {};
  }
  final firestoreData = mapToFirestore(prescription.toMap());

  // Add any Firestore field values
  prescription.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPrescriptionListFirestoreData(
  List<PrescriptionStruct>? prescriptions,
) =>
    prescriptions?.map((e) => getPrescriptionFirestoreData(e, true)).toList() ??
    [];
