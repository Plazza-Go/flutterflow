import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/cart/addtocart/addtocart_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/shimmer/medicineshimmer/medicineshimmer_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'search_medicine_widget.dart' show SearchMedicineWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
