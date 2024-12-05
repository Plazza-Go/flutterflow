import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'addtocartsearch_widget.dart' show AddtocartsearchWidget;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddtocartsearchModel extends FlutterFlowModel<AddtocartsearchWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (Add Medicine)] action in addbtn widget.
  ApiCallResponse? addMedicine1;
  // Stores action output result for [Backend Call - API (createOrders By Search With address)] action in addbtn widget.
  ApiCallResponse? createorderwithaddress;
  // Stores action output result for [Backend Call - API (Add Medicine)] action in addbtn widget.
  ApiCallResponse? addMedicine2A;
  // Stores action output result for [Backend Call - API (createOrders By Search)] action in addbtn widget.
  ApiCallResponse? createorder1;
  // Stores action output result for [Backend Call - API (Add Medicine)] action in addbtn widget.
  ApiCallResponse? addMedicine2;
  // Stores action output result for [Backend Call - API (Delete)] action in MinusIconButton widget.
  ApiCallResponse? deleted;
  // Stores action output result for [Backend Call - API (Delete)] action in MinusIconButton widget.
  ApiCallResponse? delete1;
  // Stores action output result for [Backend Call - API (UpdateSearchMedicineDetails )] action in MinusIconButton widget.
  ApiCallResponse? minus;
  // Stores action output result for [Backend Call - API (UpdateSearchMedicineDetails )] action in PlusIconButton widget.
  ApiCallResponse? apiResult1om;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
