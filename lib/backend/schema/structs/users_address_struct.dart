// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class UsersAddressStruct extends FFFirebaseStruct {
  UsersAddressStruct({
    String? tag,
    String? phoneNumber,
    String? floorNo,
    String? block,
    String? city,
    String? state,
    int? pinCode,
    String? houseNo,
    String? landmark,
    LatLng? coordinates,
    bool? isPrimary,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _tag = tag,
        _phoneNumber = phoneNumber,
        _floorNo = floorNo,
        _block = block,
        _city = city,
        _state = state,
        _pinCode = pinCode,
        _houseNo = houseNo,
        _landmark = landmark,
        _coordinates = coordinates,
        _isPrimary = isPrimary,
        super(firestoreUtilData);

  // "tag" field.
  String? _tag;
  String get tag => _tag ?? '';
  set tag(String? val) => _tag = val;

  bool hasTag() => _tag != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  set phoneNumber(String? val) => _phoneNumber = val;

  bool hasPhoneNumber() => _phoneNumber != null;

  // "floor_no" field.
  String? _floorNo;
  String get floorNo => _floorNo ?? '';
  set floorNo(String? val) => _floorNo = val;

  bool hasFloorNo() => _floorNo != null;

  // "block" field.
  String? _block;
  String get block => _block ?? '';
  set block(String? val) => _block = val;

  bool hasBlock() => _block != null;

  // "city" field.
  String? _city;
  String get city => _city ?? '';
  set city(String? val) => _city = val;

  bool hasCity() => _city != null;

  // "state" field.
  String? _state;
  String get state => _state ?? '';
  set state(String? val) => _state = val;

  bool hasState() => _state != null;

  // "pin_code" field.
  int? _pinCode;
  int get pinCode => _pinCode ?? 0;
  set pinCode(int? val) => _pinCode = val;

  void incrementPinCode(int amount) => pinCode = pinCode + amount;

  bool hasPinCode() => _pinCode != null;

  // "house_no" field.
  String? _houseNo;
  String get houseNo => _houseNo ?? '';
  set houseNo(String? val) => _houseNo = val;

  bool hasHouseNo() => _houseNo != null;

  // "landmark" field.
  String? _landmark;
  String get landmark => _landmark ?? '';
  set landmark(String? val) => _landmark = val;

  bool hasLandmark() => _landmark != null;

  // "coordinates" field.
  LatLng? _coordinates;
  LatLng? get coordinates => _coordinates;
  set coordinates(LatLng? val) => _coordinates = val;

  bool hasCoordinates() => _coordinates != null;

  // "is_primary" field.
  bool? _isPrimary;
  bool get isPrimary => _isPrimary ?? false;
  set isPrimary(bool? val) => _isPrimary = val;

  bool hasIsPrimary() => _isPrimary != null;

  static UsersAddressStruct fromMap(Map<String, dynamic> data) =>
      UsersAddressStruct(
        tag: data['tag'] as String?,
        phoneNumber: data['phone_number'] as String?,
        floorNo: data['floor_no'] as String?,
        block: data['block'] as String?,
        city: data['city'] as String?,
        state: data['state'] as String?,
        pinCode: castToType<int>(data['pin_code']),
        houseNo: data['house_no'] as String?,
        landmark: data['landmark'] as String?,
        coordinates: data['coordinates'] as LatLng?,
        isPrimary: data['is_primary'] as bool?,
      );

  static UsersAddressStruct? maybeFromMap(dynamic data) => data is Map
      ? UsersAddressStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'tag': _tag,
        'phone_number': _phoneNumber,
        'floor_no': _floorNo,
        'block': _block,
        'city': _city,
        'state': _state,
        'pin_code': _pinCode,
        'house_no': _houseNo,
        'landmark': _landmark,
        'coordinates': _coordinates,
        'is_primary': _isPrimary,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'tag': serializeParam(
          _tag,
          ParamType.String,
        ),
        'phone_number': serializeParam(
          _phoneNumber,
          ParamType.String,
        ),
        'floor_no': serializeParam(
          _floorNo,
          ParamType.String,
        ),
        'block': serializeParam(
          _block,
          ParamType.String,
        ),
        'city': serializeParam(
          _city,
          ParamType.String,
        ),
        'state': serializeParam(
          _state,
          ParamType.String,
        ),
        'pin_code': serializeParam(
          _pinCode,
          ParamType.int,
        ),
        'house_no': serializeParam(
          _houseNo,
          ParamType.String,
        ),
        'landmark': serializeParam(
          _landmark,
          ParamType.String,
        ),
        'coordinates': serializeParam(
          _coordinates,
          ParamType.LatLng,
        ),
        'is_primary': serializeParam(
          _isPrimary,
          ParamType.bool,
        ),
      }.withoutNulls;

  static UsersAddressStruct fromSerializableMap(Map<String, dynamic> data) =>
      UsersAddressStruct(
        tag: deserializeParam(
          data['tag'],
          ParamType.String,
          false,
        ),
        phoneNumber: deserializeParam(
          data['phone_number'],
          ParamType.String,
          false,
        ),
        floorNo: deserializeParam(
          data['floor_no'],
          ParamType.String,
          false,
        ),
        block: deserializeParam(
          data['block'],
          ParamType.String,
          false,
        ),
        city: deserializeParam(
          data['city'],
          ParamType.String,
          false,
        ),
        state: deserializeParam(
          data['state'],
          ParamType.String,
          false,
        ),
        pinCode: deserializeParam(
          data['pin_code'],
          ParamType.int,
          false,
        ),
        houseNo: deserializeParam(
          data['house_no'],
          ParamType.String,
          false,
        ),
        landmark: deserializeParam(
          data['landmark'],
          ParamType.String,
          false,
        ),
        coordinates: deserializeParam(
          data['coordinates'],
          ParamType.LatLng,
          false,
        ),
        isPrimary: deserializeParam(
          data['is_primary'],
          ParamType.bool,
          false,
        ),
      );

  static UsersAddressStruct fromAlgoliaData(Map<String, dynamic> data) =>
      UsersAddressStruct(
        tag: convertAlgoliaParam(
          data['tag'],
          ParamType.String,
          false,
        ),
        phoneNumber: convertAlgoliaParam(
          data['phone_number'],
          ParamType.String,
          false,
        ),
        floorNo: convertAlgoliaParam(
          data['floor_no'],
          ParamType.String,
          false,
        ),
        block: convertAlgoliaParam(
          data['block'],
          ParamType.String,
          false,
        ),
        city: convertAlgoliaParam(
          data['city'],
          ParamType.String,
          false,
        ),
        state: convertAlgoliaParam(
          data['state'],
          ParamType.String,
          false,
        ),
        pinCode: convertAlgoliaParam(
          data['pin_code'],
          ParamType.int,
          false,
        ),
        houseNo: convertAlgoliaParam(
          data['house_no'],
          ParamType.String,
          false,
        ),
        landmark: convertAlgoliaParam(
          data['landmark'],
          ParamType.String,
          false,
        ),
        coordinates: convertAlgoliaParam(
          data,
          ParamType.LatLng,
          false,
        ),
        isPrimary: convertAlgoliaParam(
          data['is_primary'],
          ParamType.bool,
          false,
        ),
        firestoreUtilData: const FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'UsersAddressStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UsersAddressStruct &&
        tag == other.tag &&
        phoneNumber == other.phoneNumber &&
        floorNo == other.floorNo &&
        block == other.block &&
        city == other.city &&
        state == other.state &&
        pinCode == other.pinCode &&
        houseNo == other.houseNo &&
        landmark == other.landmark &&
        coordinates == other.coordinates &&
        isPrimary == other.isPrimary;
  }

  @override
  int get hashCode => const ListEquality().hash([
        tag,
        phoneNumber,
        floorNo,
        block,
        city,
        state,
        pinCode,
        houseNo,
        landmark,
        coordinates,
        isPrimary
      ]);
}

UsersAddressStruct createUsersAddressStruct({
  String? tag,
  String? phoneNumber,
  String? floorNo,
  String? block,
  String? city,
  String? state,
  int? pinCode,
  String? houseNo,
  String? landmark,
  LatLng? coordinates,
  bool? isPrimary,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    UsersAddressStruct(
      tag: tag,
      phoneNumber: phoneNumber,
      floorNo: floorNo,
      block: block,
      city: city,
      state: state,
      pinCode: pinCode,
      houseNo: houseNo,
      landmark: landmark,
      coordinates: coordinates,
      isPrimary: isPrimary,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

UsersAddressStruct? updateUsersAddressStruct(
  UsersAddressStruct? usersAddress, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    usersAddress
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addUsersAddressStructData(
  Map<String, dynamic> firestoreData,
  UsersAddressStruct? usersAddress,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (usersAddress == null) {
    return;
  }
  if (usersAddress.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && usersAddress.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final usersAddressData =
      getUsersAddressFirestoreData(usersAddress, forFieldValue);
  final nestedData =
      usersAddressData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = usersAddress.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getUsersAddressFirestoreData(
  UsersAddressStruct? usersAddress, [
  bool forFieldValue = false,
]) {
  if (usersAddress == null) {
    return {};
  }
  final firestoreData = mapToFirestore(usersAddress.toMap());

  // Add any Firestore field values
  usersAddress.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getUsersAddressListFirestoreData(
  List<UsersAddressStruct>? usersAddresss,
) =>
    usersAddresss?.map((e) => getUsersAddressFirestoreData(e, true)).toList() ??
    [];
