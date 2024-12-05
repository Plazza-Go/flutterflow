import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/upload_prescription/components/status_of_prescription_cart_being_built/status_of_prescription_cart_being_built_widget.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'status_model.dart';
export 'status_model.dart';

class StatusWidget extends StatefulWidget {
  const StatusWidget({
    super.key,
    required this.ticketid,
    required this.pageName,
  });

  final int? ticketid;
  final String? pageName;

  @override
  State<StatusWidget> createState() => _StatusWidgetState();
}

class _StatusWidgetState extends State<StatusWidget> {
  late StatusModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StatusModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<List<OrderNotificationsRecord>>(
      stream: queryOrderNotificationsRecord(
        queryBuilder: (orderNotificationsRecord) => orderNotificationsRecord
            .where(
              'ticketID',
              isEqualTo: widget!.ticketid,
            )
            .where(
              'status',
              isEqualTo: 'Final order ready',
            ),
      )..listen((snapshot) {
          List<OrderNotificationsRecord> statusOrderNotificationsRecordList =
              snapshot;
          if (_model.statusPreviousSnapshot != null &&
              !const ListEquality(OrderNotificationsRecordDocumentEquality())
                  .equals(statusOrderNotificationsRecordList,
                      _model.statusPreviousSnapshot)) {
            () async {
              context.pushNamed(
                'medicineCart',
                queryParameters: {
                  'ticketId': serializeParam(
                    widget!.ticketid,
                    ParamType.int,
                  ),
                }.withoutNulls,
              );

              safeSetState(() {});
            }();
          }
          _model.statusPreviousSnapshot = snapshot;
        }),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<OrderNotificationsRecord> statusOrderNotificationsRecordList =
            snapshot.data!;

        return Title(
            title: 'Status',
            color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Scaffold(
                key: scaffoldKey,
                backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
                appBar: responsiveVisibility(
                  context: context,
                  tabletLandscape: false,
                  desktop: false,
                )
                    ? AppBar(
                        backgroundColor:
                            FlutterFlowTheme.of(context).primaryBackground,
                        automaticallyImplyLeading: false,
                        title: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 10.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  if (widget!.pageName == 'History') {
                                    context.safePop();
                                  } else {
                                    context.goNamed(
                                      'Home',
                                      extra: <String, dynamic>{
                                        kTransitionInfoKey: TransitionInfo(
                                          hasTransition: true,
                                          transitionType:
                                              PageTransitionType.topToBottom,
                                        ),
                                      },
                                    );
                                  }
                                },
                                child: Icon(
                                  Icons.close_sharp,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 24.0,
                                ),
                              ),
                            ].divide(SizedBox(width: 20.0)),
                          ),
                        ),
                        actions: [],
                        centerTitle: true,
                        elevation: 0.0,
                      )
                    : null,
                body: SafeArea(
                  top: true,
                  child: Align(
                    alignment: AlignmentDirectional(0.0, -1.0),
                    child: Container(
                      constraints: BoxConstraints(
                        maxWidth: isWeb
                            ? () {
                                if (MediaQuery.sizeOf(context).width <
                                    kBreakpointSmall) {
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
                      decoration: BoxDecoration(),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Stack(
                              alignment: AlignmentDirectional(-0.4, -1.0),
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.85,
                                    child: Stack(
                                      alignment: AlignmentDirectional(1.2, 0.6),
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-1.0, -1.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 20.0, 0.0, 0.0),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: Image.asset(
                                                'assets/images/4958274_2545087_1_(2).png',
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: 130.0,
                                          height: 60.0,
                                          decoration: BoxDecoration(
                                            color: Color(0xFF393C4D),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 0.0, 10.0, 0.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'Cart will be ready ',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        color: Colors.white,
                                                        fontSize: 10.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily),
                                                      ),
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      'anytime now',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelLarge
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelLargeFamily,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .labelLargeFamily),
                                                              ),
                                                    ),
                                                  ],
                                                ),
                                              ].divide(SizedBox(height: 5.0)),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Lottie.asset(
                                  'assets/jsons/Medicine_Prescriptionss.json',
                                  width: 200.0,
                                  height: 200.0,
                                  fit: BoxFit.contain,
                                  animate: true,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: wrapWithModel(
                              model: _model
                                  .statusOfPrescriptionCartBeingBuiltModel,
                              updateCallback: () => safeSetState(() {}),
                              updateOnChange: true,
                              child: StatusOfPrescriptionCartBeingBuiltWidget(
                                ticketid: widget!.ticketid!,
                                status: 'ok',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ));
      },
    );
  }
}
