import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/location/components/add_new_address/add_new_address_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import 'location_widget.dart' show LocationWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class LocationModel extends FlutterFlowModel<LocationWidget> {
  ///  Local state fields for this page.

  int spread = -10;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - checkLocationPermission] action in Container widget.
  bool? location;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
