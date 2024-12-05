import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'select_option_widget.dart' show SelectOptionWidget;
import 'package:flutter/material.dart';

class SelectOptionModel extends FlutterFlowModel<SelectOptionWidget> {
  ///  Local state fields for this component.

  bool housenumber = false;

  bool floor = false;

  bool tower = false;

  bool nearby = false;

  bool phonenumber = false;

  String? addessType;

  bool pincode = false;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (Delete)] action in Container widget.
  ApiCallResponse? apiResultuwy;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
