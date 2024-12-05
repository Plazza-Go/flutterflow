import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/shimmer/location_search_shimmer/location_search_shimmer_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import 'dart:async';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'search_location_model.dart';
export 'search_location_model.dart';

class SearchLocationWidget extends StatefulWidget {
  const SearchLocationWidget({
    super.key,
    this.recordId,
    required this.addLocation,
    this.addressId,
    this.tag,
    this.pagename,
  });

  final String? recordId;
  final String? addLocation;
  final String? addressId;
  final String? tag;
  final String? pagename;

  @override
  State<SearchLocationWidget> createState() => _SearchLocationWidgetState();
}

class _SearchLocationWidgetState extends State<SearchLocationWidget> {
  late SearchLocationModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SearchLocationModel());

    _model.textController ??= TextEditingController();
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
        title: 'SearchLocation',
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
                        FlutterFlowTheme.of(context).secondaryBackground,
                    automaticallyImplyLeading: false,
                    leading: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          FlutterFlowIconButton(
                            icon: Icon(
                              Icons.arrow_back_rounded,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 24.0,
                            ),
                            onPressed: () async {
                              context.safePop();
                            },
                          ),
                          Text(
                            'Enter your location',
                            style: FlutterFlowTheme.of(context)
                                .titleLarge
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .titleLargeFamily,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .titleLargeFamily),
                                ),
                          ),
                        ].divide(SizedBox(width: 10.0)),
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
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 8.0, 0.0, 20.0),
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 0.9,
                            height: 50.0,
                            decoration: BoxDecoration(),
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              child: TextFormField(
                                controller: _model.textController,
                                focusNode: _model.textFieldFocusNode,
                                onChanged: (_) => EasyDebounce.debounce(
                                  '_model.textController',
                                  Duration(milliseconds: 2000),
                                  () async {
                                    safeSetState(() =>
                                        _model.apiRequestCompleter = null);
                                    await _model.waitForApiRequestCompleted();
                                  },
                                ),
                                autofocus: true,
                                obscureText: false,
                                decoration: InputDecoration(
                                  isDense: true,
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .labelMediumFamily,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        letterSpacing: 0.5,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .labelMediumFamily),
                                      ),
                                  hintText: 'Search for your area or apartment',
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyLargeFamily,
                                        letterSpacing: 0.5,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyLargeFamily),
                                        lineHeight: 1.0,
                                      ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).accent2,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).accent2,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  filled: true,
                                  fillColor: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  contentPadding:
                                      EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 0.0, 10.0),
                                  prefixIcon: Icon(
                                    FFIcons.ksearch1,
                                  ),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyLargeFamily,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      letterSpacing: 0.0,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyLargeFamily),
                                    ),
                                cursorColor:
                                    FlutterFlowTheme.of(context).primaryText,
                                validator: _model.textControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 20.0),
                          child: Container(
                            decoration: BoxDecoration(),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                _model.locations =
                                    await actions.locationPermissionDenied();

                                context.pushNamed('Home');

                                safeSetState(() {});
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Icon(
                                        Icons.my_location,
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        size: 20.0,
                                      ),
                                      Text(
                                        'Use my current location',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
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
                                    ].divide(SizedBox(width: 8.0)),
                                  ),
                                  Icon(
                                    Icons.chevron_right_outlined,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 24.0,
                                  ),
                                ].divide(SizedBox(width: 10.0)),
                              ),
                            ),
                          ),
                        ),
                        Divider(
                          thickness: 1.0,
                          color: Color(0xFFF0F0F0),
                        ),
                        Container(
                          decoration: BoxDecoration(),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              FutureBuilder<ApiCallResponse>(
                                future: (_model.apiRequestCompleter ??=
                                        Completer<ApiCallResponse>()
                                          ..complete(GoogleMapSearchCall.call(
                                            input: _model.textController.text,
                                          )))
                                    .future,
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return LocationSearchShimmerWidget();
                                  }
                                  final addressListViewGoogleMapSearchResponse =
                                      snapshot.data!;

                                  return Builder(
                                    builder: (context) {
                                      final location =
                                          AddresslistStruct.maybeFromMap(
                                                      addressListViewGoogleMapSearchResponse
                                                          .jsonBody)
                                                  ?.predictions
                                                  ?.toList() ??
                                              [];

                                      return RefreshIndicator(
                                        onRefresh: () async {
                                          safeSetState(() => _model
                                              .apiRequestCompleter = null);
                                          await _model
                                              .waitForApiRequestCompleted();
                                        },
                                        child: ListView.separated(
                                          padding: EdgeInsets.zero,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount: location.length,
                                          separatorBuilder: (_, __) =>
                                              SizedBox(height: 16.0),
                                          itemBuilder:
                                              (context, locationIndex) {
                                            final locationItem =
                                                location[locationIndex];
                                            return InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                _model.getLatlng =
                                                    await FindlatlngByPlaceIdCall
                                                        .call(
                                                  placeid: locationItem.placeId,
                                                );

                                                if ((_model
                                                        .getLatlng?.succeeded ??
                                                    true)) {
                                                  if (widget!.addLocation !=
                                                      'Edit') {
                                                    FFAppState().address =
                                                        AppAddressStruct(
                                                      lat:
                                                          FindlatlngByPlaceIdCall
                                                              .lat(
                                                        (_model.getLatlng
                                                                ?.jsonBody ??
                                                            ''),
                                                      )?.toString(),
                                                      lng:
                                                          FindlatlngByPlaceIdCall
                                                              .lng(
                                                        (_model.getLatlng
                                                                ?.jsonBody ??
                                                            ''),
                                                      )?.toString(),
                                                    );
                                                    safeSetState(() {});

                                                    context.pushNamed('Home');
                                                  } else {
                                                    context.pushNamed(
                                                      'changeLocation',
                                                      queryParameters: {
                                                        'lat': serializeParam(
                                                          FindlatlngByPlaceIdCall
                                                              .lat(
                                                            (_model.getLatlng
                                                                    ?.jsonBody ??
                                                                ''),
                                                          )?.toString(),
                                                          ParamType.String,
                                                        ),
                                                        'lng': serializeParam(
                                                          FindlatlngByPlaceIdCall
                                                              .lng(
                                                            (_model.getLatlng
                                                                    ?.jsonBody ??
                                                                ''),
                                                          )?.toString(),
                                                          ParamType.String,
                                                        ),
                                                        'orderRecordId':
                                                            serializeParam(
                                                          widget!.recordId,
                                                          ParamType.String,
                                                        ),
                                                        'pagename':
                                                            serializeParam(
                                                          widget!.pagename,
                                                          ParamType.String,
                                                        ),
                                                        'addressId':
                                                            serializeParam(
                                                          widget!.addressId,
                                                          ParamType.String,
                                                        ),
                                                        'tag': serializeParam(
                                                          widget!.tag,
                                                          ParamType.String,
                                                        ),
                                                      }.withoutNulls,
                                                    );
                                                  }
                                                } else {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        'Something want wrong please try again',
                                                        style:
                                                            GoogleFonts.getFont(
                                                          'Figtree',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .info,
                                                        ),
                                                      ),
                                                      duration: Duration(
                                                          milliseconds: 4000),
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                    ),
                                                  );
                                                }

                                                safeSetState(() {});
                                              },
                                              child: Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        1.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 8.0, 12.0, 8.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Icon(
                                                        Icons
                                                            .location_on_rounded,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        size: 20.0,
                                                      ),
                                                      Expanded(
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  locationItem
                                                                      .structuredFormatting
                                                                      .mainText,
                                                                  'Not Found',
                                                                ),
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
                                                                              .w600,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                    ),
                                                              ),
                                                              Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  locationItem
                                                                      .structuredFormatting
                                                                      .secondaryText,
                                                                  'Not Found',
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLarge
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyLargeFamily,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).bodyLargeFamily),
                                                                    ),
                                                              ),
                                                            ].divide(SizedBox(
                                                                height: 8.0)),
                                                          ),
                                                        ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 8.0)),
                                                  ),
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
                            ],
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
  }
}
