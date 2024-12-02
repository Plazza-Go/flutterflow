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
import 'cart_items_model.dart';
import '/services/cart_manager.dart';
export 'cart_items_model.dart';

class CartItemsWidget extends StatefulWidget {
  const CartItemsWidget({
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
  State<CartItemsWidget> createState() => _CartItemsWidgetState();
}

class _CartItemsWidgetState extends State<CartItemsWidget> {
  late CartItemsModel _model;
  final CartManager _cartManager = CartManager();

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CartItemsModel());

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
        if (_cartManager.getItemPrice(widget.medicineRate!, _model.count ?? widget.quantity) != 0)
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
                                          if (_cartManager.getItemsPrice() <= 0.0) {
                                            await _cartManager.initializePrice(widget.itemtotal);
                                          }
                                          
                                          await _cartManager.decrementQuantity(
                                            productId: widget.productId!,
                                            medicineRecordId: widget.medicineRecordid,
                                            orderSource: widget.orderSource,
                                            orderRecordId: widget.orderRecordId,
                                            medicineRate: widget.medicineRate,
                                            currentCount: _model.count,
                                          );
                                          
                                          _model.loading = false;
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
                                          if (_cartManager.getItemsPrice() <= 0.0) {
                                            await _cartManager.initializePrice(widget.itemtotal);
                                          }

                                          await _cartManager.incrementQuantity(
                                            productId: widget.productId!,
                                            medicineRecordId: widget.medicineRecordid,
                                            medicineRate: widget.medicineRate,
                                            currentCount: _model.count,
                                            orderSource: widget.orderSource,
                                          );
                                          
                                          _model.loading = false;
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
