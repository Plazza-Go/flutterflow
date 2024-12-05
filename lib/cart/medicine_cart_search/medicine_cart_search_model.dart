import '/backend/api_requests/api_calls.dart';
import '/cart/cart_items/cart_items_widget.dart';
import '/cart/openperscription_required/openperscription_required_widget.dart';
import '/cart/prescription_requied/prescription_requied_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'medicine_cart_search_widget.dart' show MedicineCartSearchWidget;
import 'package:flutter/material.dart';

class MedicineCartSearchModel
    extends FlutterFlowModel<MedicineCartSearchWidget> {
  ///  State fields for stateful widgets in this page.

  Completer<ApiCallResponse>? apiRequestCompleter;
  // Models for CartItem.
  late FlutterFlowDynamicModels<CartItemsModel> cartItemModels;
  // Model for OpenperscriptionRequired component.
  late OpenperscriptionRequiredModel openperscriptionRequiredModel;
  // Model for prescriptionRequied component.
  late PrescriptionRequiedModel prescriptionRequiedModel;

  @override
  void initState(BuildContext context) {
    cartItemModels = FlutterFlowDynamicModels(() => CartItemsModel());
    openperscriptionRequiredModel =
        createModel(context, () => OpenperscriptionRequiredModel());
    prescriptionRequiedModel =
        createModel(context, () => PrescriptionRequiedModel());
  }

  @override
  void dispose() {
    cartItemModels.dispose();
    openperscriptionRequiredModel.dispose();
    prescriptionRequiedModel.dispose();
  }

  /// Additional helper methods.
  Future waitForApiRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
