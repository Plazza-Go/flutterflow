// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TermsStruct extends FFFirebaseStruct {
  TermsStruct({
    int? offset,
    String? value,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _offset = offset,
        _value = value,
        super(firestoreUtilData);

  // "offset" field.
  int? _offset;
  int get offset => _offset ?? 0;
  set offset(int? val) => _offset = val;

  void incrementOffset(int amount) => offset = offset + amount;

  bool hasOffset() => _offset != null;

  // "value" field.
  String? _value;
  String get value => _value ?? '';
  set value(String? val) => _value = val;

  bool hasValue() => _value != null;

  static TermsStruct fromMap(Map<String, dynamic> data) => TermsStruct(
        offset: castToType<int>(data['offset']),
        value: data['value'] as String?,
      );

  static TermsStruct? maybeFromMap(dynamic data) =>
      data is Map ? TermsStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'offset': _offset,
        'value': _value,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'offset': serializeParam(
          _offset,
          ParamType.int,
        ),
        'value': serializeParam(
          _value,
          ParamType.String,
        ),
      }.withoutNulls;

  static TermsStruct fromSerializableMap(Map<String, dynamic> data) =>
      TermsStruct(
        offset: deserializeParam(
          data['offset'],
          ParamType.int,
          false,
        ),
        value: deserializeParam(
          data['value'],
          ParamType.String,
          false,
        ),
      );

  static TermsStruct fromAlgoliaData(Map<String, dynamic> data) => TermsStruct(
        offset: convertAlgoliaParam(
          data['offset'],
          ParamType.int,
          false,
        ),
        value: convertAlgoliaParam(
          data['value'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'TermsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TermsStruct &&
        offset == other.offset &&
        value == other.value;
  }

  @override
  int get hashCode => const ListEquality().hash([offset, value]);
}

TermsStruct createTermsStruct({
  int? offset,
  String? value,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    TermsStruct(
      offset: offset,
      value: value,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

TermsStruct? updateTermsStruct(
  TermsStruct? terms, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    terms
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addTermsStructData(
  Map<String, dynamic> firestoreData,
  TermsStruct? terms,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (terms == null) {
    return;
  }
  if (terms.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && terms.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final termsData = getTermsFirestoreData(terms, forFieldValue);
  final nestedData = termsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = terms.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getTermsFirestoreData(
  TermsStruct? terms, [
  bool forFieldValue = false,
]) {
  if (terms == null) {
    return {};
  }
  final firestoreData = mapToFirestore(terms.toMap());

  // Add any Firestore field values
  terms.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getTermsListFirestoreData(
  List<TermsStruct>? termss,
) =>
    termss?.map((e) => getTermsFirestoreData(e, true)).toList() ?? [];
