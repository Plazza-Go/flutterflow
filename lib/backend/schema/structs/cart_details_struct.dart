// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class CartDetailsStruct extends FFFirebaseStruct {
  CartDetailsStruct({
    String? orderid,
    int? ticketid,
    int? platformFee,
    int? packagingCharges,
    int? convenienceFee,
    int? deliveryCharges,
    String? addressID,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _orderid = orderid,
        _ticketid = ticketid,
        _platformFee = platformFee,
        _packagingCharges = packagingCharges,
        _convenienceFee = convenienceFee,
        _deliveryCharges = deliveryCharges,
        _addressID = addressID,
        super(firestoreUtilData);

  // "orderid" field.
  String? _orderid;
  String get orderid => _orderid ?? '';
  set orderid(String? val) => _orderid = val;

  bool hasOrderid() => _orderid != null;

  // "ticketid" field.
  int? _ticketid;
  int get ticketid => _ticketid ?? 0;
  set ticketid(int? val) => _ticketid = val;

  void incrementTicketid(int amount) => ticketid = ticketid + amount;

  bool hasTicketid() => _ticketid != null;

  // "Platform_Fee" field.
  int? _platformFee;
  int get platformFee => _platformFee ?? 0;
  set platformFee(int? val) => _platformFee = val;

  void incrementPlatformFee(int amount) => platformFee = platformFee + amount;

  bool hasPlatformFee() => _platformFee != null;

  // "Packaging_Charges" field.
  int? _packagingCharges;
  int get packagingCharges => _packagingCharges ?? 0;
  set packagingCharges(int? val) => _packagingCharges = val;

  void incrementPackagingCharges(int amount) =>
      packagingCharges = packagingCharges + amount;

  bool hasPackagingCharges() => _packagingCharges != null;

  // "Convenience_Fee" field.
  int? _convenienceFee;
  int get convenienceFee => _convenienceFee ?? 0;
  set convenienceFee(int? val) => _convenienceFee = val;

  void incrementConvenienceFee(int amount) =>
      convenienceFee = convenienceFee + amount;

  bool hasConvenienceFee() => _convenienceFee != null;

  // "Delivery_Charges" field.
  int? _deliveryCharges;
  int get deliveryCharges => _deliveryCharges ?? 0;
  set deliveryCharges(int? val) => _deliveryCharges = val;

  void incrementDeliveryCharges(int amount) =>
      deliveryCharges = deliveryCharges + amount;

  bool hasDeliveryCharges() => _deliveryCharges != null;

  // "AddressID" field.
  String? _addressID;
  String get addressID => _addressID ?? '';
  set addressID(String? val) => _addressID = val;

  bool hasAddressID() => _addressID != null;

  static CartDetailsStruct fromMap(Map<String, dynamic> data) =>
      CartDetailsStruct(
        orderid: data['orderid'] as String?,
        ticketid: castToType<int>(data['ticketid']),
        platformFee: castToType<int>(data['Platform_Fee']),
        packagingCharges: castToType<int>(data['Packaging_Charges']),
        convenienceFee: castToType<int>(data['Convenience_Fee']),
        deliveryCharges: castToType<int>(data['Delivery_Charges']),
        addressID: data['AddressID'] as String?,
      );

  static CartDetailsStruct? maybeFromMap(dynamic data) => data is Map
      ? CartDetailsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'orderid': _orderid,
        'ticketid': _ticketid,
        'Platform_Fee': _platformFee,
        'Packaging_Charges': _packagingCharges,
        'Convenience_Fee': _convenienceFee,
        'Delivery_Charges': _deliveryCharges,
        'AddressID': _addressID,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'orderid': serializeParam(
          _orderid,
          ParamType.String,
        ),
        'ticketid': serializeParam(
          _ticketid,
          ParamType.int,
        ),
        'Platform_Fee': serializeParam(
          _platformFee,
          ParamType.int,
        ),
        'Packaging_Charges': serializeParam(
          _packagingCharges,
          ParamType.int,
        ),
        'Convenience_Fee': serializeParam(
          _convenienceFee,
          ParamType.int,
        ),
        'Delivery_Charges': serializeParam(
          _deliveryCharges,
          ParamType.int,
        ),
        'AddressID': serializeParam(
          _addressID,
          ParamType.String,
        ),
      }.withoutNulls;

  static CartDetailsStruct fromSerializableMap(Map<String, dynamic> data) =>
      CartDetailsStruct(
        orderid: deserializeParam(
          data['orderid'],
          ParamType.String,
          false,
        ),
        ticketid: deserializeParam(
          data['ticketid'],
          ParamType.int,
          false,
        ),
        platformFee: deserializeParam(
          data['Platform_Fee'],
          ParamType.int,
          false,
        ),
        packagingCharges: deserializeParam(
          data['Packaging_Charges'],
          ParamType.int,
          false,
        ),
        convenienceFee: deserializeParam(
          data['Convenience_Fee'],
          ParamType.int,
          false,
        ),
        deliveryCharges: deserializeParam(
          data['Delivery_Charges'],
          ParamType.int,
          false,
        ),
        addressID: deserializeParam(
          data['AddressID'],
          ParamType.String,
          false,
        ),
      );

  static CartDetailsStruct fromAlgoliaData(Map<String, dynamic> data) =>
      CartDetailsStruct(
        orderid: convertAlgoliaParam(
          data['orderid'],
          ParamType.String,
          false,
        ),
        ticketid: convertAlgoliaParam(
          data['ticketid'],
          ParamType.int,
          false,
        ),
        platformFee: convertAlgoliaParam(
          data['Platform_Fee'],
          ParamType.int,
          false,
        ),
        packagingCharges: convertAlgoliaParam(
          data['Packaging_Charges'],
          ParamType.int,
          false,
        ),
        convenienceFee: convertAlgoliaParam(
          data['Convenience_Fee'],
          ParamType.int,
          false,
        ),
        deliveryCharges: convertAlgoliaParam(
          data['Delivery_Charges'],
          ParamType.int,
          false,
        ),
        addressID: convertAlgoliaParam(
          data['AddressID'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: const FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'CartDetailsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CartDetailsStruct &&
        orderid == other.orderid &&
        ticketid == other.ticketid &&
        platformFee == other.platformFee &&
        packagingCharges == other.packagingCharges &&
        convenienceFee == other.convenienceFee &&
        deliveryCharges == other.deliveryCharges &&
        addressID == other.addressID;
  }

  @override
  int get hashCode => const ListEquality().hash([
        orderid,
        ticketid,
        platformFee,
        packagingCharges,
        convenienceFee,
        deliveryCharges,
        addressID
      ]);
}

CartDetailsStruct createCartDetailsStruct({
  String? orderid,
  int? ticketid,
  int? platformFee,
  int? packagingCharges,
  int? convenienceFee,
  int? deliveryCharges,
  String? addressID,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CartDetailsStruct(
      orderid: orderid,
      ticketid: ticketid,
      platformFee: platformFee,
      packagingCharges: packagingCharges,
      convenienceFee: convenienceFee,
      deliveryCharges: deliveryCharges,
      addressID: addressID,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CartDetailsStruct? updateCartDetailsStruct(
  CartDetailsStruct? cartDetails, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    cartDetails
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCartDetailsStructData(
  Map<String, dynamic> firestoreData,
  CartDetailsStruct? cartDetails,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (cartDetails == null) {
    return;
  }
  if (cartDetails.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && cartDetails.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final cartDetailsData =
      getCartDetailsFirestoreData(cartDetails, forFieldValue);
  final nestedData =
      cartDetailsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = cartDetails.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCartDetailsFirestoreData(
  CartDetailsStruct? cartDetails, [
  bool forFieldValue = false,
]) {
  if (cartDetails == null) {
    return {};
  }
  final firestoreData = mapToFirestore(cartDetails.toMap());

  // Add any Firestore field values
  cartDetails.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCartDetailsListFirestoreData(
  List<CartDetailsStruct>? cartDetailss,
) =>
    cartDetailss?.map((e) => getCartDetailsFirestoreData(e, true)).toList() ??
    [];
