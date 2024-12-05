import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'select_reason_widget.dart' show SelectReasonWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SelectReasonModel extends FlutterFlowModel<SelectReasonWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController;
  // State field(s) for message widget.
  FocusNode? messageFocusNode;
  TextEditingController? messageTextController;
  String? Function(BuildContext, String?)? messageTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    messageFocusNode?.dispose();
    messageTextController?.dispose();
  }

  /// Additional helper methods.
  String? get radioButtonValue => radioButtonValueController?.value;
}
