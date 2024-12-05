import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'search_medicine_copy_widget.dart' show SearchMedicineCopyWidget;
import 'package:flutter/material.dart';

class SearchMedicineCopyModel
    extends FlutterFlowModel<SearchMedicineCopyWidget> {
  ///  Local state fields for this page.

  String? search;

  MedicineSearchStruct? searchmedicine;
  void updateSearchmedicineStruct(Function(MedicineSearchStruct) updateFn) {
    updateFn(searchmedicine ??= MedicineSearchStruct());
  }

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Delete)] action in Text widget.
  ApiCallResponse? delete1;
  // State field(s) for TextField11 widget.
  FocusNode? textField11FocusNode;
  TextEditingController? textField11TextController;
  String? Function(BuildContext, String?)? textField11TextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textField11FocusNode?.dispose();
    textField11TextController?.dispose();
  }
}
