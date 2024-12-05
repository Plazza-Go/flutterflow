import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'cart_items_widget.dart' show CartItemsWidget;
import 'package:flutter/material.dart';

class CartItemsModel extends FlutterFlowModel<CartItemsWidget> {
  ///  Local state fields for this component.

  int? count;

  bool loading = false;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (Delete)] action in minusIconButton widget.
  ApiCallResponse? apiResultbn0;
  // Stores action output result for [Backend Call - API (Delete)] action in minusIconButton widget.
  ApiCallResponse? deleted;
  // Stores action output result for [Backend Call - API (UpdateMedicineDetails)] action in minusIconButton widget.
  ApiCallResponse? minusmedicine;
  // Stores action output result for [Backend Call - API (UpdateMedicineDetails)] action in plusIconButton widget.
  ApiCallResponse? apiResult5ax;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
