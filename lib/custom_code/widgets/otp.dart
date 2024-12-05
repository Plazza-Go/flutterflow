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

import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:sms_autofill/sms_autofill.dart';

class Otp extends StatefulWidget {
  const Otp({
    super.key,
    this.width,
    this.height,
    required this.auth,
  });

  final double? width;
  final double? height;
  final Future Function(String otps) auth;
  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  final TextEditingController _otpController = TextEditingController();
  late final SmsAutoFill _smsAutoFill;

  @override
  void initState() {
    super.initState();
    _smsAutoFill = SmsAutoFill();
    _smsAutoFill.listenForCode(); // Start listening for SMS OTP autofill
  }

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: widget.width ?? 300,
        height: widget.height ?? 100,
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // OTP PinCodeField
            PinCodeTextField(
              appContext: context, // Add this line to provide the app context
              controller: _otpController,
              length: 6, // Number of OTP digits
              obscureText: false, // Do not obscure text (used for passwords)
              animationType: AnimationType.fade,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(5),
                fieldHeight: 45,
                fieldWidth: 45,
                activeColor: Color(0xFFECECEC),
                inactiveColor: Color(0xFFECECEC),
                selectedColor: Color(0xFFFF0083),
              ),
              keyboardType: TextInputType.number,
              autoFocus: true,
              onChanged: (value) {
                // Handle OTP change
                print("OTP changed: $value");
              },
              onCompleted: (value) async {
                // Handle OTP completion
                await widget.auth(value);
                print("OTP completed: $value");
                // Here you can validate the OTP or proceed with the next action
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle OTP submission
                print("OTP entered: ${_otpController.text}");
              },
              child: const Text('Submit OTP'),
            ),
          ],
        ),
      ),
    );
  }
}
