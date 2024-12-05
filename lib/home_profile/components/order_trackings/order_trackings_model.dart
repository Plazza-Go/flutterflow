import '/flutter_flow/flutter_flow_util.dart';
import 'order_trackings_widget.dart' show OrderTrackingsWidget;
import 'package:flutter/material.dart';

class OrderTrackingsModel extends FlutterFlowModel<OrderTrackingsWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
