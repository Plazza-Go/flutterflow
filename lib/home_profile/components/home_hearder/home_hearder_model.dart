import '/flutter_flow/flutter_flow_util.dart';
import 'home_hearder_widget.dart' show HomeHearderWidget;
import 'package:flutter/material.dart';

class HomeHearderModel extends FlutterFlowModel<HomeHearderWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
