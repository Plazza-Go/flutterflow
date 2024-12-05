import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/order/livetrackinglinks/livetrackinglinks_widget.dart';
import '/order/reting/reting_widget.dart';
import '/payments/bill_details/bill_details_widget.dart';
import '/shimmer/order_status_shimmer/order_status_shimmer_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'status_of_order_model.dart';
export 'status_of_order_model.dart';

class StatusOfOrderWidget extends StatefulWidget {
  const StatusOfOrderWidget({
    super.key,
    required this.ticketid,
    required this.pagename,
  });

  final int? ticketid;
  final String? pagename;

  @override
  State<StatusOfOrderWidget> createState() => _StatusOfOrderWidgetState();
}

class _StatusOfOrderWidgetState extends State<StatusOfOrderWidget> {
  late StatusOfOrderModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StatusOfOrderModel());

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
        queryBuilder: (orderNotificationsRecord) =>
            orderNotificationsRecord.whereIn('status', [
          'Order confirmed and customer paid',
          'Ready for pickup',
          'Order picked up by Delivery Agent',
          'Order Delivered',
          'Order Cancelled'
        ]).where(
          'ticketID',
          isEqualTo: widget!.ticketid,
        ),
      )..listen((snapshot) {
          List<OrderNotificationsRecord>
              statusOfOrderOrderNotificationsRecordList = snapshot;
          if (_model.statusOfOrderPreviousSnapshot != null &&
              !const ListEquality(OrderNotificationsRecordDocumentEquality())
                  .equals(statusOfOrderOrderNotificationsRecordList,
                      _model.statusOfOrderPreviousSnapshot)) {
            () async {
              _model.rebuild = 'Rebuild';
              safeSetState(() {});

              safeSetState(() {});
            }();
          }
          _model.statusOfOrderPreviousSnapshot = snapshot;
        }),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 1.0,
                height: 1.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Color(0x00FF0083),
                  ),
                ),
              ),
            ),
          );
        }
        List<OrderNotificationsRecord>
            statusOfOrderOrderNotificationsRecordList = snapshot.data!;

        return Title(
            title: 'statusOfOrder',
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
                        backgroundColor: Color(0xFFEBF7F3),
                        automaticallyImplyLeading: false,
                        title: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 30.0,
                              buttonSize: 46.0,
                              icon: Icon(
                                Icons.close,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24.0,
                              ),
                              onPressed: () async {
                                if (widget!.pagename == 'History') {
                                  context.safePop();
                                } else {
                                  context.pushNamed(
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
                            ),
                          ].divide(SizedBox(width: 20.0)),
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
                    child: FutureBuilder<ApiCallResponse>(
                      future: (_model.apiRequestCompleter ??=
                              Completer<ApiCallResponse>()
                                ..complete(
                                    AirtableApiGroup.findSingleOrderCall.call(
                                  ticketID: widget!.ticketid,
                                )))
                          .future,
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return OrderStatusShimmerWidget();
                        }
                        final containerMFindSingleOrderResponse =
                            snapshot.data!;

                        return Container(
                          constraints: BoxConstraints(
                            maxWidth: isWeb
                                ? () {
                                    if (MediaQuery.sizeOf(context).width <
                                        kBreakpointSmall) {
                                      return FFAppState()
                                          .width
                                          .small
                                          .toDouble();
                                    } else if (MediaQuery.sizeOf(context)
                                            .width <
                                        kBreakpointMedium) {
                                      return FFAppState()
                                          .width
                                          .medium
                                          .toDouble();
                                    } else if (MediaQuery.sizeOf(context)
                                            .width <
                                        kBreakpointLarge) {
                                      return FFAppState()
                                          .width
                                          .large
                                          .toDouble();
                                    } else {
                                      return FFAppState()
                                          .width
                                          .small
                                          .toDouble();
                                    }
                                  }()
                                : FFAppState().width.small.toDouble(),
                          ),
                          decoration: BoxDecoration(),
                          child: Stack(
                            children: [
                              SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Stack(
                                      children: [
                                        if ((AirtableApiGroup
                                                    .findSingleOrderCall
                                                    .status(
                                                  containerMFindSingleOrderResponse
                                                      .jsonBody,
                                                ) ==
                                                'Order confirmed and customer paid') ||
                                            (AirtableApiGroup
                                                    .findSingleOrderCall
                                                    .status(
                                                  containerMFindSingleOrderResponse
                                                      .jsonBody,
                                                ) ==
                                                ' Order modified post payment') ||
                                            (AirtableApiGroup
                                                    .findSingleOrderCall
                                                    .status(
                                                  containerMFindSingleOrderResponse
                                                      .jsonBody,
                                                ) ==
                                                'Ready for pickup') ||
                                            (widget!.pagename == 'Payment'))
                                          Container(
                                            decoration: BoxDecoration(
                                              color: Color(0xFFEBF7F3),
                                            ),
                                            child: Lottie.asset(
                                              'assets/jsons/packinggoods1.json',
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  1.0,
                                              height: 300.0,
                                              fit: BoxFit.contain,
                                              animate: true,
                                            ),
                                          ),
                                        if (AirtableApiGroup.findSingleOrderCall
                                                .status(
                                              containerMFindSingleOrderResponse
                                                  .jsonBody,
                                            ) ==
                                            'Order picked up by Delivery Agent')
                                          Container(
                                            decoration: BoxDecoration(
                                              color: Color(0xFFEBF7F3),
                                            ),
                                            child: Lottie.asset(
                                              'assets/jsons/Out_for_deliverys_(1).json',
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  1.0,
                                              height: 300.0,
                                              fit: BoxFit.contain,
                                              animate: true,
                                            ),
                                          ),
                                        if (AirtableApiGroup.findSingleOrderCall
                                                .status(
                                              containerMFindSingleOrderResponse
                                                  .jsonBody,
                                            ) ==
                                            'Order Delivered')
                                          Container(
                                            decoration: BoxDecoration(
                                              color: Color(0xFFEBF7F3),
                                            ),
                                            child: Lottie.asset(
                                              'assets/jsons/Delivery_Complet_(1).json',
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  1.0,
                                              height: 300.0,
                                              fit: BoxFit.contain,
                                              animate: true,
                                            ),
                                          ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SingleChildScrollView(
                                primary: false,
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Align(
                                      alignment:
                                          AlignmentDirectional(0.0, -1.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 300.0, 0.0, 0.0),
                                        child: Container(
                                          width: 390.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(0.0),
                                              bottomRight: Radius.circular(0.0),
                                              topLeft: Radius.circular(18.0),
                                              topRight: Radius.circular(18.0),
                                            ),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 0.0, 20.0, 20.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 20.0, 0.0, 0.0),
                                                  child: Container(
                                                    width: 350.0,
                                                    height: 20.0,
                                                    decoration: BoxDecoration(),
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, 0.0),
                                                    child: Text(
                                                      () {
                                                        if (AirtableApiGroup
                                                                .findSingleOrderCall
                                                                .status(
                                                              containerMFindSingleOrderResponse
                                                                  .jsonBody,
                                                            ) ==
                                                            'Order Delivered') {
                                                          return 'Order successfully delivered ';
                                                        } else if (AirtableApiGroup
                                                                .findSingleOrderCall
                                                                .status(
                                                              containerMFindSingleOrderResponse
                                                                  .jsonBody,
                                                            ) ==
                                                            'Order picked up by Delivery Agent') {
                                                          return 'Order has been dispatched!';
                                                        } else {
                                                          return 'Order is being packed';
                                                        }
                                                      }(),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .headlineLarge
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineLargeFamily,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .headlineLargeFamily),
                                                              ),
                                                    ),
                                                  ),
                                                ),
                                                if (AirtableApiGroup
                                                        .findSingleOrderCall
                                                        .status(
                                                      containerMFindSingleOrderResponse
                                                          .jsonBody,
                                                    ) ==
                                                    'Order picked up by Delivery Agent')
                                                  Container(
                                                    width: 350.0,
                                                    height: 65.0,
                                                    decoration: BoxDecoration(),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      8.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Container(
                                                            width: 272.0,
                                                            height: 24.0,
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceEvenly,
                                                              children: [
                                                                ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                  child: Image
                                                                      .asset(
                                                                    'assets/images/material-symbols_package-2.png',
                                                                    width: 24.0,
                                                                    height:
                                                                        24.0,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                                LinearPercentIndicator(
                                                                  percent: 1.0,
                                                                  width: 80.0,
                                                                  lineHeight:
                                                                      4.0,
                                                                  animation:
                                                                      true,
                                                                  animateFromLastPercent:
                                                                      true,
                                                                  progressColor:
                                                                      Color(
                                                                          0xFF50C154),
                                                                  backgroundColor:
                                                                      Color(
                                                                          0xFFD9D9D9),
                                                                  barRadius: Radius
                                                                      .circular(
                                                                          8.0),
                                                                  padding:
                                                                      EdgeInsets
                                                                          .zero,
                                                                ),
                                                                ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                  child:
                                                                      SvgPicture
                                                                          .asset(
                                                                    'assets/images/Bike_(1).svg',
                                                                    width: 24.0,
                                                                    height:
                                                                        24.0,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                                LinearPercentIndicator(
                                                                  percent: 0.0,
                                                                  width: 80.0,
                                                                  lineHeight:
                                                                      4.0,
                                                                  animation:
                                                                      true,
                                                                  animateFromLastPercent:
                                                                      true,
                                                                  progressColor:
                                                                      Color(
                                                                          0xFF318616),
                                                                  backgroundColor:
                                                                      Color(
                                                                          0xFFD9D9D9),
                                                                  padding:
                                                                      EdgeInsets
                                                                          .zero,
                                                                ),
                                                                ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                  child: Image
                                                                      .asset(
                                                                    'assets/images/zap.png',
                                                                    width: 24.0,
                                                                    height:
                                                                        24.0,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      16.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Container(
                                                                width: 116.0,
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child: Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    'Packing',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Figtree',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).backArrowColor,
                                                                          fontSize:
                                                                              10.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                          decoration:
                                                                              TextDecoration.underline,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey('Figtree'),
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child:
                                                                    Container(
                                                                  width: 116.0,
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    'On the way',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Figtree',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).backArrowColor,
                                                                          fontSize:
                                                                              10.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey('Figtree'),
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Container(
                                                                width: 116.0,
                                                                decoration:
                                                                    BoxDecoration(),
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child: Text(
                                                                  'Delivered',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Figtree',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .backArrowColor,
                                                                        fontSize:
                                                                            10.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey('Figtree'),
                                                                      ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                if ((AirtableApiGroup
                                                            .findSingleOrderCall
                                                            .status(
                                                          containerMFindSingleOrderResponse
                                                              .jsonBody,
                                                        ) ==
                                                        'Order confirmed and customer paid') ||
                                                    (AirtableApiGroup
                                                            .findSingleOrderCall
                                                            .status(
                                                          containerMFindSingleOrderResponse
                                                              .jsonBody,
                                                        ) ==
                                                        ' Order modified post payment') ||
                                                    (AirtableApiGroup
                                                            .findSingleOrderCall
                                                            .status(
                                                          containerMFindSingleOrderResponse
                                                              .jsonBody,
                                                        ) ==
                                                        'Ready for pickup'))
                                                  Container(
                                                    width: 350.0,
                                                    height: 65.0,
                                                    decoration: BoxDecoration(),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      8.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Container(
                                                            width: 272.0,
                                                            height: 24.0,
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceEvenly,
                                                              children: [
                                                                ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                  child: Image
                                                                      .asset(
                                                                    'assets/images/material-symbols_package-2.png',
                                                                    width: 24.0,
                                                                    height:
                                                                        24.0,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                                LinearPercentIndicator(
                                                                  percent: 0.0,
                                                                  width: 80.0,
                                                                  lineHeight:
                                                                      4.0,
                                                                  animation:
                                                                      true,
                                                                  animateFromLastPercent:
                                                                      true,
                                                                  progressColor:
                                                                      Color(
                                                                          0xFF50C154),
                                                                  backgroundColor:
                                                                      Color(
                                                                          0xFFD9D9D9),
                                                                  barRadius: Radius
                                                                      .circular(
                                                                          8.0),
                                                                  padding:
                                                                      EdgeInsets
                                                                          .zero,
                                                                ),
                                                                ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                  child:
                                                                      SvgPicture
                                                                          .asset(
                                                                    'assets/images/Bike.svg',
                                                                    width: 24.0,
                                                                    height:
                                                                        24.0,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                                LinearPercentIndicator(
                                                                  percent: 0.0,
                                                                  width: 80.0,
                                                                  lineHeight:
                                                                      4.0,
                                                                  animation:
                                                                      true,
                                                                  animateFromLastPercent:
                                                                      true,
                                                                  progressColor:
                                                                      Color(
                                                                          0xFF318616),
                                                                  backgroundColor:
                                                                      Color(
                                                                          0xFFD9D9D9),
                                                                  padding:
                                                                      EdgeInsets
                                                                          .zero,
                                                                ),
                                                                ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                  child: Image
                                                                      .asset(
                                                                    'assets/images/zap.png',
                                                                    width: 24.0,
                                                                    height:
                                                                        24.0,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      16.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceEvenly,
                                                            children: [
                                                              Container(
                                                                width: 116.0,
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child: Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          -0.1,
                                                                          0.0),
                                                                  child: Text(
                                                                    'Packing',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Figtree',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).backArrowColor,
                                                                          fontSize:
                                                                              10.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                          decoration:
                                                                              TextDecoration.underline,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey('Figtree'),
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child:
                                                                    Container(
                                                                  width: 116.0,
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    'On the way',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Figtree',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).backArrowColor,
                                                                          fontSize:
                                                                              10.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey('Figtree'),
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Container(
                                                                width: 116.0,
                                                                decoration:
                                                                    BoxDecoration(),
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child: Text(
                                                                  'Delivered',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Figtree',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .backArrowColor,
                                                                        fontSize:
                                                                            10.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey('Figtree'),
                                                                      ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    if ((AirtableApiGroup
                                                                .findSingleOrderCall
                                                                .status(
                                                              containerMFindSingleOrderResponse
                                                                  .jsonBody,
                                                            ) ==
                                                            'Order picked up by Delivery Agent') &&
                                                        (AirtableApiGroup
                                                                    .findSingleOrderCall
                                                                    .deliveryAgentTrackingURL(
                                                                  containerMFindSingleOrderResponse
                                                                      .jsonBody,
                                                                ) !=
                                                                null &&
                                                            AirtableApiGroup
                                                                    .findSingleOrderCall
                                                                    .deliveryAgentTrackingURL(
                                                                  containerMFindSingleOrderResponse
                                                                      .jsonBody,
                                                                ) !=
                                                                '') &&
                                                        (AirtableApiGroup
                                                                    .findSingleOrderCall
                                                                    .deliveryAgentPhoneNumber(
                                                                  containerMFindSingleOrderResponse
                                                                      .jsonBody,
                                                                ) !=
                                                                null &&
                                                            AirtableApiGroup
                                                                    .findSingleOrderCall
                                                                    .deliveryAgentPhoneNumber(
                                                                  containerMFindSingleOrderResponse
                                                                      .jsonBody,
                                                                ) !=
                                                                '') &&
                                                        (AirtableApiGroup
                                                                    .findSingleOrderCall
                                                                    .deliveryAgentName(
                                                                  containerMFindSingleOrderResponse
                                                                      .jsonBody,
                                                                ) !=
                                                                null &&
                                                            AirtableApiGroup
                                                                    .findSingleOrderCall
                                                                    .deliveryAgentName(
                                                                  containerMFindSingleOrderResponse
                                                                      .jsonBody,
                                                                ) !=
                                                                ''))
                                                      Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            0.0),
                                                                child:
                                                                    Image.asset(
                                                                  'assets/images/Mask_group.png',
                                                                  width: 40.0,
                                                                  height: 40.0,
                                                                  fit: BoxFit
                                                                      .fill,
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Text(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        AirtableApiGroup
                                                                            .findSingleOrderCall
                                                                            .deliveryAgentName(
                                                                          containerMFindSingleOrderResponse
                                                                              .jsonBody,
                                                                        ),
                                                                        ' Name',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .headlineLarge
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).headlineLargeFamily,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).headlineLargeFamily),
                                                                          ),
                                                                    ),
                                                                    FlutterFlowIconButton(
                                                                      borderColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .alternate,
                                                                      borderRadius:
                                                                          20.0,
                                                                      buttonSize:
                                                                          40.0,
                                                                      icon:
                                                                          Icon(
                                                                        Icons
                                                                            .call,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        size:
                                                                            24.0,
                                                                      ),
                                                                      onPressed:
                                                                          () async {
                                                                        await launchURL(
                                                                            'tel:${AirtableApiGroup.findSingleOrderCall.deliveryAgentPhoneNumber(
                                                                          containerMFindSingleOrderResponse
                                                                              .jsonBody,
                                                                        )}');
                                                                      },
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ].divide(SizedBox(
                                                                width: 20.0)),
                                                          ),
                                                          Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color(
                                                                  0xFFEBFFEF),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(
                                                                          10.0),
                                                              child: Text(
                                                                'I have picked up your order, and I am on the way to your \nlocation for the delivery',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .labelMediumFamily,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .success,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).labelMediumFamily),
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                          InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              await showModalBottomSheet(
                                                                isScrollControlled:
                                                                    true,
                                                                backgroundColor:
                                                                    Colors
                                                                        .transparent,
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (context) {
                                                                  return WebViewAware(
                                                                    child:
                                                                        GestureDetector(
                                                                      onTap: () =>
                                                                          FocusScope.of(context)
                                                                              .unfocus(),
                                                                      child:
                                                                          Padding(
                                                                        padding:
                                                                            MediaQuery.viewInsetsOf(context),
                                                                        child:
                                                                            LivetrackinglinksWidget(
                                                                          url: AirtableApiGroup
                                                                              .findSingleOrderCall
                                                                              .deliveryAgentTrackingURL(
                                                                            containerMFindSingleOrderResponse.jsonBody,
                                                                          )!,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                              ).then((value) =>
                                                                  safeSetState(
                                                                      () {}));
                                                            },
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .end,
                                                              children: [
                                                                Text(
                                                                  'Live tracking link',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                      ),
                                                                ),
                                                                Icon(
                                                                  Icons
                                                                      .play_arrow,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  size: 24.0,
                                                                ),
                                                              ].divide(SizedBox(
                                                                  width: 10.0)),
                                                            ),
                                                          ),
                                                        ].divide(SizedBox(
                                                            height: 10.0)),
                                                      ),
                                                    if (AirtableApiGroup
                                                            .findSingleOrderCall
                                                            .status(
                                                          containerMFindSingleOrderResponse
                                                              .jsonBody,
                                                        ) ==
                                                        'Order Delivered')
                                                      InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          if (AirtableApiGroup
                                                                  .findSingleOrderCall
                                                                  .rating(
                                                                containerMFindSingleOrderResponse
                                                                    .jsonBody,
                                                              ) ==
                                                              null) {
                                                            await showModalBottomSheet(
                                                              isScrollControlled:
                                                                  true,
                                                              backgroundColor:
                                                                  Colors
                                                                      .transparent,
                                                              isDismissible:
                                                                  false,
                                                              enableDrag: false,
                                                              context: context,
                                                              builder:
                                                                  (context) {
                                                                return WebViewAware(
                                                                  child:
                                                                      GestureDetector(
                                                                    onTap: () =>
                                                                        FocusScope.of(context)
                                                                            .unfocus(),
                                                                    child:
                                                                        Padding(
                                                                      padding: MediaQuery
                                                                          .viewInsetsOf(
                                                                              context),
                                                                      child:
                                                                          RetingWidget(
                                                                        orderrecordId: AirtableApiGroup
                                                                            .findSingleOrderCall
                                                                            .recordId(
                                                                          containerMFindSingleOrderResponse
                                                                              .jsonBody,
                                                                        )!,
                                                                        refereceDatabase:
                                                                            () async {
                                                                          safeSetState(() =>
                                                                              _model.apiRequestCompleter = null);
                                                                          await _model
                                                                              .waitForApiRequestCompleted();
                                                                          FFAppState().RebuildPage =
                                                                              'Rebuild';
                                                                          safeSetState(
                                                                              () {});
                                                                        },
                                                                      ),
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            ).then((value) =>
                                                                safeSetState(
                                                                    () {}));
                                                          }
                                                        },
                                                        child: Container(
                                                          height: 68.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryBackground,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0),
                                                          ),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Stack(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                children: [
                                                                  Container(
                                                                    width: 36.0,
                                                                    height:
                                                                        36.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: Color(
                                                                          0xFFF7F7F7),
                                                                      shape: BoxShape
                                                                          .circle,
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    width: 20.0,
                                                                    height:
                                                                        20.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                    ),
                                                                    child:
                                                                        ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                      child: Image
                                                                          .asset(
                                                                        'assets/images/star.png',
                                                                        width:
                                                                            36.0,
                                                                        height:
                                                                            36.0,
                                                                        fit: BoxFit
                                                                            .contain,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Expanded(
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Stack(
                                                                        children: [
                                                                          RatingBar
                                                                              .builder(
                                                                            onRatingUpdate: (newValue) =>
                                                                                safeSetState(() => _model.ratingBarValue = newValue),
                                                                            itemBuilder: (context, index) =>
                                                                                Icon(
                                                                              Icons.star_rounded,
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                            ),
                                                                            direction:
                                                                                Axis.horizontal,
                                                                            initialRating: _model.ratingBarValue ??= AirtableApiGroup.findSingleOrderCall.rating(
                                                                                      containerMFindSingleOrderResponse.jsonBody,
                                                                                    ) ==
                                                                                    null
                                                                                ? 0.0
                                                                                : AirtableApiGroup.findSingleOrderCall
                                                                                    .rating(
                                                                                      containerMFindSingleOrderResponse.jsonBody,
                                                                                    )!
                                                                                    .toDouble(),
                                                                            unratedColor:
                                                                                FlutterFlowTheme.of(context).accent1,
                                                                            itemCount:
                                                                                5,
                                                                            itemSize:
                                                                                24.0,
                                                                            glowColor:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                          ),
                                                                          Container(
                                                                            width:
                                                                                250.0,
                                                                            height:
                                                                                25.0,
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          AirtableApiGroup.findSingleOrderCall.rating(
                                                                                    containerMFindSingleOrderResponse.jsonBody,
                                                                                  ) !=
                                                                                  null
                                                                              ? 'You rated this order'
                                                                              : 'Tap to rate this order',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodySmall
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                letterSpacing: 0.0,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                              if (AirtableApiGroup
                                                                      .findSingleOrderCall
                                                                      .rating(
                                                                    containerMFindSingleOrderResponse
                                                                        .jsonBody,
                                                                  ) ==
                                                                  null)
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Icon(
                                                                    Icons
                                                                        .arrow_forward_ios_outlined,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .backArrowColor,
                                                                    size: 14.0,
                                                                  ),
                                                                ),
                                                            ].divide(SizedBox(
                                                                width: 10.0)),
                                                          ),
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                                Container(
                                                  height: 68.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Stack(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        children: [
                                                          Container(
                                                            width: 36.0,
                                                            height: 36.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color(
                                                                  0xFFF7F7F7),
                                                              shape: BoxShape
                                                                  .circle,
                                                            ),
                                                          ),
                                                          Container(
                                                            width: 20.0,
                                                            height: 20.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                            ),
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              child:
                                                                  Image.asset(
                                                                'assets/images/home.png',
                                                                width: 20.0,
                                                                height: 20.0,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      8.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                'Delivery at ${AirtableApiGroup.findSingleOrderCall.tag(
                                                                  containerMFindSingleOrderResponse
                                                                      .jsonBody,
                                                                )}',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineLarge
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .headlineLargeFamily,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).headlineLargeFamily),
                                                                    ),
                                                              ),
                                                              Text(
                                                                AirtableApiGroup
                                                                    .findSingleOrderCall
                                                                    .fullAddress(
                                                                  containerMFindSingleOrderResponse
                                                                      .jsonBody,
                                                                )!,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmall
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodySmallFamily,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).bodySmallFamily),
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 10.0)),
                                                  ),
                                                ),
                                                InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    await launchURL(
                                                        'https://api.whatsapp.com/send?phone=15557031014&text=Hi%2C%20I%20need%20help%20with%20my%20Plazza%20Order%23${widget!.ticketid?.toString()}');
                                                  },
                                                  child: Container(
                                                    height: 68.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                    ),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Stack(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          children: [
                                                            Container(
                                                              width: 36.0,
                                                              height: 36.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Color(
                                                                    0xFFF7F7F7),
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                            ),
                                                            Container(
                                                              width: 20.0,
                                                              height: 20.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                              ),
                                                              child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                                child:
                                                                    Image.asset(
                                                                  'assets/images/message-square_(1).png',
                                                                  width: 20.0,
                                                                  height: 20.0,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        8.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  'Need help?',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineLarge
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).headlineLargeFamily,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).headlineLargeFamily),
                                                                      ),
                                                                ),
                                                                Text(
                                                                  'Chat with us about any issue with your order',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodySmallFamily,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                      ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      8.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Icon(
                                                            Icons
                                                                .arrow_forward_ios_outlined,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .backArrowColor,
                                                            size: 14.0,
                                                          ),
                                                        ),
                                                      ].divide(SizedBox(
                                                          width: 10.0)),
                                                    ),
                                                  ),
                                                ),
                                                InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    await showModalBottomSheet(
                                                      isScrollControlled: true,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      enableDrag: false,
                                                      context: context,
                                                      builder: (context) {
                                                        return WebViewAware(
                                                          child:
                                                              GestureDetector(
                                                            onTap: () =>
                                                                FocusScope.of(
                                                                        context)
                                                                    .unfocus(),
                                                            child: Padding(
                                                              padding: MediaQuery
                                                                  .viewInsetsOf(
                                                                      context),
                                                              child:
                                                                  BillDetailsWidget(
                                                                ticketid: widget!
                                                                    .ticketid!,
                                                                itemtotal:
                                                                    formatNumber(
                                                                  functions.checkInt(
                                                                          getJsonField(
                                                                    containerMFindSingleOrderResponse
                                                                        .jsonBody,
                                                                    r'''$.records[:].fields[ "Item Total"]''',
                                                                  ))
                                                                      ? getJsonField(
                                                                          containerMFindSingleOrderResponse
                                                                              .jsonBody,
                                                                          r'''$.records[:].fields[ "Item Total"]''',
                                                                        )
                                                                      : getJsonField(
                                                                          containerMFindSingleOrderResponse
                                                                              .jsonBody,
                                                                          r'''$.records[:].fields[ "Item Total"]''',
                                                                        ),
                                                                  formatType:
                                                                      FormatType
                                                                          .decimal,
                                                                  decimalType:
                                                                      DecimalType
                                                                          .periodDecimal,
                                                                ),
                                                                totalbill:
                                                                    formatNumber(
                                                                  functions.checkInt(
                                                                          getJsonField(
                                                                    containerMFindSingleOrderResponse
                                                                        .jsonBody,
                                                                    r'''$.records[:].fields[ "Bill Total Amount"]''',
                                                                  ))
                                                                      ? getJsonField(
                                                                          containerMFindSingleOrderResponse
                                                                              .jsonBody,
                                                                          r'''$.records[:].fields[ "Bill Total Amount"]''',
                                                                        )
                                                                      : getJsonField(
                                                                          containerMFindSingleOrderResponse
                                                                              .jsonBody,
                                                                          r'''$.records[:].fields[ "Bill Total Amount"]''',
                                                                        ),
                                                                  formatType:
                                                                      FormatType
                                                                          .decimal,
                                                                  decimalType:
                                                                      DecimalType
                                                                          .periodDecimal,
                                                                ),
                                                                timeStamp: functions.stringToTimestamp(
                                                                    AirtableApiGroup
                                                                        .findSingleOrderCall
                                                                        .createdTime(
                                                                  containerMFindSingleOrderResponse
                                                                      .jsonBody,
                                                                )!),
                                                                prescriptionListurl:
                                                                    AirtableApiGroup
                                                                        .findSingleOrderCall
                                                                        .prescriptionListurl(
                                                                  containerMFindSingleOrderResponse
                                                                      .jsonBody,
                                                                ),
                                                                deliveryfee:
                                                                    AirtableApiGroup
                                                                        .findSingleOrderCall
                                                                        .deliveryfee(
                                                                  containerMFindSingleOrderResponse
                                                                      .jsonBody,
                                                                )!,
                                                                packegingfee:
                                                                    AirtableApiGroup
                                                                        .findSingleOrderCall
                                                                        .packingfee(
                                                                  containerMFindSingleOrderResponse
                                                                      .jsonBody,
                                                                )!,
                                                                platformfee:
                                                                    AirtableApiGroup
                                                                        .findSingleOrderCall
                                                                        .platformfee(
                                                                  containerMFindSingleOrderResponse
                                                                      .jsonBody,
                                                                )!,
                                                                canvanicefee:
                                                                    AirtableApiGroup
                                                                        .findSingleOrderCall
                                                                        .conveniencefee(
                                                                  containerMFindSingleOrderResponse
                                                                      .jsonBody,
                                                                )!,
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ).then((value) =>
                                                        safeSetState(() {}));
                                                  },
                                                  child: Container(
                                                    height: 68.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  10.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Stack(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            children: [
                                                              Container(
                                                                width: 36.0,
                                                                height: 36.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Color(
                                                                      0xFFF7F7F7),
                                                                  shape: BoxShape
                                                                      .circle,
                                                                ),
                                                              ),
                                                              Container(
                                                                width: 20.0,
                                                                height: 20.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                ),
                                                                child:
                                                                    ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                  child: Image
                                                                      .asset(
                                                                    'assets/images/file-text.png',
                                                                    width: 20.0,
                                                                    height:
                                                                        20.0,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Expanded(
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    'Bill Details',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .headlineLarge
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).headlineLargeFamily,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).headlineLargeFamily),
                                                                        ),
                                                                  ),
                                                                  Text(
                                                                    '₹${formatNumber(
                                                                      functions.checkInt(
                                                                              getJsonField(
                                                                        containerMFindSingleOrderResponse
                                                                            .jsonBody,
                                                                        r'''$.records[:].fields[ "Bill Total Amount"]''',
                                                                      ))
                                                                          ? getJsonField(
                                                                              containerMFindSingleOrderResponse.jsonBody,
                                                                              r'''$.records[:].fields[ "Bill Total Amount"]''',
                                                                            )
                                                                          : getJsonField(
                                                                              containerMFindSingleOrderResponse.jsonBody,
                                                                              r'''$.records[:].fields[ "Bill Total Amount"]''',
                                                                            ),
                                                                      formatType:
                                                                          FormatType
                                                                              .decimal,
                                                                      decimalType:
                                                                          DecimalType
                                                                              .periodDecimal,
                                                                    )}',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmall
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodySmallFamily,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                        ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        8.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Icon(
                                                              Icons
                                                                  .arrow_forward_ios_outlined,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .backArrowColor,
                                                              size: 14.0,
                                                            ),
                                                          ),
                                                        ].divide(SizedBox(
                                                            width: 10.0)),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ].divide(SizedBox(height: 20.0)),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ));
      },
    );
  }
}
