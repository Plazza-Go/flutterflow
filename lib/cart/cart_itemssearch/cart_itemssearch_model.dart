import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'cart_itemssearch_widget.dart' show CartItemssearchWidget;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CartItemssearchModel extends FlutterFlowModel<CartItemssearchWidget> {
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
