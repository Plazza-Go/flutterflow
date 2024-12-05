// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class ItemStruct extends FFFirebaseStruct {
  ItemStruct({
    String? name,
    String? salt,
    String? quantity,
    String? dosage,
    String? frequency,
    String? type,
    bool? availability,
    String? status,
    int? availableQuantity,
    String? alternative,
    int? plazzaPrice,
    int? mrp,
    int? batchSize,
    String? catalogId,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _salt = salt,
        _quantity = quantity,
        _dosage = dosage,
        _frequency = frequency,
        _type = type,
        _availability = availability,
        _status = status,
        _availableQuantity = availableQuantity,
        _alternative = alternative,
        _plazzaPrice = plazzaPrice,
        _mrp = mrp,
        _batchSize = batchSize,
        _catalogId = catalogId,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "salt" field.
  String? _salt;
  String get salt => _salt ?? '';
  set salt(String? val) => _salt = val;

  bool hasSalt() => _salt != null;

  // "quantity" field.
  String? _quantity;
  String get quantity => _quantity ?? '';
  set quantity(String? val) => _quantity = val;

  bool hasQuantity() => _quantity != null;

  // "dosage" field.
  String? _dosage;
  String get dosage => _dosage ?? '';
  set dosage(String? val) => _dosage = val;

  bool hasDosage() => _dosage != null;

  // "frequency" field.
  String? _frequency;
  String get frequency => _frequency ?? '';
  set frequency(String? val) => _frequency = val;

  bool hasFrequency() => _frequency != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  set type(String? val) => _type = val;

  bool hasType() => _type != null;

  // "availability" field.
  bool? _availability;
  bool get availability => _availability ?? false;
  set availability(bool? val) => _availability = val;

  bool hasAvailability() => _availability != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  set status(String? val) => _status = val;

  bool hasStatus() => _status != null;

  // "available_quantity" field.
  int? _availableQuantity;
  int get availableQuantity => _availableQuantity ?? 0;
  set availableQuantity(int? val) => _availableQuantity = val;

  void incrementAvailableQuantity(int amount) =>
      availableQuantity = availableQuantity + amount;

  bool hasAvailableQuantity() => _availableQuantity != null;

  // "alternative" field.
  String? _alternative;
  String get alternative => _alternative ?? '';
  set alternative(String? val) => _alternative = val;

  bool hasAlternative() => _alternative != null;

  // "plazza_price" field.
  int? _plazzaPrice;
  int get plazzaPrice => _plazzaPrice ?? 0;
  set plazzaPrice(int? val) => _plazzaPrice = val;

  void incrementPlazzaPrice(int amount) => plazzaPrice = plazzaPrice + amount;

  bool hasPlazzaPrice() => _plazzaPrice != null;

  // "mrp" field.
  int? _mrp;
  int get mrp => _mrp ?? 0;
  set mrp(int? val) => _mrp = val;

  void incrementMrp(int amount) => mrp = mrp + amount;

  bool hasMrp() => _mrp != null;

  // "batch_size" field.
  int? _batchSize;
  int get batchSize => _batchSize ?? 0;
  set batchSize(int? val) => _batchSize = val;

  void incrementBatchSize(int amount) => batchSize = batchSize + amount;

  bool hasBatchSize() => _batchSize != null;

  // "catalog_id" field.
  String? _catalogId;
  String get catalogId => _catalogId ?? '';
  set catalogId(String? val) => _catalogId = val;

  bool hasCatalogId() => _catalogId != null;

  static ItemStruct fromMap(Map<String, dynamic> data) => ItemStruct(
        name: data['name'] as String?,
        salt: data['salt'] as String?,
        quantity: data['quantity'] as String?,
        dosage: data['dosage'] as String?,
        frequency: data['frequency'] as String?,
        type: data['type'] as String?,
        availability: data['availability'] as bool?,
        status: data['status'] as String?,
        availableQuantity: castToType<int>(data['available_quantity']),
        alternative: data['alternative'] as String?,
        plazzaPrice: castToType<int>(data['plazza_price']),
        mrp: castToType<int>(data['mrp']),
        batchSize: castToType<int>(data['batch_size']),
        catalogId: data['catalog_id'] as String?,
      );

  static ItemStruct? maybeFromMap(dynamic data) =>
      data is Map ? ItemStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'salt': _salt,
        'quantity': _quantity,
        'dosage': _dosage,
        'frequency': _frequency,
        'type': _type,
        'availability': _availability,
        'status': _status,
        'available_quantity': _availableQuantity,
        'alternative': _alternative,
        'plazza_price': _plazzaPrice,
        'mrp': _mrp,
        'batch_size': _batchSize,
        'catalog_id': _catalogId,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'salt': serializeParam(
          _salt,
          ParamType.String,
        ),
        'quantity': serializeParam(
          _quantity,
          ParamType.String,
        ),
        'dosage': serializeParam(
          _dosage,
          ParamType.String,
        ),
        'frequency': serializeParam(
          _frequency,
          ParamType.String,
        ),
        'type': serializeParam(
          _type,
          ParamType.String,
        ),
        'availability': serializeParam(
          _availability,
          ParamType.bool,
        ),
        'status': serializeParam(
          _status,
          ParamType.String,
        ),
        'available_quantity': serializeParam(
          _availableQuantity,
          ParamType.int,
        ),
        'alternative': serializeParam(
          _alternative,
          ParamType.String,
        ),
        'plazza_price': serializeParam(
          _plazzaPrice,
          ParamType.int,
        ),
        'mrp': serializeParam(
          _mrp,
          ParamType.int,
        ),
        'batch_size': serializeParam(
          _batchSize,
          ParamType.int,
        ),
        'catalog_id': serializeParam(
          _catalogId,
          ParamType.String,
        ),
      }.withoutNulls;

  static ItemStruct fromSerializableMap(Map<String, dynamic> data) =>
      ItemStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        salt: deserializeParam(
          data['salt'],
          ParamType.String,
          false,
        ),
        quantity: deserializeParam(
          data['quantity'],
          ParamType.String,
          false,
        ),
        dosage: deserializeParam(
          data['dosage'],
          ParamType.String,
          false,
        ),
        frequency: deserializeParam(
          data['frequency'],
          ParamType.String,
          false,
        ),
        type: deserializeParam(
          data['type'],
          ParamType.String,
          false,
        ),
        availability: deserializeParam(
          data['availability'],
          ParamType.bool,
          false,
        ),
        status: deserializeParam(
          data['status'],
          ParamType.String,
          false,
        ),
        availableQuantity: deserializeParam(
          data['available_quantity'],
          ParamType.int,
          false,
        ),
        alternative: deserializeParam(
          data['alternative'],
          ParamType.String,
          false,
        ),
        plazzaPrice: deserializeParam(
          data['plazza_price'],
          ParamType.int,
          false,
        ),
        mrp: deserializeParam(
          data['mrp'],
          ParamType.int,
          false,
        ),
        batchSize: deserializeParam(
          data['batch_size'],
          ParamType.int,
          false,
        ),
        catalogId: deserializeParam(
          data['catalog_id'],
          ParamType.String,
          false,
        ),
      );

  static ItemStruct fromAlgoliaData(Map<String, dynamic> data) => ItemStruct(
        name: convertAlgoliaParam(
          data['name'],
          ParamType.String,
          false,
        ),
        salt: convertAlgoliaParam(
          data['salt'],
          ParamType.String,
          false,
        ),
        quantity: convertAlgoliaParam(
          data['quantity'],
          ParamType.String,
          false,
        ),
        dosage: convertAlgoliaParam(
          data['dosage'],
          ParamType.String,
          false,
        ),
        frequency: convertAlgoliaParam(
          data['frequency'],
          ParamType.String,
          false,
        ),
        type: convertAlgoliaParam(
          data['type'],
          ParamType.String,
          false,
        ),
        availability: convertAlgoliaParam(
          data['availability'],
          ParamType.bool,
          false,
        ),
        status: convertAlgoliaParam(
          data['status'],
          ParamType.String,
          false,
        ),
        availableQuantity: convertAlgoliaParam(
          data['available_quantity'],
          ParamType.int,
          false,
        ),
        alternative: convertAlgoliaParam(
          data['alternative'],
          ParamType.String,
          false,
        ),
        plazzaPrice: convertAlgoliaParam(
          data['plazza_price'],
          ParamType.int,
          false,
        ),
        mrp: convertAlgoliaParam(
          data['mrp'],
          ParamType.int,
          false,
        ),
        batchSize: convertAlgoliaParam(
          data['batch_size'],
          ParamType.int,
          false,
        ),
        catalogId: convertAlgoliaParam(
          data['catalog_id'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: const FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'ItemStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ItemStruct &&
        name == other.name &&
        salt == other.salt &&
        quantity == other.quantity &&
        dosage == other.dosage &&
        frequency == other.frequency &&
        type == other.type &&
        availability == other.availability &&
        status == other.status &&
        availableQuantity == other.availableQuantity &&
        alternative == other.alternative &&
        plazzaPrice == other.plazzaPrice &&
        mrp == other.mrp &&
        batchSize == other.batchSize &&
        catalogId == other.catalogId;
  }

  @override
  int get hashCode => const ListEquality().hash([
        name,
        salt,
        quantity,
        dosage,
        frequency,
        type,
        availability,
        status,
        availableQuantity,
        alternative,
        plazzaPrice,
        mrp,
        batchSize,
        catalogId
      ]);
}

ItemStruct createItemStruct({
  String? name,
  String? salt,
  String? quantity,
  String? dosage,
  String? frequency,
  String? type,
  bool? availability,
  String? status,
  int? availableQuantity,
  String? alternative,
  int? plazzaPrice,
  int? mrp,
  int? batchSize,
  String? catalogId,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ItemStruct(
      name: name,
      salt: salt,
      quantity: quantity,
      dosage: dosage,
      frequency: frequency,
      type: type,
      availability: availability,
      status: status,
      availableQuantity: availableQuantity,
      alternative: alternative,
      plazzaPrice: plazzaPrice,
      mrp: mrp,
      batchSize: batchSize,
      catalogId: catalogId,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ItemStruct? updateItemStruct(
  ItemStruct? item, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    item
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addItemStructData(
  Map<String, dynamic> firestoreData,
  ItemStruct? item,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (item == null) {
    return;
  }
  if (item.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue && item.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final itemData = getItemFirestoreData(item, forFieldValue);
  final nestedData = itemData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = item.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getItemFirestoreData(
  ItemStruct? item, [
  bool forFieldValue = false,
]) {
  if (item == null) {
    return {};
  }
  final firestoreData = mapToFirestore(item.toMap());

  // Add any Firestore field values
  item.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getItemListFirestoreData(
  List<ItemStruct>? items,
) =>
    items?.map((e) => getItemFirestoreData(e, true)).toList() ?? [];
