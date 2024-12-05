// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// DO NOT REMOVE OR MODIFY THE CODE ABOVE

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:razorpay_flutter/razorpay_flutter.dart';

class RazorpayWithCreateOrder extends StatefulWidget {
  const RazorpayWithCreateOrder({
    Key? key,
    this.width,
    this.height,
    this.amount,
    this.name,
    this.ticketId,
    this.buttonTextValue,
    this.contactNumber,
    required this.navigatesuccessful,
    required this.navigatefailed,
  }) : super(key: key);

  final double? width;
  final double? height;
  final double? amount;
  final String? name;
  final int? ticketId;
  final String? contactNumber;
  final String? buttonTextValue;
  final Future Function(int ticketid) navigatesuccessful;
  final Future Function(int ticketid) navigatefailed;

  @override
  State<RazorpayWithCreateOrder> createState() =>
      _RazorpayWithCreateOrderState();
}

class _RazorpayWithCreateOrderState extends State<RazorpayWithCreateOrder> {
  late Razorpay _razorpay;
  bool _isLoading = false;
  String? _orderId;
  int? _amount;

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  void openCheckout() async {
    setState(() {
      _isLoading = true;
    });

    final url = Uri.parse(
        'https://us-central1-plazza-mvp.cloudfunctions.net/createRazorpayOrder');

    // Ensure the amount is in paise (smallest unit)
    final amountInPaise = (widget.amount!);

    final body = json.encode({
      "data": {
        "amount": amountInPaise, // Amount in paise
        "currency": "INR",
        "isProd": false
      }
    });

    try {
      final apiResponse = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: body,
      );

      if (apiResponse.statusCode == 200) {
        final apiData = json.decode(apiResponse.body);

        if (apiData['result']['status'] == "created") {
          _orderId = apiData['result']['id'];
          _amount = apiData['result']['amount']; // Amount returned by the API

          var options = {
            'key': 'rzp_live_13nfx7eGyPUdLb', // Use test key for development
            'amount': _amount, // Razorpay expects amount in paise
            'name': widget.name ?? 'Customer',
            'order_id': _orderId, // Pass the order ID here
            'prefill': {
              'contact': widget.contactNumber ?? '',
            },
            'notes': {
              "ticket_ID": widget.ticketId?.toString(),
              "Order Type": "OPD Order",
            }
          };

          try {
            _razorpay.open(options);
          } catch (e) {
            setState(() {
              _isLoading = false;
            });
            debugPrint('Error while opening Razorpay checkout: $e');
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Failed to open Razorpay checkout: $e')),
            );
          }
        } else {
          setState(() {
            _isLoading = false;
          });
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: Text(
                    'Failed to create Razorpay order: ${apiData['message']}')),
          );
        }
      } else {
        setState(() {
          _isLoading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content:
                  Text('Failed to create Razorpay order: ${apiResponse.body}')),
        );
      }
    } catch (error) {
      setState(() {
        _isLoading = false;
      });
      debugPrint('Error creating Razorpay order: $error');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $error')),
      );
    }
  }

  Future<void> _handlePaymentSuccess(PaymentSuccessResponse response) async {
    setState(() {
      _isLoading = true;
    });

    final url = Uri.parse(
        'https://us-central1-plazza-mvp.cloudfunctions.net/verifyAndCapturePayments');
    final body = json.encode({
      "data": {
        "paymentId": response.paymentId,
        'order_id': _orderId,
        'amount': _amount, // This should match the captured amount
        "currency": "INR",
        "isProd": true
      }
    });

    try {
      final apiResponse = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: body,
      );

      if (apiResponse.statusCode == 200) {
        final apiData = json.decode(apiResponse.body);

        if (apiData['result']['success'] == true &&
            apiData['result']['payment']['status'] == 'captured') {
          if (widget.ticketId != null) {
            await widget.navigatesuccessful(widget.ticketId!);
          }
        } else {
          if (widget.ticketId != null) {
            await widget.navigatefailed(widget.ticketId!);
          }
        }
      } else {
        throw Exception('Failed to capture payment: ${apiResponse.body}');
      }
    } catch (error) {
      debugPrint('Error capturing payment: $error');
      if (widget.ticketId != null) {
        await widget.navigatefailed(widget.ticketId!);
      }
    } finally {
      setState(() {
        _isLoading = false;
      });
      _razorpay.clear();
    }
  }

  void _handlePaymentError(PaymentFailureResponse response) async {
    if (widget.ticketId != null) {
      await widget.navigatefailed(widget.ticketId!);
    }
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Payment failed! Error: ${response.message}')),
    );
  }

  void _handleExternalWallet(ExternalWalletResponse response) {}

  @override
  void dispose() {
    _razorpay.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _isLoading
          ? CircularProgressIndicator()
          : ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFF0083),
                minimumSize: Size(widget.width ?? 150, widget.height ?? 50),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: openCheckout,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.buttonTextValue.toString(),
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    'PLACE ORDER',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
    );
  }
}
