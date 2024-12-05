import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'add_more_address_widget.dart' show AddMoreAddressWidget;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class AddMoreAddressModel extends FlutterFlowModel<AddMoreAddressWidget> {
  ///  Local state fields for this component.

  bool housenumber = false;

  bool floor = false;

  bool tower = false;

  bool nearby = false;

  bool phonenumber = false;

  String? addessType;

  bool pincode = false;

  bool buildingName = false;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for HouseTextField widget.
  FocusNode? houseTextFieldFocusNode;
  TextEditingController? houseTextFieldTextController;
  String? Function(BuildContext, String?)?
      houseTextFieldTextControllerValidator;
  String? _houseTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  String? _textController3Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for BuildingNameTextField widget.
  FocusNode? buildingNameTextFieldFocusNode;
  TextEditingController? buildingNameTextFieldTextController;
  String? Function(BuildContext, String?)?
      buildingNameTextFieldTextControllerValidator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController5;
  String? Function(BuildContext, String?)? textController5Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode4;
  TextEditingController? textController6;
  String? Function(BuildContext, String?)? textController6Validator;
  // Stores action output result for [Backend Call - API (createAddress)] action in Button widget.
  ApiCallResponse? apiResultAddreaa1;
  // Stores action output result for [Backend Call - API (update Addressid in order)] action in Button widget.
  ApiCallResponse? orderUpdate1;
  // Stores action output result for [Backend Call - API (update Addressid in order)] action in Button widget.
  ApiCallResponse? orderUpdate2;
  // Stores action output result for [Backend Call - API (createAddress)] action in Button widget.
  ApiCallResponse? someOneElseaddress;
  // Stores action output result for [Backend Call - API (update Addressid in order)] action in Button widget.
  ApiCallResponse? orderupdate3;

  @override
  void initState(BuildContext context) {
    houseTextFieldTextControllerValidator =
        _houseTextFieldTextControllerValidator;
    textController3Validator = _textController3Validator;
  }

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    houseTextFieldFocusNode?.dispose();
    houseTextFieldTextController?.dispose();

    textFieldFocusNode2?.dispose();
    textController3?.dispose();

    buildingNameTextFieldFocusNode?.dispose();
    buildingNameTextFieldTextController?.dispose();

    textFieldFocusNode3?.dispose();
    textController5?.dispose();

    textFieldFocusNode4?.dispose();
    textController6?.dispose();
  }

  /// Additional helper methods.
  String? get radioButtonValue => radioButtonValueController?.value;
}
