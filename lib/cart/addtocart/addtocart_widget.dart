import '/auth/firebase_auth/auth_util.dart';
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
import 'addtocart_model.dart';
export 'addtocart_model.dart';

class AddtocartWidget extends StatefulWidget {
  const AddtocartWidget({
    super.key,
    this.productID,
    this.name,
    this.mrp,
    this.prescriptionRequired,
    this.packagingDetails,
    required this.textcolor,
    required this.bordercolor,
    required this.background,
    required this.height,
    required this.width,
    required this.textValue,
    required this.imageurl,
    required this.image,
  });

  final String? productID;
  final String? name;
  final double? mrp;
  final String? prescriptionRequired;
  final String? packagingDetails;
  final Color? textcolor;
  final Color? bordercolor;
  final Color? background;
  final int? height;
  final int? width;
  final String? textValue;
  final List<dynamic>? imageurl;
  final String? image;

  @override
  State<AddtocartWidget> createState() => _AddtocartWidgetState();
}

class _AddtocartWidgetState extends State<AddtocartWidget> {
  late AddtocartModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddtocartModel());

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

    return Container(
      width: widget!.width?.toDouble(),
      height: widget!.height?.toDouble(),
      decoration: BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (functions
                  .checklistContains(
                      FFAppState()
                          .CartMedicineDetails
                          .map((e) => e.productID)
                          .toList(),
                      widget!.productID!)
                  .toString() ==
              '-1')
            Align(
              alignment: AlignmentDirectional(1.06, -0.04),
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  if (FFAppState().cartId.orderid != null &&
                      FFAppState().cartId.orderid != '') {
                    FFAppState()
                        .addToCartMedicineDetails(CartMedicineDetailsStruct(
                      medicineName: widget!.name,
                      quantity: 1,
                      quantityCart: 1,
                      productID: widget!.productID,
                      plazzaPrice: widget!.mrp,
                      medicineRate: widget!.mrp,
                      plazzaPriceCart: widget!.mrp,
                      cartProductid: widget!.productID,
                      prescriptionRequired: widget!.prescriptionRequired,
                      url: widget!.image,
                      medicineStripSize: widget!.packagingDetails,
                    ));
                    safeSetState(() {});
                    _model.addMedicine1 =
                        await AirtableApiGroup.addMedicineCall.call(
                      orderID: FFAppState().cartId.orderid,
                      medicineName: widget!.name,
                      quantity: 1,
                      plazzaPrice: widget!.mrp,
                      quantityCart: 1,
                      plazzaPriceCart: widget!.mrp,
                      medicineRate: widget!.mrp,
                      productid: widget!.productID,
                      prescriptionRequired: widget!.prescriptionRequired,
                      packagingDetails: widget!.packagingDetails,
                      medicineStripSizes: widget!.packagingDetails,
                    );

                    if ((_model.addMedicine1?.succeeded ?? true)) {
                      FFAppState().updateCartMedicineDetailsAtIndex(
                        functions.checklistContains(
                            FFAppState()
                                .CartMedicineDetails
                                .map((e) => e.productID)
                                .toList(),
                            widget!.productID!)!,
                        (e) => e
                          ..recordid = AirtableApiGroup.addMedicineCall.id(
                            (_model.addMedicine1?.jsonBody ?? ''),
                          ),
                      );
                      safeSetState(() {});
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Something went wrong please try again',
                            style: GoogleFonts.getFont(
                              'Figtree',
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              fontSize: 14.0,
                            ),
                          ),
                          duration: Duration(milliseconds: 4000),
                          backgroundColor: FlutterFlowTheme.of(context).primary,
                        ),
                      );
                      FFAppState().removeAtIndexFromCartMedicineDetails(
                          functions.checklistContains(
                              FFAppState()
                                  .CartMedicineDetails
                                  .map((e) => e.productID)
                                  .toList(),
                              widget!.productID!)!);
                      safeSetState(() {});
                    }
                  } else {
                    FFAppState()
                        .addToCartMedicineDetails(CartMedicineDetailsStruct(
                      medicineName: widget!.name,
                      quantity: 1,
                      quantityCart: 1,
                      productID: widget!.productID,
                      plazzaPrice: widget!.mrp,
                      medicineRate: widget!.mrp,
                      plazzaPriceCart: widget!.mrp,
                      cartProductid: widget!.productID,
                      prescriptionRequired: widget!.prescriptionRequired,
                      url: widget!.image,
                      medicineStripSize: widget!.packagingDetails,
                    ));
                    safeSetState(() {});
                    if (FFAppState().Serviceability.addressIdSet) {
                      _model.createorderwithaddress = await AirtableApiGroup
                          .createOrdersBySearchWithAddressCall
                          .call(
                        contactID: valueOrDefault(
                            currentUserDocument?.userRecordId, ''),
                        localityId: FFAppState().Serviceability.id,
                        addressId: FFAppState().Serviceability.addressId,
                        appVersion:
                            '${FFAppConstants.appversion.toString()}-${() {
                          if (isAndroid) {
                            return 'Android';
                          } else if (isiOS) {
                            return 'IOS';
                          } else {
                            return 'Web';
                          }
                        }()}',
                      );

                      if ((_model.createorderwithaddress?.succeeded ?? true)) {
                        FFAppState().cartId = CartDetailsStruct(
                          ticketid: AirtableApiGroup
                              .createOrdersBySearchWithAddressCall
                              .ticketId(
                            (_model.createorderwithaddress?.jsonBody ?? ''),
                          ),
                          orderid: AirtableApiGroup
                              .createOrdersBySearchWithAddressCall
                              .orderId(
                            (_model.createorderwithaddress?.jsonBody ?? ''),
                          ),
                        );
                        safeSetState(() {});
                        _model.addMedicine2A =
                            await AirtableApiGroup.addMedicineCall.call(
                          orderID: FFAppState().cartId.orderid,
                          medicineName: widget!.name,
                          quantity: 1,
                          plazzaPrice: widget!.mrp,
                          quantityCart: 1,
                          plazzaPriceCart: widget!.mrp,
                          medicineRate: widget!.mrp,
                          productid: widget!.productID,
                          prescriptionRequired: widget!.prescriptionRequired,
                          packagingDetails: widget!.packagingDetails,
                          medicineStripSizes: widget!.packagingDetails,
                        );

                        if ((_model.addMedicine2A?.succeeded ?? true)) {
                          FFAppState().updateCartMedicineDetailsAtIndex(
                            functions.checklistContains(
                                FFAppState()
                                    .CartMedicineDetails
                                    .map((e) => e.productID)
                                    .toList(),
                                widget!.productID!)!,
                            (e) => e
                              ..recordid = AirtableApiGroup.addMedicineCall.id(
                                (_model.addMedicine2A?.jsonBody ?? ''),
                              ),
                          );
                          safeSetState(() {});
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Something went wrong please try again',
                                style: GoogleFonts.getFont(
                                  'Figtree',
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  fontSize: 14.0,
                                ),
                              ),
                              duration: Duration(milliseconds: 4000),
                              backgroundColor:
                                  FlutterFlowTheme.of(context).primary,
                            ),
                          );
                          FFAppState().removeAtIndexFromCartMedicineDetails(
                              functions.checklistContains(
                                  FFAppState()
                                      .CartMedicineDetails
                                      .map((e) => e.productID)
                                      .toList(),
                                  widget!.productID!)!);
                          safeSetState(() {});
                        }
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Something went wrong please try again',
                              style: GoogleFonts.getFont(
                                'Figtree',
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                fontSize: 14.0,
                              ),
                            ),
                            duration: Duration(milliseconds: 4000),
                            backgroundColor:
                                FlutterFlowTheme.of(context).primary,
                          ),
                        );
                        FFAppState().removeAtIndexFromCartMedicineDetails(
                            functions.checklistContains(
                                FFAppState()
                                    .CartMedicineDetails
                                    .map((e) => e.productID)
                                    .toList(),
                                widget!.productID!)!);
                        safeSetState(() {});
                      }
                    } else {
                      _model.createorder1 =
                          await AirtableApiGroup.createOrdersBySearchCall.call(
                        contactID: valueOrDefault(
                            currentUserDocument?.userRecordId, ''),
                        localityId: FFAppState().Serviceability.id,
                        appVersion:
                            '${FFAppConstants.appversion.toString()}-${() {
                          if (isAndroid) {
                            return 'Android';
                          } else if (isiOS) {
                            return 'IOS';
                          } else {
                            return 'Web';
                          }
                        }()}',
                      );

                      if ((_model.createorder1?.succeeded ?? true)) {
                        FFAppState().cartId = CartDetailsStruct(
                          ticketid: AirtableApiGroup.createOrdersBySearchCall
                              .ticketId(
                            (_model.createorder1?.jsonBody ?? ''),
                          ),
                          orderid:
                              AirtableApiGroup.createOrdersBySearchCall.orderId(
                            (_model.createorder1?.jsonBody ?? ''),
                          ),
                        );
                        safeSetState(() {});
                        _model.addMedicine2 =
                            await AirtableApiGroup.addMedicineCall.call(
                          orderID: FFAppState().cartId.orderid,
                          medicineName: widget!.name,
                          quantity: 1,
                          plazzaPrice: widget!.mrp,
                          quantityCart: 1,
                          plazzaPriceCart: widget!.mrp,
                          medicineRate: widget!.mrp,
                          productid: widget!.productID,
                          prescriptionRequired: widget!.prescriptionRequired,
                          packagingDetails: widget!.packagingDetails,
                          medicineStripSizes: widget!.packagingDetails,
                        );

                        if ((_model.addMedicine2?.succeeded ?? true)) {
                          FFAppState().updateCartMedicineDetailsAtIndex(
                            functions.checklistContains(
                                FFAppState()
                                    .CartMedicineDetails
                                    .map((e) => e.productID)
                                    .toList(),
                                widget!.productID!)!,
                            (e) => e
                              ..recordid = AirtableApiGroup.addMedicineCall.id(
                                (_model.addMedicine2?.jsonBody ?? ''),
                              ),
                          );
                          safeSetState(() {});
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Something went wrong please try again',
                                style: GoogleFonts.getFont(
                                  'Figtree',
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  fontSize: 14.0,
                                ),
                              ),
                              duration: Duration(milliseconds: 4000),
                              backgroundColor:
                                  FlutterFlowTheme.of(context).primary,
                            ),
                          );
                          FFAppState().removeAtIndexFromCartMedicineDetails(
                              functions.checklistContains(
                                  FFAppState()
                                      .CartMedicineDetails
                                      .map((e) => e.productID)
                                      .toList(),
                                  widget!.productID!)!);
                          safeSetState(() {});
                        }
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Something went wrong please try again',
                              style: GoogleFonts.getFont(
                                'Figtree',
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                fontSize: 14.0,
                              ),
                            ),
                            duration: Duration(milliseconds: 4000),
                            backgroundColor:
                                FlutterFlowTheme.of(context).primary,
                          ),
                        );
                        FFAppState().removeAtIndexFromCartMedicineDetails(
                            functions.checklistContains(
                                FFAppState()
                                    .CartMedicineDetails
                                    .map((e) => e.productID)
                                    .toList(),
                                widget!.productID!)!);
                        safeSetState(() {});
                      }
                    }
                  }

                  safeSetState(() {});
                },
                child: Container(
                  width: widget!.width?.toDouble(),
                  height: widget!.height?.toDouble(),
                  decoration: BoxDecoration(
                    color: valueOrDefault<Color>(
                      widget!.background,
                      FlutterFlowTheme.of(context).primaryBackground,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(
                      color: valueOrDefault<Color>(
                        widget!.bordercolor,
                        FlutterFlowTheme.of(context).primary,
                      ),
                    ),
                  ),
                  child: Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Text(
                      valueOrDefault<String>(
                        widget!.textValue,
                        'Add',
                      ),
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyMediumFamily,
                            color: valueOrDefault<Color>(
                              widget!.textcolor,
                              FlutterFlowTheme.of(context).primary,
                            ),
                            fontSize: 12.0,
                            letterSpacing: 0.0,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).bodyMediumFamily),
                          ),
                    ),
                  ),
                ),
              ),
            ),
          if (functions
                  .checklistContains(
                      FFAppState()
                          .CartMedicineDetails
                          .map((e) => e.productID)
                          .toList(),
                      widget!.productID!)
                  .toString() !=
              '-1')
            Align(
              alignment: AlignmentDirectional(1.06, -0.04),
              child: Container(
                width: widget!.width?.toDouble(),
                height: widget!.height?.toDouble(),
                decoration: BoxDecoration(
                  color: valueOrDefault<Color>(
                    widget!.background,
                    FlutterFlowTheme.of(context).primaryBackground,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(
                    color: valueOrDefault<Color>(
                      widget!.bordercolor,
                      FlutterFlowTheme.of(context).primary,
                    ),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FlutterFlowIconButton(
                      buttonSize: 30.0,
                      fillColor: valueOrDefault<Color>(
                        widget!.background,
                        FlutterFlowTheme.of(context).primaryBackground,
                      ),
                      icon: FaIcon(
                        FontAwesomeIcons.minus,
                        color: valueOrDefault<Color>(
                          widget!.textcolor,
                          FlutterFlowTheme.of(context).primary,
                        ),
                        size: 12.0,
                      ),
                      onPressed: () async {
                        FFAppState().updateCartMedicineDetailsAtIndex(
                          functions.checklistContains(
                              FFAppState()
                                  .CartMedicineDetails
                                  .map((e) => e.productID)
                                  .toList(),
                              widget!.productID!)!,
                          (e) => e
                            ..incrementQuantity(-1)
                            ..incrementQuantityCart(-1),
                        );
                        safeSetState(() {});
                        FFAppState().updateCartMedicineDetailsAtIndex(
                          functions.checklistContains(
                              FFAppState()
                                  .CartMedicineDetails
                                  .map((e) => e.productID)
                                  .toList(),
                              widget!.productID!)!,
                          (e) => e
                            ..plazzaPrice =
                                functions.valueOneMultiplayByvalueTwo(
                                    FFAppState()
                                        .CartMedicineDetails[
                                            functions.checklistContains(
                                                FFAppState()
                                                    .CartMedicineDetails
                                                    .map((e) => e.productID)
                                                    .toList(),
                                                widget!.productID!)!]
                                        .quantity,
                                    functions.doubleToInt(widget!.mrp!))
                            ..plazzaPriceCart =
                                functions.valueOneMultiplayByvalueTwo(
                                    FFAppState()
                                        .CartMedicineDetails[
                                            functions.checklistContains(
                                                FFAppState()
                                                    .CartMedicineDetails
                                                    .map((e) => e.productID)
                                                    .toList(),
                                                widget!.productID!)!]
                                        .quantity,
                                    functions.doubleToInt(widget!.mrp!)),
                        );
                        safeSetState(() {});
                        if (FFAppState()
                                .CartMedicineDetails[
                                    functions.checklistContains(
                                        FFAppState()
                                            .CartMedicineDetails
                                            .map((e) => e.productID)
                                            .toList(),
                                        widget!.productID!)!]
                                .quantity ==
                            0) {
                          FFAppState().updateCartMedicineDetailsAtIndex(
                            functions.checklistContains(
                                FFAppState()
                                    .CartMedicineDetails
                                    .map((e) => e.productID)
                                    .toList(),
                                widget!.productID!)!,
                            (e) => e..productID = null,
                          );
                          safeSetState(() {});
                          _model.deleted =
                              await AirtableApiGroup.deleteCall.call(
                            tableName: 'tblN6VE6bxbIgu0z3',
                            recordId: FFAppState()
                                .CartMedicineDetails[
                                    functions.checklistContains(
                                        FFAppState()
                                            .CartMedicineDetails
                                            .map((e) => e.cartProductid)
                                            .toList(),
                                        widget!.productID!)!]
                                .recordid,
                          );

                          if ((_model.deleted?.succeeded ?? true)) {
                            FFAppState().removeAtIndexFromCartMedicineDetails(
                                functions.checklistContains(
                                    FFAppState()
                                        .CartMedicineDetails
                                        .map((e) => e.cartProductid)
                                        .toList(),
                                    widget!.productID!)!);
                            safeSetState(() {});
                            if (!(FFAppState()
                                .CartMedicineDetails
                                .isNotEmpty)) {
                              _model.delete1 =
                                  await AirtableApiGroup.deleteCall.call(
                                tableName: 'tblGQ0gGC4IKOo48N',
                                recordId: FFAppState().cartId.orderid,
                              );

                              if ((_model.delete1?.succeeded ?? true)) {
                                FFAppState().cartId = CartDetailsStruct();
                                safeSetState(() {});
                              }
                            }
                          } else {
                            FFAppState().updateCartMedicineDetailsAtIndex(
                              functions.checklistContains(
                                  FFAppState()
                                      .CartMedicineDetails
                                      .map((e) => e.productID)
                                      .toList(),
                                  widget!.productID!)!,
                              (e) => e..productID = widget!.productID,
                            );
                            safeSetState(() {});
                          }
                        } else {
                          _model.minus = await AirtableApiGroup
                              .updateSearchMedicineDetailsCall
                              .call(
                            recordId: FFAppState()
                                .CartMedicineDetails[
                                    functions.checklistContains(
                                        FFAppState()
                                            .CartMedicineDetails
                                            .map((e) => e.productID)
                                            .toList(),
                                        widget!.productID!)!]
                                .recordid,
                            totalprice: FFAppState()
                                .CartMedicineDetails[
                                    functions.checklistContains(
                                        FFAppState()
                                            .CartMedicineDetails
                                            .map((e) => e.productID)
                                            .toList(),
                                        widget!.productID!)!]
                                .plazzaPrice,
                            quantity: FFAppState()
                                .CartMedicineDetails[
                                    functions.checklistContains(
                                        FFAppState()
                                            .CartMedicineDetails
                                            .map((e) => e.productID)
                                            .toList(),
                                        widget!.productID!)!]
                                .quantity
                                .toDouble(),
                          );

                          if (!(_model.minus?.succeeded ?? true)) {
                            FFAppState().updateCartMedicineDetailsAtIndex(
                              functions.checklistContains(
                                  FFAppState()
                                      .CartMedicineDetails
                                      .map((e) => e.productID)
                                      .toList(),
                                  widget!.productID!)!,
                              (e) => e
                                ..incrementQuantity(1)
                                ..incrementQuantityCart(1),
                            );
                            safeSetState(() {});
                            FFAppState().updateCartMedicineDetailsAtIndex(
                              functions.checklistContains(
                                  FFAppState()
                                      .CartMedicineDetails
                                      .map((e) => e.productID)
                                      .toList(),
                                  widget!.productID!)!,
                              (e) => e
                                ..plazzaPrice =
                                    functions.valueOneMultiplayByvalueTwo(
                                        FFAppState()
                                            .CartMedicineDetails[
                                                functions.checklistContains(
                                                    FFAppState()
                                                        .CartMedicineDetails
                                                        .map((e) => e.productID)
                                                        .toList(),
                                                    widget!.productID!)!]
                                            .quantity,
                                        functions.doubleToInt(widget!.mrp!))
                                ..plazzaPriceCart =
                                    functions.valueOneMultiplayByvalueTwo(
                                        FFAppState()
                                            .CartMedicineDetails[
                                                functions.checklistContains(
                                                    FFAppState()
                                                        .CartMedicineDetails
                                                        .map((e) => e.productID)
                                                        .toList(),
                                                    widget!.productID!)!]
                                            .quantity,
                                        functions.doubleToInt(widget!.mrp!)),
                            );
                            safeSetState(() {});
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Something went wrong please try again',
                                  style: GoogleFonts.getFont(
                                    'Figtree',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    fontSize: 14.0,
                                  ),
                                ),
                                duration: Duration(milliseconds: 4000),
                                backgroundColor:
                                    FlutterFlowTheme.of(context).primary,
                              ),
                            );
                          }
                        }

                        safeSetState(() {});
                      },
                    ),
                    Text(
                      valueOrDefault<String>(
                        FFAppState()
                            .CartMedicineDetails[functions.checklistContains(
                                FFAppState()
                                    .CartMedicineDetails
                                    .map((e) => e.productID)
                                    .toList(),
                                widget!.productID!)!]
                            .quantity
                            .toString(),
                        '0',
                      ),
                      style: FlutterFlowTheme.of(context).titleLarge.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).titleLargeFamily,
                            color: valueOrDefault<Color>(
                              widget!.textcolor,
                              FlutterFlowTheme.of(context).primary,
                            ),
                            fontSize: 12.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w800,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).titleLargeFamily),
                          ),
                    ),
                    FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      buttonSize: 30.0,
                      fillColor: valueOrDefault<Color>(
                        widget!.background,
                        FlutterFlowTheme.of(context).primaryBackground,
                      ),
                      icon: FaIcon(
                        FontAwesomeIcons.plus,
                        color: valueOrDefault<Color>(
                          widget!.textcolor,
                          FlutterFlowTheme.of(context).primary,
                        ),
                        size: 12.0,
                      ),
                      onPressed: () async {
                        FFAppState().updateCartMedicineDetailsAtIndex(
                          functions.checklistContains(
                              FFAppState()
                                  .CartMedicineDetails
                                  .map((e) => e.productID)
                                  .toList(),
                              widget!.productID!)!,
                          (e) => e
                            ..incrementQuantity(1)
                            ..incrementQuantityCart(1),
                        );
                        safeSetState(() {});
                        FFAppState().updateCartMedicineDetailsAtIndex(
                          functions.checklistContains(
                              FFAppState()
                                  .CartMedicineDetails
                                  .map((e) => e.productID)
                                  .toList(),
                              widget!.productID!)!,
                          (e) => e
                            ..plazzaPrice =
                                functions.valueOneMultiplayByvalueTwo(
                                    FFAppState()
                                        .CartMedicineDetails[
                                            functions.checklistContains(
                                                FFAppState()
                                                    .CartMedicineDetails
                                                    .map((e) => e.productID)
                                                    .toList(),
                                                widget!.productID!)!]
                                        .quantity,
                                    functions.doubleToInt(widget!.mrp!))
                            ..plazzaPriceCart =
                                functions.valueOneMultiplayByvalueTwo(
                                    FFAppState()
                                        .CartMedicineDetails[
                                            functions.checklistContains(
                                                FFAppState()
                                                    .CartMedicineDetails
                                                    .map((e) => e.productID)
                                                    .toList(),
                                                widget!.productID!)!]
                                        .quantity,
                                    functions.doubleToInt(widget!.mrp!)),
                        );
                        safeSetState(() {});
                        _model.apiResult1om = await AirtableApiGroup
                            .updateSearchMedicineDetailsCall
                            .call(
                          recordId: FFAppState()
                              .CartMedicineDetails[functions.checklistContains(
                                  FFAppState()
                                      .CartMedicineDetails
                                      .map((e) => e.productID)
                                      .toList(),
                                  widget!.productID!)!]
                              .recordid,
                          totalprice: FFAppState()
                              .CartMedicineDetails[functions.checklistContains(
                                  FFAppState()
                                      .CartMedicineDetails
                                      .map((e) => e.productID)
                                      .toList(),
                                  widget!.productID!)!]
                              .plazzaPrice,
                          quantity: FFAppState()
                              .CartMedicineDetails[functions.checklistContains(
                                  FFAppState()
                                      .CartMedicineDetails
                                      .map((e) => e.productID)
                                      .toList(),
                                  widget!.productID!)!]
                              .quantity
                              .toDouble(),
                        );

                        if (!(_model.apiResult1om?.succeeded ?? true)) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Something went wrong please try again',
                                style: GoogleFonts.getFont(
                                  'Figtree',
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  fontSize: 14.0,
                                ),
                              ),
                              duration: Duration(milliseconds: 4000),
                              backgroundColor:
                                  FlutterFlowTheme.of(context).primary,
                            ),
                          );
                          FFAppState().updateCartMedicineDetailsAtIndex(
                            functions.checklistContains(
                                FFAppState()
                                    .CartMedicineDetails
                                    .map((e) => e.productID)
                                    .toList(),
                                widget!.productID!)!,
                            (e) => e
                              ..incrementQuantity(-1)
                              ..incrementQuantityCart(-1),
                          );
                          safeSetState(() {});
                          FFAppState().updateCartMedicineDetailsAtIndex(
                            functions.checklistContains(
                                FFAppState()
                                    .CartMedicineDetails
                                    .map((e) => e.productID)
                                    .toList(),
                                widget!.productID!)!,
                            (e) => e
                              ..plazzaPrice = functions
                                  .valueOneMultiplayByvalueTwo(
                                      FFAppState()
                                          .CartMedicineDetails[
                                              functions.checklistContains(
                                                  FFAppState()
                                                      .CartMedicineDetails
                                                      .map((e) => e.productID)
                                                      .toList(),
                                                  widget!.productID!)!]
                                          .quantity,
                                      functions.doubleToInt(widget!.mrp!))
                              ..plazzaPriceCart =
                                  functions.valueOneMultiplayByvalueTwo(
                                      FFAppState()
                                          .CartMedicineDetails[
                                              functions.checklistContains(
                                                  FFAppState()
                                                      .CartMedicineDetails
                                                      .map((e) => e.productID)
                                                      .toList(),
                                                  widget!.productID!)!]
                                          .quantity,
                                      functions.doubleToInt(widget!.mrp!)),
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
        ],
      ),
    );
  }
}
