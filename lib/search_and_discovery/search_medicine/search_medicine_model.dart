import '/backend/api_requests/api_calls.dart';
import '/cart/addtocart/addtocart_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'search_medicine_widget.dart' show SearchMedicineWidget;
import 'package:flutter/material.dart';

class SearchMedicineModel extends FlutterFlowModel<SearchMedicineWidget> {
  ///  Local state fields for this page.

  bool? loading;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textFieldTextController;
  String? Function(BuildContext, String?)? textFieldTextControllerValidator;
  Completer<ApiCallResponse>? apiRequestCompleter;
  // Models for Addtocart dynamic component.
  late FlutterFlowDynamicModels<AddtocartModel> addtocartModels;

  @override
  void initState(BuildContext context) {
    addtocartModels = FlutterFlowDynamicModels(() => AddtocartModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textFieldTextController?.dispose();

    addtocartModels.dispose();
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
