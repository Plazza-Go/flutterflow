import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/cart/cart_items/cart_items_widget.dart';
import '/cart/emptymedicine/emptymedicine_widget.dart';
import '/cart/handlingcharges/handlingcharges_widget.dart';
import '/cart/openperscription_required/openperscription_required_widget.dart';
import '/cart/prescription_requied/prescription_requied_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/location/components/add_new_address/add_new_address_widget.dart';
import '/shimmer/cart_shimmer/cart_shimmer_widget.dart';
import '/shimmer/location_search_shimmer/location_search_shimmer_widget.dart';
import '/shimmer/shimmer_address/shimmer_address_widget.dart';
import '/upload_prescription/components/view_prescription/view_prescription_widget.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'medicine_cart_model.dart';
export 'medicine_cart_model.dart';

class MedicineCartWidget extends StatefulWidget {
  const MedicineCartWidget({
    super.key,
    required this.ticketId,
  });

  final int? ticketId;

  @override
  State<MedicineCartWidget> createState() => _MedicineCartWidgetState();
}

class _MedicineCartWidgetState extends State<MedicineCartWidget> {
  late MedicineCartModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MedicineCartModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().itemsPrice = 0.0;
      FFAppState().Donothaveprescription = false;
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

    return FutureBuilder<ApiCallResponse>(
      future: AirtableApiGroup.findSingleOrderCall.call(
        ticketID: widget.ticketId,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: const CartShimmerWidget(),
          );
        }
        final medicineCartFindSingleOrderResponse = snapshot.data!;

        return Title(
            title: 'medicineCart',
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
                        iconTheme: IconThemeData(
                            color: FlutterFlowTheme.of(context).primary),
                        automaticallyImplyLeading: false,
                        title: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            FlutterFlowIconButton(
                              buttonSize: 40.0,
                              icon: Icon(
                                Icons.arrow_back,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24.0,
                              ),
                              onPressed: () async {
                                context.safePop();
                              },
                            ),
                            Text(
                              'Your cart',
                              style: FlutterFlowTheme.of(context)
                                  .titleLarge
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .titleLargeFamily,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .titleLargeFamily),
                                  ),
                            ),
                          ].divide(const SizedBox(width: 20.0)),
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
                    child: FutureBuilder<ApiCallResponse>(
                      future: (_model.apiRequestCompleter ??= Completer<
                              ApiCallResponse>()
                            ..complete(
                                AirtableApiGroup.getMedicineDetailsCall.call(
                              orderTicketId: widget.ticketId,
                              quantityvalue: 0,
                            )))
                          .future,
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return const CartShimmerWidget();
                        }
                        final mainContainerGetMedicineDetailsResponse =
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
                          decoration: const BoxDecoration(),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              if ((AirtableApiGroup.findSingleOrderCall
                                              .presscriptionCheck(
                                            medicineCartFindSingleOrderResponse
                                                .jsonBody,
                                          ) ==
                                          null ||
                                      AirtableApiGroup.findSingleOrderCall
                                              .presscriptionCheck(
                                            medicineCartFindSingleOrderResponse
                                                .jsonBody,
                                          ) ==
                                          '') &&
                                  FFAppState().Donothaveprescription &&
                                  (FFAppState()
                                          .CartMedicineDetails
                                          .where((e) =>
                                              e.prescriptionRequired ==
                                              'Prescription Required')
                                          .toList().isNotEmpty))
                                Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        20.0, 0.0, 20.0, 0.0),
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      height: 44.0,
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFFFEDF8),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 10.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'I don’t have a prescription (get a call back)',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodySmall
                                                  .override(
                                                    fontFamily:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodySmallFamily,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    fontSize: 12.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.bold,
                                                    useGoogleFonts: GoogleFonts
                                                            .asMap()
                                                        .containsKey(
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmallFamily),
                                                  ),
                                            ),
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                FFAppState()
                                                        .Donothaveprescription =
                                                    !(FFAppState()
                                                            .Donothaveprescription ??
                                                        true);
                                                FFAppState().update(() {});
                                                await showModalBottomSheet(
                                                  isScrollControlled: true,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  isDismissible: false,
                                                  enableDrag: false,
                                                  context: context,
                                                  builder: (context) {
                                                    return WebViewAware(
                                                      child: GestureDetector(
                                                        onTap: () =>
                                                            FocusScope.of(
                                                                    context)
                                                                .unfocus(),
                                                        child: Padding(
                                                          padding: MediaQuery
                                                              .viewInsetsOf(
                                                                  context),
                                                          child:
                                                              PrescriptionRequiedWidget(
                                                            orderId:
                                                                AirtableApiGroup
                                                                    .findSingleOrderCall
                                                                    .recordId(
                                                              medicineCartFindSingleOrderResponse
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
                                              child: Text(
                                                'Change',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily),
                                                        ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              if (AirtableApiGroup.findSingleOrderCall
                                          .presscriptionCheck(
                                        medicineCartFindSingleOrderResponse
                                            .jsonBody,
                                      ) !=
                                      null &&
                                  AirtableApiGroup.findSingleOrderCall
                                          .presscriptionCheck(
                                        medicineCartFindSingleOrderResponse
                                            .jsonBody,
                                      ) !=
                                      '')
                                Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        20.0, 0.0, 20.0, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        await showModalBottomSheet(
                                          isScrollControlled: true,
                                          backgroundColor: Colors.transparent,
                                          enableDrag: false,
                                          context: context,
                                          builder: (context) {
                                            return WebViewAware(
                                              child: GestureDetector(
                                                onTap: () =>
                                                    FocusScope.of(context)
                                                        .unfocus(),
                                                child: Padding(
                                                  padding:
                                                      MediaQuery.viewInsetsOf(
                                                          context),
                                                  child: ViewPrescriptionWidget(
                                                    ticketid: widget.ticketId,
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        ).then((value) => safeSetState(() {}));
                                      },
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        height: 44.0,
                                        decoration: BoxDecoration(
                                          color: const Color(0xFFFFEDF8),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 10.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                '${AirtableApiGroup.findSingleOrderCall.prescriptionList(
                                                      medicineCartFindSingleOrderResponse
                                                          .jsonBody,
                                                    )?.length.toString()} Prescriptions uploaded. Tap to see files.',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmall
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodySmallFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmallFamily),
                                                        ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 0.0),
                                  child: Container(
                                    decoration: const BoxDecoration(),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        safeSetState(() =>
                                            _model.apiRequestCompleter = null);
                                        await _model
                                            .waitForApiRequestCompleted();
                                      },
                                      child: SingleChildScrollView(
                                        primary: false,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 0.0, 20.0, 0.0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  boxShadow: const [
                                                    BoxShadow(
                                                      blurRadius: 24.0,
                                                      color: Color(0x34959DA5),
                                                      offset: Offset(
                                                        0.0,
                                                        8.0,
                                                      ),
                                                      spreadRadius: 0.0,
                                                    )
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 20.0, 0.0, 20.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      if (AirtableApiGroup
                                                              .getMedicineDetailsCall
                                                              .recordList(
                                                                mainContainerGetMedicineDetailsResponse
                                                                    .jsonBody,
                                                              )
                                                              ?.length !=
                                                          0)
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      20.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Text(
                                                            'Delivery in ${FFAppState().Serviceability.deliverytime}',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily),
                                                                ),
                                                          ),
                                                        ),
                                                      Divider(
                                                        thickness: 1.0,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                      ),
                                                      FutureBuilder<
                                                          List<
                                                              AppResourcesRecord>>(
                                                        future: FFAppState()
                                                            .appAssets(
                                                          requestFn: () =>
                                                              queryAppResourcesRecordOnce(
                                                            singleRecord: true,
                                                          ),
                                                        ),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
                                                            return const LocationSearchShimmerWidget();
                                                          }
                                                          List<AppResourcesRecord>
                                                              containerAppResourcesRecordList =
                                                              snapshot.data!;
                                                          // Return an empty Container when the item does not exist.
                                                          if (snapshot
                                                              .data!.isEmpty) {
                                                            return Container();
                                                          }
                                                          final containerAppResourcesRecord =
                                                              containerAppResourcesRecordList
                                                                      .isNotEmpty
                                                                  ? containerAppResourcesRecordList
                                                                      .first
                                                                  : null;

                                                          return Container(
                                                            decoration:
                                                                const BoxDecoration(),
                                                            child: Builder(
                                                              builder:
                                                                  (context) {
                                                                final medicine =
                                                                    AirtableApiGroup
                                                                            .getMedicineDetailsCall
                                                                            .recordList(
                                                                              mainContainerGetMedicineDetailsResponse.jsonBody,
                                                                            )
                                                                            ?.toList() ??
                                                                        [];
                                                                if (medicine
                                                                    .isEmpty) {
                                                                  return const EmptymedicineWidget();
                                                                }

                                                                return Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: List.generate(
                                                                      medicine
                                                                          .length,
                                                                      (medicineIndex) {
                                                                    final medicineItem =
                                                                        medicine[
                                                                            medicineIndex];
                                                                    return wrapWithModel(
                                                                      model: _model
                                                                          .cartItemModels
                                                                          .getModel(
                                                                        medicineIndex
                                                                            .toString(),
                                                                        medicineIndex,
                                                                      ),
                                                                      updateCallback:
                                                                          () =>
                                                                              safeSetState(() {}),
                                                                      updateOnChange:
                                                                          true,
                                                                      child:
                                                                          CartItemsWidget(
                                                                        key:
                                                                            Key(
                                                                          'Keymlf_${medicineIndex.toString()}',
                                                                        ),
                                                                        medicineimageurl:
                                                                            getJsonField(
                                                                          medicineItem,
                                                                          r'''$.fields.MedicineImages[0].thumbnails.large.url''',
                                                                        ),
                                                                        defultImageurl:
                                                                            containerAppResourcesRecord!.defaultMedicineImageCart,
                                                                        medicine:
                                                                            getJsonField(
                                                                          medicineItem,
                                                                          r'''$.fields["Medicine Name"]''',
                                                                        ),
                                                                        quantity:
                                                                            getJsonField(
                                                                          medicineItem,
                                                                          r'''$.fields.Quantity''',
                                                                        ),
                                                                        quantityCart:
                                                                            getJsonField(
                                                                          medicineItem,
                                                                          r'''$.fields.Quantity_Cart''',
                                                                        ),
                                                                        medicineRecordid:
                                                                            getJsonField(
                                                                          medicineItem,
                                                                          r'''$.id''',
                                                                        ),
                                                                        medicineRate:
                                                                            getJsonField(
                                                                          medicineItem,
                                                                          r'''$.fields.MedicineRate''',
                                                                        ),
                                                                        ticketid:
                                                                            widget.ticketId!,
                                                                        orderRecordId: AirtableApiGroup
                                                                            .findSingleOrderCall
                                                                            .recordId(
                                                                          medicineCartFindSingleOrderResponse
                                                                              .jsonBody,
                                                                        ),
                                                                        description:
                                                                            getJsonField(
                                                                          medicineItem,
                                                                          r'''$.fields.Medicine_strip_size''',
                                                                        ),
                                                                        itemtotal:
                                                                            getJsonField(
                                                                          medicineCartFindSingleOrderResponse
                                                                              .jsonBody,
                                                                          r'''$.records[:].fields["Item Total"]''',
                                                                        ),
                                                                        productId:
                                                                            getJsonField(
                                                                          medicineItem,
                                                                          r'''$.fields.Product_ID''',
                                                                        ).toString(),
                                                                        orderSource:
                                                                            valueOrDefault<String>(
                                                                          AirtableApiGroup
                                                                              .findSingleOrderCall
                                                                              .orderSource(
                                                                            medicineCartFindSingleOrderResponse.jsonBody,
                                                                          ),
                                                                          'Rx',
                                                                        ),
                                                                      ),
                                                                    );
                                                                  }),
                                                                );
                                                              },
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                    ].divide(
                                                        const SizedBox(height: 10.0)),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            if (AirtableApiGroup
                                                    .getMedicineDetailsCall
                                                    .recordList(
                                                      mainContainerGetMedicineDetailsResponse
                                                          .jsonBody,
                                                    )
                                                    ?.length !=
                                                0)
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        20.0, 0.0, 20.0, 0.0),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    boxShadow: const [
                                                      BoxShadow(
                                                        blurRadius: 24.0,
                                                        color:
                                                            Color(0x34959DA5),
                                                        offset: Offset(
                                                          0.0,
                                                          8.0,
                                                        ),
                                                        spreadRadius: 0.0,
                                                      )
                                                    ],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(10.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets.all(
                                                                  8.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Text(
                                                                'Bill details',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                    ),
                                                              ),
                                                            ].divide(const SizedBox(
                                                                width: 10.0)),
                                                          ),
                                                        ),
                                                        if (getJsonField(
                                                              medicineCartFindSingleOrderResponse
                                                                  .jsonBody,
                                                              r'''$.records[:].fields["Item Total"]''',
                                                            ) !=
                                                            null)
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets.all(
                                                                    8.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                      child: Image
                                                                          .asset(
                                                                        'assets/images/Icon_(1).png',
                                                                        width:
                                                                            16.0,
                                                                        height:
                                                                            16.0,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          8.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        'Items total',
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
                                                                Text(
                                                                  '₹ ${formatNumber(
                                                                    FFAppState().itemsPrice >
                                                                            0.0
                                                                        ? FFAppState()
                                                                            .itemsPrice
                                                                        : getJsonField(
                                                                            medicineCartFindSingleOrderResponse.jsonBody,
                                                                            r'''$.records[:].fields["Item Total"]''',
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
                                                                      .bodyLarge
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyLargeFamily),
                                                                      ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets.all(
                                                                  8.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Builder(
                                                                builder:
                                                                    (context) =>
                                                                        InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    await showDialog(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (dialogContext) {
                                                                        return Dialog(
                                                                          elevation:
                                                                              0,
                                                                          insetPadding:
                                                                              EdgeInsets.zero,
                                                                          backgroundColor:
                                                                              Colors.transparent,
                                                                          alignment:
                                                                              const AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                          child:
                                                                              WebViewAware(
                                                                            child:
                                                                                GestureDetector(
                                                                              onTap: () => FocusScope.of(dialogContext).unfocus(),
                                                                              child: SizedBox(
                                                                                height: 300.0,
                                                                                width: 300.0,
                                                                                child: HandlingchargesWidget(
                                                                                  packaging: valueOrDefault<int>(
                                                                                    AirtableApiGroup.findSingleOrderCall.packingfee(
                                                                                      medicineCartFindSingleOrderResponse.jsonBody,
                                                                                    ),
                                                                                    15,
                                                                                  ),
                                                                                  platform: valueOrDefault<int>(
                                                                                    AirtableApiGroup.findSingleOrderCall.platformfee(
                                                                                      medicineCartFindSingleOrderResponse.jsonBody,
                                                                                    ),
                                                                                    2,
                                                                                  ),
                                                                                  canvenience: valueOrDefault<int>(
                                                                                    AirtableApiGroup.findSingleOrderCall.conveniencefee(
                                                                                      medicineCartFindSingleOrderResponse.jsonBody,
                                                                                    ),
                                                                                    5,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    );
                                                                  },
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      ClipRRect(
                                                                        borderRadius:
                                                                            BorderRadius.circular(0.0),
                                                                        child: Image
                                                                            .asset(
                                                                          'assets/images/shopping-bag.png',
                                                                          width:
                                                                              16.0,
                                                                          height:
                                                                              16.0,
                                                                          fit: BoxFit
                                                                              .cover,
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            8.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          'Handling charges',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodySmall
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                letterSpacing: 0.0,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                              ),
                                                                        ),
                                                                      ),
                                                                      Builder(
                                                                        builder:
                                                                            (context) =>
                                                                                Padding(
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                                              8.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
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
                                                                              await showDialog(
                                                                                context: context,
                                                                                builder: (dialogContext) {
                                                                                  return Dialog(
                                                                                    elevation: 0,
                                                                                    insetPadding: EdgeInsets.zero,
                                                                                    backgroundColor: Colors.transparent,
                                                                                    alignment: const AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                    child: WebViewAware(
                                                                                      child: GestureDetector(
                                                                                        onTap: () => FocusScope.of(dialogContext).unfocus(),
                                                                                        child: SizedBox(
                                                                                          height: 300.0,
                                                                                          width: 300.0,
                                                                                          child: HandlingchargesWidget(
                                                                                            packaging: valueOrDefault<int>(
                                                                                              AirtableApiGroup.findSingleOrderCall.packingfee(
                                                                                                medicineCartFindSingleOrderResponse.jsonBody,
                                                                                              ),
                                                                                              15,
                                                                                            ),
                                                                                            platform: valueOrDefault<int>(
                                                                                              AirtableApiGroup.findSingleOrderCall.platformfee(
                                                                                                medicineCartFindSingleOrderResponse.jsonBody,
                                                                                              ),
                                                                                              2,
                                                                                            ),
                                                                                            canvenience: valueOrDefault<int>(
                                                                                              AirtableApiGroup.findSingleOrderCall.conveniencefee(
                                                                                                medicineCartFindSingleOrderResponse.jsonBody,
                                                                                              ),
                                                                                              5,
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  );
                                                                                },
                                                                              );
                                                                            },
                                                                            child:
                                                                                Icon(
                                                                              Icons.info_outlined,
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                              size: 15.0,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            8.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      '₹ ${(valueOrDefault<int>(
                                                                            AirtableApiGroup.findSingleOrderCall.platformfee(
                                                                              medicineCartFindSingleOrderResponse.jsonBody,
                                                                            ),
                                                                            2,
                                                                          ) + valueOrDefault<int>(
                                                                            AirtableApiGroup.findSingleOrderCall.conveniencefee(
                                                                              medicineCartFindSingleOrderResponse.jsonBody,
                                                                            ),
                                                                            5,
                                                                          ) + valueOrDefault<int>(
                                                                            AirtableApiGroup.findSingleOrderCall.packingfee(
                                                                              medicineCartFindSingleOrderResponse.jsonBody,
                                                                            ),
                                                                            15,
                                                                          )).toString()}',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyLarge
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyLargeFamily),
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  if (((AirtableApiGroup.findSingleOrderCall.platformfee(
                                                                                medicineCartFindSingleOrderResponse.jsonBody,
                                                                              )!) +
                                                                              (AirtableApiGroup.findSingleOrderCall.conveniencefee(
                                                                                medicineCartFindSingleOrderResponse.jsonBody,
                                                                              )!) +
                                                                              (AirtableApiGroup.findSingleOrderCall.packingfee(
                                                                                medicineCartFindSingleOrderResponse.jsonBody,
                                                                              )!))
                                                                          .toString() ==
                                                                      '0')
                                                                    Text(
                                                                      'FREE',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).customColor2,
                                                                            fontSize:
                                                                                13.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                          ),
                                                                    ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets.all(
                                                                  8.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            0.0),
                                                                    child: Image
                                                                        .asset(
                                                                      'assets/images/shopping-bag.png',
                                                                      width:
                                                                          16.0,
                                                                      height:
                                                                          16.0,
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      'Delivery charge (Inc taxes)',
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
                                                                  ),
                                                                ],
                                                              ),
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            8.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      '₹ ${valueOrDefault<String>(
                                                                        AirtableApiGroup
                                                                            .findSingleOrderCall
                                                                            .deliveryfee(
                                                                              medicineCartFindSingleOrderResponse.jsonBody,
                                                                            )
                                                                            ?.toString(),
                                                                        '40',
                                                                      )}',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyLarge
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyLargeFamily),
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  if (AirtableApiGroup
                                                                          .findSingleOrderCall
                                                                          .deliveryfee(
                                                                        medicineCartFindSingleOrderResponse
                                                                            .jsonBody,
                                                                      ) ==
                                                                      0)
                                                                    Text(
                                                                      'FREE',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).customColor2,
                                                                            fontSize:
                                                                                13.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                          ),
                                                                    ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        if (responsiveVisibility(
                                                          context: context,
                                                          phone: false,
                                                          tablet: false,
                                                          tabletLandscape:
                                                              false,
                                                          desktop: false,
                                                        ))
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets.all(
                                                                    8.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              0.0),
                                                                      child: Image
                                                                          .asset(
                                                                        'assets/images/mdi_brightness-percent.png',
                                                                        width:
                                                                            14.0,
                                                                        height:
                                                                            13.0,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          8.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        'Discount coupon',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Text(
                                                                      '-₹80',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).customColor2,
                                                                            fontSize:
                                                                                13.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                          ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        Divider(
                                                          thickness: 1.0,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .alternate,
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets.all(
                                                                  9.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Text(
                                                                'Grand total',
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
                                                                '₹ ${formatNumber(
                                                                  (FFAppState().itemsPrice >
                                                                              0.0
                                                                          ? FFAppState()
                                                                              .itemsPrice
                                                                          : getJsonField(
                                                                              medicineCartFindSingleOrderResponse.jsonBody,
                                                                              r'''$.records[:].fields["Item Total"]''',
                                                                            )) +
                                                                      ((AirtableApiGroup.findSingleOrderCall.platformfee(
                                                                                medicineCartFindSingleOrderResponse.jsonBody,
                                                                              )!) +
                                                                              (AirtableApiGroup.findSingleOrderCall.conveniencefee(
                                                                                medicineCartFindSingleOrderResponse.jsonBody,
                                                                              )!) +
                                                                              (AirtableApiGroup.findSingleOrderCall.packingfee(
                                                                                medicineCartFindSingleOrderResponse.jsonBody,
                                                                              )!))
                                                                          .toDouble() +
                                                                      AirtableApiGroup.findSingleOrderCall
                                                                          .deliveryfee(
                                                                            medicineCartFindSingleOrderResponse.jsonBody,
                                                                          )!
                                                                          .toDouble(),
                                                                  formatType:
                                                                      FormatType
                                                                          .decimal,
                                                                  decimalType:
                                                                      DecimalType
                                                                          .periodDecimal,
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
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            if (AirtableApiGroup
                                                    .getMedicineDetailsCall
                                                    .recordList(
                                                      mainContainerGetMedicineDetailsResponse
                                                          .jsonBody,
                                                    )
                                                    ?.length !=
                                                0)
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        20.0, 0.0, 20.0, 0.0),
                                                child: Container(
                                                  height: 68.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                  child: InkWell(
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
                                                          'https://api.whatsapp.com/send?phone=15557031014&text=Hi%2C%20I%20need%20help%20with%20my%20Plazza%20Order%23${widget.ticketId?.toString()}');
                                                    },
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Stack(
                                                          alignment:
                                                              const AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          children: [
                                                            Container(
                                                              width: 36.0,
                                                              height: 36.0,
                                                              decoration:
                                                                  const BoxDecoration(
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
                                                                const EdgeInsetsDirectional
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
                                                              const EdgeInsetsDirectional
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
                                                      ].divide(const SizedBox(
                                                          width: 10.0)),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            if (AirtableApiGroup
                                                    .getMedicineDetailsCall
                                                    .recordList(
                                                      mainContainerGetMedicineDetailsResponse
                                                          .jsonBody,
                                                    )
                                                    ?.length !=
                                                0)
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        20.0, 0.0, 20.0, 0.0),
                                                child: Container(
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
                                                            const AlignmentDirectional(
                                                                0.0, 0.0),
                                                        children: [
                                                          Container(
                                                            width: 36.0,
                                                            height: 36.0,
                                                            decoration:
                                                                const BoxDecoration(
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
                                                                'assets/images/x-circle.png',
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
                                                              const EdgeInsetsDirectional
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
                                                                'Cancellation & refund policy',
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
                                                                'Orders cannot be cancelled once packed \nfor delivery.',
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
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            wrapWithModel(
                                              model: _model
                                                  .openperscriptionRequiredModel,
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child:
                                                  OpenperscriptionRequiredWidget(
                                                recordId: AirtableApiGroup
                                                    .findSingleOrderCall
                                                    .recordId(
                                                  medicineCartFindSingleOrderResponse
                                                      .jsonBody,
                                                )!,
                                                ordersource: AirtableApiGroup
                                                    .findSingleOrderCall
                                                    .orderSource(
                                                  medicineCartFindSingleOrderResponse
                                                      .jsonBody,
                                                )!,
                                                prescriptioncheck: AirtableApiGroup
                                                            .findSingleOrderCall
                                                            .presscriptionCheck(
                                                          medicineCartFindSingleOrderResponse
                                                              .jsonBody,
                                                        ) ==
                                                        null ||
                                                    AirtableApiGroup
                                                            .findSingleOrderCall
                                                            .presscriptionCheck(
                                                          medicineCartFindSingleOrderResponse
                                                              .jsonBody,
                                                        ) ==
                                                        '',
                                              ),
                                            ),
                                          ].divide(const SizedBox(height: 20.0)),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              if (responsiveVisibility(
                                context: context,
                                phone: false,
                                tablet: false,
                                tabletLandscape: false,
                                desktop: false,
                              ))
                                wrapWithModel(
                                  model: _model.prescriptionRequiedModel,
                                  updateCallback: () => safeSetState(() {}),
                                  child: PrescriptionRequiedWidget(
                                    orderId: AirtableApiGroup
                                        .findSingleOrderCall
                                        .recordId(
                                      medicineCartFindSingleOrderResponse
                                          .jsonBody,
                                    )!,
                                  ),
                                ),
                              Container(
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  boxShadow: const [
                                    BoxShadow(
                                      blurRadius: 24.0,
                                      color: Color(0x34959DA5),
                                      offset: Offset(
                                        0.0,
                                        8.0,
                                      ),
                                      spreadRadius: 0.0,
                                    )
                                  ],
                                  borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(0.0),
                                    bottomRight: Radius.circular(0.0),
                                    topLeft: Radius.circular(20.0),
                                    topRight: Radius.circular(20.0),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      20.0, 0.0, 20.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      if ((AirtableApiGroup.findSingleOrderCall
                                                      .addressID(
                                                    medicineCartFindSingleOrderResponse
                                                        .jsonBody,
                                                  ) ==
                                                  null ||
                                              AirtableApiGroup
                                                      .findSingleOrderCall
                                                      .addressID(
                                                    medicineCartFindSingleOrderResponse
                                                        .jsonBody,
                                                  ) ==
                                                  '') &&
                                          (AirtableApiGroup
                                                  .getMedicineDetailsCall
                                                  .recordList(
                                                    mainContainerGetMedicineDetailsResponse
                                                        .jsonBody,
                                                  )
                                                  ?.length !=
                                              0))
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 10.0, 0.0, 0.0),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              context.pushNamed(
                                                'changeLocation',
                                                queryParameters: {
                                                  'lat': serializeParam(
                                                    FFAppState().address.lat,
                                                    ParamType.String,
                                                  ),
                                                  'lng': serializeParam(
                                                    FFAppState().address.lng,
                                                    ParamType.String,
                                                  ),
                                                  'orderRecordId':
                                                      serializeParam(
                                                    AirtableApiGroup
                                                        .findSingleOrderCall
                                                        .recordId(
                                                      medicineCartFindSingleOrderResponse
                                                          .jsonBody,
                                                    ),
                                                    ParamType.String,
                                                  ),
                                                  'pagename': serializeParam(
                                                    'Cart',
                                                    ParamType.String,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            },
                                            text: 'Add adress',
                                            options: FFButtonOptions(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  1.0,
                                              height: 50.0,
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 0.0),
                                              iconPadding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineSmall
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineSmallFamily,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineSmallFamily),
                                                      ),
                                              elevation: 0.0,
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                        ),
                                      if ((AirtableApiGroup.findSingleOrderCall
                                                      .addressID(
                                                    medicineCartFindSingleOrderResponse
                                                        .jsonBody,
                                                  ) !=
                                                  null &&
                                              AirtableApiGroup
                                                      .findSingleOrderCall
                                                      .addressID(
                                                    medicineCartFindSingleOrderResponse
                                                        .jsonBody,
                                                  ) !=
                                                  '') &&
                                          (AirtableApiGroup
                                                  .getMedicineDetailsCall
                                                  .recordList(
                                                    mainContainerGetMedicineDetailsResponse
                                                        .jsonBody,
                                                  )
                                                  ?.length !=
                                              0))
                                        FutureBuilder<ApiCallResponse>(
                                          future: AirtableApiGroup
                                              .getAddressDetailsCall
                                              .call(
                                            addressId: AirtableApiGroup
                                                .findSingleOrderCall
                                                .addressID(
                                              medicineCartFindSingleOrderResponse
                                                  .jsonBody,
                                            ),
                                          ),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return const ShimmerAddressWidget();
                                            }
                                            final addressRowGetAddressDetailsResponse =
                                                snapshot.data!;

                                            return Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          0.0),
                                                  child: Image.asset(
                                                    'assets/images/Icon_map_pin.png',
                                                    width: 24.0,
                                                    height: 24.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Container(
                                                    height: 54.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Text(
                                                                'Delivering to ',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .labelSmallFamily,
                                                                      fontSize:
                                                                          12.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).labelSmallFamily),
                                                                    ),
                                                              ),
                                                              Text(
                                                                AirtableApiGroup
                                                                    .getAddressDetailsCall
                                                                    .tag(
                                                                  addressRowGetAddressDetailsResponse
                                                                      .jsonBody,
                                                                )!,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .labelSmallFamily,
                                                                      fontSize:
                                                                          12.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).labelSmallFamily),
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                          Text(
                                                            '${AirtableApiGroup.getAddressDetailsCall.houseNumber(
                                                              addressRowGetAddressDetailsResponse
                                                                  .jsonBody,
                                                            )}, ${AirtableApiGroup.getAddressDetailsCall.floor(
                                                              addressRowGetAddressDetailsResponse
                                                                  .jsonBody,
                                                            )}, ${AirtableApiGroup.getAddressDetailsCall.locality(
                                                              addressRowGetAddressDetailsResponse
                                                                  .jsonBody,
                                                            )} ....',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodySmall
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmallFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodySmallFamily),
                                                                ),
                                                          ),
                                                        ],
                                                      ),
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
                                                                  AddNewAddressWidget(
                                                                recordid: AirtableApiGroup
                                                                    .findSingleOrderCall
                                                                    .recordId(
                                                                  medicineCartFindSingleOrderResponse
                                                                      .jsonBody,
                                                                ),
                                                                pagename:
                                                                    'Cart',
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ).then((value) =>
                                                        safeSetState(() {}));
                                                  },
                                                  child: Text(
                                                    'Change',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .plazzaNewPrimaryPink,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily),
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            );
                                          },
                                        ),
                                      if ((AirtableApiGroup.findSingleOrderCall
                                                      .addressID(
                                                    medicineCartFindSingleOrderResponse
                                                        .jsonBody,
                                                  ) !=
                                                  null &&
                                              AirtableApiGroup
                                                      .findSingleOrderCall
                                                      .addressID(
                                                    medicineCartFindSingleOrderResponse
                                                        .jsonBody,
                                                  ) !=
                                                  '') &&
                                          (AirtableApiGroup
                                                  .getMedicineDetailsCall
                                                  .recordList(
                                                    mainContainerGetMedicineDetailsResponse
                                                        .jsonBody,
                                                  )
                                                  ?.length !=
                                              0))
                                        AuthUserStreamWidget(
                                          builder: (context) => SizedBox(
                                            width: 390.0,
                                            height: 60.0,
                                            child:
                                                custom_widgets.RazorpayWidget(
                                              width: 390.0,
                                              height: 60.0,
                                              amount: (FFAppState().itemsPrice >
                                                          0.0
                                                      ? FFAppState().itemsPrice
                                                      : getJsonField(
                                                          medicineCartFindSingleOrderResponse
                                                              .jsonBody,
                                                          r'''$.records[:].fields["Item Total"]''',
                                                        )) +
                                                  ((AirtableApiGroup
                                                              .findSingleOrderCall
                                                              .platformfee(
                                                            medicineCartFindSingleOrderResponse
                                                                .jsonBody,
                                                          )!) +
                                                          (AirtableApiGroup
                                                              .findSingleOrderCall
                                                              .conveniencefee(
                                                            medicineCartFindSingleOrderResponse
                                                                .jsonBody,
                                                          )!) +
                                                          (AirtableApiGroup
                                                              .findSingleOrderCall
                                                              .packingfee(
                                                            medicineCartFindSingleOrderResponse
                                                                .jsonBody,
                                                          )!))
                                                      .toDouble() +
                                                  AirtableApiGroup
                                                      .findSingleOrderCall
                                                      .deliveryfee(
                                                        medicineCartFindSingleOrderResponse
                                                            .jsonBody,
                                                      )!
                                                      .toDouble(),
                                              name:
                                                  '${valueOrDefault(currentUserDocument?.firstName, '')} ${valueOrDefault(currentUserDocument?.lastName, '')}',
                                              ticketId: widget.ticketId,
                                              contactNumber: currentPhoneNumber,
                                              buttonTextValue:
                                                  'TOTAL ${'₹ ${formatNumber(
                                                (FFAppState().itemsPrice > 0.0
                                                        ? FFAppState()
                                                            .itemsPrice
                                                        : getJsonField(
                                                            medicineCartFindSingleOrderResponse
                                                                .jsonBody,
                                                            r'''$.records[:].fields["Item Total"]''',
                                                          )) +
                                                    ((AirtableApiGroup
                                                                .findSingleOrderCall
                                                                .platformfee(
                                                              medicineCartFindSingleOrderResponse
                                                                  .jsonBody,
                                                            )!) +
                                                            (AirtableApiGroup
                                                                .findSingleOrderCall
                                                                .conveniencefee(
                                                              medicineCartFindSingleOrderResponse
                                                                  .jsonBody,
                                                            )!) +
                                                            (AirtableApiGroup
                                                                .findSingleOrderCall
                                                                .packingfee(
                                                              medicineCartFindSingleOrderResponse
                                                                  .jsonBody,
                                                            )!))
                                                        .toDouble() +
                                                    AirtableApiGroup
                                                        .findSingleOrderCall
                                                        .deliveryfee(
                                                          medicineCartFindSingleOrderResponse
                                                              .jsonBody,
                                                        )!
                                                        .toDouble(),
                                                formatType: FormatType.decimal,
                                                decimalType:
                                                    DecimalType.periodDecimal,
                                              )}'}',
                                              navigatesuccessful:
                                                  (ticketid) async {
                                                context.pushNamed(
                                                  'PaymentSuccess',
                                                  queryParameters: {
                                                    'ticketId': serializeParam(
                                                      widget.ticketId,
                                                      ParamType.int,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              },
                                              navigatefailed: (ticketid) async {
                                                context.pushNamed(
                                                  'PaymentFailed',
                                                  queryParameters: {
                                                    'ticketid': serializeParam(
                                                      widget.ticketId,
                                                      ParamType.int,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                    ]
                                        .divide(const SizedBox(height: 8.0))
                                        .around(const SizedBox(height: 8.0)),
                                  ),
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
