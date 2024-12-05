import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'successfully_uploaded_model.dart';
export 'successfully_uploaded_model.dart';

class SuccessfullyUploadedWidget extends StatefulWidget {
  const SuccessfullyUploadedWidget({
    super.key,
    required this.imageurl,
    required this.url,
    this.orderId,
  });

  final PrescriptionStruct? imageurl;
  final PrescriptiondataStruct? url;
  final String? orderId;

  @override
  State<SuccessfullyUploadedWidget> createState() =>
      _SuccessfullyUploadedWidgetState();
}

class _SuccessfullyUploadedWidgetState
    extends State<SuccessfullyUploadedWidget> {
  late SuccessfullyUploadedModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SuccessfullyUploadedModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().addToPrescriptionAppside(widget.imageurl!);
      FFAppState().addToPrescritiondata(widget.url!);
      safeSetState(() {});
      if (widget.orderId == null || widget.orderId == '') {
        _model.delay = await actions.secondDelay(
          1,
        );
        if (_model.delay!) {
          Navigator.pop(context);

          context.pushNamed('Ordermedicine');
        }
      } else {
        _model.apiResultimx =
            await AirtableApiGroup.updateOrderPrescriptionCall.call(
          prescriptionJson:
              FFAppState().prescritiondata.map((e) => e.toMap()).toList(),
          recordId: widget.orderId,
        );

        if ((_model.apiResultimx?.succeeded ?? true)) {
          FFAppState().prescritiondata = [];
          FFAppState().prescriptionAppside = [];
          FFAppState().update(() {});
          Navigator.pop(context);
          if (widget.orderId == FFAppState().cartId.orderid) {
            context.pushNamed(
              'medicineCart',
              queryParameters: {
                'ticketId': serializeParam(
                  FFAppState().cartId.ticketid,
                  ParamType.int,
                ),
              }.withoutNulls,
              extra: <String, dynamic>{
                kTransitionInfoKey: const TransitionInfo(
                  hasTransition: true,
                  transitionType: PageTransitionType.topToBottom,
                ),
              },
            );
          }
        } else {
          await showDialog(
            context: context,
            builder: (alertDialogContext) {
              return WebViewAware(
                child: AlertDialog(
                  title: const Text('Please try agian'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(alertDialogContext),
                      child: const Text('Ok'),
                    ),
                  ],
                ),
              );
            },
          );
        }
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
      height: 270.0,
      constraints: BoxConstraints(
        minWidth: 392.0,
        maxWidth: isWeb
            ? () {
                if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                  return FFAppState().width.small.toDouble();
                } else if (MediaQuery.sizeOf(context).width <
                    kBreakpointMedium) {
                  return FFAppState().width.medium.toDouble();
                } else if (MediaQuery.sizeOf(context).width <
                    kBreakpointLarge) {
                  return FFAppState().width.large.toDouble();
                } else {
                  return FFAppState().width.small.toDouble();
                }
              }()
            : FFAppState().width.small.toDouble(),
      ),
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
        boxShadow: const [
          BoxShadow(
            blurRadius: 25.0,
            color: Color(0x19000000),
            offset: Offset(
              0.0,
              4.0,
            ),
            spreadRadius: 0.0,
          )
        ],
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(18.0),
          topRight: Radius.circular(18.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Lottie.asset(
              'assets/jsons/Animation_-_1727350827488.json',
              width: 100.0,
              height: 100.0,
              fit: BoxFit.contain,
              animate: true,
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  'Prescription(s) successfully uploaded',
                  style: FlutterFlowTheme.of(context).displayMedium.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).displayMediumFamily,
                        color: FlutterFlowTheme.of(context).primaryText,
                        letterSpacing: 0.0,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).displayMediumFamily),
                      ),
                ),
                Text(
                  'Submit this prescription now to place and order',
                  style: FlutterFlowTheme.of(context).bodySmall.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).bodySmallFamily,
                        color: const Color(0xFF616161),
                        letterSpacing: 0.0,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).bodySmallFamily),
                      ),
                ),
              ].divide(const SizedBox(height: 8.0)),
            ),
          ].divide(const SizedBox(height: 20.0)),
        ),
      ),
    );
  }
}
