import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/order/reting_component/reting_component_widget.dart';
import 'dart:async';
import 'history_widget.dart' show HistoryWidget;
import 'package:flutter/material.dart';

class HistoryModel extends FlutterFlowModel<HistoryWidget> {
  ///  Local state fields for this page.

  String? rebuild;

  bool loadApi = false;

  ///  State fields for stateful widgets in this page.

  List<OrderNotificationsRecord>? historyPreviousSnapshot;
  Completer<ApiCallResponse>? apiRequestCompleter;
  // Models for retingComponent dynamic component.
  late FlutterFlowDynamicModels<RetingComponentModel> retingComponentModels;

  @override
  void initState(BuildContext context) {
    retingComponentModels =
        FlutterFlowDynamicModels(() => RetingComponentModel());
  }

  @override
  void dispose() {
    retingComponentModels.dispose();
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
