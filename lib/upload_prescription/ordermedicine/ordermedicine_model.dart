import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_pdf_viewer.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/custom_components/image_viewer/image_viewer_widget.dart';
import '/pages/custom_components/pdf_viewer/pdf_viewer_widget.dart';
import '/upload_prescription/components/upload_prescriptions/upload_prescriptions_widget.dart';
import 'ordermedicine_widget.dart' show OrdermedicineWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class OrdermedicineModel extends FlutterFlowModel<OrdermedicineWidget> {
  ///  Local state fields for this page.

  int spread = -10;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (createOrder By Prescription With Address)] action in Container widget.
  ApiCallResponse? orderwithaddress;
  // Stores action output result for [Backend Call - API (createOrder By Prescription)] action in Container widget.
  ApiCallResponse? order;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
