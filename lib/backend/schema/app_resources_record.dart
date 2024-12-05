import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AppResourcesRecord extends FirestoreRecord {
  AppResourcesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "customer_support" field.
  String? _customerSupport;
  String get customerSupport => _customerSupport ?? '';
  bool hasCustomerSupport() => _customerSupport != null;

  // "default_medicine_image_cart" field.
  String? _defaultMedicineImageCart;
  String get defaultMedicineImageCart => _defaultMedicineImageCart ?? '';
  bool hasDefaultMedicineImageCart() => _defaultMedicineImageCart != null;

  // "location" field.
  String? _location;
  String get location => _location ?? '';
  bool hasLocation() => _location != null;

  // "default_lottie_aerobar" field.
  String? _defaultLottieAerobar;
  String get defaultLottieAerobar => _defaultLottieAerobar ?? '';
  bool hasDefaultLottieAerobar() => _defaultLottieAerobar != null;

  // "login_banner" field.
  String? _loginBanner;
  String get loginBanner => _loginBanner ?? '';
  bool hasLoginBanner() => _loginBanner != null;

  // "login_banner_2" field.
  String? _loginBanner2;
  String get loginBanner2 => _loginBanner2 ?? '';
  bool hasLoginBanner2() => _loginBanner2 != null;

  // "pharmacy_home" field.
  String? _pharmacyHome;
  String get pharmacyHome => _pharmacyHome ?? '';
  bool hasPharmacyHome() => _pharmacyHome != null;

  // "whatsapp_order" field.
  String? _whatsappOrder;
  String get whatsappOrder => _whatsappOrder ?? '';
  bool hasWhatsappOrder() => _whatsappOrder != null;

  // "app_version_image" field.
  String? _appVersionImage;
  String get appVersionImage => _appVersionImage ?? '';
  bool hasAppVersionImage() => _appVersionImage != null;

  void _initializeFields() {
    _customerSupport = snapshotData['customer_support'] as String?;
    _defaultMedicineImageCart =
        snapshotData['default_medicine_image_cart'] as String?;
    _location = snapshotData['location'] as String?;
    _defaultLottieAerobar = snapshotData['default_lottie_aerobar'] as String?;
    _loginBanner = snapshotData['login_banner'] as String?;
    _loginBanner2 = snapshotData['login_banner_2'] as String?;
    _pharmacyHome = snapshotData['pharmacy_home'] as String?;
    _whatsappOrder = snapshotData['whatsapp_order'] as String?;
    _appVersionImage = snapshotData['app_version_image'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('app_resources');

  static Stream<AppResourcesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AppResourcesRecord.fromSnapshot(s));

  static Future<AppResourcesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AppResourcesRecord.fromSnapshot(s));

  static AppResourcesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AppResourcesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AppResourcesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AppResourcesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AppResourcesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AppResourcesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAppResourcesRecordData({
  String? customerSupport,
  String? defaultMedicineImageCart,
  String? location,
  String? defaultLottieAerobar,
  String? loginBanner,
  String? loginBanner2,
  String? pharmacyHome,
  String? whatsappOrder,
  String? appVersionImage,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'customer_support': customerSupport,
      'default_medicine_image_cart': defaultMedicineImageCart,
      'location': location,
      'default_lottie_aerobar': defaultLottieAerobar,
      'login_banner': loginBanner,
      'login_banner_2': loginBanner2,
      'pharmacy_home': pharmacyHome,
      'whatsapp_order': whatsappOrder,
      'app_version_image': appVersionImage,
    }.withoutNulls,
  );

  return firestoreData;
}

class AppResourcesRecordDocumentEquality
    implements Equality<AppResourcesRecord> {
  const AppResourcesRecordDocumentEquality();

  @override
  bool equals(AppResourcesRecord? e1, AppResourcesRecord? e2) {
    return e1?.customerSupport == e2?.customerSupport &&
        e1?.defaultMedicineImageCart == e2?.defaultMedicineImageCart &&
        e1?.location == e2?.location &&
        e1?.defaultLottieAerobar == e2?.defaultLottieAerobar &&
        e1?.loginBanner == e2?.loginBanner &&
        e1?.loginBanner2 == e2?.loginBanner2 &&
        e1?.pharmacyHome == e2?.pharmacyHome &&
        e1?.whatsappOrder == e2?.whatsappOrder &&
        e1?.appVersionImage == e2?.appVersionImage;
  }

  @override
  int hash(AppResourcesRecord? e) => const ListEquality().hash([
        e?.customerSupport,
        e?.defaultMedicineImageCart,
        e?.location,
        e?.defaultLottieAerobar,
        e?.loginBanner,
        e?.loginBanner2,
        e?.pharmacyHome,
        e?.whatsappOrder,
        e?.appVersionImage
      ]);

  @override
  bool isValidKey(Object? o) => o is AppResourcesRecord;
}
