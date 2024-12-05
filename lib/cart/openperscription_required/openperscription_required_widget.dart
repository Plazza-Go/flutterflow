import '/cart/prescription_requied/prescription_requied_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'openperscription_required_model.dart';
export 'openperscription_required_model.dart';

class OpenperscriptionRequiredWidget extends StatefulWidget {
  const OpenperscriptionRequiredWidget({
    super.key,
    required this.recordId,
    required this.ordersource,
    required this.prescriptioncheck,
  });

  final String? recordId;
  final String? ordersource;
  final bool? prescriptioncheck;

  @override
  State<OpenperscriptionRequiredWidget> createState() =>
      _OpenperscriptionRequiredWidgetState();
}

class _OpenperscriptionRequiredWidgetState
    extends State<OpenperscriptionRequiredWidget> {
  late OpenperscriptionRequiredModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OpenperscriptionRequiredModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if ((widget!.ordersource == 'Search') &&
          !FFAppState().Donothaveprescription &&
          widget!.prescriptioncheck! &&
          (FFAppState()
                  .CartMedicineDetails
                  .where(
                      (e) => e.prescriptionRequired == 'Prescription Required')
                  .toList()
                  .length >=
              1)) {
        await showModalBottomSheet(
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          isDismissible: false,
          enableDrag: false,
          context: context,
          builder: (context) {
            return WebViewAware(
              child: Padding(
                padding: MediaQuery.viewInsetsOf(context),
                child: PrescriptionRequiedWidget(
                  orderId: widget!.recordId!,
                ),
              ),
            );
          },
        ).then((value) => safeSetState(() {}));
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      height: 1.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
    );
  }
}
