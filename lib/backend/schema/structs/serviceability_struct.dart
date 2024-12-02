// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class ServiceabilityStruct extends FFFirebaseStruct {
  ServiceabilityStruct({
    String? id,
    String? name,
    int? number,
    String? addressId,
    bool? addressIdSet,
    String? deliverytime,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _name = name,
        _number = number,
        _addressId = addressId,
        _addressIdSet = addressIdSet,
        _deliverytime = deliverytime,
        super(firestoreUtilData);

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "number" field.
  int? _number;
  int get number => _number ?? 0;
  set number(int? val) => _number = val;

  void incrementNumber(int amount) => number = number + amount;

  bool hasNumber() => _number != null;

  // "AddressId" field.
  String? _addressId;
  String get addressId => _addressId ?? '';
  set addressId(String? val) => _addressId = val;

  bool hasAddressId() => _addressId != null;

  // "AddressIdSet" field.
  bool? _addressIdSet;
  bool get addressIdSet => _addressIdSet ?? false;
  set addressIdSet(bool? val) => _addressIdSet = val;

  bool hasAddressIdSet() => _addressIdSet != null;

  // "deliverytime" field.
  String? _deliverytime;
  String get deliverytime => _deliverytime ?? '';
  set deliverytime(String? val) => _deliverytime = val;

  bool hasDeliverytime() => _deliverytime != null;

  static ServiceabilityStruct fromMap(Map<String, dynamic> data) =>
      ServiceabilityStruct(
        id: data['id'] as String?,
        name: data['name'] as String?,
        number: castToType<int>(data['number']),
        addressId: data['AddressId'] as String?,
        addressIdSet: data['AddressIdSet'] as bool?,
        deliverytime: data['deliverytime'] as String?,
      );

  static ServiceabilityStruct? maybeFromMap(dynamic data) => data is Map
      ? ServiceabilityStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'name': _name,
        'number': _number,
        'AddressId': _addressId,
        'AddressIdSet': _addressIdSet,
        'deliverytime': _deliverytime,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'number': serializeParam(
          _number,
          ParamType.int,
        ),
        'AddressId': serializeParam(
          _addressId,
          ParamType.String,
        ),
        'AddressIdSet': serializeParam(
          _addressIdSet,
          ParamType.bool,
        ),
        'deliverytime': serializeParam(
          _deliverytime,
          ParamType.String,
        ),
      }.withoutNulls;

  static ServiceabilityStruct fromSerializableMap(Map<String, dynamic> data) =>
      ServiceabilityStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        number: deserializeParam(
          data['number'],
          ParamType.int,
          false,
        ),
        addressId: deserializeParam(
          data['AddressId'],
          ParamType.String,
          false,
        ),
        addressIdSet: deserializeParam(
          data['AddressIdSet'],
          ParamType.bool,
          false,
        ),
        deliverytime: deserializeParam(
          data['deliverytime'],
          ParamType.String,
          false,
        ),
      );

  static ServiceabilityStruct fromAlgoliaData(Map<String, dynamic> data) =>
      ServiceabilityStruct(
        id: convertAlgoliaParam(
          data['id'],
          ParamType.String,
          false,
        ),
        name: convertAlgoliaParam(
          data['name'],
          ParamType.String,
          false,
        ),
        number: convertAlgoliaParam(
          data['number'],
          ParamType.int,
          false,
        ),
        addressId: convertAlgoliaParam(
          data['AddressId'],
          ParamType.String,
          false,
        ),
        addressIdSet: convertAlgoliaParam(
          data['AddressIdSet'],
          ParamType.bool,
          false,
        ),
        deliverytime: convertAlgoliaParam(
          data['deliverytime'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: const FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'ServiceabilityStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ServiceabilityStruct &&
        id == other.id &&
        name == other.name &&
        number == other.number &&
        addressId == other.addressId &&
        addressIdSet == other.addressIdSet &&
        deliverytime == other.deliverytime;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([id, name, number, addressId, addressIdSet, deliverytime]);
}

ServiceabilityStruct createServiceabilityStruct({
  String? id,
  String? name,
  int? number,
  String? addressId,
  bool? addressIdSet,
  String? deliverytime,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ServiceabilityStruct(
      id: id,
      name: name,
      number: number,
      addressId: addressId,
      addressIdSet: addressIdSet,
      deliverytime: deliverytime,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ServiceabilityStruct? updateServiceabilityStruct(
  ServiceabilityStruct? serviceability, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    serviceability
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addServiceabilityStructData(
  Map<String, dynamic> firestoreData,
  ServiceabilityStruct? serviceability,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (serviceability == null) {
    return;
  }
  if (serviceability.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && serviceability.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final serviceabilityData =
      getServiceabilityFirestoreData(serviceability, forFieldValue);
  final nestedData =
      serviceabilityData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = serviceability.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getServiceabilityFirestoreData(
  ServiceabilityStruct? serviceability, [
  bool forFieldValue = false,
]) {
  if (serviceability == null) {
    return {};
  }
  final firestoreData = mapToFirestore(serviceability.toMap());

  // Add any Firestore field values
  serviceability.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getServiceabilityListFirestoreData(
  List<ServiceabilityStruct>? serviceabilitys,
) =>
    serviceabilitys
        ?.map((e) => getServiceabilityFirestoreData(e, true))
        .toList() ??
    [];
