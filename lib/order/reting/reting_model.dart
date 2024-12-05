import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'reting_widget.dart' show RetingWidget;
import 'package:flutter/material.dart';

class RetingModel extends FlutterFlowModel<RetingWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for RatingBar widget.
  double? ratingBarValue;
  // Stores action output result for [Backend Call - API (RateOrder)] action in Button widget.
  ApiCallResponse? apiResult4ki;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
