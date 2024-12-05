import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'order_trackings_model.dart';
export 'order_trackings_model.dart';

class OrderTrackingsWidget extends StatefulWidget {
  const OrderTrackingsWidget({
    super.key,
    required this.jsonUrl,
    required this.records,
  });

  final String? jsonUrl;
  final List<dynamic>? records;

  @override
  State<OrderTrackingsWidget> createState() => _OrderTrackingsWidgetState();
}

class _OrderTrackingsWidgetState extends State<OrderTrackingsWidget> {
  late OrderTrackingsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OrderTrackingsModel());

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

    return Material(
      color: Colors.transparent,
      elevation: 6.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(14.0),
          topRight: Radius.circular(14.0),
        ),
      ),
      child: Container(
        width: MediaQuery.sizeOf(context).width * 1.0,
        height: 68.0,
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
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(0.0),
            topLeft: Radius.circular(14.0),
            topRight: Radius.circular(14.0),
          ),
        ),
        child: Builder(
          builder: (context) {
            final orderlist = widget!.records!.toList();

            return Container(
              width: double.infinity,
              child: Stack(
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 20.0),
                    child: PageView.builder(
                      controller: _model.pageViewController ??= PageController(
                          initialPage: max(0, min(0, orderlist.length - 1))),
                      scrollDirection: Axis.horizontal,
                      itemCount: orderlist.length,
                      itemBuilder: (context, orderlistIndex) {
                        final orderlistItem = orderlist[orderlistIndex];
                        return InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            if ((functions.jsonConvertToString(getJsonField(
                                      orderlistItem,
                                      r'''$.fields.Status''',
                                    )) ==
                                    'New Order') ||
                                (functions.jsonConvertToString(getJsonField(
                                      orderlistItem,
                                      r'''$.fields.Status''',
                                    )) ==
                                    'Waiting for availability') ||
                                (functions.jsonConvertToString(getJsonField(
                                      orderlistItem,
                                      r'''$.fields.Status''',
                                    )) ==
                                    'Availability updated')) {
                              context.pushNamed(
                                'Status',
                                queryParameters: {
                                  'ticketid': serializeParam(
                                    getJsonField(
                                      orderlistItem,
                                      r'''$.fields["Ticket ID"]''',
                                    ),
                                    ParamType.int,
                                  ),
                                  'pageName': serializeParam(
                                    'ArrowBar',
                                    ParamType.String,
                                  ),
                                }.withoutNulls,
                                extra: <String, dynamic>{
                                  kTransitionInfoKey: TransitionInfo(
                                    hasTransition: true,
                                    transitionType:
                                        PageTransitionType.bottomToTop,
                                  ),
                                },
                              );
                            } else {
                              if (functions.jsonConvertToString(getJsonField(
                                    orderlistItem,
                                    r'''$.fields.Status''',
                                  )) ==
                                  'Final order ready') {
                                context.pushNamed(
                                  'medicineCart',
                                  queryParameters: {
                                    'ticketId': serializeParam(
                                      getJsonField(
                                        orderlistItem,
                                        r'''$.fields["Ticket ID"]''',
                                      ),
                                      ParamType.int,
                                    ),
                                  }.withoutNulls,
                                );
                              } else {
                                context.pushNamed(
                                  'statusOfOrder',
                                  queryParameters: {
                                    'ticketid': serializeParam(
                                      getJsonField(
                                        orderlistItem,
                                        r'''$.fields["Ticket ID"]''',
                                      ),
                                      ParamType.int,
                                    ),
                                    'pagename': serializeParam(
                                      'ArrowBar',
                                      ParamType.String,
                                    ),
                                  }.withoutNulls,
                                  extra: <String, dynamic>{
                                    kTransitionInfoKey: TransitionInfo(
                                      hasTransition: true,
                                      transitionType:
                                          PageTransitionType.bottomToTop,
                                    ),
                                  },
                                );
                              }
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  15.0, 0.0, 15.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: 36.0,
                                            height: 36.0,
                                            decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                colors: [
                                                  Color(0xFFFFDBEE),
                                                  Color(0xFFF9A4D0)
                                                ],
                                                stops: [0.3, 1.0],
                                                begin: AlignmentDirectional(
                                                    1.0, 0.0),
                                                end: AlignmentDirectional(
                                                    -1.0, 0),
                                              ),
                                              shape: BoxShape.circle,
                                            ),
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Lottie.network(
                                              '',
                                              width: 24.0,
                                              height: 24.0,
                                              fit: BoxFit.cover,
                                              animate: true,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        () {
                                          if ((functions.jsonConvertToString(
                                                      getJsonField(
                                                    orderlistItem,
                                                    r'''$.fields.Status''',
                                                  )) ==
                                                  'New Order') ||
                                              (functions.jsonConvertToString(
                                                      getJsonField(
                                                    orderlistItem,
                                                    r'''$.fields.Status''',
                                                  )) ==
                                                  'Waiting for availability') ||
                                              (functions.jsonConvertToString(
                                                      getJsonField(
                                                    orderlistItem,
                                                    r'''$.fields.Status''',
                                                  )) ==
                                                  'Availability updated')) {
                                            return 'Our pharmacist is preparing your cart';
                                          } else if (functions
                                                  .jsonConvertToString(
                                                      getJsonField(
                                                orderlistItem,
                                                r'''$.fields.Status''',
                                              )) ==
                                              'Final order ready') {
                                            return 'Please review your cart & pay';
                                          } else if (functions
                                                  .jsonConvertToString(
                                                      getJsonField(
                                                orderlistItem,
                                                r'''$.fields.Status''',
                                              )) ==
                                              'Order confirmed and customer paid') {
                                            return 'Your order in being packed ';
                                          } else if (functions
                                                  .jsonConvertToString(
                                                      getJsonField(
                                                orderlistItem,
                                                r'''$.fields.Status''',
                                              )) ==
                                              'Ready for pickup') {
                                            return 'Your order will be out for delivery any minute';
                                          } else if (functions
                                                  .jsonConvertToString(
                                                      getJsonField(
                                                orderlistItem,
                                                r'''$.fields.Status''',
                                              )) ==
                                              'Order picked up by Delivery Agent') {
                                            return 'Your order is on its way!';
                                          } else if ((functions
                                                      .jsonConvertToString(
                                                          getJsonField(
                                                    orderlistItem,
                                                    r'''$.fields.Status''',
                                                  )) ==
                                                  'Order Delivered') &&
                                              (getJsonField(
                                                    orderlistItem,
                                                    r'''$.fields.Rating''',
                                                  ) ==
                                                  null)) {
                                            return 'Please rate your order to help us improve';
                                          } else {
                                            return 'Delivered successfully';
                                          }
                                        }(),
                                        style: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmallFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .backArrowColor,
                                              letterSpacing: 0.0,
                                              useGoogleFonts:
                                                  GoogleFonts.asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmallFamily),
                                            ),
                                      ),
                                    ].divide(SizedBox(width: 10.0)),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      borderRadius: BorderRadius.circular(12.0),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8.0, 6.0, 8.0, 6.0),
                                      child: Text(
                                        valueOrDefault<String>(
                                          functions.jsonConvertToString(
                                                      getJsonField(
                                                    orderlistItem,
                                                    r'''$.fields.Status''',
                                                  )) ==
                                                  'Order Delivered'
                                              ? 'Rate'
                                              : 'Track',
                                          'Track',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmallFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              letterSpacing: 0.0,
                                              useGoogleFonts:
                                                  GoogleFonts.asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmallFamily),
                                            ),
                                      ),
                                    ),
                                  ),
                                ].divide(SizedBox(width: 10.0)),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, 1.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                      child: smooth_page_indicator.SmoothPageIndicator(
                        controller: _model.pageViewController ??=
                            PageController(
                                initialPage:
                                    max(0, min(0, orderlist.length - 1))),
                        count: orderlist.length,
                        axisDirection: Axis.horizontal,
                        onDotClicked: (i) async {
                          await _model.pageViewController!.animateToPage(
                            i,
                            duration: Duration(milliseconds: 500),
                            curve: Curves.ease,
                          );
                          safeSetState(() {});
                        },
                        effect: smooth_page_indicator.SlideEffect(
                          spacing: 8.0,
                          radius: 8.0,
                          dotWidth: 6.0,
                          dotHeight: 6.0,
                          dotColor: FlutterFlowTheme.of(context).accent1,
                          activeDotColor: FlutterFlowTheme.of(context).primary,
                          paintStyle: PaintingStyle.fill,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
