import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'cart_itemssearch_model.dart';
export 'cart_itemssearch_model.dart';

class CartItemssearchWidget extends StatefulWidget {
  const CartItemssearchWidget({
    super.key,
    required this.defultImageurl,
    this.quantity,
    this.quantityCart,
    this.medicineRecordid,
    required this.ticketid,
    this.orderRecordId,
    this.medicine,
    this.description,
    this.medicineimageurl,
    required this.itemtotal,
    required this.productId,
    required this.orderSource,
    this.medicineRate,
  });

  final String? defultImageurl;
  final dynamic quantity;
  final dynamic quantityCart;
  final dynamic medicineRecordid;
  final int? ticketid;
  final String? orderRecordId;
  final dynamic medicine;
  final dynamic description;
  final dynamic medicineimageurl;
  final dynamic itemtotal;
  final String? productId;
  final String? orderSource;
  final dynamic medicineRate;

  @override
  State<CartItemssearchWidget> createState() => _CartItemssearchWidgetState();
}

class _CartItemssearchWidgetState extends State<CartItemssearchWidget> {
  late CartItemssearchModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CartItemssearchModel());

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

    return Stack(
      alignment: const AlignmentDirectional(0.0, 0.0),
      children: [
        if (formatNumber(
              (_model.count != null
                      ? _model.count!.toDouble()
                      : (widget.quantity == widget.quantityCart
                              ? widget.quantity!
                              : widget.quantityCart!)
                          .toDouble()) *
                  functions.stringToDouble(widget.medicineRate!.toString()),
              formatType: FormatType.decimal,
              decimalType: DecimalType.periodDecimal,
            ) !=
            '0')
          Opacity(
            opacity: _model.loading ? 0.5 : 1.0,
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        widget.medicineimageurl != null
                            ? widget.medicineimageurl!.toString()
                            : widget.defultImageurl!,
                        width: 36.0,
                        height: 36.0,
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) =>
                            Image.asset(
                          'assets/images/error_image.png',
                          width: 36.0,
                          height: 36.0,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 3,
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      widget.medicine!.toString(),
                                      textAlign: TextAlign.start,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyLargeFamily,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLargeFamily),
                                          ),
                                    ),
                                    if (widget.description != null)
                                      Text(
                                        widget.description!.toString(),
                                        style: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMediumFamily,
                                              fontSize: 12.0,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMediumFamily),
                                            ),
                                      ),
                                  ].divide(const SizedBox(height: 4.0)),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Container(
                                  width: 80.0,
                                  height: 35.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context).primary,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      FlutterFlowIconButton(
                                        borderRadius: 8.0,
                                        buttonSize: 30.0,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .primary,
                                        icon: FaIcon(
                                          FontAwesomeIcons.minus,
                                          color:
                                              FlutterFlowTheme.of(context).info,
                                          size: 12.0,
                                        ),
                                        onPressed: () async {
                                          _model.loading = true;
                                          safeSetState(() {});
                                          if (FFAppState().itemsPrice <= 0.0) {
                                            FFAppState().itemsPrice =
                                                functions.jsonToDouble(
                                                    widget.itemtotal!);
                                            safeSetState(() {});
                                          }
                                          if (_model.count != null) {
                                            _model.count = _model.count! + -1;
                                            safeSetState(() {});
                                          } else {
                                            _model.count = (widget.quantity ==
                                                        widget.quantityCart
                                                    ? widget.quantity!
                                                    : widget.quantityCart!) -
                                                1;
                                            safeSetState(() {});
                                          }

                                          FFAppState().itemsPrice = (functions
                                                      .doubleToInt(FFAppState()
                                                          .itemsPrice) -
                                                  functions.doubleToInt(functions
                                                      .jsonToDouble(widget
                                                          .medicineRate!))) /
                                              100;
                                          safeSetState(() {});
                                          if ((FFAppState().itemsPrice ==
                                                  0.0) ||
                                              (FFAppState()
                                                      .CartMedicineDetails.isEmpty) ||
                                              !(FFAppState()
                                                  .CartMedicineDetails
                                                  .isNotEmpty)) {
                                            _model.loading = false;
                                            safeSetState(() {});
                                            await Future.wait([
                                              Future(() async {
                                                _model.apiResultbn0 =
                                                    await AirtableApiGroup
                                                        .deleteCall
                                                        .call(
                                                  tableName:
                                                      'tblGQ0gGC4IKOo48N',
                                                  recordId:
                                                      widget.orderRecordId,
                                                );
                                              }),
                                              Future(() async {
                                                context.pushNamed('Home');
                                              }),
                                              Future(() async {
                                                if (widget.orderSource ==
                                                    'Search') {
                                                  FFAppState()
                                                      .CartMedicineDetails = [];
                                                  FFAppState().cartId =
                                                      CartDetailsStruct();
                                                  safeSetState(() {});
                                                }
                                              }),
                                            ]);
                                          } else {
                                            if (_model.count == 0) {
                                              _model.deleted =
                                                  await AirtableApiGroup
                                                      .deleteCall
                                                      .call(
                                                tableName: 'tblN6VE6bxbIgu0z3',
                                                recordId: widget
                                                    .medicineRecordid
                                                    ?.toString(),
                                              );

                                              if (widget.orderSource ==
                                                  'Search') {
                                                FFAppState().removeAtIndexFromCartMedicineDetails(
                                                    functions.checklistContains(
                                                        FFAppState()
                                                            .CartMedicineDetails
                                                            .map((e) =>
                                                                e.productID)
                                                            .toList(),
                                                        widget.productId!)!);
                                                safeSetState(() {});
                                              }
                                            } else {
                                              _model.minusmedicine =
                                                  await AirtableApiGroup
                                                      .updateMedicineDetailsCall
                                                      .call(
                                                totalprice: (_model.count !=
                                                            null
                                                        ? _model.count!
                                                            .toDouble()
                                                        : (widget.quantity ==
                                                                    widget
                                                                        .quantityCart
                                                                ? widget
                                                                    .quantity!
                                                                : widget
                                                                    .quantityCart!)
                                                            .toDouble()) *
                                                    functions.stringToDouble(
                                                        widget.medicineRate!
                                                            .toString()),
                                                quantity:
                                                    _model.count?.toDouble(),
                                                recordId: widget
                                                    .medicineRecordid
                                                    ?.toString(),
                                              );

                                              if (widget.orderSource ==
                                                  'Search') {
                                                FFAppState()
                                                    .updateCartMedicineDetailsAtIndex(
                                                  functions.checklistContains(
                                                      FFAppState()
                                                          .CartMedicineDetails
                                                          .map((e) =>
                                                              e.productID)
                                                          .toList(),
                                                      widget.productId!)!,
                                                  (e) => e
                                                    ..incrementQuantity(-1)
                                                    ..incrementQuantityCart(-1)
                                                    ..incrementPlazzaPrice(
                                                        functions.getMinus(functions
                                                            .stringToDouble(widget
                                                                .medicineRate!
                                                                .toString())))
                                                    ..incrementPlazzaPriceCart(
                                                        functions.getMinus(functions
                                                            .stringToDouble(widget
                                                                .medicineRate!
                                                                .toString()))),
                                                );
                                                safeSetState(() {});
                                              }
                                            }
                                          }

                                          _model.loading = false;
                                          safeSetState(() {});

                                          safeSetState(() {});
                                        },
                                      ),
                                      Text(
                                        valueOrDefault<String>(
                                          (_model.count ?? (widget.quantity ==
                                                          widget.quantityCart
                                                      ? widget.quantity
                                                      : widget.quantityCart))
                                              ?.toString(),
                                          '1',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLargeFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              fontSize: 12.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w800,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleLargeFamily),
                                            ),
                                      ),
                                      FlutterFlowIconButton(
                                        borderColor: Colors.transparent,
                                        borderRadius: 8.0,
                                        buttonSize: 30.0,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .primary,
                                        icon: FaIcon(
                                          FontAwesomeIcons.plus,
                                          color:
                                              FlutterFlowTheme.of(context).info,
                                          size: 12.0,
                                        ),
                                        onPressed: () async {
                                          _model.loading = true;
                                          safeSetState(() {});
                                          if (FFAppState().itemsPrice <= 0.0) {
                                            FFAppState().itemsPrice =
                                                functions.jsonToDouble(
                                                    widget.itemtotal!);
                                            safeSetState(() {});
                                          }
                                          if (_model.count != null) {
                                            _model.count = _model.count! + 1;
                                            safeSetState(() {});
                                          } else {
                                            _model.count = widget.quantity ==
                                                    widget.quantityCart
                                                ? widget.quantity
                                                : widget.quantityCart;
                                            safeSetState(() {});
                                            _model.count = _model.count! + 1;
                                            safeSetState(() {});
                                          }

                                          FFAppState().itemsPrice = (functions
                                                      .doubleToInt(FFAppState()
                                                          .itemsPrice) +
                                                  functions.doubleToInt(functions
                                                      .jsonToDouble(widget
                                                          .medicineRate!))) /
                                              100;
                                          safeSetState(() {});
                                          _model.apiResult5ax =
                                              await AirtableApiGroup
                                                  .updateMedicineDetailsCall
                                                  .call(
                                            recordId: widget.medicineRecordid
                                                ?.toString(),
                                            totalprice: (_model.count != null
                                                    ? _model.count!.toDouble()
                                                    : (widget.quantity ==
                                                                widget
                                                                    .quantityCart
                                                            ? widget.quantity!
                                                            : widget
                                                                .quantityCart!)
                                                        .toDouble()) *
                                                functions.stringToDouble(widget
                                                    .medicineRate!
                                                    .toString()),
                                            quantity: _model.count?.toDouble(),
                                          );

                                          _model.loading = false;
                                          safeSetState(() {});
                                          if (widget.orderSource == 'Search') {
                                            FFAppState()
                                                .updateCartMedicineDetailsAtIndex(
                                              functions.checklistContains(
                                                  FFAppState()
                                                      .CartMedicineDetails
                                                      .map((e) => e.productID)
                                                      .toList(),
                                                  widget.productId!)!,
                                              (e) => e
                                                ..incrementQuantity(1)
                                                ..incrementQuantityCart(1)
                                                ..incrementPlazzaPrice(
                                                    widget.medicineRate!)
                                                ..incrementPlazzaPriceCart(
                                                    widget.medicineRate!),
                                            );
                                            safeSetState(() {});
                                          }

                                          safeSetState(() {});
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ].divide(const SizedBox(width: 10.0)),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 10.0, 0.0),
                                child: Text(
                                  '₹ ${formatNumber(
                                    (_model.count != null
                                            ? _model.count!
                                            : (widget.quantity ==
                                                    widget.quantityCart
                                                ? widget.quantity!
                                                : widget.quantityCart!)) *
                                        functions.stringToDouble(
                                            widget.medicineRate!.toString()),
                                    formatType: FormatType.decimal,
                                    decimalType: DecimalType.periodDecimal,
                                  )}',
                                  textAlign: TextAlign.end,
                                  style: FlutterFlowTheme.of(context)
                                      .labelLarge
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .labelLargeFamily,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .labelLargeFamily),
                                      ),
                                ),
                              ),
                            ].divide(const SizedBox(width: 10.0)),
                          ),
                        ].divide(const SizedBox(height: 8.0)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        if (_model.loading)
          Align(
            alignment: const AlignmentDirectional(0.0, 0.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                'assets/images/ZKZg.gif',
                width: 30.0,
                height: 30.0,
                fit: BoxFit.cover,
              ),
            ),
          ),
      ],
    );
  }
}
