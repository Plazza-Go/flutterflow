// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CatalogueStruct extends FFFirebaseStruct {
  CatalogueStruct({
    String? catalogId,
    String? type,
    String? name,
    String? tag,
    String? salt,
    String? dosage,
    bool? availability,
    double? mrp,
    int? batchSize,
    String? category,
    String? description,
    bool? prescriptionRequired,
    List<String>? images,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _catalogId = catalogId,
        _type = type,
        _name = name,
        _tag = tag,
        _salt = salt,
        _dosage = dosage,
        _availability = availability,
        _mrp = mrp,
        _batchSize = batchSize,
        _category = category,
        _description = description,
        _prescriptionRequired = prescriptionRequired,
        _images = images,
        super(firestoreUtilData);

  // "catalog_id" field.
  String? _catalogId;
  String get catalogId => _catalogId ?? '';
  set catalogId(String? val) => _catalogId = val;

  bool hasCatalogId() => _catalogId != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  set type(String? val) => _type = val;

  bool hasType() => _type != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "tag" field.
  String? _tag;
  String get tag => _tag ?? '';
  set tag(String? val) => _tag = val;

  bool hasTag() => _tag != null;

  // "salt" field.
  String? _salt;
  String get salt => _salt ?? '';
  set salt(String? val) => _salt = val;

  bool hasSalt() => _salt != null;

  // "dosage" field.
  String? _dosage;
  String get dosage => _dosage ?? '';
  set dosage(String? val) => _dosage = val;

  bool hasDosage() => _dosage != null;

  // "availability" field.
  bool? _availability;
  bool get availability => _availability ?? false;
  set availability(bool? val) => _availability = val;

  bool hasAvailability() => _availability != null;

  // "mrp" field.
  double? _mrp;
  double get mrp => _mrp ?? 0.0;
  set mrp(double? val) => _mrp = val;

  void incrementMrp(double amount) => mrp = mrp + amount;

  bool hasMrp() => _mrp != null;

  // "batch_size" field.
  int? _batchSize;
  int get batchSize => _batchSize ?? 0;
  set batchSize(int? val) => _batchSize = val;

  void incrementBatchSize(int amount) => batchSize = batchSize + amount;

  bool hasBatchSize() => _batchSize != null;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  set category(String? val) => _category = val;

  bool hasCategory() => _category != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  // "prescription_required" field.
  bool? _prescriptionRequired;
  bool get prescriptionRequired => _prescriptionRequired ?? false;
  set prescriptionRequired(bool? val) => _prescriptionRequired = val;

  bool hasPrescriptionRequired() => _prescriptionRequired != null;

  // "images" field.
  List<String>? _images;
  List<String> get images => _images ?? const [];
  set images(List<String>? val) => _images = val;

  void updateImages(Function(List<String>) updateFn) {
    updateFn(_images ??= []);
  }

  bool hasImages() => _images != null;

  static CatalogueStruct fromMap(Map<String, dynamic> data) => CatalogueStruct(
        catalogId: data['catalog_id'] as String?,
        type: data['type'] as String?,
        name: data['name'] as String?,
        tag: data['tag'] as String?,
        salt: data['salt'] as String?,
        dosage: data['dosage'] as String?,
        availability: data['availability'] as bool?,
        mrp: castToType<double>(data['mrp']),
        batchSize: castToType<int>(data['batch_size']),
        category: data['category'] as String?,
        description: data['description'] as String?,
        prescriptionRequired: data['prescription_required'] as bool?,
        images: getDataList(data['images']),
      );

  static CatalogueStruct? maybeFromMap(dynamic data) => data is Map
      ? CatalogueStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'catalog_id': _catalogId,
        'type': _type,
        'name': _name,
        'tag': _tag,
        'salt': _salt,
        'dosage': _dosage,
        'availability': _availability,
        'mrp': _mrp,
        'batch_size': _batchSize,
        'category': _category,
        'description': _description,
        'prescription_required': _prescriptionRequired,
        'images': _images,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'catalog_id': serializeParam(
          _catalogId,
          ParamType.String,
        ),
        'type': serializeParam(
          _type,
          ParamType.String,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'tag': serializeParam(
          _tag,
          ParamType.String,
        ),
        'salt': serializeParam(
          _salt,
          ParamType.String,
        ),
        'dosage': serializeParam(
          _dosage,
          ParamType.String,
        ),
        'availability': serializeParam(
          _availability,
          ParamType.bool,
        ),
        'mrp': serializeParam(
          _mrp,
          ParamType.double,
        ),
        'batch_size': serializeParam(
          _batchSize,
          ParamType.int,
        ),
        'category': serializeParam(
          _category,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'prescription_required': serializeParam(
          _prescriptionRequired,
          ParamType.bool,
        ),
        'images': serializeParam(
          _images,
          ParamType.String,
          isList: true,
        ),
      }.withoutNulls;

  static CatalogueStruct fromSerializableMap(Map<String, dynamic> data) =>
      CatalogueStruct(
        catalogId: deserializeParam(
          data['catalog_id'],
          ParamType.String,
          false,
        ),
        type: deserializeParam(
          data['type'],
          ParamType.String,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        tag: deserializeParam(
          data['tag'],
          ParamType.String,
          false,
        ),
        salt: deserializeParam(
          data['salt'],
          ParamType.String,
          false,
        ),
        dosage: deserializeParam(
          data['dosage'],
          ParamType.String,
          false,
        ),
        availability: deserializeParam(
          data['availability'],
          ParamType.bool,
          false,
        ),
        mrp: deserializeParam(
          data['mrp'],
          ParamType.double,
          false,
        ),
        batchSize: deserializeParam(
          data['batch_size'],
          ParamType.int,
          false,
        ),
        category: deserializeParam(
          data['category'],
          ParamType.String,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        prescriptionRequired: deserializeParam(
          data['prescription_required'],
          ParamType.bool,
          false,
        ),
        images: deserializeParam<String>(
          data['images'],
          ParamType.String,
          true,
        ),
      );

  static CatalogueStruct fromAlgoliaData(Map<String, dynamic> data) =>
      CatalogueStruct(
        catalogId: convertAlgoliaParam(
          data['catalog_id'],
          ParamType.String,
          false,
        ),
        type: convertAlgoliaParam(
          data['type'],
          ParamType.String,
          false,
        ),
        name: convertAlgoliaParam(
          data['name'],
          ParamType.String,
          false,
        ),
        tag: convertAlgoliaParam(
          data['tag'],
          ParamType.String,
          false,
        ),
        salt: convertAlgoliaParam(
          data['salt'],
          ParamType.String,
          false,
        ),
        dosage: convertAlgoliaParam(
          data['dosage'],
          ParamType.String,
          false,
        ),
        availability: convertAlgoliaParam(
          data['availability'],
          ParamType.bool,
          false,
        ),
        mrp: convertAlgoliaParam(
          data['mrp'],
          ParamType.double,
          false,
        ),
        batchSize: convertAlgoliaParam(
          data['batch_size'],
          ParamType.int,
          false,
        ),
        category: convertAlgoliaParam(
          data['category'],
          ParamType.String,
          false,
        ),
        description: convertAlgoliaParam(
          data['description'],
          ParamType.String,
          false,
        ),
        prescriptionRequired: convertAlgoliaParam(
          data['prescription_required'],
          ParamType.bool,
          false,
        ),
        images: convertAlgoliaParam<String>(
          data['images'],
          ParamType.String,
          true,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'CatalogueStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is CatalogueStruct &&
        catalogId == other.catalogId &&
        type == other.type &&
        name == other.name &&
        tag == other.tag &&
        salt == other.salt &&
        dosage == other.dosage &&
        availability == other.availability &&
        mrp == other.mrp &&
        batchSize == other.batchSize &&
        category == other.category &&
        description == other.description &&
        prescriptionRequired == other.prescriptionRequired &&
        listEquality.equals(images, other.images);
  }

  @override
  int get hashCode => const ListEquality().hash([
        catalogId,
        type,
        name,
        tag,
        salt,
        dosage,
        availability,
        mrp,
        batchSize,
        category,
        description,
        prescriptionRequired,
        images
      ]);
}

CatalogueStruct createCatalogueStruct({
  String? catalogId,
  String? type,
  String? name,
  String? tag,
  String? salt,
  String? dosage,
  bool? availability,
  double? mrp,
  int? batchSize,
  String? category,
  String? description,
  bool? prescriptionRequired,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CatalogueStruct(
      catalogId: catalogId,
      type: type,
      name: name,
      tag: tag,
      salt: salt,
      dosage: dosage,
      availability: availability,
      mrp: mrp,
      batchSize: batchSize,
      category: category,
      description: description,
      prescriptionRequired: prescriptionRequired,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CatalogueStruct? updateCatalogueStruct(
  CatalogueStruct? catalogue, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    catalogue
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCatalogueStructData(
  Map<String, dynamic> firestoreData,
  CatalogueStruct? catalogue,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (catalogue == null) {
    return;
  }
  if (catalogue.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && catalogue.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final catalogueData = getCatalogueFirestoreData(catalogue, forFieldValue);
  final nestedData = catalogueData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = catalogue.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCatalogueFirestoreData(
  CatalogueStruct? catalogue, [
  bool forFieldValue = false,
]) {
  if (catalogue == null) {
    return {};
  }
  final firestoreData = mapToFirestore(catalogue.toMap());

  // Add any Firestore field values
  catalogue.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCatalogueListFirestoreData(
  List<CatalogueStruct>? catalogues,
) =>
    catalogues?.map((e) => getCatalogueFirestoreData(e, true)).toList() ?? [];
