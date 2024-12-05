import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      if (prefs.containsKey('ff_width')) {
        try {
          final serializedData = prefs.getString('ff_width') ?? '{}';
          _width =
              DeviceWidthStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      if (prefs.containsKey('ff_cartId')) {
        try {
          final serializedData = prefs.getString('ff_cartId') ?? '{}';
          _cartId =
              CartDetailsStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _CartMedicineDetails = prefs
              .getStringList('ff_CartMedicineDetails')
              ?.map((x) {
                try {
                  return CartMedicineDetailsStruct.fromSerializableMap(
                      jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _CartMedicineDetails;
    });
    _safeInit(() {
      _medicinecartApp = prefs
              .getStringList('ff_medicinecartApp')
              ?.map((x) {
                try {
                  return MedicineCartStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _medicinecartApp;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  DeviceWidthStruct _width = DeviceWidthStruct.fromSerializableMap(
      jsonDecode('{\"small\":\"500\",\"medium\":\"800\",\"large\":\"500\"}'));
  DeviceWidthStruct get width => _width;
  set width(DeviceWidthStruct value) {
    _width = value;
    prefs.setString('ff_width', value.serialize());
  }

  void updateWidthStruct(Function(DeviceWidthStruct) updateFn) {
    updateFn(_width);
    prefs.setString('ff_width', _width.serialize());
  }

  AppAddressStruct _address = AppAddressStruct();
  AppAddressStruct get address => _address;
  set address(AppAddressStruct value) {
    _address = value;
  }

  void updateAddressStruct(Function(AppAddressStruct) updateFn) {
    updateFn(_address);
  }

  List<PrescriptiondataStruct> _prescritiondata = [];
  List<PrescriptiondataStruct> get prescritiondata => _prescritiondata;
  set prescritiondata(List<PrescriptiondataStruct> value) {
    _prescritiondata = value;
  }

  void addToPrescritiondata(PrescriptiondataStruct value) {
    prescritiondata.add(value);
  }

  void removeFromPrescritiondata(PrescriptiondataStruct value) {
    prescritiondata.remove(value);
  }

  void removeAtIndexFromPrescritiondata(int index) {
    prescritiondata.removeAt(index);
  }

  void updatePrescritiondataAtIndex(
    int index,
    PrescriptiondataStruct Function(PrescriptiondataStruct) updateFn,
  ) {
    prescritiondata[index] = updateFn(_prescritiondata[index]);
  }

  void insertAtIndexInPrescritiondata(int index, PrescriptiondataStruct value) {
    prescritiondata.insert(index, value);
  }

  double _itemsPrice = 0.0;
  double get itemsPrice => _itemsPrice;
  set itemsPrice(double value) {
    _itemsPrice = value;
  }

  List<PrescriptionStruct> _prescriptionAppside = [];
  List<PrescriptionStruct> get prescriptionAppside => _prescriptionAppside;
  set prescriptionAppside(List<PrescriptionStruct> value) {
    _prescriptionAppside = value;
  }

  void addToPrescriptionAppside(PrescriptionStruct value) {
    prescriptionAppside.add(value);
  }

  void removeFromPrescriptionAppside(PrescriptionStruct value) {
    prescriptionAppside.remove(value);
  }

  void removeAtIndexFromPrescriptionAppside(int index) {
    prescriptionAppside.removeAt(index);
  }

  void updatePrescriptionAppsideAtIndex(
    int index,
    PrescriptionStruct Function(PrescriptionStruct) updateFn,
  ) {
    prescriptionAppside[index] = updateFn(_prescriptionAppside[index]);
  }

  void insertAtIndexInPrescriptionAppside(int index, PrescriptionStruct value) {
    prescriptionAppside.insert(index, value);
  }

  ServiceabilityStruct _Serviceability =
      ServiceabilityStruct.fromSerializableMap(jsonDecode('{}'));
  ServiceabilityStruct get Serviceability => _Serviceability;
  set Serviceability(ServiceabilityStruct value) {
    _Serviceability = value;
  }

  void updateServiceabilityStruct(Function(ServiceabilityStruct) updateFn) {
    updateFn(_Serviceability);
  }

  CartDetailsStruct _cartId = CartDetailsStruct();
  CartDetailsStruct get cartId => _cartId;
  set cartId(CartDetailsStruct value) {
    _cartId = value;
    prefs.setString('ff_cartId', value.serialize());
  }

  void updateCartIdStruct(Function(CartDetailsStruct) updateFn) {
    updateFn(_cartId);
    prefs.setString('ff_cartId', _cartId.serialize());
  }

  List<CartMedicineDetailsStruct> _CartMedicineDetails = [];
  List<CartMedicineDetailsStruct> get CartMedicineDetails =>
      _CartMedicineDetails;
  set CartMedicineDetails(List<CartMedicineDetailsStruct> value) {
    _CartMedicineDetails = value;
    prefs.setStringList(
        'ff_CartMedicineDetails', value.map((x) => x.serialize()).toList());
  }

  void addToCartMedicineDetails(CartMedicineDetailsStruct value) {
    CartMedicineDetails.add(value);
    prefs.setStringList('ff_CartMedicineDetails',
        _CartMedicineDetails.map((x) => x.serialize()).toList());
  }

  void removeFromCartMedicineDetails(CartMedicineDetailsStruct value) {
    CartMedicineDetails.remove(value);
    prefs.setStringList('ff_CartMedicineDetails',
        _CartMedicineDetails.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromCartMedicineDetails(int index) {
    CartMedicineDetails.removeAt(index);
    prefs.setStringList('ff_CartMedicineDetails',
        _CartMedicineDetails.map((x) => x.serialize()).toList());
  }

  void updateCartMedicineDetailsAtIndex(
    int index,
    CartMedicineDetailsStruct Function(CartMedicineDetailsStruct) updateFn,
  ) {
    CartMedicineDetails[index] = updateFn(_CartMedicineDetails[index]);
    prefs.setStringList('ff_CartMedicineDetails',
        _CartMedicineDetails.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInCartMedicineDetails(
      int index, CartMedicineDetailsStruct value) {
    CartMedicineDetails.insert(index, value);
    prefs.setStringList('ff_CartMedicineDetails',
        _CartMedicineDetails.map((x) => x.serialize()).toList());
  }

  String _currentLocation = '';
  String get currentLocation => _currentLocation;
  set currentLocation(String value) {
    _currentLocation = value;
  }

  bool _customNavBar = false;
  bool get customNavBar => _customNavBar;
  set customNavBar(bool value) {
    _customNavBar = value;
  }

  bool _profileToOrderHistory = false;
  bool get profileToOrderHistory => _profileToOrderHistory;
  set profileToOrderHistory(bool value) {
    _profileToOrderHistory = value;
  }

  bool _Donothaveprescription = false;
  bool get Donothaveprescription => _Donothaveprescription;
  set Donothaveprescription(bool value) {
    _Donothaveprescription = value;
  }

  bool _IsNotmandatory = false;
  bool get IsNotmandatory => _IsNotmandatory;
  set IsNotmandatory(bool value) {
    _IsNotmandatory = value;
  }

  int _cachehome = 0;
  int get cachehome => _cachehome;
  set cachehome(int value) {
    _cachehome = value;
  }

  String _RebuildPage = '';
  String get RebuildPage => _RebuildPage;
  set RebuildPage(String value) {
    _RebuildPage = value;
  }

  List<MedicineCartStruct> _medicinecartApp = [];
  List<MedicineCartStruct> get medicinecartApp => _medicinecartApp;
  set medicinecartApp(List<MedicineCartStruct> value) {
    _medicinecartApp = value;
    prefs.setStringList(
        'ff_medicinecartApp', value.map((x) => x.serialize()).toList());
  }

  void addToMedicinecartApp(MedicineCartStruct value) {
    medicinecartApp.add(value);
    prefs.setStringList('ff_medicinecartApp',
        _medicinecartApp.map((x) => x.serialize()).toList());
  }

  void removeFromMedicinecartApp(MedicineCartStruct value) {
    medicinecartApp.remove(value);
    prefs.setStringList('ff_medicinecartApp',
        _medicinecartApp.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromMedicinecartApp(int index) {
    medicinecartApp.removeAt(index);
    prefs.setStringList('ff_medicinecartApp',
        _medicinecartApp.map((x) => x.serialize()).toList());
  }

  void updateMedicinecartAppAtIndex(
    int index,
    MedicineCartStruct Function(MedicineCartStruct) updateFn,
  ) {
    medicinecartApp[index] = updateFn(_medicinecartApp[index]);
    prefs.setStringList('ff_medicinecartApp',
        _medicinecartApp.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInMedicinecartApp(int index, MedicineCartStruct value) {
    medicinecartApp.insert(index, value);
    prefs.setStringList('ff_medicinecartApp',
        _medicinecartApp.map((x) => x.serialize()).toList());
  }

  final _appAssetsManager = FutureRequestManager<List<AppResourcesRecord>>();
  Future<List<AppResourcesRecord>> appAssets({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<AppResourcesRecord>> Function() requestFn,
  }) =>
      _appAssetsManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearAppAssetsCache() => _appAssetsManager.clear();
  void clearAppAssetsCacheKey(String? uniqueKey) =>
      _appAssetsManager.clearRequest(uniqueKey);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
