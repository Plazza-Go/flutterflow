import '/flutter_flow/flutter_flow_util.dart';
import 'product_description_page_widget.dart' show ProductDescriptionPageWidget;
import 'package:flutter/material.dart';

class ProductDescriptionPageModel
    extends FlutterFlowModel<ProductDescriptionPageWidget> {
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
