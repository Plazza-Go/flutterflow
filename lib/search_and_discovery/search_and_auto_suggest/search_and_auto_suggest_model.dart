import '/flutter_flow/flutter_flow_util.dart';
import 'search_and_auto_suggest_widget.dart' show SearchAndAutoSuggestWidget;
import 'package:flutter/material.dart';

class SearchAndAutoSuggestModel
    extends FlutterFlowModel<SearchAndAutoSuggestWidget> {
  ///  State fields for stateful widgets in this page.

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
