import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/cart/addtocart/addtocart_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/shimmer/medicineinformationshimmer/medicineinformationshimmer_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'medicine_information_widget.dart' show MedicineInformationWidget;
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MedicineInformationModel
    extends FlutterFlowModel<MedicineInformationWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for PageViewimage widget.
  PageController? pageViewimageController;

  int get pageViewimageCurrentIndex => pageViewimageController != null &&
          pageViewimageController!.hasClients &&
          pageViewimageController!.page != null
      ? pageViewimageController!.page!.round()
      : 0;
  // Model for Addtocart component.
  late AddtocartModel addtocartModel;

  @override
  void initState(BuildContext context) {
    addtocartModel = createModel(context, () => AddtocartModel());
  }

  @override
  void dispose() {
    addtocartModel.dispose();
  }
}
