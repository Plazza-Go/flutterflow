import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_faqs_model.dart';
export 'home_faqs_model.dart';

class HomeFaqsWidget extends StatefulWidget {
  const HomeFaqsWidget({super.key});

  @override
  State<HomeFaqsWidget> createState() => _HomeFaqsWidgetState();
}

class _HomeFaqsWidgetState extends State<HomeFaqsWidget> {
  late HomeFaqsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeFaqsModel());

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
        color: FlutterFlowTheme.of(context).primaryBackground,
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'FAQs',
              style: FlutterFlowTheme.of(context).titleLarge.override(
                    fontFamily: FlutterFlowTheme.of(context).titleLargeFamily,
                    fontSize: 20.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w800,
                    useGoogleFonts: GoogleFonts.asMap().containsKey(
                        FlutterFlowTheme.of(context).titleLargeFamily),
                  ),
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    _model.faqs1 = !_model.faqs1;
                    safeSetState(() {});
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'How does it work?',
                        style: FlutterFlowTheme.of(context).bodyLarge.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyLargeFamily,
                              color: FlutterFlowTheme.of(context).primaryText,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context).bodyLargeFamily),
                            ),
                      ),
                      if (_model.faqs1)
                        Icon(
                          Icons.keyboard_arrow_up,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 20.0,
                        ),
                      if (!_model.faqs1)
                        Icon(
                          Icons.keyboard_arrow_down,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 20.0,
                        ),
                    ],
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(),
                  child: Visibility(
                    visible: _model.faqs1,
                    child: Text(
                      'It’s easy! Submit a prescription then our pharmacist reviews the prescription & sends you a cart. You can review medicines and pay. We deliver it in 10 mins from then.',
                      textAlign: TextAlign.start,
                      style: FlutterFlowTheme.of(context).bodySmall.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodySmallFamily,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            letterSpacing: 0.0,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).bodySmallFamily),
                          ),
                    ),
                  ),
                ),
              ].divide(const SizedBox(height: 12.0)),
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    _model.faqs2 = !_model.faqs2;
                    safeSetState(() {});
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'How does it work?',
                        style: FlutterFlowTheme.of(context).bodyLarge.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyLargeFamily,
                              color: FlutterFlowTheme.of(context).primaryText,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context).bodyLargeFamily),
                            ),
                      ),
                      if (_model.faqs2)
                        Icon(
                          Icons.keyboard_arrow_up,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 20.0,
                        ),
                      if (!_model.faqs2)
                        Icon(
                          Icons.keyboard_arrow_down,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 20.0,
                        ),
                    ],
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(),
                  child: Visibility(
                    visible: _model.faqs2,
                    child: Text(
                      'It’s easy! Submit a prescription then our pharmacist reviews the prescription & sends you a cart. You can review medicines and pay. We deliver it in 10 mins from then.',
                      textAlign: TextAlign.start,
                      style: FlutterFlowTheme.of(context).bodySmall.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodySmallFamily,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            letterSpacing: 0.0,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).bodySmallFamily),
                          ),
                    ),
                  ),
                ),
              ].divide(const SizedBox(height: 12.0)),
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    _model.faqs3 = !_model.faqs3;
                    safeSetState(() {});
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'How does it work?',
                        style: FlutterFlowTheme.of(context).bodyLarge.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyLargeFamily,
                              color: FlutterFlowTheme.of(context).primaryText,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context).bodyLargeFamily),
                            ),
                      ),
                      if (_model.faqs3)
                        Icon(
                          Icons.keyboard_arrow_up,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 20.0,
                        ),
                      if (!_model.faqs3)
                        Icon(
                          Icons.keyboard_arrow_down,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 20.0,
                        ),
                    ],
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(),
                  child: Visibility(
                    visible: _model.faqs3,
                    child: Text(
                      'It’s easy! Submit a prescription then our pharmacist reviews the prescription & sends you a cart. You can review medicines and pay. We deliver it in 10 mins from then.',
                      textAlign: TextAlign.start,
                      style: FlutterFlowTheme.of(context).bodySmall.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodySmallFamily,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            letterSpacing: 0.0,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).bodySmallFamily),
                          ),
                    ),
                  ),
                ),
              ].divide(const SizedBox(height: 12.0)),
            ),
          ].divide(const SizedBox(height: 16.0)),
        ),
      ),
    );
  }
}
