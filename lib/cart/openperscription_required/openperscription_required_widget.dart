import '/cart/prescription_requied/prescription_requied_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'openperscription_required_model.dart';
import '/services/cart_manager.dart';
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
  final CartManager _cartManager = CartManager();

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
      if ((widget.ordersource == 'Search') &&
          !_cartManager.getDontHavePrescriptionStatus() &&
          widget.prescriptioncheck! &&
          _cartManager.hasPrescriptionItems()) {
        await _cartManager.showPrescriptionModal(
          context: context,
          orderId: widget.recordId!,
        );
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
