import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'successfully_uploaded_widget.dart' show SuccessfullyUploadedWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class SuccessfullyUploadedModel
    extends FlutterFlowModel<SuccessfullyUploadedWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Custom Action - secondDelay] action in SuccessfullyUploaded widget.
  bool? delay;
  // Stores action output result for [Backend Call - API (UpdateOrder Prescription)] action in SuccessfullyUploaded widget.
  ApiCallResponse? apiResultimx;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
