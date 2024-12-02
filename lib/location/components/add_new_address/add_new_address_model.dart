import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'add_new_address_widget.dart' show AddNewAddressWidget;
import 'dart:async';
import 'package:flutter/material.dart';

class AddNewAddressModel extends FlutterFlowModel<AddNewAddressWidget> {
  ///  State fields for stateful widgets in this component.

  Completer<ApiCallResponse>? apiRequestCompleter;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Custom Action - locationPermissionDenied] action in Row widget.
  bool? location;
  // Stores action output result for [Backend Call - API (update Addressid in order)] action in Container widget.
  ApiCallResponse? apiResultjvr;
  // Stores action output result for [Backend Call - API (UpdateContactIdAddress)] action in Container widget.
  ApiCallResponse? apiResultjqo;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
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
