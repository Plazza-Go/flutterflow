import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/order/livetrackinglinks/livetrackinglinks_widget.dart';
import '/order/reting/reting_widget.dart';
import '/payments/bill_details/bill_details_widget.dart';
import '/shimmer/order_status_shimmer/order_status_shimmer_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'status_of_order_widget.dart' show StatusOfOrderWidget;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class StatusOfOrderModel extends FlutterFlowModel<StatusOfOrderWidget> {
  ///  Local state fields for this page.

  String? rebuild;

  ///  State fields for stateful widgets in this page.

  List<OrderNotificationsRecord>? statusOfOrderPreviousSnapshot;
  Completer<ApiCallResponse>? apiRequestCompleter;
  // State field(s) for RatingBar widget.
  double? ratingBarValue;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

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
