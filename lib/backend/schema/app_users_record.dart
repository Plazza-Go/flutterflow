import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AppUsersRecord extends FirestoreRecord {
  AppUsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "gender" field.
  String? _gender;
  String get gender => _gender ?? '';
  bool hasGender() => _gender != null;

  // "account_status" field.
  String? _accountStatus;
  String get accountStatus => _accountStatus ?? '';
  bool hasAccountStatus() => _accountStatus != null;

  // "location" field.
  LatLng? _location;
  LatLng? get location => _location;
  bool hasLocation() => _location != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "last_app_open" field.
  DateTime? _lastAppOpen;
  DateTime? get lastAppOpen => _lastAppOpen;
  bool hasLastAppOpen() => _lastAppOpen != null;

  // "last_used_location" field.
  LatLng? _lastUsedLocation;
  LatLng? get lastUsedLocation => _lastUsedLocation;
  bool hasLastUsedLocation() => _lastUsedLocation != null;

  // "date_of_birth" field.
  DateTime? _dateOfBirth;
  DateTime? get dateOfBirth => _dateOfBirth;
  bool hasDateOfBirth() => _dateOfBirth != null;

  // "user_address" field.
  List<UsersAddressStruct>? _userAddress;
  List<UsersAddressStruct> get userAddress => _userAddress ?? const [];
  bool hasUserAddress() => _userAddress != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "first_name" field.
  String? _firstName;
  String get firstName => _firstName ?? '';
  bool hasFirstName() => _firstName != null;

  // "last_name" field.
  String? _lastName;
  String get lastName => _lastName ?? '';
  bool hasLastName() => _lastName != null;

  // "user_record_id" field.
  String? _userRecordId;
  String get userRecordId => _userRecordId ?? '';
  bool hasUserRecordId() => _userRecordId != null;

  // "profile_completion" field.
  bool? _profileCompletion;
  bool get profileCompletion => _profileCompletion ?? false;
  bool hasProfileCompletion() => _profileCompletion != null;

  // "prescription_url_list" field.
  List<String>? _prescriptionUrlList;
  List<String> get prescriptionUrlList => _prescriptionUrlList ?? const [];
  bool hasPrescriptionUrlList() => _prescriptionUrlList != null;

  void _initializeFields() {
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _gender = snapshotData['gender'] as String?;
    _accountStatus = snapshotData['account_status'] as String?;
    _location = snapshotData['location'] as LatLng?;
    _email = snapshotData['email'] as String?;
    _lastAppOpen = snapshotData['last_app_open'] as DateTime?;
    _lastUsedLocation = snapshotData['last_used_location'] as LatLng?;
    _dateOfBirth = snapshotData['date_of_birth'] as DateTime?;
    _userAddress = getStructList(
      snapshotData['user_address'],
      UsersAddressStruct.fromMap,
    );
    _displayName = snapshotData['display_name'] as String?;
    _firstName = snapshotData['first_name'] as String?;
    _lastName = snapshotData['last_name'] as String?;
    _userRecordId = snapshotData['user_record_id'] as String?;
    _profileCompletion = snapshotData['profile_completion'] as bool?;
    _prescriptionUrlList = getDataList(snapshotData['prescription_url_list']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('app_users');

  static Stream<AppUsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AppUsersRecord.fromSnapshot(s));

  static Future<AppUsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AppUsersRecord.fromSnapshot(s));

  static AppUsersRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AppUsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AppUsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AppUsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AppUsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AppUsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAppUsersRecordData({
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  String? gender,
  String? accountStatus,
  LatLng? location,
  String? email,
  DateTime? lastAppOpen,
  LatLng? lastUsedLocation,
  DateTime? dateOfBirth,
  String? displayName,
  String? firstName,
  String? lastName,
  String? userRecordId,
  bool? profileCompletion,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'gender': gender,
      'account_status': accountStatus,
      'location': location,
      'email': email,
      'last_app_open': lastAppOpen,
      'last_used_location': lastUsedLocation,
      'date_of_birth': dateOfBirth,
      'display_name': displayName,
      'first_name': firstName,
      'last_name': lastName,
      'user_record_id': userRecordId,
      'profile_completion': profileCompletion,
    }.withoutNulls,
  );

  return firestoreData;
}

class AppUsersRecordDocumentEquality implements Equality<AppUsersRecord> {
  const AppUsersRecordDocumentEquality();

  @override
  bool equals(AppUsersRecord? e1, AppUsersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.gender == e2?.gender &&
        e1?.accountStatus == e2?.accountStatus &&
        e1?.location == e2?.location &&
        e1?.email == e2?.email &&
        e1?.lastAppOpen == e2?.lastAppOpen &&
        e1?.lastUsedLocation == e2?.lastUsedLocation &&
        e1?.dateOfBirth == e2?.dateOfBirth &&
        listEquality.equals(e1?.userAddress, e2?.userAddress) &&
        e1?.displayName == e2?.displayName &&
        e1?.firstName == e2?.firstName &&
        e1?.lastName == e2?.lastName &&
        e1?.userRecordId == e2?.userRecordId &&
        e1?.profileCompletion == e2?.profileCompletion &&
        listEquality.equals(e1?.prescriptionUrlList, e2?.prescriptionUrlList);
  }

  @override
  int hash(AppUsersRecord? e) => const ListEquality().hash([
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.gender,
        e?.accountStatus,
        e?.location,
        e?.email,
        e?.lastAppOpen,
        e?.lastUsedLocation,
        e?.dateOfBirth,
        e?.userAddress,
        e?.displayName,
        e?.firstName,
        e?.lastName,
        e?.userRecordId,
        e?.profileCompletion,
        e?.prescriptionUrlList
      ]);

  @override
  bool isValidKey(Object? o) => o is AppUsersRecord;
}
