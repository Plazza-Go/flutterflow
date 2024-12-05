import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/cart/addtocart/addtocart_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/shimmer/medicineinformationshimmer/medicineinformationshimmer_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'medicine_information_model.dart';
export 'medicine_information_model.dart';

class MedicineInformationWidget extends StatefulWidget {
  const MedicineInformationWidget({
    super.key,
    required this.productid,
  });

  final String? productid;

  @override
  State<MedicineInformationWidget> createState() =>
      _MedicineInformationWidgetState();
}

class _MedicineInformationWidgetState extends State<MedicineInformationWidget> {
  late MedicineInformationModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MedicineInformationModel());

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
      future: SingleMedicineByProductIdCall.call(
        productId: widget.productid,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: const MedicineinformationshimmerWidget(),
          );
        }
        final medicineInformationSingleMedicineByProductIdResponse =
            snapshot.data!;

        return Title(
            title: 'MedicineInformation',
            color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Scaffold(
                key: scaffoldKey,
                backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
                floatingActionButton: Visibility(
                  visible: functions
                          .addlist(FFAppState()
                              .CartMedicineDetails
                              .map((e) => e.quantity)
                              .toList())
                          .toString() !=
                      '0',
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
                appBar: responsiveVisibility(
                  context: context,
                  tabletLandscape: false,
                  desktop: false,
                )
                    ? AppBar(
                        backgroundColor: const Color(0xFFFFEDF3),
                        automaticallyImplyLeading: false,
                        leading: FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 30.0,
                          borderWidth: 1.0,
                          buttonSize: 60.0,
                          icon: Icon(
                            Icons.chevron_left,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 30.0,
                          ),
                          onPressed: () async {
                            context.pop();
                          },
                        ),
                        title: Text(
                          SingleMedicineByProductIdCall.name(
                            medicineInformationSingleMedicineByProductIdResponse
                                .jsonBody,
                          )!,
                          style: FlutterFlowTheme.of(context)
                              .headlineLarge
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .headlineLargeFamily,
                                fontSize: 24.0,
                                letterSpacing: 0.0,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .headlineLargeFamily),
                              ),
                        ),
                        actions: const [],
                        centerTitle: false,
                        elevation: 0.0,
                      )
                    : null,
                body: SafeArea(
                  top: true,
                  child: Align(
                    alignment: const AlignmentDirectional(0.0, -1.0),
                    child: FutureBuilder<List<AppResourcesRecord>>(
                      future: queryAppResourcesRecordOnce(
                        singleRecord: true,
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return const MedicineinformationshimmerWidget();
                        }
                        List<AppResourcesRecord>
                            containerAppResourcesRecordList = snapshot.data!;
                        // Return an empty Container when the item does not exist.
                        if (snapshot.data!.isEmpty) {
                          return Container();
                        }
                        final containerAppResourcesRecord =
                            containerAppResourcesRecordList.isNotEmpty
                                ? containerAppResourcesRecordList.first
                                : null;

                        return Container(
                          decoration: const BoxDecoration(),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                20.0, 0.0, 20.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    if (SingleMedicineByProductIdCall.imageurl(
                                              medicineInformationSingleMedicineByProductIdResponse
                                                  .jsonBody,
                                            ) !=
                                            null &&
                                        (SingleMedicineByProductIdCall.imageurl(
                                          medicineInformationSingleMedicineByProductIdResponse
                                              .jsonBody,
                                        ))!
                                            .isNotEmpty)
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(0.0, -1.0),
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 30.0, 0.0, 30.0),
                                          child: Builder(
                                            builder: (context) {
                                              final imagePath =
                                                  SingleMedicineByProductIdCall
                                                          .imageurl(
                                                        medicineInformationSingleMedicineByProductIdResponse
                                                            .jsonBody,
                                                      )?.toList() ??
                                                      [];

                                              return SizedBox(
                                                width: 230.0,
                                                height: 290.0,
                                                child: Stack(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  40.0),
                                                      child: PageView.builder(
                                                        controller: _model
                                                                .pageViewimageController ??=
                                                            PageController(
                                                                initialPage: max(
                                                                    0,
                                                                    min(
                                                                        0,
                                                                        imagePath.length -
                                                                            1))),
                                                        scrollDirection:
                                                            Axis.horizontal,
                                                        itemCount:
                                                            imagePath.length,
                                                        itemBuilder: (context,
                                                            imagePathIndex) {
                                                          final imagePathItem =
                                                              imagePath[
                                                                  imagePathIndex];
                                                          return ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                            child:
                                                                Image.network(
                                                              imagePathItem,
                                                              width: 230.0,
                                                              height: 280.0,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              0.0, 1.0),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    16.0),
                                                        child: smooth_page_indicator
                                                            .SmoothPageIndicator(
                                                          controller: _model
                                                                  .pageViewimageController ??=
                                                              PageController(
                                                                  initialPage: max(
                                                                      0,
                                                                      min(
                                                                          0,
                                                                          imagePath.length -
                                                                              1))),
                                                          count:
                                                              imagePath.length,
                                                          axisDirection:
                                                              Axis.horizontal,
                                                          onDotClicked:
                                                              (i) async {
                                                            await _model
                                                                .pageViewimageController!
                                                                .animateToPage(
                                                              i,
                                                              duration: const Duration(
                                                                  milliseconds:
                                                                      500),
                                                              curve:
                                                                  Curves.ease,
                                                            );
                                                            safeSetState(() {});
                                                          },
                                                          effect:
                                                              smooth_page_indicator
                                                                  .SlideEffect(
                                                            spacing: 8.0,
                                                            radius: 8.0,
                                                            dotWidth: 8.0,
                                                            dotHeight: 8.0,
                                                            dotColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .accent1,
                                                            activeDotColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                            paintStyle:
                                                                PaintingStyle
                                                                    .fill,
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
                                      ),
                                    if (SingleMedicineByProductIdCall.imageurl(
                                          medicineInformationSingleMedicineByProductIdResponse
                                              .jsonBody,
                                        )?.length ==
                                        0)
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                        child: Image.network(
                                          containerAppResourcesRecord!
                                              .defaultMedicineImageCart,
                                          width: 230.0,
                                          height: 280.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                  ],
                                ),
                                Text(
                                  SingleMedicineByProductIdCall.name(
                                    medicineInformationSingleMedicineByProductIdResponse
                                        .jsonBody,
                                  )!,
                                  textAlign: TextAlign.start,
                                  style: FlutterFlowTheme.of(context)
                                      .headlineLarge
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .headlineLargeFamily,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .headlineLargeFamily),
                                      ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 4.0, 0.0, 0.0),
                                  child: Text(
                                    SingleMedicineByProductIdCall
                                        .packagingDetail(
                                      medicineInformationSingleMedicineByProductIdResponse
                                          .jsonBody,
                                    )!,
                                    style: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .titleMediumFamily,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .titleMediumFamily),
                                        ),
                                  ),
                                ),
                                const Spacer(),
                                Container(
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
                                  decoration: const BoxDecoration(),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '₹${SingleMedicineByProductIdCall.mrp(
                                              medicineInformationSingleMedicineByProductIdResponse
                                                  .jsonBody,
                                            )}',
                                            style: FlutterFlowTheme.of(context)
                                                .headlineLarge
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .headlineLargeFamily,
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(FlutterFlowTheme
                                                              .of(context)
                                                          .headlineLargeFamily),
                                                ),
                                          ),
                                          Text(
                                            'Inclusive of all taxes',
                                            style: FlutterFlowTheme.of(context)
                                                .bodySmall
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodySmallFamily,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmallFamily),
                                                ),
                                          ),
                                        ].divide(const SizedBox(height: 4.0)),
                                      ),
                                      wrapWithModel(
                                        model: _model.addtocartModel,
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        updateOnChange: true,
                                        child: AddtocartWidget(
                                          productID:
                                              SingleMedicineByProductIdCall
                                                  .productid(
                                            medicineInformationSingleMedicineByProductIdResponse
                                                .jsonBody,
                                          ),
                                          name: SingleMedicineByProductIdCall
                                              .name(
                                            medicineInformationSingleMedicineByProductIdResponse
                                                .jsonBody,
                                          ),
                                          mrp: functions.stringToDouble(
                                              SingleMedicineByProductIdCall.mrp(
                                            medicineInformationSingleMedicineByProductIdResponse
                                                .jsonBody,
                                          )!),
                                          prescriptionRequired:
                                              SingleMedicineByProductIdCall
                                                  .prescriptionrequired(
                                            medicineInformationSingleMedicineByProductIdResponse
                                                .jsonBody,
                                          ),
                                          packagingDetails:
                                              SingleMedicineByProductIdCall
                                                  .packagingDetail(
                                            medicineInformationSingleMedicineByProductIdResponse
                                                .jsonBody,
                                          ),
                                          textcolor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryBackground,
                                          bordercolor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                          background:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                          height: 50,
                                          width: 200,
                                          textValue: 'Add to cart',
                                          imageurl: getJsonField(
                                                    medicineInformationSingleMedicineByProductIdResponse
                                                        .jsonBody,
                                                    r'''$.hits.hits[:]._source.image_url''',
                                                  ) !=
                                                  null
                                              ? getJsonField(
                                                  medicineInformationSingleMedicineByProductIdResponse
                                                      .jsonBody,
                                                  r'''$.hits.hits[:]._source.image_url''',
                                                  true,
                                                )!
                                              : functions.singleimageToList(
                                                  containerAppResourcesRecord!
                                                      .defaultMedicineImageCart),
                                          image: getJsonField(
                                                    medicineInformationSingleMedicineByProductIdResponse
                                                        .jsonBody,
                                                    r'''$.hits.hits[:]._source.image_url[0]''',
                                                  ) !=
                                                  null
                                              ? getJsonField(
                                                  medicineInformationSingleMedicineByProductIdResponse
                                                      .jsonBody,
                                                  r'''$.hits.hits[:]._source.image_url[0]''',
                                                ).toString()
                                              : containerAppResourcesRecord!
                                                  .defaultMedicineImageCart,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
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
