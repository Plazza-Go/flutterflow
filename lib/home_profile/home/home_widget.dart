import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/home_profile/components/home_faqs/home_faqs_widget.dart';
import '/home_profile/components/home_hearder/home_hearder_widget.dart';
import '/home_profile/components/order_trackings/order_trackings_widget.dart';
import '/location/components/add_new_address/add_new_address_widget.dart';
import '/pages/authentication/sign_in/sign_in_widget.dart';
import '/shimmer/comman_shimmer/comman_shimmer_widget.dart';
import '/shimmer/home_shimmer/home_shimmer_widget.dart';
import '/shimmer/service_availability/service_availability_widget.dart';
import '/upload_prescription/components/upload_prescriptions/upload_prescriptions_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'home_model.dart';
export 'home_model.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  late HomeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      currentUserLocationValue =
          await getCurrentUserLocation(defaultLocation: const LatLng(0.0, 0.0));
      if ((FFAppConstants.appversion >= getRemoteConfigDouble('app_version')) ||
          FFAppState().IsNotmandatory) {
        if (!((FFAppState().address.lat != '') &&
            (FFAppState().address.lng != ''))) {
          _model.location = await actions.checkLocationPermission();
          if (_model.location!) {
            FFAppState().address = AppAddressStruct(
              lat: functions.getLet(currentUserLocationValue!),
              lng: functions.getLng(currentUserLocationValue!),
            );
            safeSetState(() {});
          } else {
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
                      child: const AddNewAddressWidget(
                        pagename: 'Home',
                      ),
                    ),
                  ),
                );
              },
            ).then((value) => safeSetState(() {}));
          }
        }
        if ((FFAppState().cachehome == 0) || (FFAppState().cachehome == 2)) {
          FFAppState().clearAppAssetsCache();
          _model.clearServiceabilityCache();
          FFAppState().cachehome = FFAppState().cachehome + 1;
          safeSetState(() {});
          await Future.delayed(const Duration(milliseconds: 1000));
          FFAppState().cachehome = FFAppState().cachehome + 1;
          safeSetState(() {});
        } else {
          FFAppState().cachehome = FFAppState().cachehome + 1;
          safeSetState(() {});
        }
      } else {
        context.goNamed('UpdateApp');
      }
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

    return FutureBuilder<List<AppResourcesRecord>>(
      future: FFAppState().appAssets(
        uniqueQueryKey: 'AppAssets',
        overrideCache: FFAppState().cachehome == 1,
        requestFn: () => queryAppResourcesRecordOnce(
          singleRecord: true,
        ),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primary,
            body: const HomeShimmerWidget(),
          );
        }
        List<AppResourcesRecord> homeAppResourcesRecordList = snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final homeAppResourcesRecord = homeAppResourcesRecordList.isNotEmpty
            ? homeAppResourcesRecordList.first
            : null;

        return Title(
            title: 'Home',
            color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Scaffold(
                key: scaffoldKey,
                backgroundColor: FlutterFlowTheme.of(context).primary,
                floatingActionButton: Visibility(
                  visible: (functions
                              .addlist(FFAppState()
                                  .CartMedicineDetails
                                  .map((e) => e.quantity)
                                  .toList())
                              .toString() !=
                          '0') &&
                      (FFAppState().Serviceability.id != ''),
                  child: Align(
                    alignment: const AlignmentDirectional(0.0, 0.8),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                      child: FloatingActionButton.extended(
                        onPressed: () async {
                          context.pushNamed(
                            'medicineCart',
                            queryParameters: {
                              'ticketId': serializeParam(
                                FFAppState().cartId.ticketid,
                                ParamType.int,
                              ),
                            }.withoutNulls,
                          );
                                                },
                        backgroundColor: FlutterFlowTheme.of(context).primary,
                        elevation: 8.0,
                        label: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              10.0, 8.0, 0.0, 8.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed(
                                'medicineCart',
                                queryParameters: {
                                  'ticketId': serializeParam(
                                    FFAppState().cartId.ticketid,
                                    ParamType.int,
                                  ),
                                }.withoutNulls,
                              );
                                                        },
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'View cart',
                                      style: FlutterFlowTheme.of(context)
                                          .headlineLarge
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .headlineLargeFamily,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .headlineLargeFamily),
                                          ),
                                    ),
                                    Text(
                                      '${functions.addlist(FFAppState().CartMedicineDetails.map((e) => e.quantity).toList()).toString()} ITEMS',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyLargeFamily,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLargeFamily),
                                          ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 0.0, 0.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed(
                                        'medicineCart',
                                        queryParameters: {
                                          'ticketId': serializeParam(
                                            FFAppState().cartId.ticketid,
                                            ParamType.int,
                                          ),
                                        }.withoutNulls,
                                      );
                                                                        },
                                    child: Icon(
                                      Icons.arrow_forward_ios,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      size: 24.0,
                                    ),
                                  ),
                                ),
                              ].divide(const SizedBox(width: 8.0)),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                body: SafeArea(
                  top: true,
                  child: Stack(
                    children: [
                      if ((FFAppState().address.lat != '') &&
                          (FFAppState().address.lng != ''))
                        Align(
                          alignment: const AlignmentDirectional(0.0, -1.0),
                          child: AuthUserStreamWidget(
                            builder: (context) =>
                                FutureBuilder<ApiCallResponse>(
                              future: _model.serviceability(
                                uniqueQueryKey: 'Serviceability',
                                overrideCache: (FFAppState().cachehome == 1) &&
                                    (FFAppState().cachehome == 3),
                                requestFn: () => ServiceabilityCall.call(
                                  lng: FFAppState().address.lng,
                                  lat: FFAppState().address.lat,
                                  phonenumber: functions
                                      .getphoneNumber(currentPhoneNumber),
                                ),
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return const HomeShimmerWidget();
                                }
                                final containerServiceabilityResponse =
                                    snapshot.data!;

                                return Container(
                                  constraints: BoxConstraints(
                                    maxWidth: isWeb
                                        ? () {
                                            if (MediaQuery.sizeOf(context)
                                                    .width <
                                                kBreakpointSmall) {
                                              return FFAppState()
                                                  .width
                                                  .small
                                                  .toDouble();
                                            } else if (MediaQuery.sizeOf(
                                                        context)
                                                    .width <
                                                kBreakpointMedium) {
                                              return FFAppState()
                                                  .width
                                                  .medium
                                                  .toDouble();
                                            } else if (MediaQuery.sizeOf(
                                                        context)
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
                                  decoration: const BoxDecoration(
                                    color: Color(0xFFFFEDF8),
                                  ),
                                  child: Container(
                                    decoration: const BoxDecoration(),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Container(
                                                decoration: const BoxDecoration(),
                                                child: wrapWithModel(
                                                  model: _model
                                                      .homeHearderTopModel,
                                                  updateCallback: () =>
                                                      safeSetState(() {}),
                                                  updateOnChange: true,
                                                  child: HomeHearderWidget(
                                                    deliverytime: ServiceabilityCall
                                                            .serviceable(
                                                      containerServiceabilityResponse
                                                          .jsonBody,
                                                    )!
                                                        ? '${ServiceabilityCall.pharmacyDeliveryTime(
                                                            containerServiceabilityResponse
                                                                .jsonBody,
                                                          )?.toString()} minutes'
                                                        : 'Coming soon',
                                                    latlng:
                                                        '${FFAppState().address.lat},${FFAppState().address.lng}',
                                                    localityid:
                                                        valueOrDefault<String>(
                                                      ServiceabilityCall
                                                          .localityId(
                                                        containerServiceabilityResponse
                                                            .jsonBody,
                                                      ),
                                                      '0',
                                                    ),
                                                    localityname:
                                                        valueOrDefault<String>(
                                                      ServiceabilityCall.name(
                                                        containerServiceabilityResponse
                                                            .jsonBody,
                                                      ),
                                                      '0',
                                                    ),
                                                    localitynumber:
                                                        valueOrDefault<int>(
                                                      ServiceabilityCall
                                                          .localityNumber(
                                                        containerServiceabilityResponse
                                                            .jsonBody,
                                                      ),
                                                      0,
                                                    ),
                                                    closestAddress:
                                                        ServiceabilityCall
                                                            .closestAddress(
                                                      containerServiceabilityResponse
                                                          .jsonBody,
                                                    )!,
                                                    address:
                                                        valueOrDefault<String>(
                                                      '${ServiceabilityCall.houseNumber(
                                                        containerServiceabilityResponse
                                                            .jsonBody,
                                                      )}, ${ServiceabilityCall.buildingName(
                                                        containerServiceabilityResponse
                                                            .jsonBody,
                                                      ).toString()}',
                                                      'Address',
                                                    ),
                                                    tag: valueOrDefault<String>(
                                                      ServiceabilityCall
                                                          .addressTag(
                                                        containerServiceabilityResponse
                                                            .jsonBody,
                                                      ),
                                                      'Home',
                                                    ),
                                                    addressId:
                                                        valueOrDefault<String>(
                                                      ServiceabilityCall
                                                          .addressId(
                                                        containerServiceabilityResponse
                                                            .jsonBody,
                                                      ),
                                                      '   AddressId',
                                                    ),
                                                    serviceabilitybool:
                                                        ServiceabilityCall
                                                            .serviceable(
                                                      containerServiceabilityResponse
                                                          .jsonBody,
                                                    )!,
                                                  ),
                                                ),
                                              ),
                                              if (ServiceabilityCall
                                                      .serviceable(
                                                    containerServiceabilityResponse
                                                        .jsonBody,
                                                  ) ??
                                                  true)
                                                Expanded(
                                                  child: Container(
                                                    height: 450.0,
                                                    constraints: const BoxConstraints(
                                                      maxHeight: 600.0,
                                                    ),
                                                    decoration: const BoxDecoration(),
                                                    child:
                                                        SingleChildScrollView(
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        10.0,
                                                                        0.0,
                                                                        25.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Expanded(
                                                                  child:
                                                                      ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            0.0),
                                                                    child: Image
                                                                        .network(
                                                                      homeAppResourcesRecord!
                                                                          .pharmacyHome,
                                                                      fit: BoxFit
                                                                          .contain,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        20.0,
                                                                        0.0,
                                                                        20.0,
                                                                        20.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Expanded(
                                                                  child:
                                                                      InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      if (loggedIn) {
                                                                        await showModalBottomSheet(
                                                                          isScrollControlled:
                                                                              true,
                                                                          backgroundColor:
                                                                              Colors.transparent,
                                                                          enableDrag:
                                                                              false,
                                                                          context:
                                                                              context,
                                                                          builder:
                                                                              (context) {
                                                                            return WebViewAware(
                                                                              child: GestureDetector(
                                                                                onTap: () => FocusScope.of(context).unfocus(),
                                                                                child: Padding(
                                                                                  padding: MediaQuery.viewInsetsOf(context),
                                                                                  child: const SizedBox(
                                                                                    height: 320.0,
                                                                                    child: UploadPrescriptionsWidget(),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            );
                                                                          },
                                                                        ).then((value) =>
                                                                            safeSetState(() {}));
                                                                      } else {
                                                                        await showModalBottomSheet(
                                                                          isScrollControlled:
                                                                              true,
                                                                          backgroundColor:
                                                                              Colors.transparent,
                                                                          enableDrag:
                                                                              false,
                                                                          context:
                                                                              context,
                                                                          builder:
                                                                              (context) {
                                                                            return WebViewAware(
                                                                              child: GestureDetector(
                                                                                onTap: () => FocusScope.of(context).unfocus(),
                                                                                child: Padding(
                                                                                  padding: MediaQuery.viewInsetsOf(context),
                                                                                  child: const SignInWidget(),
                                                                                ),
                                                                              ),
                                                                            );
                                                                          },
                                                                        ).then((value) =>
                                                                            safeSetState(() {}));
                                                                      }
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          106.0,
                                                                      height:
                                                                          88.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: Colors
                                                                            .white,
                                                                        borderRadius:
                                                                            BorderRadius.circular(12.0),
                                                                        border:
                                                                            Border.all(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding:
                                                                            const EdgeInsets.all(8.0),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Expanded(
                                                                              child: Text(
                                                                                'Order with \nPrescription',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                      fontSize: 13.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.bold,
                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                            Icon(
                                                                              Icons.file_upload_outlined,
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              size: 24.0,
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child:
                                                                      InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      await launchURL(
                                                                          homeAppResourcesRecord
                                                                              .whatsappOrder);
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          106.0,
                                                                      height:
                                                                          88.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: Colors
                                                                            .white,
                                                                        borderRadius:
                                                                            BorderRadius.circular(12.0),
                                                                        border:
                                                                            Border.all(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding:
                                                                            const EdgeInsets.all(8.0),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Expanded(
                                                                              child: Text(
                                                                                'Order on\nWhatsApp',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                      fontSize: 13.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.bold,
                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                            FaIcon(
                                                                              FontAwesomeIcons.whatsapp,
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              size: 24.0,
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child: Stack(
                                                                    alignment:
                                                                        const AlignmentDirectional(
                                                                            1.7,
                                                                            0.74),
                                                                    children: [
                                                                      Container(
                                                                        width:
                                                                            106.0,
                                                                        height:
                                                                            88.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              Colors.white,
                                                                          borderRadius:
                                                                              BorderRadius.circular(12.0),
                                                                          border:
                                                                              Border.all(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                          ),
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              const EdgeInsets.all(8.0),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              Expanded(
                                                                                child: Text(
                                                                                  'Order by \nSymptoms',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                        color: const Color(0xFFFFADC9),
                                                                                        fontSize: 13.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.bold,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                              const Icon(
                                                                                Icons.check_circle_outline_rounded,
                                                                                color: Color(0xFFFFADC9),
                                                                                size: 24.0,
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      ClipRRect(
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                        child: Image
                                                                            .asset(
                                                                          'assets/images/labelcomingsoon.png',
                                                                          width:
                                                                              77.0,
                                                                          height:
                                                                              21.0,
                                                                          fit: BoxFit
                                                                              .contain,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ].divide(const SizedBox(
                                                                  width: 20.0)),
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
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          32.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Container(
                                                                width: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    1.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                                ),
                                                                child: Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          10.0,
                                                                          0.0,
                                                                          10.0),
                                                                  child:
                                                                      wrapWithModel(
                                                                    model: _model
                                                                        .homeFaqsModel,
                                                                    updateCallback: () =>
                                                                        safeSetState(
                                                                            () {}),
                                                                    child:
                                                                        const HomeFaqsWidget(),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              if (!ServiceabilityCall
                                                  .serviceable(
                                                containerServiceabilityResponse
                                                    .jsonBody,
                                              )!)
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 30.0,
                                                                0.0, 0.0),
                                                    child: wrapWithModel(
                                                      model: _model
                                                          .serviceAvailabilityModel,
                                                      updateCallback: () =>
                                                          safeSetState(() {}),
                                                      child:
                                                          const ServiceAvailabilityWidget(
                                                        speard: -10,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                            ],
                                          ),
                                        ),
                                        if (ServiceabilityCall.serviceable(
                                              containerServiceabilityResponse
                                                  .jsonBody,
                                            ) ??
                                            true)
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              if (loggedIn)
                                                FutureBuilder<ApiCallResponse>(
                                                  future: AirtableApiGroup
                                                      .arrowBarOrderCall
                                                      .call(
                                                    phoneNumber: functions
                                                        .getphoneNumber(
                                                            currentPhoneNumber),
                                                  ),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return const CommanShimmerWidget(
                                                        hieght: 68,
                                                        width: 400,
                                                        radiusTL: 16,
                                                        radiusTR: 16,
                                                        radiusBL: 0,
                                                        radiusBR: 0,
                                                      );
                                                    }
                                                    final containerArrowBarOrderResponse =
                                                        snapshot.data!;

                                                    return Container(
                                                      decoration:
                                                          const BoxDecoration(),
                                                      child: Visibility(
                                                        visible: AirtableApiGroup
                                                                .arrowBarOrderCall
                                                                .records(
                                                                  containerArrowBarOrderResponse
                                                                      .jsonBody,
                                                                )!.isNotEmpty,
                                                        child: wrapWithModel(
                                                          model: _model
                                                              .orderTrackingsModel,
                                                          updateCallback: () =>
                                                              safeSetState(
                                                                  () {}),
                                                          child:
                                                              OrderTrackingsWidget(
                                                            jsonUrl:
                                                                homeAppResourcesRecord!
                                                                    .defaultLottieAerobar,
                                                            records:
                                                                AirtableApiGroup
                                                                    .arrowBarOrderCall
                                                                    .records(
                                                              containerArrowBarOrderResponse
                                                                  .jsonBody,
                                                            )!,
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ),
                                            ],
                                          ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      if ((FFAppState().address.lat == '') &&
                          (FFAppState().address.lng == ''))
                        wrapWithModel(
                          model: _model.homeShimmerModel,
                          updateCallback: () => safeSetState(() {}),
                          child: const HomeShimmerWidget(),
                        ),
                    ],
                  ),
                ),
              ),
            ));
      },
    );
  }
}
