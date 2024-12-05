import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/upload_prescription/components/status_of_prescription_cart_being_built/status_of_prescription_cart_being_built_widget.dart';
import 'status_widget.dart' show StatusWidget;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

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
