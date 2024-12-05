import 'package:flutter/material.dart';
import '/backend/schema/structs/cart_medicine_details_struct.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/app_state.dart';

class CartManager {
  final FFAppState _appState = FFAppState();
  final Map<String, CartMedicineDetailsStruct> _pendingUpdates = {};
  final Map<String, String> _pendingDeletes = {}; // productId -> recordId
  bool _hasErrors = false;
  static const int _maxRetries = 3;

  int _toPaise(double rupees) => (rupees * 100).round();
  double _toRupees(int paise) => paise / 100;

  void addToCart(CartMedicineDetailsStruct item) {
    try {
      _pendingUpdates[item.productID] = item;
      _appState.addToCartMedicineDetails(item);
      _recalculateTotal();
    } catch (e) {
      _hasErrors = true;
      print('Error adding to cart: $e');
    }
  }

  void removeFromCart(String productId) {
    try {
      final index = _appState.CartMedicineDetails.indexWhere(
          (item) => item.productID == productId);

      if (index != -1) {
        final item = _appState.CartMedicineDetails[index];
        _pendingDeletes[productId] = item.recordid;
        _pendingUpdates.remove(productId);

        _appState.removeFromCartMedicineDetails(item);
        _recalculateTotal();
      }
    } catch (e) {
      _hasErrors = true;
      print('Error removing from cart: $e');
    }
  }

  void updateQuantity(String productId, int newQuantity) {
    try {
      if (newQuantity < 0) throw Exception('Quantity cannot be negative');

      if (newQuantity == 0) {
        removeFromCart(productId);
        return;
      }

      final index = _appState.CartMedicineDetails.indexWhere(
          (item) => item.productID == productId);

      if (index != -1) {
        final item = _appState.CartMedicineDetails[index];
        final newPriceInPaise = _toPaise(item.medicineRate) * newQuantity;

        _appState.updateCartMedicineDetailsAtIndex(
          index,
          (item) => item
            ..quantity = newQuantity
            ..plazzaPrice = _toRupees(newPriceInPaise),
        );

        _pendingUpdates[productId] = _appState.CartMedicineDetails[index];
        _recalculateTotal();
      }
    } catch (e) {
      _hasErrors = true;
      print('Error updating quantity: $e');
    }
  }

  void _recalculateTotal() {
    try {
      int totalInPaise = 0;
      for (var item in _appState.CartMedicineDetails) {
        totalInPaise += _toPaise(item.plazzaPrice);
      }
      _appState.itemsPrice = _toRupees(totalInPaise);
    } catch (e) {
      _hasErrors = true;
      print('Error calculating total: $e');
    }
  }

  Future<bool> _retryOperation(
      Future<ApiCallResponse> Function() operation) async {
    for (int i = 0; i < _maxRetries; i++) {
      try {
        final response = await operation();
        if (response.statusCode == 200) return true;
      } catch (e) {
        if (i == _maxRetries - 1) throw e;
        await Future.delayed(Duration(seconds: i + 1)); // Exponential backoff
      }
    }
    return false;
  }

  Future<bool> commitChanges() async {
    if (_hasErrors) {
      print('Cannot commit due to previous errors');
      return false;
    }

    try {
      // Handle deletions first
      for (var recordId in _pendingDeletes.values) {
        await _retryOperation(() => AirtableApiGroup.deleteCall.call(
              tableName: 'tblN6VE6bxbIgu0z3',
              recordId: recordId,
            ));
      }

      // Handle updates
      for (var item in _pendingUpdates.values) {
        await _retryOperation(
            () => AirtableApiGroup.updateMedicineDetailsCall.call(
                  recordId: item.recordid,
                  quantity: item.quantity.toDouble(),
                  totalprice: item.plazzaPrice,
                ));
      }

      _pendingUpdates.clear();
      _pendingDeletes.clear();
      _hasErrors = false;
      return true;
    } catch (e) {
      _hasErrors = true;
      print('Error committing changes: $e');
      return false;
    }
  }

  void clearCart() {
    try {
      for (var item in _appState.CartMedicineDetails) {
        _pendingDeletes[item.productID] = item.recordid;
      }
      _appState.CartMedicineDetails = [];
      _pendingUpdates.clear();
      _recalculateTotal();
    } catch (e) {
      _hasErrors = true;
      print('Error clearing cart: $e');
    }
  }

  double getItemPrice(double medicineRate, int quantity) {
    return medicineRate * quantity;
  }

  double getItemsPrice() {
    return _appState.itemsPrice;
  }

  Future<void> initializePrice(double itemTotal) async {
    _appState.itemsPrice = itemTotal;
  }

  Future<void> decrementQuantity({
    required String productId,
    required int currentCount,
    required String medicineRecordId,
    required String? orderSource,
    required String? orderRecordId,
    required dynamic medicineRate,
  }) async {
    if (currentCount > 1) {
      // Just update local state and add to pending updates
      updateQuantity(productId, currentCount - 1);
    } else {
      // Just remove from cart (which handles pending deletes)
      removeFromCart(productId);
    }
  }

  Future<void> incrementQuantity({
    required String productId,
    required int currentCount,
    required String medicineRecordId,
    required String? orderSource,
    required dynamic medicineRate,
  }) async {
    // Just update local state and add to pending updates
    updateQuantity(productId, currentCount + 1);
  }

  bool getDontHavePrescriptionStatus() {
    return _appState.Donothaveprescription;
  }

  bool hasPrescriptionItems() {
    return _appState.CartMedicineDetails.any(
      (item) => item.prescriptionRequired.toLowerCase() == 'true',
    );
  }

  Future<void> showPrescriptionModal(BuildContext context) async {
    // Implement your modal logic here
    // For now, just return to avoid errors
    return;
  }

  Future<void> handlePrescriptionUpload(String orderId) async {
    // Implement prescription upload logic
    // For now, just return to avoid errors
    return;
  }

  List<CartMedicineDetailsStruct> getPrescriptionRequiredItems() {
    return _appState.CartMedicineDetails.where(
      (item) => item.prescriptionRequired.toLowerCase() == 'true',
    ).toList();
  }

  bool getPrescriptionStatus() {
    return _appState.IsNotmandatory;
  }

  bool isCartEmpty() {
    return _appState.CartMedicineDetails.isEmpty;
  }
}
