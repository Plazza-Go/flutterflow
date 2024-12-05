// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class FieldsStruct extends FFFirebaseStruct {
  FieldsStruct({
    int? quantity,
    int? quantityCart,
    double? plazzaPriceCart,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _quantity = quantity,
        _quantityCart = quantityCart,
        _plazzaPriceCart = plazzaPriceCart,
        super(firestoreUtilData);

  // "Quantity" field.
  int? _quantity;
  int get quantity => _quantity ?? 0;
  set quantity(int? val) => _quantity = val;

  void incrementQuantity(int amount) => quantity = quantity + amount;

  bool hasQuantity() => _quantity != null;

  // "Quantity_Cart" field.
  int? _quantityCart;
  int get quantityCart => _quantityCart ?? 0;
  set quantityCart(int? val) => _quantityCart = val;

  void incrementQuantityCart(int amount) =>
      quantityCart = quantityCart + amount;

  bool hasQuantityCart() => _quantityCart != null;

  // "PlazzaPrice_Cart" field.
  double? _plazzaPriceCart;
  double get plazzaPriceCart => _plazzaPriceCart ?? 0.0;
  set plazzaPriceCart(double? val) => _plazzaPriceCart = val;

  void incrementPlazzaPriceCart(double amount) =>
      plazzaPriceCart = plazzaPriceCart + amount;

  bool hasPlazzaPriceCart() => _plazzaPriceCart != null;

  static FieldsStruct fromMap(Map<String, dynamic> data) => FieldsStruct(
        quantity: castToType<int>(data['Quantity']),
        quantityCart: castToType<int>(data['Quantity_Cart']),
        plazzaPriceCart: castToType<double>(data['PlazzaPrice_Cart']),
      );

  static FieldsStruct? maybeFromMap(dynamic data) =>
      data is Map ? FieldsStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'Quantity': _quantity,
        'Quantity_Cart': _quantityCart,
        'PlazzaPrice_Cart': _plazzaPriceCart,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Quantity': serializeParam(
          _quantity,
          ParamType.int,
        ),
        'Quantity_Cart': serializeParam(
          _quantityCart,
          ParamType.int,
        ),
        'PlazzaPrice_Cart': serializeParam(
          _plazzaPriceCart,
          ParamType.double,
        ),
      }.withoutNulls;

  static FieldsStruct fromSerializableMap(Map<String, dynamic> data) =>
      FieldsStruct(
        quantity: deserializeParam(
          data['Quantity'],
          ParamType.int,
          false,
        ),
        quantityCart: deserializeParam(
          data['Quantity_Cart'],
          ParamType.int,
          false,
        ),
        plazzaPriceCart: deserializeParam(
          data['PlazzaPrice_Cart'],
          ParamType.double,
          false,
        ),
      );

  static FieldsStruct fromAlgoliaData(Map<String, dynamic> data) =>
      FieldsStruct(
        quantity: convertAlgoliaParam(
          data['Quantity'],
          ParamType.int,
          false,
        ),
        quantityCart: convertAlgoliaParam(
          data['Quantity_Cart'],
          ParamType.int,
          false,
        ),
        plazzaPriceCart: convertAlgoliaParam(
          data['PlazzaPrice_Cart'],
          ParamType.double,
          false,
        ),
        firestoreUtilData: const FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'FieldsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is FieldsStruct &&
        quantity == other.quantity &&
        quantityCart == other.quantityCart &&
        plazzaPriceCart == other.plazzaPriceCart;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([quantity, quantityCart, plazzaPriceCart]);
}

FieldsStruct createFieldsStruct({
  int? quantity,
  int? quantityCart,
  double? plazzaPriceCart,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    FieldsStruct(
      quantity: quantity,
      quantityCart: quantityCart,
      plazzaPriceCart: plazzaPriceCart,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

FieldsStruct? updateFieldsStruct(
  FieldsStruct? fields, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    fields
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addFieldsStructData(
  Map<String, dynamic> firestoreData,
  FieldsStruct? fields,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (fields == null) {
    return;
  }
  if (fields.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && fields.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final fieldsData = getFieldsFirestoreData(fields, forFieldValue);
  final nestedData = fieldsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = fields.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getFieldsFirestoreData(
  FieldsStruct? fields, [
  bool forFieldValue = false,
]) {
  if (fields == null) {
    return {};
  }
  final firestoreData = mapToFirestore(fields.toMap());

  // Add any Firestore field values
  fields.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getFieldsListFirestoreData(
  List<FieldsStruct>? fieldss,
) =>
    fieldss?.map((e) => getFieldsFirestoreData(e, true)).toList() ?? [];
