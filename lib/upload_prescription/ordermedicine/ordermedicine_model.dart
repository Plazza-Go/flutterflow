import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'ordermedicine_widget.dart' show OrdermedicineWidget;
import 'package:flutter/material.dart';

class OrdermedicineModel extends FlutterFlowModel<OrdermedicineWidget> {
  ///  Local state fields for this page.

  int spread = -10;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (createOrder By Prescription With Address)] action in Container widget.
  ApiCallResponse? orderwithaddress;
  // Stores action output result for [Backend Call - API (createOrder By Prescription)] action in Container widget.
  ApiCallResponse? order;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
