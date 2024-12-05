// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PersonDetailsStruct extends FFFirebaseStruct {
  PersonDetailsStruct({
    String? name,
    DateTime? dob,
    String? whatsappno,
    String? gender,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _dob = dob,
        _whatsappno = whatsappno,
        _gender = gender,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "dob" field.
  DateTime? _dob;
  DateTime? get dob => _dob;
  set dob(DateTime? val) => _dob = val;

  bool hasDob() => _dob != null;

  // "whatsappno" field.
  String? _whatsappno;
  String get whatsappno => _whatsappno ?? '';
  set whatsappno(String? val) => _whatsappno = val;

  bool hasWhatsappno() => _whatsappno != null;

  // "gender" field.
  String? _gender;
  String get gender => _gender ?? '';
  set gender(String? val) => _gender = val;

  bool hasGender() => _gender != null;

  static PersonDetailsStruct fromMap(Map<String, dynamic> data) =>
      PersonDetailsStruct(
        name: data['name'] as String?,
        dob: data['dob'] as DateTime?,
        whatsappno: data['whatsappno'] as String?,
        gender: data['gender'] as String?,
      );

  static PersonDetailsStruct? maybeFromMap(dynamic data) => data is Map
      ? PersonDetailsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'dob': _dob,
        'whatsappno': _whatsappno,
        'gender': _gender,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'dob': serializeParam(
          _dob,
          ParamType.DateTime,
        ),
        'whatsappno': serializeParam(
          _whatsappno,
          ParamType.String,
        ),
        'gender': serializeParam(
          _gender,
          ParamType.String,
        ),
      }.withoutNulls;

  static PersonDetailsStruct fromSerializableMap(Map<String, dynamic> data) =>
      PersonDetailsStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        dob: deserializeParam(
          data['dob'],
          ParamType.DateTime,
          false,
        ),
        whatsappno: deserializeParam(
          data['whatsappno'],
          ParamType.String,
          false,
        ),
        gender: deserializeParam(
          data['gender'],
          ParamType.String,
          false,
        ),
      );

  static PersonDetailsStruct fromAlgoliaData(Map<String, dynamic> data) =>
      PersonDetailsStruct(
        name: convertAlgoliaParam(
          data['name'],
          ParamType.String,
          false,
        ),
        dob: convertAlgoliaParam(
          data['dob'],
          ParamType.DateTime,
          false,
        ),
        whatsappno: convertAlgoliaParam(
          data['whatsappno'],
          ParamType.String,
          false,
        ),
        gender: convertAlgoliaParam(
          data['gender'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'PersonDetailsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PersonDetailsStruct &&
        name == other.name &&
        dob == other.dob &&
        whatsappno == other.whatsappno &&
        gender == other.gender;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([name, dob, whatsappno, gender]);
}

PersonDetailsStruct createPersonDetailsStruct({
  String? name,
  DateTime? dob,
  String? whatsappno,
  String? gender,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PersonDetailsStruct(
      name: name,
      dob: dob,
      whatsappno: whatsappno,
      gender: gender,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PersonDetailsStruct? updatePersonDetailsStruct(
  PersonDetailsStruct? personDetails, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    personDetails
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPersonDetailsStructData(
  Map<String, dynamic> firestoreData,
  PersonDetailsStruct? personDetails,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (personDetails == null) {
    return;
  }
  if (personDetails.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && personDetails.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final personDetailsData =
      getPersonDetailsFirestoreData(personDetails, forFieldValue);
  final nestedData =
      personDetailsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = personDetails.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPersonDetailsFirestoreData(
  PersonDetailsStruct? personDetails, [
  bool forFieldValue = false,
]) {
  if (personDetails == null) {
    return {};
  }
  final firestoreData = mapToFirestore(personDetails.toMap());

  // Add any Firestore field values
  personDetails.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPersonDetailsListFirestoreData(
  List<PersonDetailsStruct>? personDetailss,
) =>
    personDetailss
        ?.map((e) => getPersonDetailsFirestoreData(e, true))
        .toList() ??
    [];
