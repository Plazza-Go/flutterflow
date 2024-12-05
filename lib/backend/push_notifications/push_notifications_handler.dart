import 'dart:async';

import 'serialization_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';


final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({super.key, required this.child});

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    safeSetState(() => _loading = true);
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        context.pushNamed(
          initialPageName,
          pathParameters: parameterData.pathParameters,
          extra: parameterData.extra,
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      safeSetState(() => _loading = false);
    }
  }

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      handleOpenedPushNotification();
    });
  }

  @override
  Widget build(BuildContext context) => _loading
      ? isWeb
          ? Container()
          : Container(
              color: FlutterFlowTheme.of(context).primary,
              child: Center(
                child: Image.asset(
                  'assets/images/Plazza_Branding.png',
                  width: MediaQuery.sizeOf(context).width * 0.8,
                  fit: BoxFit.contain,
                ),
              ),
            )
      : widget.child;
}

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get pathParameters => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => const ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'Status': (data) async => ParameterData(
        allParams: {
          'ticketid': getParameter<int>(data, 'ticketid'),
          'pageName': getParameter<String>(data, 'pageName'),
        },
      ),
  'History': ParameterData.none(),
  'Home': ParameterData.none(),
  'Cancelled': ParameterData.none(),
  'medicineCart': (data) async => ParameterData(
        allParams: {
          'ticketId': getParameter<int>(data, 'ticketId'),
        },
      ),
  'Location': ParameterData.none(),
  'PhoneAuth': ParameterData.none(),
  'Otp': (data) async => ParameterData(
        allParams: {
          'number': getParameter<String>(data, 'number'),
        },
      ),
  'Profile': ParameterData.none(),
  'Ordermedicine': ParameterData.none(),
  'PaymentSuccess': (data) async => ParameterData(
        allParams: {
          'ticketId': getParameter<int>(data, 'ticketId'),
        },
      ),
  'PaymentFailed': (data) async => ParameterData(
        allParams: {
          'ticketid': getParameter<int>(data, 'ticketid'),
        },
      ),
  'statusOfOrder': (data) async => ParameterData(
        allParams: {
          'ticketid': getParameter<int>(data, 'ticketid'),
          'pagename': getParameter<String>(data, 'pagename'),
        },
      ),
  'Userlogdata': ParameterData.none(),
  'Settings': ParameterData.none(),
  'changeLocation': (data) async => ParameterData(
        allParams: {
          'lat': getParameter<String>(data, 'lat'),
          'lng': getParameter<String>(data, 'lng'),
          'orderRecordId': getParameter<String>(data, 'orderRecordId'),
          'pagename': getParameter<String>(data, 'pagename'),
          'addressId': getParameter<String>(data, 'addressId'),
          'tag': getParameter<String>(data, 'tag'),
        },
      ),
  'searchAndDiscoveryHome': ParameterData.none(),
  'searchAndDiscover2': ParameterData.none(),
  'Addressbook': ParameterData.none(),
  'PolicyWebview': ParameterData.none(),
  'searchMedicine': ParameterData.none(),
  'searchAndAutoSuggest': ParameterData.none(),
  'productDescriptionPage': ParameterData.none(),
  'MedicineInformation': (data) async => ParameterData(
        allParams: {
          'productid': getParameter<String>(data, 'productid'),
        },
      ),
  'searchMedicineCopy': ParameterData.none(),
  'cartEmpty': ParameterData.none(),
  'SearchLocation': (data) async => ParameterData(
        allParams: {
          'recordId': getParameter<String>(data, 'recordId'),
          'addLocation': getParameter<String>(data, 'addLocation'),
          'addressId': getParameter<String>(data, 'addressId'),
          'tag': getParameter<String>(data, 'tag'),
          'pagename': getParameter<String>(data, 'pagename'),
        },
      ),
  'UpdateApp': ParameterData.none(),
  'RazorpaycreateOrders': (data) async => ParameterData(
        allParams: {
          'ticketId': getParameter<int>(data, 'ticketId'),
        },
      ),
  'test': (data) async => ParameterData(
        allParams: {
          'phone': getParameter<String>(data, 'phone'),
        },
      ),
  'medicineCartSearch': (data) async => ParameterData(
        allParams: {
          'ticketId': getParameter<int>(data, 'ticketId'),
        },
      ),
};

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
