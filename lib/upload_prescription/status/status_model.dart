import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/upload_prescription/components/status_of_prescription_cart_being_built/status_of_prescription_cart_being_built_widget.dart';
import 'status_widget.dart' show StatusWidget;
import 'package:flutter/material.dart';

class StatusModel extends FlutterFlowModel<StatusWidget> {
  ///  Local state fields for this page.

  String? status;

  ///  State fields for stateful widgets in this page.

  List<OrderNotificationsRecord>? statusPreviousSnapshot;
  // Model for statusOfPrescription-cartBeingBuilt component.
  late StatusOfPrescriptionCartBeingBuiltModel
      statusOfPrescriptionCartBeingBuiltModel;

  @override
  void initState(BuildContext context) {
    statusOfPrescriptionCartBeingBuiltModel =
        createModel(context, () => StatusOfPrescriptionCartBeingBuiltModel());
  }

  @override
  void dispose() {
    statusOfPrescriptionCartBeingBuiltModel.dispose();
  }
}
