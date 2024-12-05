import '/cart/addtocart/addtocart_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'medicine_information_widget.dart' show MedicineInformationWidget;
import 'package:flutter/material.dart';

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
