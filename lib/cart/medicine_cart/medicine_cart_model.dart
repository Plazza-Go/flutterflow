import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/cart/cart_items/cart_items_widget.dart';
import '/cart/emptymedicine/emptymedicine_widget.dart';
import '/cart/handlingcharges/handlingcharges_widget.dart';
import '/cart/openperscription_required/openperscription_required_widget.dart';
import '/cart/prescription_requied/prescription_requied_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/location/components/add_new_address/add_new_address_widget.dart';
import '/shimmer/cart_shimmer/cart_shimmer_widget.dart';
import '/shimmer/location_search_shimmer/location_search_shimmer_widget.dart';
import '/shimmer/shimmer_address/shimmer_address_widget.dart';
import '/upload_prescription/components/view_prescription/view_prescription_widget.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'dart:async';
import 'medicine_cart_widget.dart' show MedicineCartWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class MedicineCartModel extends FlutterFlowModel<MedicineCartWidget> {
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
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
