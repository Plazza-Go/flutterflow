import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/home_profile/home_nav_bar/home_nav_bar_widget.dart';
import '/location/components/add_new_address/add_new_address_widget.dart';
import '/pages/authentication/sign_in/sign_in_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'search_and_discovery_home_widget.dart'
    show SearchAndDiscoveryHomeWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class SearchAndDiscoveryHomeModel
    extends FlutterFlowModel<SearchAndDiscoveryHomeWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Model for HomeNavBar component.
  late HomeNavBarModel homeNavBarModel;

  @override
  void initState(BuildContext context) {
    homeNavBarModel = createModel(context, () => HomeNavBarModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    homeNavBarModel.dispose();
  }
}
