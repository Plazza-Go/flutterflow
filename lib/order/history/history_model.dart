import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/order/reting/reting_widget.dart';
import '/order/reting_component/reting_component_widget.dart';
import '/shimmer/shimmer/shimmer_widget.dart';
import '/shimmer/shimmer_history/shimmer_history_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'history_widget.dart' show HistoryWidget;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

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
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
