// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DocumentStruct extends FFFirebaseStruct {
  DocumentStruct({
    String? manufacturerAddress,
    String? manufacturerdetails,
    String? marketerdetails,
    String? package,
    String? packagingDetail,
    String? productForm,
    String? productId,
    String? qty,
    String? alcoholInteraction,
    String? benefits,
    String? commonSideEffect,
    String? description,
    String? drivingInteraction,
    String? id,
    String? kidneyInteraction,
    String? lactationInteraction,
    String? liverInteraction,
    String? manufacturers,
    String? medicineType,
    String? name,
    String? pregnancyInteraction,
    String? prescriptionRequired,
    String? primaryUse,
    String? safetyAdvise,
    String? saltComposition,
    String? storage,
    String? useOf,
    List<String>? imageUrl,
    double? mrp,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _manufacturerAddress = manufacturerAddress,
        _manufacturerdetails = manufacturerdetails,
        _marketerdetails = marketerdetails,
        _package = package,
        _packagingDetail = packagingDetail,
        _productForm = productForm,
        _productId = productId,
        _qty = qty,
        _alcoholInteraction = alcoholInteraction,
        _benefits = benefits,
        _commonSideEffect = commonSideEffect,
        _description = description,
        _drivingInteraction = drivingInteraction,
        _id = id,
        _kidneyInteraction = kidneyInteraction,
        _lactationInteraction = lactationInteraction,
        _liverInteraction = liverInteraction,
        _manufacturers = manufacturers,
        _medicineType = medicineType,
        _name = name,
        _pregnancyInteraction = pregnancyInteraction,
        _prescriptionRequired = prescriptionRequired,
        _primaryUse = primaryUse,
        _safetyAdvise = safetyAdvise,
        _saltComposition = saltComposition,
        _storage = storage,
        _useOf = useOf,
        _imageUrl = imageUrl,
        _mrp = mrp,
        super(firestoreUtilData);

  // "MANUFACTURER_ADDRESS" field.
  String? _manufacturerAddress;
  String get manufacturerAddress => _manufacturerAddress ?? '';
  set manufacturerAddress(String? val) => _manufacturerAddress = val;

  bool hasManufacturerAddress() => _manufacturerAddress != null;

  // "Manufacturerdetails" field.
  String? _manufacturerdetails;
  String get manufacturerdetails => _manufacturerdetails ?? '';
  set manufacturerdetails(String? val) => _manufacturerdetails = val;

  bool hasManufacturerdetails() => _manufacturerdetails != null;

  // "Marketerdetails" field.
  String? _marketerdetails;
  String get marketerdetails => _marketerdetails ?? '';
  set marketerdetails(String? val) => _marketerdetails = val;

  bool hasMarketerdetails() => _marketerdetails != null;

  // "Package" field.
  String? _package;
  String get package => _package ?? '';
  set package(String? val) => _package = val;

  bool hasPackage() => _package != null;

  // "Packaging_Detail" field.
  String? _packagingDetail;
  String get packagingDetail => _packagingDetail ?? '';
  set packagingDetail(String? val) => _packagingDetail = val;

  bool hasPackagingDetail() => _packagingDetail != null;

  // "ProductForm" field.
  String? _productForm;
  String get productForm => _productForm ?? '';
  set productForm(String? val) => _productForm = val;

  bool hasProductForm() => _productForm != null;

  // "Product_id" field.
  String? _productId;
  String get productId => _productId ?? '';
  set productId(String? val) => _productId = val;

  bool hasProductId() => _productId != null;

  // "Qty" field.
  String? _qty;
  String get qty => _qty ?? '';
  set qty(String? val) => _qty = val;

  bool hasQty() => _qty != null;

  // "alcoholInteraction" field.
  String? _alcoholInteraction;
  String get alcoholInteraction => _alcoholInteraction ?? '';
  set alcoholInteraction(String? val) => _alcoholInteraction = val;

  bool hasAlcoholInteraction() => _alcoholInteraction != null;

  // "benefits" field.
  String? _benefits;
  String get benefits => _benefits ?? '';
  set benefits(String? val) => _benefits = val;

  bool hasBenefits() => _benefits != null;

  // "common_side_effect" field.
  String? _commonSideEffect;
  String get commonSideEffect => _commonSideEffect ?? '';
  set commonSideEffect(String? val) => _commonSideEffect = val;

  bool hasCommonSideEffect() => _commonSideEffect != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  // "drivingInteraction" field.
  String? _drivingInteraction;
  String get drivingInteraction => _drivingInteraction ?? '';
  set drivingInteraction(String? val) => _drivingInteraction = val;

  bool hasDrivingInteraction() => _drivingInteraction != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "kidneyInteraction" field.
  String? _kidneyInteraction;
  String get kidneyInteraction => _kidneyInteraction ?? '';
  set kidneyInteraction(String? val) => _kidneyInteraction = val;

  bool hasKidneyInteraction() => _kidneyInteraction != null;

  // "lactationInteraction" field.
  String? _lactationInteraction;
  String get lactationInteraction => _lactationInteraction ?? '';
  set lactationInteraction(String? val) => _lactationInteraction = val;

  bool hasLactationInteraction() => _lactationInteraction != null;

  // "liverInteraction" field.
  String? _liverInteraction;
  String get liverInteraction => _liverInteraction ?? '';
  set liverInteraction(String? val) => _liverInteraction = val;

  bool hasLiverInteraction() => _liverInteraction != null;

  // "manufacturers" field.
  String? _manufacturers;
  String get manufacturers => _manufacturers ?? '';
  set manufacturers(String? val) => _manufacturers = val;

  bool hasManufacturers() => _manufacturers != null;

  // "medicine_type" field.
  String? _medicineType;
  String get medicineType => _medicineType ?? '';
  set medicineType(String? val) => _medicineType = val;

  bool hasMedicineType() => _medicineType != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "pregnancyInteraction" field.
  String? _pregnancyInteraction;
  String get pregnancyInteraction => _pregnancyInteraction ?? '';
  set pregnancyInteraction(String? val) => _pregnancyInteraction = val;

  bool hasPregnancyInteraction() => _pregnancyInteraction != null;

  // "prescription_required" field.
  String? _prescriptionRequired;
  String get prescriptionRequired => _prescriptionRequired ?? '';
  set prescriptionRequired(String? val) => _prescriptionRequired = val;

  bool hasPrescriptionRequired() => _prescriptionRequired != null;

  // "primary_use" field.
  String? _primaryUse;
  String get primaryUse => _primaryUse ?? '';
  set primaryUse(String? val) => _primaryUse = val;

  bool hasPrimaryUse() => _primaryUse != null;

  // "safety_advise" field.
  String? _safetyAdvise;
  String get safetyAdvise => _safetyAdvise ?? '';
  set safetyAdvise(String? val) => _safetyAdvise = val;

  bool hasSafetyAdvise() => _safetyAdvise != null;

  // "salt_composition" field.
  String? _saltComposition;
  String get saltComposition => _saltComposition ?? '';
  set saltComposition(String? val) => _saltComposition = val;

  bool hasSaltComposition() => _saltComposition != null;

  // "storage" field.
  String? _storage;
  String get storage => _storage ?? '';
  set storage(String? val) => _storage = val;

  bool hasStorage() => _storage != null;

  // "use_of" field.
  String? _useOf;
  String get useOf => _useOf ?? '';
  set useOf(String? val) => _useOf = val;

  bool hasUseOf() => _useOf != null;

  // "image_url" field.
  List<String>? _imageUrl;
  List<String> get imageUrl => _imageUrl ?? const [];
  set imageUrl(List<String>? val) => _imageUrl = val;

  void updateImageUrl(Function(List<String>) updateFn) {
    updateFn(_imageUrl ??= []);
  }

  bool hasImageUrl() => _imageUrl != null;

  // "MRP" field.
  double? _mrp;
  double get mrp => _mrp ?? 0.0;
  set mrp(double? val) => _mrp = val;

  void incrementMrp(double amount) => mrp = mrp + amount;

  bool hasMrp() => _mrp != null;

  static DocumentStruct fromMap(Map<String, dynamic> data) => DocumentStruct(
        manufacturerAddress: data['MANUFACTURER_ADDRESS'] as String?,
        manufacturerdetails: data['Manufacturerdetails'] as String?,
        marketerdetails: data['Marketerdetails'] as String?,
        package: data['Package'] as String?,
        packagingDetail: data['Packaging_Detail'] as String?,
        productForm: data['ProductForm'] as String?,
        productId: data['Product_id'] as String?,
        qty: data['Qty'] as String?,
        alcoholInteraction: data['alcoholInteraction'] as String?,
        benefits: data['benefits'] as String?,
        commonSideEffect: data['common_side_effect'] as String?,
        description: data['description'] as String?,
        drivingInteraction: data['drivingInteraction'] as String?,
        id: data['id'] as String?,
        kidneyInteraction: data['kidneyInteraction'] as String?,
        lactationInteraction: data['lactationInteraction'] as String?,
        liverInteraction: data['liverInteraction'] as String?,
        manufacturers: data['manufacturers'] as String?,
        medicineType: data['medicine_type'] as String?,
        name: data['name'] as String?,
        pregnancyInteraction: data['pregnancyInteraction'] as String?,
        prescriptionRequired: data['prescription_required'] as String?,
        primaryUse: data['primary_use'] as String?,
        safetyAdvise: data['safety_advise'] as String?,
        saltComposition: data['salt_composition'] as String?,
        storage: data['storage'] as String?,
        useOf: data['use_of'] as String?,
        imageUrl: getDataList(data['image_url']),
        mrp: castToType<double>(data['MRP']),
      );

  static DocumentStruct? maybeFromMap(dynamic data) =>
      data is Map ? DocumentStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'MANUFACTURER_ADDRESS': _manufacturerAddress,
        'Manufacturerdetails': _manufacturerdetails,
        'Marketerdetails': _marketerdetails,
        'Package': _package,
        'Packaging_Detail': _packagingDetail,
        'ProductForm': _productForm,
        'Product_id': _productId,
        'Qty': _qty,
        'alcoholInteraction': _alcoholInteraction,
        'benefits': _benefits,
        'common_side_effect': _commonSideEffect,
        'description': _description,
        'drivingInteraction': _drivingInteraction,
        'id': _id,
        'kidneyInteraction': _kidneyInteraction,
        'lactationInteraction': _lactationInteraction,
        'liverInteraction': _liverInteraction,
        'manufacturers': _manufacturers,
        'medicine_type': _medicineType,
        'name': _name,
        'pregnancyInteraction': _pregnancyInteraction,
        'prescription_required': _prescriptionRequired,
        'primary_use': _primaryUse,
        'safety_advise': _safetyAdvise,
        'salt_composition': _saltComposition,
        'storage': _storage,
        'use_of': _useOf,
        'image_url': _imageUrl,
        'MRP': _mrp,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'MANUFACTURER_ADDRESS': serializeParam(
          _manufacturerAddress,
          ParamType.String,
        ),
        'Manufacturerdetails': serializeParam(
          _manufacturerdetails,
          ParamType.String,
        ),
        'Marketerdetails': serializeParam(
          _marketerdetails,
          ParamType.String,
        ),
        'Package': serializeParam(
          _package,
          ParamType.String,
        ),
        'Packaging_Detail': serializeParam(
          _packagingDetail,
          ParamType.String,
        ),
        'ProductForm': serializeParam(
          _productForm,
          ParamType.String,
        ),
        'Product_id': serializeParam(
          _productId,
          ParamType.String,
        ),
        'Qty': serializeParam(
          _qty,
          ParamType.String,
        ),
        'alcoholInteraction': serializeParam(
          _alcoholInteraction,
          ParamType.String,
        ),
        'benefits': serializeParam(
          _benefits,
          ParamType.String,
        ),
        'common_side_effect': serializeParam(
          _commonSideEffect,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'drivingInteraction': serializeParam(
          _drivingInteraction,
          ParamType.String,
        ),
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'kidneyInteraction': serializeParam(
          _kidneyInteraction,
          ParamType.String,
        ),
        'lactationInteraction': serializeParam(
          _lactationInteraction,
          ParamType.String,
        ),
        'liverInteraction': serializeParam(
          _liverInteraction,
          ParamType.String,
        ),
        'manufacturers': serializeParam(
          _manufacturers,
          ParamType.String,
        ),
        'medicine_type': serializeParam(
          _medicineType,
          ParamType.String,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'pregnancyInteraction': serializeParam(
          _pregnancyInteraction,
          ParamType.String,
        ),
        'prescription_required': serializeParam(
          _prescriptionRequired,
          ParamType.String,
        ),
        'primary_use': serializeParam(
          _primaryUse,
          ParamType.String,
        ),
        'safety_advise': serializeParam(
          _safetyAdvise,
          ParamType.String,
        ),
        'salt_composition': serializeParam(
          _saltComposition,
          ParamType.String,
        ),
        'storage': serializeParam(
          _storage,
          ParamType.String,
        ),
        'use_of': serializeParam(
          _useOf,
          ParamType.String,
        ),
        'image_url': serializeParam(
          _imageUrl,
          ParamType.String,
          isList: true,
        ),
        'MRP': serializeParam(
          _mrp,
          ParamType.double,
        ),
      }.withoutNulls;

  static DocumentStruct fromSerializableMap(Map<String, dynamic> data) =>
      DocumentStruct(
        manufacturerAddress: deserializeParam(
          data['MANUFACTURER_ADDRESS'],
          ParamType.String,
          false,
        ),
        manufacturerdetails: deserializeParam(
          data['Manufacturerdetails'],
          ParamType.String,
          false,
        ),
        marketerdetails: deserializeParam(
          data['Marketerdetails'],
          ParamType.String,
          false,
        ),
        package: deserializeParam(
          data['Package'],
          ParamType.String,
          false,
        ),
        packagingDetail: deserializeParam(
          data['Packaging_Detail'],
          ParamType.String,
          false,
        ),
        productForm: deserializeParam(
          data['ProductForm'],
          ParamType.String,
          false,
        ),
        productId: deserializeParam(
          data['Product_id'],
          ParamType.String,
          false,
        ),
        qty: deserializeParam(
          data['Qty'],
          ParamType.String,
          false,
        ),
        alcoholInteraction: deserializeParam(
          data['alcoholInteraction'],
          ParamType.String,
          false,
        ),
        benefits: deserializeParam(
          data['benefits'],
          ParamType.String,
          false,
        ),
        commonSideEffect: deserializeParam(
          data['common_side_effect'],
          ParamType.String,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        drivingInteraction: deserializeParam(
          data['drivingInteraction'],
          ParamType.String,
          false,
        ),
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        kidneyInteraction: deserializeParam(
          data['kidneyInteraction'],
          ParamType.String,
          false,
        ),
        lactationInteraction: deserializeParam(
          data['lactationInteraction'],
          ParamType.String,
          false,
        ),
        liverInteraction: deserializeParam(
          data['liverInteraction'],
          ParamType.String,
          false,
        ),
        manufacturers: deserializeParam(
          data['manufacturers'],
          ParamType.String,
          false,
        ),
        medicineType: deserializeParam(
          data['medicine_type'],
          ParamType.String,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        pregnancyInteraction: deserializeParam(
          data['pregnancyInteraction'],
          ParamType.String,
          false,
        ),
        prescriptionRequired: deserializeParam(
          data['prescription_required'],
          ParamType.String,
          false,
        ),
        primaryUse: deserializeParam(
          data['primary_use'],
          ParamType.String,
          false,
        ),
        safetyAdvise: deserializeParam(
          data['safety_advise'],
          ParamType.String,
          false,
        ),
        saltComposition: deserializeParam(
          data['salt_composition'],
          ParamType.String,
          false,
        ),
        storage: deserializeParam(
          data['storage'],
          ParamType.String,
          false,
        ),
        useOf: deserializeParam(
          data['use_of'],
          ParamType.String,
          false,
        ),
        imageUrl: deserializeParam<String>(
          data['image_url'],
          ParamType.String,
          true,
        ),
        mrp: deserializeParam(
          data['MRP'],
          ParamType.double,
          false,
        ),
      );

  static DocumentStruct fromAlgoliaData(Map<String, dynamic> data) =>
      DocumentStruct(
        manufacturerAddress: convertAlgoliaParam(
          data['MANUFACTURER_ADDRESS'],
          ParamType.String,
          false,
        ),
        manufacturerdetails: convertAlgoliaParam(
          data['Manufacturerdetails'],
          ParamType.String,
          false,
        ),
        marketerdetails: convertAlgoliaParam(
          data['Marketerdetails'],
          ParamType.String,
          false,
        ),
        package: convertAlgoliaParam(
          data['Package'],
          ParamType.String,
          false,
        ),
        packagingDetail: convertAlgoliaParam(
          data['Packaging_Detail'],
          ParamType.String,
          false,
        ),
        productForm: convertAlgoliaParam(
          data['ProductForm'],
          ParamType.String,
          false,
        ),
        productId: convertAlgoliaParam(
          data['Product_id'],
          ParamType.String,
          false,
        ),
        qty: convertAlgoliaParam(
          data['Qty'],
          ParamType.String,
          false,
        ),
        alcoholInteraction: convertAlgoliaParam(
          data['alcoholInteraction'],
          ParamType.String,
          false,
        ),
        benefits: convertAlgoliaParam(
          data['benefits'],
          ParamType.String,
          false,
        ),
        commonSideEffect: convertAlgoliaParam(
          data['common_side_effect'],
          ParamType.String,
          false,
        ),
        description: convertAlgoliaParam(
          data['description'],
          ParamType.String,
          false,
        ),
        drivingInteraction: convertAlgoliaParam(
          data['drivingInteraction'],
          ParamType.String,
          false,
        ),
        id: convertAlgoliaParam(
          data['id'],
          ParamType.String,
          false,
        ),
        kidneyInteraction: convertAlgoliaParam(
          data['kidneyInteraction'],
          ParamType.String,
          false,
        ),
        lactationInteraction: convertAlgoliaParam(
          data['lactationInteraction'],
          ParamType.String,
          false,
        ),
        liverInteraction: convertAlgoliaParam(
          data['liverInteraction'],
          ParamType.String,
          false,
        ),
        manufacturers: convertAlgoliaParam(
          data['manufacturers'],
          ParamType.String,
          false,
        ),
        medicineType: convertAlgoliaParam(
          data['medicine_type'],
          ParamType.String,
          false,
        ),
        name: convertAlgoliaParam(
          data['name'],
          ParamType.String,
          false,
        ),
        pregnancyInteraction: convertAlgoliaParam(
          data['pregnancyInteraction'],
          ParamType.String,
          false,
        ),
        prescriptionRequired: convertAlgoliaParam(
          data['prescription_required'],
          ParamType.String,
          false,
        ),
        primaryUse: convertAlgoliaParam(
          data['primary_use'],
          ParamType.String,
          false,
        ),
        safetyAdvise: convertAlgoliaParam(
          data['safety_advise'],
          ParamType.String,
          false,
        ),
        saltComposition: convertAlgoliaParam(
          data['salt_composition'],
          ParamType.String,
          false,
        ),
        storage: convertAlgoliaParam(
          data['storage'],
          ParamType.String,
          false,
        ),
        useOf: convertAlgoliaParam(
          data['use_of'],
          ParamType.String,
          false,
        ),
        imageUrl: convertAlgoliaParam<String>(
          data['image_url'],
          ParamType.String,
          true,
        ),
        mrp: convertAlgoliaParam(
          data['MRP'],
          ParamType.double,
          false,
        ),
        firestoreUtilData: const FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'DocumentStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is DocumentStruct &&
        manufacturerAddress == other.manufacturerAddress &&
        manufacturerdetails == other.manufacturerdetails &&
        marketerdetails == other.marketerdetails &&
        package == other.package &&
        packagingDetail == other.packagingDetail &&
        productForm == other.productForm &&
        productId == other.productId &&
        qty == other.qty &&
        alcoholInteraction == other.alcoholInteraction &&
        benefits == other.benefits &&
        commonSideEffect == other.commonSideEffect &&
        description == other.description &&
        drivingInteraction == other.drivingInteraction &&
        id == other.id &&
        kidneyInteraction == other.kidneyInteraction &&
        lactationInteraction == other.lactationInteraction &&
        liverInteraction == other.liverInteraction &&
        manufacturers == other.manufacturers &&
        medicineType == other.medicineType &&
        name == other.name &&
        pregnancyInteraction == other.pregnancyInteraction &&
        prescriptionRequired == other.prescriptionRequired &&
        primaryUse == other.primaryUse &&
        safetyAdvise == other.safetyAdvise &&
        saltComposition == other.saltComposition &&
        storage == other.storage &&
        useOf == other.useOf &&
        listEquality.equals(imageUrl, other.imageUrl) &&
        mrp == other.mrp;
  }

  @override
  int get hashCode => const ListEquality().hash([
        manufacturerAddress,
        manufacturerdetails,
        marketerdetails,
        package,
        packagingDetail,
        productForm,
        productId,
        qty,
        alcoholInteraction,
        benefits,
        commonSideEffect,
        description,
        drivingInteraction,
        id,
        kidneyInteraction,
        lactationInteraction,
        liverInteraction,
        manufacturers,
        medicineType,
        name,
        pregnancyInteraction,
        prescriptionRequired,
        primaryUse,
        safetyAdvise,
        saltComposition,
        storage,
        useOf,
        imageUrl,
        mrp
      ]);
}

DocumentStruct createDocumentStruct({
  String? manufacturerAddress,
  String? manufacturerdetails,
  String? marketerdetails,
  String? package,
  String? packagingDetail,
  String? productForm,
  String? productId,
  String? qty,
  String? alcoholInteraction,
  String? benefits,
  String? commonSideEffect,
  String? description,
  String? drivingInteraction,
  String? id,
  String? kidneyInteraction,
  String? lactationInteraction,
  String? liverInteraction,
  String? manufacturers,
  String? medicineType,
  String? name,
  String? pregnancyInteraction,
  String? prescriptionRequired,
  String? primaryUse,
  String? safetyAdvise,
  String? saltComposition,
  String? storage,
  String? useOf,
  double? mrp,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DocumentStruct(
      manufacturerAddress: manufacturerAddress,
      manufacturerdetails: manufacturerdetails,
      marketerdetails: marketerdetails,
      package: package,
      packagingDetail: packagingDetail,
      productForm: productForm,
      productId: productId,
      qty: qty,
      alcoholInteraction: alcoholInteraction,
      benefits: benefits,
      commonSideEffect: commonSideEffect,
      description: description,
      drivingInteraction: drivingInteraction,
      id: id,
      kidneyInteraction: kidneyInteraction,
      lactationInteraction: lactationInteraction,
      liverInteraction: liverInteraction,
      manufacturers: manufacturers,
      medicineType: medicineType,
      name: name,
      pregnancyInteraction: pregnancyInteraction,
      prescriptionRequired: prescriptionRequired,
      primaryUse: primaryUse,
      safetyAdvise: safetyAdvise,
      saltComposition: saltComposition,
      storage: storage,
      useOf: useOf,
      mrp: mrp,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

DocumentStruct? updateDocumentStruct(
  DocumentStruct? document, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    document
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addDocumentStructData(
  Map<String, dynamic> firestoreData,
  DocumentStruct? document,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (document == null) {
    return;
  }
  if (document.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && document.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final documentData = getDocumentFirestoreData(document, forFieldValue);
  final nestedData = documentData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = document.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getDocumentFirestoreData(
  DocumentStruct? document, [
  bool forFieldValue = false,
]) {
  if (document == null) {
    return {};
  }
  final firestoreData = mapToFirestore(document.toMap());

  // Add any Firestore field values
  document.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDocumentListFirestoreData(
  List<DocumentStruct>? documents,
) =>
    documents?.map((e) => getDocumentFirestoreData(e, true)).toList() ?? [];
