import '/flutter_flow/flutter_flow_util.dart';
import '/home_profile/home_nav_bar/home_nav_bar_widget.dart';
import 'search_and_discovery_home_widget.dart'
    show SearchAndDiscoveryHomeWidget;
import 'package:flutter/material.dart';

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
