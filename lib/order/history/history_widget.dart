import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/order/reting/reting_widget.dart';
import '/order/reting_component/reting_component_widget.dart';
import '/shimmer/shimmer/shimmer_widget.dart';
import '/shimmer/shimmer_history/shimmer_history_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'history_model.dart';
export 'history_model.dart';

class HistoryWidget extends StatefulWidget {
  const HistoryWidget({super.key});

  @override
  State<HistoryWidget> createState() => _HistoryWidgetState();
}

class _HistoryWidgetState extends State<HistoryWidget> {
  late HistoryModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HistoryModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.loadApi = true;
      safeSetState(() {});
    });

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
          'Final order ready',
          'Order confirmed and customer paid',
          'Ready for pickup',
          'Order picked up by Delivery Agent',
          'Order Delivered',
          'Order Cancelled'
        ]),
      )..listen((snapshot) {
          List<OrderNotificationsRecord> historyOrderNotificationsRecordList =
              snapshot;
          if (_model.historyPreviousSnapshot != null &&
              !const ListEquality(OrderNotificationsRecordDocumentEquality())
                  .equals(historyOrderNotificationsRecordList,
                      _model.historyPreviousSnapshot)) {
            () async {
              _model.rebuild = 'Rebuild';
              safeSetState(() {});

              safeSetState(() {});
            }();
          }
          _model.historyPreviousSnapshot = snapshot;
        }),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return const Scaffold(
            backgroundColor: Color(0xFFF4F6FB),
            body: Center(
              child: SizedBox(
                width: 50,
                height: 50,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Color(0x00FFFFFF),
                  ),
                ),
              ),
            ),
          );
        }
        List<OrderNotificationsRecord> historyOrderNotificationsRecordList =
            snapshot.data!;

        return Title(
            title: 'History',
            color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Scaffold(
                key: scaffoldKey,
                backgroundColor: const Color(0xFFF4F6FB),
                appBar: responsiveVisibility(
                  context: context,
                  tabletLandscape: false,
                  desktop: false,
                )
                    ? AppBar(
                        backgroundColor: const Color(0xFFF4F6FB),
                        automaticallyImplyLeading: false,
                        title: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 10.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Order History',
                                style: FlutterFlowTheme.of(context)
                                    .headlineMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .headlineMediumFamily,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      fontSize: 26.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .headlineMediumFamily),
                                    ),
                              ),
                            ].divide(const SizedBox(width: 20.0)),
                          ),
                        ),
                        actions: const [],
                        centerTitle: true,
                        elevation: 0.0,
                      )
                    : null,
                body: SafeArea(
                  top: true,
                  child: Align(
                    alignment: const AlignmentDirectional(0.0, -1.0),
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
                      decoration: const BoxDecoration(
                        color: Color(0xFFF4F6FB),
                      ),
                      child: Align(
                        alignment: const AlignmentDirectional(0.0, -1.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    20.0, 0.0, 20.0, 0.0),
                                child: SingleChildScrollView(
                                  primary: false,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      AuthUserStreamWidget(
                                        builder: (context) =>
                                            FutureBuilder<ApiCallResponse>(
                                          future: (_model
                                                      .apiRequestCompleter ??=
                                                  Completer<ApiCallResponse>()
                                                    ..complete(AirtableApiGroup
                                                        .findOrderListDataCall
                                                        .call(
                                                      phoneNumber: functions
                                                          .getphoneNumber(
                                                              currentPhoneNumber),
                                                    )))
                                              .future,
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return const ShimmerHistoryWidget();
                                            }
                                            final listViewFindOrderListDataResponse =
                                                snapshot.data!;

                                            return Builder(
                                              builder: (context) {
                                                final orders = AirtableApiGroup
                                                        .findOrderListDataCall
                                                        .records(
                                                          listViewFindOrderListDataResponse
                                                              .jsonBody,
                                                        )
                                                        ?.toList() ??
                                                    [];

                                                return RefreshIndicator(
                                                  onRefresh: () async {
                                                    safeSetState(() => _model
                                                            .apiRequestCompleter =
                                                        null);
                                                    await _model
                                                        .waitForApiRequestCompleted();
                                                  },
                                                  child: ListView.separated(
                                                    padding: EdgeInsets.zero,
                                                    primary: false,
                                                    shrinkWrap: true,
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    itemCount: orders.length,
                                                    separatorBuilder: (_, __) =>
                                                        const SizedBox(height: 10.0),
                                                    itemBuilder:
                                                        (context, ordersIndex) {
                                                      final ordersItem =
                                                          orders[ordersIndex];
                                                      return InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          if ((functions.jsonConvertToString(
                                                                      getJsonField(
                                                                    ordersItem,
                                                                    r'''$.fields.Status''',
                                                                  )) ==
                                                                  'New Order') ||
                                                              (functions.jsonConvertToString(
                                                                      getJsonField(
                                                                    ordersItem,
                                                                    r'''$.fields.Status''',
                                                                  )) ==
                                                                  'Waiting for availability') ||
                                                              (functions.jsonConvertToString(
                                                                      getJsonField(
                                                                    ordersItem,
                                                                    r'''$.fields.Status''',
                                                                  )) ==
                                                                  'Availability updated')) {
                                                            context.pushNamed(
                                                              'Status',
                                                              queryParameters: {
                                                                'ticketid':
                                                                    serializeParam(
                                                                  getJsonField(
                                                                    ordersItem,
                                                                    r'''$.fields["Ticket ID"]''',
                                                                  ),
                                                                  ParamType.int,
                                                                ),
                                                                'pageName':
                                                                    serializeParam(
                                                                  'History',
                                                                  ParamType
                                                                      .String,
                                                                ),
                                                              }.withoutNulls,
                                                              extra: <String,
                                                                  dynamic>{
                                                                kTransitionInfoKey:
                                                                    const TransitionInfo(
                                                                  hasTransition:
                                                                      true,
                                                                  transitionType:
                                                                      PageTransitionType
                                                                          .bottomToTop,
                                                                ),
                                                              },
                                                            );
                                                          } else {
                                                            if (functions
                                                                    .jsonConvertToString(
                                                                        getJsonField(
                                                                  ordersItem,
                                                                  r'''$.fields.Status''',
                                                                )) ==
                                                                'Final order ready') {
                                                              context.pushNamed(
                                                                'medicineCart',
                                                                queryParameters:
                                                                    {
                                                                  'ticketId':
                                                                      serializeParam(
                                                                    getJsonField(
                                                                      ordersItem,
                                                                      r'''$.fields["Ticket ID"]''',
                                                                    ),
                                                                    ParamType
                                                                        .int,
                                                                  ),
                                                                }.withoutNulls,
                                                              );
                                                            } else {
                                                              context.pushNamed(
                                                                'statusOfOrder',
                                                                queryParameters:
                                                                    {
                                                                  'ticketid':
                                                                      serializeParam(
                                                                    getJsonField(
                                                                      ordersItem,
                                                                      r'''$.fields["Ticket ID"]''',
                                                                    ),
                                                                    ParamType
                                                                        .int,
                                                                  ),
                                                                  'pagename':
                                                                      serializeParam(
                                                                    'History',
                                                                    ParamType
                                                                        .String,
                                                                  ),
                                                                }.withoutNulls,
                                                                extra: <String,
                                                                    dynamic>{
                                                                  kTransitionInfoKey:
                                                                      const TransitionInfo(
                                                                    hasTransition:
                                                                        true,
                                                                    transitionType:
                                                                        PageTransitionType
                                                                            .topToBottom,
                                                                  ),
                                                                },
                                                              );
                                                            }
                                                          }
                                                        },
                                                        child: Container(
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  1.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryBackground,
                                                            boxShadow: const [
                                                              BoxShadow(
                                                                blurRadius:
                                                                    24.0,
                                                                color: Color(
                                                                    0x34959DA5),
                                                                offset: Offset(
                                                                  0.0,
                                                                  8.0,
                                                                ),
                                                                spreadRadius:
                                                                    0.0,
                                                              )
                                                            ],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0),
                                                          ),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Padding(
                                                                padding: const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        16.0,
                                                                        16.0,
                                                                        8.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Container(
                                                                      width:
                                                                          46.0,
                                                                      height:
                                                                          45.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: const Color(
                                                                            0xFFEBFFEF),
                                                                        borderRadius:
                                                                            BorderRadius.circular(12.0),
                                                                      ),
                                                                      child:
                                                                          const Icon(
                                                                        Icons
                                                                            .check,
                                                                        color: Color(
                                                                            0xFF24963F),
                                                                        size:
                                                                            24.0,
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Padding(
                                                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                                                15.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Text(
                                                                                  () {
                                                                                    if ((functions.jsonConvertToString(getJsonField(
                                                                                              ordersItem,
                                                                                              r'''$.fields.Status''',
                                                                                            )) ==
                                                                                            'New Order') ||
                                                                                        (functions.jsonConvertToString(getJsonField(
                                                                                              ordersItem,
                                                                                              r'''$.fields.Status''',
                                                                                            )) ==
                                                                                            'Waiting for availability') ||
                                                                                        (functions.jsonConvertToString(getJsonField(
                                                                                              ordersItem,
                                                                                              r'''$.fields.Status''',
                                                                                            )) ==
                                                                                            'Availability updated')) {
                                                                                      return 'Preparing Cart';
                                                                                    } else if (functions.jsonConvertToString(getJsonField(
                                                                                          ordersItem,
                                                                                          r'''$.fields.Status''',
                                                                                        )) ==
                                                                                        'Final order ready') {
                                                                                      return 'Awaiting payment';
                                                                                    } else if (functions.jsonConvertToString(getJsonField(
                                                                                          ordersItem,
                                                                                          r'''$.fields.Status''',
                                                                                        )) ==
                                                                                        'Order confirmed and customer paid') {
                                                                                      return 'Packing';
                                                                                    } else if (functions.jsonConvertToString(getJsonField(
                                                                                          ordersItem,
                                                                                          r'''$.fields.Status''',
                                                                                        )) ==
                                                                                        'Ready for pickup') {
                                                                                      return 'Awaiting pickup';
                                                                                    } else if (functions.jsonConvertToString(getJsonField(
                                                                                          ordersItem,
                                                                                          r'''$.fields.Status''',
                                                                                        )) ==
                                                                                        'Order picked up by Delivery Agent') {
                                                                                      return 'On the way';
                                                                                    } else if (functions.jsonConvertToString(getJsonField(
                                                                                          ordersItem,
                                                                                          r'''$.fields.Status''',
                                                                                        )) ==
                                                                                        'Order Delivered') {
                                                                                      return ' Delivered';
                                                                                    } else if (functions.jsonConvertToString(getJsonField(
                                                                                          ordersItem,
                                                                                          r'''$.fields.Status''',
                                                                                        )) ==
                                                                                        'Order Cancelled') {
                                                                                      return 'Cancelled';
                                                                                    } else {
                                                                                      return '    ';
                                                                                    }
                                                                                  }(),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Figtree',
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w800,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey('Figtree'),
                                                                                      ),
                                                                                ),
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Text(
                                                                                      '₹${formatNumber(
                                                                                        functions.checkInt(getJsonField(
                                                                                          ordersItem,
                                                                                          r'''$.fields["Bill Total Amount"]''',
                                                                                        ))
                                                                                            ? getJsonField(
                                                                                                ordersItem,
                                                                                                r'''$.fields["Bill Total Amount"]''',
                                                                                              )
                                                                                            : getJsonField(
                                                                                                ordersItem,
                                                                                                r'''$.fields["Bill Total Amount"]''',
                                                                                              ),
                                                                                        formatType: FormatType.decimal,
                                                                                        decimalType: DecimalType.periodDecimal,
                                                                                      )}',
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Figtree',
                                                                                            fontSize: 12.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.normal,
                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey('Figtree'),
                                                                                          ),
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                      child: Container(
                                                                                        width: 6.0,
                                                                                        height: 6.0,
                                                                                        decoration: BoxDecoration(
                                                                                          color: const Color(0xFFD9D9D9),
                                                                                          borderRadius: BorderRadius.circular(100.0),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                      child: Text(
                                                                                        dateTimeFormat(
                                                                                            "d/M h:mm a",
                                                                                            functions.stringToTimestamp(getJsonField(
                                                                                              ordersItem,
                                                                                              r'''$.createdTime''',
                                                                                            ).toString())),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Figtree',
                                                                                              fontSize: 12.0,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.normal,
                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey('Figtree'),
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Text(
                                                                                      'Order#${getJsonField(
                                                                                        ordersItem,
                                                                                        r'''$.fields["Ticket ID"]''',
                                                                                      ).toString()}',
                                                                                      style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                            fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                                            letterSpacing: 0.0,
                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyLargeFamily),
                                                                                          ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ].divide(const SizedBox(height: 4.0)),
                                                                            ),
                                                                          ),
                                                                          Icon(
                                                                            Icons.arrow_forward,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            size:
                                                                                24.0,
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              if ((functions.jsonConvertToString(
                                                                          getJsonField(
                                                                        ordersItem,
                                                                        r'''$.fields.Status''',
                                                                      )) !=
                                                                      'New Order') ||
                                                                  (functions.jsonConvertToString(
                                                                          getJsonField(
                                                                        ordersItem,
                                                                        r'''$.fields.Status''',
                                                                      )) !=
                                                                      'Waiting for availability') ||
                                                                  (functions.jsonConvertToString(
                                                                          getJsonField(
                                                                        ordersItem,
                                                                        r'''$.fields.Status''',
                                                                      )) !=
                                                                      'Availability updated'))
                                                                const Divider(
                                                                  thickness:
                                                                      0.5,
                                                                  color: Color(
                                                                      0xFFEDEDED),
                                                                ),
                                                              FutureBuilder<
                                                                  ApiCallResponse>(
                                                                future: AirtableApiGroup
                                                                    .getMedicineDetailsCall
                                                                    .call(
                                                                  orderTicketId:
                                                                      getJsonField(
                                                                    ordersItem,
                                                                    r'''$.fields["Ticket ID"]''',
                                                                  ),
                                                                ),
                                                                builder: (context,
                                                                    snapshot) {
                                                                  // Customize what your widget looks like when it's loading.
                                                                  if (!snapshot
                                                                      .hasData) {
                                                                    return const ShimmerWidget();
                                                                  }
                                                                  final containerGetMedicineDetailsResponse =
                                                                      snapshot
                                                                          .data!;

                                                                  return Container(
                                                                    decoration:
                                                                        const BoxDecoration(),
                                                                    child:
                                                                        Builder(
                                                                      builder:
                                                                          (context) {
                                                                        final medicens = AirtableApiGroup.getMedicineDetailsCall
                                                                                .recordList(
                                                                                  containerGetMedicineDetailsResponse.jsonBody,
                                                                                )
                                                                                ?.toList() ??
                                                                            [];

                                                                        return Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: List.generate(
                                                                              medicens.length,
                                                                              (medicensIndex) {
                                                                            final medicensItem =
                                                                                medicens[medicensIndex];
                                                                            return Padding(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(15.0, 10.0, 0.0, 10.0),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Text(
                                                                                    '${getJsonField(
                                                                                      medicensItem,
                                                                                      r'''$.fields.Quantity_Cart''',
                                                                                    ).toString()}X',
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Figtree',
                                                                                          fontSize: 10.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.normal,
                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey('Figtree'),
                                                                                        ),
                                                                                  ),
                                                                                  Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      Padding(
                                                                                        padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                        child: Text(
                                                                                          getJsonField(
                                                                                            medicensItem,
                                                                                            r'''$.fields["Medicine Name"]''',
                                                                                          ).toString(),
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Figtree',
                                                                                                fontSize: 10.0,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FontWeight.normal,
                                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey('Figtree'),
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                      if (getJsonField(
                                                                                            medicensItem,
                                                                                            r'''$.fields.Medicine_strip_size''',
                                                                                          ) !=
                                                                                          null)
                                                                                        Padding(
                                                                                          padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                          child: Text(
                                                                                            getJsonField(
                                                                                              medicensItem,
                                                                                              r'''$.fields.Medicine_strip_size''',
                                                                                            ).toString(),
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Figtree',
                                                                                                  fontSize: 10.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.normal,
                                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey('Figtree'),
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                    ],
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            );
                                                                          }),
                                                                        );
                                                                      },
                                                                    ),
                                                                  );
                                                                },
                                                              ),
                                                              if (functions
                                                                      .jsonConvertToString(
                                                                          getJsonField(
                                                                    ordersItem,
                                                                    r'''$.fields.Status''',
                                                                  )) ==
                                                                  'Order Delivered')
                                                                Container(
                                                                  width: double
                                                                      .infinity,
                                                                  height: 0.5,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .alternate,
                                                                  ),
                                                                ),
                                                              if (functions
                                                                      .jsonConvertToString(
                                                                          getJsonField(
                                                                    ordersItem,
                                                                    r'''$.fields.Status''',
                                                                  )) ==
                                                                  'Order Delivered')
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    if (responsiveVisibility(
                                                                      context:
                                                                          context,
                                                                      phone:
                                                                          false,
                                                                      tablet:
                                                                          false,
                                                                      tabletLandscape:
                                                                          false,
                                                                      desktop:
                                                                          false,
                                                                    ))
                                                                      Container(
                                                                        width: MediaQuery.sizeOf(context).width *
                                                                            0.43,
                                                                        height:
                                                                            47.0,
                                                                        decoration:
                                                                            const BoxDecoration(),
                                                                        child:
                                                                            Align(
                                                                          alignment: const AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            'Reorder',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Figtree',
                                                                                  color: const Color(0xFF0C831F),
                                                                                  fontSize: 13.0,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey('Figtree'),
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    if (responsiveVisibility(
                                                                      context:
                                                                          context,
                                                                      phone:
                                                                          false,
                                                                      tablet:
                                                                          false,
                                                                      tabletLandscape:
                                                                          false,
                                                                      desktop:
                                                                          false,
                                                                    ))
                                                                      SizedBox(
                                                                        height:
                                                                            47.0,
                                                                        child:
                                                                            VerticalDivider(
                                                                          thickness:
                                                                              0.5,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).alternate,
                                                                        ),
                                                                      ),
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        if (getJsonField(
                                                                              ordersItem,
                                                                              r'''$.fields.Rating''',
                                                                            ) ==
                                                                            null)
                                                                          InkWell(
                                                                            splashColor:
                                                                                Colors.transparent,
                                                                            focusColor:
                                                                                Colors.transparent,
                                                                            hoverColor:
                                                                                Colors.transparent,
                                                                            highlightColor:
                                                                                Colors.transparent,
                                                                            onTap:
                                                                                () async {
                                                                              await showModalBottomSheet(
                                                                                isScrollControlled: true,
                                                                                backgroundColor: Colors.transparent,
                                                                                isDismissible: false,
                                                                                enableDrag: false,
                                                                                context: context,
                                                                                builder: (context) {
                                                                                  return WebViewAware(
                                                                                    child: GestureDetector(
                                                                                      onTap: () => FocusScope.of(context).unfocus(),
                                                                                      child: Padding(
                                                                                        padding: MediaQuery.viewInsetsOf(context),
                                                                                        child: RetingWidget(
                                                                                          orderrecordId: getJsonField(
                                                                                            ordersItem,
                                                                                            r'''$.id''',
                                                                                          ).toString(),
                                                                                          refereceDatabase: () async {
                                                                                            safeSetState(() => _model.apiRequestCompleter = null);
                                                                                            await _model.waitForApiRequestCompleted();
                                                                                            FFAppState().RebuildPage = 'Rebuild';
                                                                                            safeSetState(() {});
                                                                                          },
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  );
                                                                                },
                                                                              ).then((value) => safeSetState(() {}));
                                                                            },
                                                                            child:
                                                                                Container(
                                                                              width: MediaQuery.sizeOf(context).width * 0.4,
                                                                              height: 47.0,
                                                                              decoration: const BoxDecoration(),
                                                                              child: Align(
                                                                                alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                child: Text(
                                                                                  'Rate order',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                        color: const Color(0xFF0C831F),
                                                                                        fontSize: 13.0,
                                                                                        letterSpacing: 0.0,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        if (getJsonField(
                                                                              ordersItem,
                                                                              r'''$.fields.Rating''',
                                                                            ) !=
                                                                            null)
                                                                          Padding(
                                                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                12.0,
                                                                                0.0,
                                                                                12.0),
                                                                            child:
                                                                                wrapWithModel(
                                                                              model: _model.retingComponentModels.getModel(
                                                                                ordersIndex.toString(),
                                                                                ordersIndex,
                                                                              ),
                                                                              updateCallback: () => safeSetState(() {}),
                                                                              child: RetingComponentWidget(
                                                                                key: Key(
                                                                                  'Keyilt_${ordersIndex.toString()}',
                                                                                ),
                                                                                ratings: getJsonField(
                                                                                  ordersItem,
                                                                                  r'''$.fields.Rating''',
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                            ],
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                    ].divide(const SizedBox(height: 15.0)),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
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
