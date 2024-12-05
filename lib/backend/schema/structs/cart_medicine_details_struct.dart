// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class CartMedicineDetailsStruct extends FFFirebaseStruct {
  CartMedicineDetailsStruct({
    String? medicineName,
    int? quantity,
    int? quantityCart,
    String? productID,
    double? plazzaPrice,
    double? medicineRate,
    double? plazzaPriceCart,
    String? recordid,
    String? cartProductid,
    String? prescriptionRequired,
    String? url,
    String? medicineStripSize,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _medicineName = medicineName,
        _quantity = quantity,
        _quantityCart = quantityCart,
        _productID = productID,
        _plazzaPrice = plazzaPrice,
        _medicineRate = medicineRate,
        _plazzaPriceCart = plazzaPriceCart,
        _recordid = recordid,
        _cartProductid = cartProductid,
        _prescriptionRequired = prescriptionRequired,
        _url = url,
        _medicineStripSize = medicineStripSize,
        super(firestoreUtilData);

  // "MedicineName" field.
  String? _medicineName;
  String get medicineName => _medicineName ?? '';
  set medicineName(String? val) => _medicineName = val;

  bool hasMedicineName() => _medicineName != null;

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

  // "Product_ID" field.
  String? _productID;
  String get productID => _productID ?? '';
  set productID(String? val) => _productID = val;

  bool hasProductID() => _productID != null;

  // "PlazzaPrice" field.
  double? _plazzaPrice;
  double get plazzaPrice => _plazzaPrice ?? 0.0;
  set plazzaPrice(double? val) => _plazzaPrice = val;

  void incrementPlazzaPrice(double amount) =>
      plazzaPrice = plazzaPrice + amount;

  bool hasPlazzaPrice() => _plazzaPrice != null;

  // "MedicineRate" field.
  double? _medicineRate;
  double get medicineRate => _medicineRate ?? 0.0;
  set medicineRate(double? val) => _medicineRate = val;

  void incrementMedicineRate(double amount) =>
      medicineRate = medicineRate + amount;

  bool hasMedicineRate() => _medicineRate != null;

  // "PlazzaPrice_Cart" field.
  double? _plazzaPriceCart;
  double get plazzaPriceCart => _plazzaPriceCart ?? 0.0;
  set plazzaPriceCart(double? val) => _plazzaPriceCart = val;

  void incrementPlazzaPriceCart(double amount) =>
      plazzaPriceCart = plazzaPriceCart + amount;

  bool hasPlazzaPriceCart() => _plazzaPriceCart != null;

  // "Recordid" field.
  String? _recordid;
  String get recordid => _recordid ?? '';
  set recordid(String? val) => _recordid = val;

  bool hasRecordid() => _recordid != null;

  // "cart_productid" field.
  String? _cartProductid;
  String get cartProductid => _cartProductid ?? '';
  set cartProductid(String? val) => _cartProductid = val;

  bool hasCartProductid() => _cartProductid != null;

  // "prescription_required" field.
  String? _prescriptionRequired;
  String get prescriptionRequired => _prescriptionRequired ?? '';
  set prescriptionRequired(String? val) => _prescriptionRequired = val;

  bool hasPrescriptionRequired() => _prescriptionRequired != null;

  // "url" field.
  String? _url;
  String get url => _url ?? '';
  set url(String? val) => _url = val;

  bool hasUrl() => _url != null;

  // "medicine_strip_size" field.
  String? _medicineStripSize;
  String get medicineStripSize => _medicineStripSize ?? '';
  set medicineStripSize(String? val) => _medicineStripSize = val;

  bool hasMedicineStripSize() => _medicineStripSize != null;

  static CartMedicineDetailsStruct fromMap(Map<String, dynamic> data) =>
      CartMedicineDetailsStruct(
        medicineName: data['MedicineName'] as String?,
        quantity: castToType<int>(data['Quantity']),
        quantityCart: castToType<int>(data['Quantity_Cart']),
        productID: data['Product_ID'] as String?,
        plazzaPrice: castToType<double>(data['PlazzaPrice']),
        medicineRate: castToType<double>(data['MedicineRate']),
        plazzaPriceCart: castToType<double>(data['PlazzaPrice_Cart']),
        recordid: data['Recordid'] as String?,
        cartProductid: data['cart_productid'] as String?,
        prescriptionRequired: data['prescription_required'] as String?,
        url: data['url'] as String?,
        medicineStripSize: data['medicine_strip_size'] as String?,
      );

  static CartMedicineDetailsStruct? maybeFromMap(dynamic data) => data is Map
      ? CartMedicineDetailsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'MedicineName': _medicineName,
        'Quantity': _quantity,
        'Quantity_Cart': _quantityCart,
        'Product_ID': _productID,
        'PlazzaPrice': _plazzaPrice,
        'MedicineRate': _medicineRate,
        'PlazzaPrice_Cart': _plazzaPriceCart,
        'Recordid': _recordid,
        'cart_productid': _cartProductid,
        'prescription_required': _prescriptionRequired,
        'url': _url,
        'medicine_strip_size': _medicineStripSize,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'MedicineName': serializeParam(
          _medicineName,
          ParamType.String,
        ),
        'Quantity': serializeParam(
          _quantity,
          ParamType.int,
        ),
        'Quantity_Cart': serializeParam(
          _quantityCart,
          ParamType.int,
        ),
        'Product_ID': serializeParam(
          _productID,
          ParamType.String,
        ),
        'PlazzaPrice': serializeParam(
          _plazzaPrice,
          ParamType.double,
        ),
        'MedicineRate': serializeParam(
          _medicineRate,
          ParamType.double,
        ),
        'PlazzaPrice_Cart': serializeParam(
          _plazzaPriceCart,
          ParamType.double,
        ),
        'Recordid': serializeParam(
          _recordid,
          ParamType.String,
        ),
        'cart_productid': serializeParam(
          _cartProductid,
          ParamType.String,
        ),
        'prescription_required': serializeParam(
          _prescriptionRequired,
          ParamType.String,
        ),
        'url': serializeParam(
          _url,
          ParamType.String,
        ),
        'medicine_strip_size': serializeParam(
          _medicineStripSize,
          ParamType.String,
        ),
      }.withoutNulls;

  static CartMedicineDetailsStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      CartMedicineDetailsStruct(
        medicineName: deserializeParam(
          data['MedicineName'],
          ParamType.String,
          false,
        ),
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
        productID: deserializeParam(
          data['Product_ID'],
          ParamType.String,
          false,
        ),
        plazzaPrice: deserializeParam(
          data['PlazzaPrice'],
          ParamType.double,
          false,
        ),
        medicineRate: deserializeParam(
          data['MedicineRate'],
          ParamType.double,
          false,
        ),
        plazzaPriceCart: deserializeParam(
          data['PlazzaPrice_Cart'],
          ParamType.double,
          false,
        ),
        recordid: deserializeParam(
          data['Recordid'],
          ParamType.String,
          false,
        ),
        cartProductid: deserializeParam(
          data['cart_productid'],
          ParamType.String,
          false,
        ),
        prescriptionRequired: deserializeParam(
          data['prescription_required'],
          ParamType.String,
          false,
        ),
        url: deserializeParam(
          data['url'],
          ParamType.String,
          false,
        ),
        medicineStripSize: deserializeParam(
          data['medicine_strip_size'],
          ParamType.String,
          false,
        ),
      );

  static CartMedicineDetailsStruct fromAlgoliaData(Map<String, dynamic> data) =>
      CartMedicineDetailsStruct(
        medicineName: convertAlgoliaParam(
          data['MedicineName'],
          ParamType.String,
          false,
        ),
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
        productID: convertAlgoliaParam(
          data['Product_ID'],
          ParamType.String,
          false,
        ),
        plazzaPrice: convertAlgoliaParam(
          data['PlazzaPrice'],
          ParamType.double,
          false,
        ),
        medicineRate: convertAlgoliaParam(
          data['MedicineRate'],
          ParamType.double,
          false,
        ),
        plazzaPriceCart: convertAlgoliaParam(
          data['PlazzaPrice_Cart'],
          ParamType.double,
          false,
        ),
        recordid: convertAlgoliaParam(
          data['Recordid'],
          ParamType.String,
          false,
        ),
        cartProductid: convertAlgoliaParam(
          data['cart_productid'],
          ParamType.String,
          false,
        ),
        prescriptionRequired: convertAlgoliaParam(
          data['prescription_required'],
          ParamType.String,
          false,
        ),
        url: convertAlgoliaParam(
          data['url'],
          ParamType.String,
          false,
        ),
        medicineStripSize: convertAlgoliaParam(
          data['medicine_strip_size'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: const FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'CartMedicineDetailsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CartMedicineDetailsStruct &&
        medicineName == other.medicineName &&
        quantity == other.quantity &&
        quantityCart == other.quantityCart &&
        productID == other.productID &&
        plazzaPrice == other.plazzaPrice &&
        medicineRate == other.medicineRate &&
        plazzaPriceCart == other.plazzaPriceCart &&
        recordid == other.recordid &&
        cartProductid == other.cartProductid &&
        prescriptionRequired == other.prescriptionRequired &&
        url == other.url &&
        medicineStripSize == other.medicineStripSize;
  }

  @override
  int get hashCode => const ListEquality().hash([
        medicineName,
        quantity,
        quantityCart,
        productID,
        plazzaPrice,
        medicineRate,
        plazzaPriceCart,
        recordid,
        cartProductid,
        prescriptionRequired,
        url,
        medicineStripSize
      ]);
}

CartMedicineDetailsStruct createCartMedicineDetailsStruct({
  String? medicineName,
  int? quantity,
  int? quantityCart,
  String? productID,
  double? plazzaPrice,
  double? medicineRate,
  double? plazzaPriceCart,
  String? recordid,
  String? cartProductid,
  String? prescriptionRequired,
  String? url,
  String? medicineStripSize,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CartMedicineDetailsStruct(
      medicineName: medicineName,
      quantity: quantity,
      quantityCart: quantityCart,
      productID: productID,
      plazzaPrice: plazzaPrice,
      medicineRate: medicineRate,
      plazzaPriceCart: plazzaPriceCart,
      recordid: recordid,
      cartProductid: cartProductid,
      prescriptionRequired: prescriptionRequired,
      url: url,
      medicineStripSize: medicineStripSize,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CartMedicineDetailsStruct? updateCartMedicineDetailsStruct(
  CartMedicineDetailsStruct? cartMedicineDetails, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    cartMedicineDetails
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCartMedicineDetailsStructData(
  Map<String, dynamic> firestoreData,
  CartMedicineDetailsStruct? cartMedicineDetails,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (cartMedicineDetails == null) {
    return;
  }
  if (cartMedicineDetails.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && cartMedicineDetails.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final cartMedicineDetailsData =
      getCartMedicineDetailsFirestoreData(cartMedicineDetails, forFieldValue);
  final nestedData =
      cartMedicineDetailsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      cartMedicineDetails.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCartMedicineDetailsFirestoreData(
  CartMedicineDetailsStruct? cartMedicineDetails, [
  bool forFieldValue = false,
]) {
  if (cartMedicineDetails == null) {
    return {};
  }
  final firestoreData = mapToFirestore(cartMedicineDetails.toMap());

  // Add any Firestore field values
  cartMedicineDetails.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCartMedicineDetailsListFirestoreData(
  List<CartMedicineDetailsStruct>? cartMedicineDetailss,
) =>
    cartMedicineDetailss
        ?.map((e) => getCartMedicineDetailsFirestoreData(e, true))
        .toList() ??
    [];
