// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MedicineCartStruct extends FFFirebaseStruct {
  MedicineCartStruct({
    String? id,
    FieldsStruct? fields,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _fields = fields,
        super(firestoreUtilData);

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "fields" field.
  FieldsStruct? _fields;
  FieldsStruct get fields => _fields ?? FieldsStruct();
  set fields(FieldsStruct? val) => _fields = val;

  void updateFields(Function(FieldsStruct) updateFn) {
    updateFn(_fields ??= FieldsStruct());
  }

  bool hasFields() => _fields != null;

  static MedicineCartStruct fromMap(Map<String, dynamic> data) =>
      MedicineCartStruct(
        id: data['id'] as String?,
        fields: FieldsStruct.maybeFromMap(data['fields']),
      );

  static MedicineCartStruct? maybeFromMap(dynamic data) => data is Map
      ? MedicineCartStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'fields': _fields?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'fields': serializeParam(
          _fields,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static MedicineCartStruct fromSerializableMap(Map<String, dynamic> data) =>
      MedicineCartStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        fields: deserializeStructParam(
          data['fields'],
          ParamType.DataStruct,
          false,
          structBuilder: FieldsStruct.fromSerializableMap,
        ),
      );

  static MedicineCartStruct fromAlgoliaData(Map<String, dynamic> data) =>
      MedicineCartStruct(
        id: convertAlgoliaParam(
          data['id'],
          ParamType.String,
          false,
        ),
        fields: convertAlgoliaParam(
          data['fields'],
          ParamType.DataStruct,
          false,
          structBuilder: FieldsStruct.fromAlgoliaData,
        ),
        firestoreUtilData: const FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'MedicineCartStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MedicineCartStruct &&
        id == other.id &&
        fields == other.fields;
  }

  @override
  int get hashCode => const ListEquality().hash([id, fields]);
}

MedicineCartStruct createMedicineCartStruct({
  String? id,
  FieldsStruct? fields,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    MedicineCartStruct(
      id: id,
      fields: fields ?? (clearUnsetFields ? FieldsStruct() : null),
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

MedicineCartStruct? updateMedicineCartStruct(
  MedicineCartStruct? medicineCart, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    medicineCart
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addMedicineCartStructData(
  Map<String, dynamic> firestoreData,
  MedicineCartStruct? medicineCart,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (medicineCart == null) {
    return;
  }
  if (medicineCart.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && medicineCart.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final medicineCartData =
      getMedicineCartFirestoreData(medicineCart, forFieldValue);
  final nestedData =
      medicineCartData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = medicineCart.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getMedicineCartFirestoreData(
  MedicineCartStruct? medicineCart, [
  bool forFieldValue = false,
]) {
  if (medicineCart == null) {
    return {};
  }
  final firestoreData = mapToFirestore(medicineCart.toMap());

  // Handle nested data for "fields" field.
  addFieldsStructData(
    firestoreData,
    medicineCart.hasFields() ? medicineCart.fields : null,
    'fields',
    forFieldValue,
  );

  // Add any Firestore field values
  medicineCart.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getMedicineCartListFirestoreData(
  List<MedicineCartStruct>? medicineCarts,
) =>
    medicineCarts?.map((e) => getMedicineCartFirestoreData(e, true)).toList() ??
    [];
