// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class PatientStruct extends FFFirebaseStruct {
  PatientStruct({
    String? name,
    String? userId,
    String? dateOfBirth,
    String? gender,
    String? prescriptionId,
    String? userRelation,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _userId = userId,
        _dateOfBirth = dateOfBirth,
        _gender = gender,
        _prescriptionId = prescriptionId,
        _userRelation = userRelation,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "user_id" field.
  String? _userId;
  String get userId => _userId ?? '';
  set userId(String? val) => _userId = val;

  bool hasUserId() => _userId != null;

  // "date_of_birth" field.
  String? _dateOfBirth;
  String get dateOfBirth => _dateOfBirth ?? '';
  set dateOfBirth(String? val) => _dateOfBirth = val;

  bool hasDateOfBirth() => _dateOfBirth != null;

  // "gender" field.
  String? _gender;
  String get gender => _gender ?? '';
  set gender(String? val) => _gender = val;

  bool hasGender() => _gender != null;

  // "prescription_id" field.
  String? _prescriptionId;
  String get prescriptionId => _prescriptionId ?? '';
  set prescriptionId(String? val) => _prescriptionId = val;

  bool hasPrescriptionId() => _prescriptionId != null;

  // "user_relation" field.
  String? _userRelation;
  String get userRelation => _userRelation ?? '';
  set userRelation(String? val) => _userRelation = val;

  bool hasUserRelation() => _userRelation != null;

  static PatientStruct fromMap(Map<String, dynamic> data) => PatientStruct(
        name: data['name'] as String?,
        userId: data['user_id'] as String?,
        dateOfBirth: data['date_of_birth'] as String?,
        gender: data['gender'] as String?,
        prescriptionId: data['prescription_id'] as String?,
        userRelation: data['user_relation'] as String?,
      );

  static PatientStruct? maybeFromMap(dynamic data) =>
      data is Map ? PatientStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'user_id': _userId,
        'date_of_birth': _dateOfBirth,
        'gender': _gender,
        'prescription_id': _prescriptionId,
        'user_relation': _userRelation,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'user_id': serializeParam(
          _userId,
          ParamType.String,
        ),
        'date_of_birth': serializeParam(
          _dateOfBirth,
          ParamType.String,
        ),
        'gender': serializeParam(
          _gender,
          ParamType.String,
        ),
        'prescription_id': serializeParam(
          _prescriptionId,
          ParamType.String,
        ),
        'user_relation': serializeParam(
          _userRelation,
          ParamType.String,
        ),
      }.withoutNulls;

  static PatientStruct fromSerializableMap(Map<String, dynamic> data) =>
      PatientStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        userId: deserializeParam(
          data['user_id'],
          ParamType.String,
          false,
        ),
        dateOfBirth: deserializeParam(
          data['date_of_birth'],
          ParamType.String,
          false,
        ),
        gender: deserializeParam(
          data['gender'],
          ParamType.String,
          false,
        ),
        prescriptionId: deserializeParam(
          data['prescription_id'],
          ParamType.String,
          false,
        ),
        userRelation: deserializeParam(
          data['user_relation'],
          ParamType.String,
          false,
        ),
      );

  static PatientStruct fromAlgoliaData(Map<String, dynamic> data) =>
      PatientStruct(
        name: convertAlgoliaParam(
          data['name'],
          ParamType.String,
          false,
        ),
        userId: convertAlgoliaParam(
          data['user_id'],
          ParamType.String,
          false,
        ),
        dateOfBirth: convertAlgoliaParam(
          data['date_of_birth'],
          ParamType.String,
          false,
        ),
        gender: convertAlgoliaParam(
          data['gender'],
          ParamType.String,
          false,
        ),
        prescriptionId: convertAlgoliaParam(
          data['prescription_id'],
          ParamType.String,
          false,
        ),
        userRelation: convertAlgoliaParam(
          data['user_relation'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: const FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'PatientStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PatientStruct &&
        name == other.name &&
        userId == other.userId &&
        dateOfBirth == other.dateOfBirth &&
        gender == other.gender &&
        prescriptionId == other.prescriptionId &&
        userRelation == other.userRelation;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([name, userId, dateOfBirth, gender, prescriptionId, userRelation]);
}

PatientStruct createPatientStruct({
  String? name,
  String? userId,
  String? dateOfBirth,
  String? gender,
  String? prescriptionId,
  String? userRelation,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PatientStruct(
      name: name,
      userId: userId,
      dateOfBirth: dateOfBirth,
      gender: gender,
      prescriptionId: prescriptionId,
      userRelation: userRelation,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PatientStruct? updatePatientStruct(
  PatientStruct? patient, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    patient
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPatientStructData(
  Map<String, dynamic> firestoreData,
  PatientStruct? patient,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (patient == null) {
    return;
  }
  if (patient.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && patient.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final patientData = getPatientFirestoreData(patient, forFieldValue);
  final nestedData = patientData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = patient.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPatientFirestoreData(
  PatientStruct? patient, [
  bool forFieldValue = false,
]) {
  if (patient == null) {
    return {};
  }
  final firestoreData = mapToFirestore(patient.toMap());

  // Add any Firestore field values
  patient.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPatientListFirestoreData(
  List<PatientStruct>? patients,
) =>
    patients?.map((e) => getPatientFirestoreData(e, true)).toList() ?? [];
