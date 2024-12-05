import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'reting_model.dart';
export 'reting_model.dart';

class RetingWidget extends StatefulWidget {
  const RetingWidget({
    super.key,
    required this.orderrecordId,
    required this.refereceDatabase,
  });

  final String? orderrecordId;
  final Future Function()? refereceDatabase;

  @override
  State<RetingWidget> createState() => _RetingWidgetState();
}

class _RetingWidgetState extends State<RetingWidget> {
  late RetingModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RetingModel());

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
      height: 264.0,
      constraints: BoxConstraints(
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
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(18.0),
          topRight: Radius.circular(18.0),
        ),
      ),
      child: Form(
        key: _model.formKey,
        autovalidateMode: AutovalidateMode.disabled,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 20.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                20.0, 0.0, 0.0, 0.0),
                            child: Container(
                              width: 59.0,
                              height: 6.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).accent2,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.close,
                      color: FlutterFlowTheme.of(context).textColor,
                      size: 20.0,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              'Please rate your order experience',
              style: FlutterFlowTheme.of(context).headlineLarge.override(
                    fontFamily:
                        FlutterFlowTheme.of(context).headlineLargeFamily,
                    fontSize: 22.0,
                    letterSpacing: 0.0,
                    useGoogleFonts: GoogleFonts.asMap().containsKey(
                        FlutterFlowTheme.of(context).headlineLargeFamily),
                  ),
            ),
            RatingBar.builder(
              onRatingUpdate: (newValue) =>
                  safeSetState(() => _model.ratingBarValue = newValue),
              itemBuilder: (context, index) => Icon(
                Icons.star_rounded,
                color: FlutterFlowTheme.of(context).primary,
              ),
              direction: Axis.horizontal,
              initialRating: _model.ratingBarValue ??= 0.0,
              unratedColor: FlutterFlowTheme.of(context).accent1,
              itemCount: 5,
              itemSize: 50.0,
              glowColor: FlutterFlowTheme.of(context).primary,
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 20.0),
              child: FFButtonWidget(
                onPressed: () async {
                  if (_model.ratingBarValue != null) {
                    _model.apiResult4ki =
                        await AirtableApiGroup.rateOrderCall.call(
                      rating: _model.ratingBarValue?.round(),
                      recordId: widget.orderrecordId,
                    );

                    if ((_model.apiResult4ki?.succeeded ?? true)) {
                      await widget.refereceDatabase?.call();
                      Navigator.pop(context);
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Please rate your order experience',
                          style: TextStyle(
                            color: FlutterFlowTheme.of(context).info,
                          ),
                        ),
                        duration: const Duration(milliseconds: 4000),
                        backgroundColor: FlutterFlowTheme.of(context).primary,
                      ),
                    );
                  }

                  safeSetState(() {});
                },
                text: 'Submit',
                options: FFButtonOptions(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: 50.0,
                  padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  iconPadding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: _model.ratingBarValue != null
                      ? FlutterFlowTheme.of(context).primary
                      : FlutterFlowTheme.of(context).accent2,
                  textStyle: FlutterFlowTheme.of(context)
                      .headlineSmall
                      .override(
                        fontFamily:
                            FlutterFlowTheme.of(context).headlineSmallFamily,
                        color: FlutterFlowTheme.of(context).info,
                        letterSpacing: 0.0,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).headlineSmallFamily),
                      ),
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
            ),
          ].divide(const SizedBox(height: 20.0)),
        ),
      ),
    );
  }
}
