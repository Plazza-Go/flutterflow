import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/cart/addtocart/addtocart_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/shimmer/medicineshimmer/medicineshimmer_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'search_medicine_model.dart';
export 'search_medicine_model.dart';

class SearchMedicineWidget extends StatefulWidget {
  const SearchMedicineWidget({super.key});

  @override
  State<SearchMedicineWidget> createState() => _SearchMedicineWidgetState();
}

class _SearchMedicineWidgetState extends State<SearchMedicineWidget> {
  late SearchMedicineModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SearchMedicineModel());

    _model.textFieldTextController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

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

    return Title(
        title: 'searchMedicine',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            floatingActionButton: Visibility(
              visible: (functions
                          .addlist(FFAppState()
                              .CartMedicineDetails
                              .map((e) => e.quantity)
                              .toList())
                          .toString() !=
                      '0') &&
                  (FFAppState().cartId.ticketid != 0),
              child: Align(
                alignment: AlignmentDirectional(0.0, 1.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                  child: FloatingActionButton.extended(
                    onPressed: () async {
                      if (FFAppState().cartId.ticketid != null) {
                        context.pushNamed(
                          'medicineCart',
                          queryParameters: {
                            'ticketId': serializeParam(
                              FFAppState().cartId.ticketid,
                              ParamType.int,
                            ),
                          }.withoutNulls,
                        );
                      }
                    },
                    backgroundColor: FlutterFlowTheme.of(context).primary,
                    elevation: 8.0,
                    label: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(10.0, 8.0, 0.0, 8.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          if (FFAppState().cartId.ticketid != null) {
                            context.pushNamed(
                              'medicineCart',
                              queryParameters: {
                                'ticketId': serializeParam(
                                  FFAppState().cartId.ticketid,
                                  ParamType.int,
                                ),
                              }.withoutNulls,
                            );
                          }
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
                                        fontFamily: FlutterFlowTheme.of(context)
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
                                        fontFamily: FlutterFlowTheme.of(context)
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
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 0.0, 0.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  if (FFAppState().cartId.ticketid != null) {
                                    context.pushNamed(
                                      'medicineCart',
                                      queryParameters: {
                                        'ticketId': serializeParam(
                                          FFAppState().cartId.ticketid,
                                          ParamType.int,
                                        ),
                                      }.withoutNulls,
                                    );
                                  }
                                },
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  size: 24.0,
                                ),
                              ),
                            ),
                          ].divide(SizedBox(width: 8.0)),
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
                ? PreferredSize(
                    preferredSize: Size.fromHeight(
                        MediaQuery.sizeOf(context).height * 0.08),
                    child: AppBar(
                      backgroundColor:
                          FlutterFlowTheme.of(context).primaryBackground,
                      automaticallyImplyLeading: false,
                      actions: [],
                      flexibleSpace: FlexibleSpaceBar(
                        title: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Container(
                                height: 46.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  borderRadius: BorderRadius.circular(8.0),
                                  border: Border.all(
                                    color: FlutterFlowTheme.of(context).accent2,
                                    width: 1.0,
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8.0, 0.0, 0.0, 0.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.pushNamed('Home');
                                        },
                                        child: Icon(
                                          Icons.chevron_left,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 26.0,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        width: 200.0,
                                        child: TextFormField(
                                          controller:
                                              _model.textFieldTextController,
                                          focusNode: _model.textFieldFocusNode,
                                          onChanged: (_) =>
                                              EasyDebounce.debounce(
                                            '_model.textFieldTextController',
                                            Duration(milliseconds: 2000),
                                            () async {
                                              safeSetState(() => _model
                                                  .apiRequestCompleter = null);
                                              await _model
                                                  .waitForApiRequestCompleted(
                                                      minWait: 500,
                                                      maxWait: 1000);
                                            },
                                          ),
                                          autofocus: true,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            isDense: true,
                                            labelStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMediumFamily,
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts: GoogleFonts
                                                              .asMap()
                                                          .containsKey(
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMediumFamily),
                                                    ),
                                            hintText: 'Search for “Vitamin B3”',
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMediumFamily,
                                                      fontSize: 14.0,
                                                      letterSpacing: 0.5,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      useGoogleFonts: GoogleFonts
                                                              .asMap()
                                                          .containsKey(
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMediumFamily),
                                                      lineHeight: 1.0,
                                                    ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            filled: true,
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryBackground,
                                            contentPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    6.0, 0.0, 0.0, 0.0),
                                            suffixIcon: _model
                                                    .textFieldTextController!
                                                    .text
                                                    .isNotEmpty
                                                ? InkWell(
                                                    onTap: () async {
                                                      _model
                                                          .textFieldTextController
                                                          ?.clear();
                                                      safeSetState(() => _model
                                                              .apiRequestCompleter =
                                                          null);
                                                      await _model
                                                          .waitForApiRequestCompleted(
                                                              minWait: 500,
                                                              maxWait: 1000);
                                                      safeSetState(() {});
                                                    },
                                                    child: Icon(
                                                      Icons.clear,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      size: 22,
                                                    ),
                                                  )
                                                : null,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLargeFamily,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyLargeFamily),
                                              ),
                                          textAlign: TextAlign.start,
                                          cursorColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                          validator: _model
                                              .textFieldTextControllerValidator
                                              .asValidator(context),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        centerTitle: false,
                        expandedTitleScale: 1.0,
                        titlePadding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 4.0, 20.0, 4.0),
                      ),
                      elevation: 0.0,
                    ),
                  )
                : null,
            body: SafeArea(
              top: true,
              child: FutureBuilder<List<AppResourcesRecord>>(
                future: queryAppResourcesRecordOnce(
                  singleRecord: true,
                ),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(
                      child: SizedBox(
                        width: 50,
                        height: 50,
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Color(0x00FF0083),
                          ),
                        ),
                      ),
                    );
                  }
                  List<AppResourcesRecord> containerAppResourcesRecordList =
                      snapshot.data!;
                  // Return an empty Container when the item does not exist.
                  if (snapshot.data!.isEmpty) {
                    return Container();
                  }
                  final containerAppResourcesRecord =
                      containerAppResourcesRecordList.isNotEmpty
                          ? containerAppResourcesRecordList.first
                          : null;

                  return Container(
                    decoration: BoxDecoration(),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          if (responsiveVisibility(
                            context: context,
                            phone: false,
                            tablet: false,
                            tabletLandscape: false,
                            desktop: false,
                          ))
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                safeSetState(() {
                                  _model.textFieldTextController?.clear();
                                });
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.network(
                                      'https://picsum.photos/seed/696/600',
                                      width: 32.0,
                                      height: 32.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Text(
                                    'Crocin',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily),
                                        ),
                                  ),
                                ].divide(SizedBox(width: 19.0)),
                              ),
                            ),
                          if (_model.textFieldTextController.text != null &&
                              _model.textFieldTextController.text != '')
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    'Showing results for “${_model.textFieldTextController.text}\"',
                                    textAlign: TextAlign.start,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          fontSize: 18.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily),
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          if (_model.textFieldTextController.text != null &&
                              _model.textFieldTextController.text != '')
                            Expanded(
                              child: FutureBuilder<ApiCallResponse>(
                                future: (_model.apiRequestCompleter ??=
                                        Completer<ApiCallResponse>()
                                          ..complete(MedicineSearchsCall.call(
                                            name: _model
                                                .textFieldTextController.text,
                                          )))
                                    .future,
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return MedicineshimmerWidget();
                                  }
                                  final medicineCardMedicineSearchsResponse =
                                      snapshot.data!;

                                  return Builder(
                                    builder: (context) {
                                      final medicine =
                                          MedicineSearchsCall.medicineData(
                                                medicineCardMedicineSearchsResponse
                                                    .jsonBody,
                                              )?.toList() ??
                                              [];

                                      return RefreshIndicator(
                                        onRefresh: () async {
                                          safeSetState(() => _model
                                              .apiRequestCompleter = null);
                                          await _model
                                              .waitForApiRequestCompleted();
                                        },
                                        child: MasonryGridView.builder(
                                          gridDelegate:
                                              SliverSimpleGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 3,
                                          ),
                                          crossAxisSpacing: 10.0,
                                          mainAxisSpacing: 10.0,
                                          itemCount: medicine.length,
                                          itemBuilder:
                                              (context, medicineIndex) {
                                            final medicineItem =
                                                medicine[medicineIndex];
                                            return Container(
                                              width: 109.0,
                                              height: 186.0,
                                              decoration: BoxDecoration(),
                                              child: Stack(
                                                children: [
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
                                                      context.pushNamed(
                                                        'MedicineInformation',
                                                        queryParameters: {
                                                          'productid':
                                                              serializeParam(
                                                            getJsonField(
                                                              medicineItem,
                                                              r'''$._source.Product_id''',
                                                            ).toString(),
                                                            ParamType.String,
                                                          ),
                                                        }.withoutNulls,
                                                      );
                                                    },
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          child: Image.network(
                                                            getJsonField(
                                                                      medicineItem,
                                                                      r'''$._source.image_url[0]''',
                                                                    ) !=
                                                                    null
                                                                ? getJsonField(
                                                                    medicineItem,
                                                                    r'''$._source.image_url[0]''',
                                                                  ).toString()
                                                                : containerAppResourcesRecord!
                                                                    .defaultMedicineImageCart,
                                                            width: 100.0,
                                                            height: 100.0,
                                                            fit:
                                                                BoxFit.fitWidth,
                                                            alignment:
                                                                Alignment(
                                                                    -1.0, 0.0),
                                                          ),
                                                        ),
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.55),
                                                          child: Container(
                                                            height: 50.0,
                                                            decoration:
                                                                BoxDecoration(),
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -1.0, -1.0),
                                                            child: Visibility(
                                                              visible:
                                                                  getJsonField(
                                                                        medicineItem,
                                                                        r'''$._source.name''',
                                                                      ) !=
                                                                      null,
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            8.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  getJsonField(
                                                                    medicineItem,
                                                                    r'''$._source.name''',
                                                                  )
                                                                      .toString()
                                                                      .maybeHandleOverflow(
                                                                        maxChars:
                                                                            30,
                                                                      ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).titleSmallFamily,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        if (getJsonField(
                                                              medicineItem,
                                                              r'''$._source..["Packaging Detail"]''',
                                                            ) !=
                                                            null)
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -1.01,
                                                                    0.79),
                                                            child: Text(
                                                              getJsonField(
                                                                medicineItem,
                                                                r'''$._source..["Packaging Detail"]''',
                                                              ).toString(),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .titleSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .titleSmallFamily,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).titleSmallFamily),
                                                                  ),
                                                            ),
                                                          ),
                                                        if (getJsonField(
                                                              medicineItem,
                                                              r'''$._source.MRP''',
                                                            ) !=
                                                            null)
                                                          Text(
                                                            '₹ ${getJsonField(
                                                              medicineItem,
                                                              r'''$._source.MRP''',
                                                            ).toString()}',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .titleSmall
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmallFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .customColor2,
                                                                  fontSize:
                                                                      13.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .titleSmallFamily),
                                                                ),
                                                          ),
                                                      ],
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            1.06, -0.04),
                                                    child: wrapWithModel(
                                                      model: _model
                                                          .addtocartModels
                                                          .getModel(
                                                        medicineIndex
                                                            .toString(),
                                                        medicineIndex,
                                                      ),
                                                      updateCallback: () =>
                                                          safeSetState(() {}),
                                                      updateOnChange: true,
                                                      child: AddtocartWidget(
                                                        key: Key(
                                                          'Keynxb_${medicineIndex.toString()}',
                                                        ),
                                                        productID: getJsonField(
                                                          medicineItem,
                                                          r'''$._source.Product_id''',
                                                        ).toString(),
                                                        name: getJsonField(
                                                          medicineItem,
                                                          r'''$._source.name''',
                                                        ).toString(),
                                                        mrp: functions
                                                            .stringToDouble(
                                                                getJsonField(
                                                          medicineItem,
                                                          r'''$._source.MRP''',
                                                        ).toString()),
                                                        prescriptionRequired:
                                                            getJsonField(
                                                          medicineItem,
                                                          r'''$._source.prescription_required''',
                                                        ).toString(),
                                                        packagingDetails:
                                                            getJsonField(
                                                          medicineItem,
                                                          r'''$._source..["Packaging Detail"]''',
                                                        ).toString(),
                                                        textcolor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        bordercolor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        background:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryBackground,
                                                        height: 32,
                                                        width: 80,
                                                        textValue: 'Add',
                                                        imageurl: getJsonField(
                                                                  medicineItem,
                                                                  r'''$._source.image_url[:]''',
                                                                ) !=
                                                                null
                                                            ? getJsonField(
                                                                medicineItem,
                                                                r'''$._source.image_url[:]''',
                                                                true,
                                                              )!
                                                            : functions.singleimageToList(
                                                                containerAppResourcesRecord!
                                                                    .defaultMedicineImageCart),
                                                        image: getJsonField(
                                                                  medicineItem,
                                                                  r'''$._source.image_url[0]''',
                                                                ) !=
                                                                null
                                                            ? getJsonField(
                                                                medicineItem,
                                                                r'''$._source.image_url[0]''',
                                                              ).toString()
                                                            : containerAppResourcesRecord!
                                                                .defaultMedicineImageCart,
                                                      ),
                                                    ),
                                                  ),
                                                ],
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
                        ].divide(SizedBox(height: 24.0)),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ));
  }
}
