import 'dart:convert';
import 'dart:typed_data';
import '../schema/structs/index.dart';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start AirtableApi Group Code

class AirtableApiGroup {
  static String getBaseUrl() => 'https://api.airtable.com/v0/appGuJ4TXWY2Mi9m0';
  static Map<String, String> headers = {
    'Authorization':
        'Bearer pat70k9JHsHNESvPN.e9cda16d05774311c62e5777a9605fa4ff4eb4cea73bb0ffcea7eaa3a688e250',
  };
  static CreateAddressCall createAddressCall = CreateAddressCall();
  static CreateContactIdCall createContactIdCall = CreateContactIdCall();
  static AddMedicineCall addMedicineCall = AddMedicineCall();
  static CreateOrderByPrescriptionCall createOrderByPrescriptionCall =
      CreateOrderByPrescriptionCall();
  static CreateOrderByPrescriptionWithAddressCall
      createOrderByPrescriptionWithAddressCall =
      CreateOrderByPrescriptionWithAddressCall();
  static CreateOrdersBySearchCall createOrdersBySearchCall =
      CreateOrdersBySearchCall();
  static CreateOrdersBySearchWithAddressCall
      createOrdersBySearchWithAddressCall =
      CreateOrdersBySearchWithAddressCall();
  static UpdateAddressCall updateAddressCall = UpdateAddressCall();
  static UpdateContactIdAddressCall updateContactIdAddressCall =
      UpdateContactIdAddressCall();
  static UpdateMedicineDetailsCall updateMedicineDetailsCall =
      UpdateMedicineDetailsCall();
  static UpdateSearchMedicineDetailsCall updateSearchMedicineDetailsCall =
      UpdateSearchMedicineDetailsCall();
  static UpdateOrderItemPriceCall updateOrderItemPriceCall =
      UpdateOrderItemPriceCall();
  static UpdateOrderPrescriptionCall updateOrderPrescriptionCall =
      UpdateOrderPrescriptionCall();
  static RateOrderCall rateOrderCall = RateOrderCall();
  static UpdateAddressidInOrderCall updateAddressidInOrderCall =
      UpdateAddressidInOrderCall();
  static DeleteCall deleteCall = DeleteCall();
  static FindOrderListDataCall findOrderListDataCall = FindOrderListDataCall();
  static ArrowBarOrderCall arrowBarOrderCall = ArrowBarOrderCall();
  static FindListAddressCall findListAddressCall = FindListAddressCall();
  static FindSingleOrderCall findSingleOrderCall = FindSingleOrderCall();
  static GetInvoiceCall getInvoiceCall = GetInvoiceCall();
  static GetAnysingleTableDataCall getAnysingleTableDataCall =
      GetAnysingleTableDataCall();
  static GetAddressDetailsCall getAddressDetailsCall = GetAddressDetailsCall();
  static GetMedicineDetailsCall getMedicineDetailsCall =
      GetMedicineDetailsCall();
  static GetLocalityCall getLocalityCall = GetLocalityCall();
}

class CreateAddressCall {
  Future<ApiCallResponse> call({
    String? contactID = 'recckAFNMzRd5saKz',
    String? longitude = '77.6883275',
    String? latitude = '12.921176',
    String? houseNumber = '01',
    String? floor = 'First',
    String? buildingName = 'Gopal Tawer',
    String? landmark = 'Adarsh Palm Retreat',
    String? locality = 'Adarsh Palm Retreat',
    String? contactMobile = '919450490634',
    String? tag = 'Other',
  }) async {
    final baseUrl = AirtableApiGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "records": [
    {
      "fields": {
        "ContactID": [
          "${contactID}"
        ],
        "Longitude": "${longitude}",
        "Latitude": "${latitude}",
        "HouseNumber": "${houseNumber}",
        "Floor": "${floor}",
        "BuildingName": "${buildingName}",
        "Landmark": "${landmark}",
        "Locality": "${locality}",
        "ContactMobile": "${contactMobile}",
        "Tag": "${tag}"
      }
    }
  ]
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'createAddress',
      apiUrl: '${baseUrl}/tblc0RIN7JYzFmlxm',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer pat70k9JHsHNESvPN.e9cda16d05774311c62e5777a9605fa4ff4eb4cea73bb0ffcea7eaa3a688e250',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? addressId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.records[:].id''',
      ));
}

class CreateContactIdCall {
  Future<ApiCallResponse> call({
    String? contactID = '919335090016',
    String? firstName = 'Abhi',
    String? lastName = 'Tiwari',
    String? mobilePhoneNumber = '919335090016',
    String? gender = 'Male',
  }) async {
    final baseUrl = AirtableApiGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "records": [
    {
      "fields": {
        "ContactID": "${contactID}",
        "FirstName": "${firstName}",
        "LastName": "${lastName}",
        "MobilePhoneNumber": "${mobilePhoneNumber}",
        "Gender" : "${gender}"
      }
    }
  ]
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'CreateContactId',
      apiUrl: '${baseUrl}/tblemoQGd9z2Ehwum',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer pat70k9JHsHNESvPN.e9cda16d05774311c62e5777a9605fa4ff4eb4cea73bb0ffcea7eaa3a688e250',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? id(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.records[:].id''',
      ));
}

class AddMedicineCall {
  Future<ApiCallResponse> call({
    String? orderID = 'recxz8kypvlHp8MKu',
    String? medicineName = 'Lemtrada 12mg Infusion',
    int? quantity = 1,
    double? plazzaPrice = 620000,
    double? plazzaPriceCart = 620000,
    double? medicineRate = 620000,
    int? quantityCart = 1,
    String? productid = 'DRS292298',
    String? prescriptionRequired = '',
    String? packagingDetails = '',
    String? medicineStripSizes = '',
    List<String>? imagePathList,
  }) async {
    final baseUrl = AirtableApiGroup.getBaseUrl();
    final imagePath = _serializeList(imagePathList);

    final ffApiRequestBody = '''
{
  "records": [
    {
      "fields": {
        "Order": [
          "${orderID}"
        ],
         "MedicineImages": ${imagePath},
        "Medicine Name": "${medicineName}",
        "Quantity": ${quantity},
        "Plazza Price": ${plazzaPrice},
        "PlazzaPrice_Cart": ${plazzaPriceCart},
        "MedicineRate": ${medicineRate},
        "Quantity_Cart": ${quantityCart},
        "Product_ID": "${productid}",
        "Prescription_Required": "${prescriptionRequired}",
        "Packaging_Details": "${packagingDetails}",
         "Medicine_strip_size": "${medicineStripSizes}"
      }
    }
  ]
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Add Medicine',
      apiUrl: '${baseUrl}/tblN6VE6bxbIgu0z3',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer pat70k9JHsHNESvPN.e9cda16d05774311c62e5777a9605fa4ff4eb4cea73bb0ffcea7eaa3a688e250',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? id(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.records[:].id''',
      ));
}

class CreateOrderByPrescriptionCall {
  Future<ApiCallResponse> call({
    String? contactID = 'recckAFNMzRd5saKz',
    dynamic? urlListJson,
    String? localityId = '',
    String? appVersion = '',
  }) async {
    final baseUrl = AirtableApiGroup.getBaseUrl();

    final urlList = _serializeJson(urlListJson, true);
    final ffApiRequestBody = '''
{
  "records": [
    {
      "fields": {
        "Prescription": ${urlList},
        "Contact ID": [
          "${contactID}"
       ],
     "Locality": [
             "${localityId}"
        ],
     "App_Version_Order": "${appVersion}",
         "Order_Source":"Rx"
      }
    }
  ]
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'createOrder By Prescription',
      apiUrl: '${baseUrl}/tblGQ0gGC4IKOo48N',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer pat70k9JHsHNESvPN.e9cda16d05774311c62e5777a9605fa4ff4eb4cea73bb0ffcea7eaa3a688e250',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateOrderByPrescriptionWithAddressCall {
  Future<ApiCallResponse> call({
    String? contactID = 'recckAFNMzRd5saKz',
    dynamic? urlListJson,
    String? localityId = '',
    String? addressId = '',
    String? appVersion = '',
  }) async {
    final baseUrl = AirtableApiGroup.getBaseUrl();

    final urlList = _serializeJson(urlListJson, true);
    final ffApiRequestBody = '''
{
  "records": [
    {
      "fields": {
        "Prescription": ${urlList},
        "Contact ID": [
          "${contactID}"
       ],
     "Locality": [
             "${localityId}"
        ],
     "AddressID": [
      "${addressId}"
    ],
      "App_Version_Order": "${appVersion}",
         "Order_Source":"Rx"
      }
    }
  ]
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'createOrder By Prescription With Address',
      apiUrl: '${baseUrl}/tblGQ0gGC4IKOo48N',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer pat70k9JHsHNESvPN.e9cda16d05774311c62e5777a9605fa4ff4eb4cea73bb0ffcea7eaa3a688e250',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateOrdersBySearchCall {
  Future<ApiCallResponse> call({
    String? contactID = 'recckAFNMzRd5saKz',
    String? localityId = 'rec2J5Eh29afzsS2T',
    String? appVersion = '',
  }) async {
    final baseUrl = AirtableApiGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "records": [
    {
      "fields": {
        "Status": "New Order",
        "Contact ID": [
          "${contactID}"
        ],
        "Locality": [
          "${localityId}"
        ],
 "App_Version_Order": "${appVersion}",
        "Order_Source": "Search"
      }
    }
  ]
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'createOrders By Search',
      apiUrl: '${baseUrl}/tblGQ0gGC4IKOo48N',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer pat70k9JHsHNESvPN.e9cda16d05774311c62e5777a9605fa4ff4eb4cea73bb0ffcea7eaa3a688e250',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? orderId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.records[:].id''',
      ));
  int? ticketId(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.records[:].fields["Ticket ID"]''',
      ));
  int? deliveryCharges(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.records[:].fields.Delivery_Charges''',
      ));
  int? platformFee(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.records[:].fields.Platform_Fee''',
      ));
  int? packagingCharges(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.records[:].fields.Packaging_Charges''',
      ));
  int? convenienceFee(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.records[:].fields.Convenience_Fee''',
      ));
  dynamic addressID(dynamic response) => getJsonField(
        response,
        r'''$.records[:].fields.AddressID[0]''',
      );
}

class CreateOrdersBySearchWithAddressCall {
  Future<ApiCallResponse> call({
    String? contactID = 'recckAFNMzRd5saKz',
    String? localityId = 'rec2J5Eh29afzsS2T',
    String? addressId = '',
    String? appVersion = '',
  }) async {
    final baseUrl = AirtableApiGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "records": [
    {
      "fields": {
        "Status": "New Order",
        "Contact ID": [
          "${contactID}"
        ],
        "Locality": [
          "${localityId}"
        ],
           "AddressID": [
      "${addressId}"
    ],
    "App_Version_Order": "${appVersion}",
    "Order_Source":"Search"
      }
    }
  ]
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'createOrders By Search With address',
      apiUrl: '${baseUrl}/tblGQ0gGC4IKOo48N',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer pat70k9JHsHNESvPN.e9cda16d05774311c62e5777a9605fa4ff4eb4cea73bb0ffcea7eaa3a688e250',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? orderId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.records[:].id''',
      ));
  int? ticketId(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.records[:].fields["Ticket ID"]''',
      ));
  dynamic deliveryCharges(dynamic response) => getJsonField(
        response,
        r'''$.records[:].fields.Delivery_Charges''',
      );
  dynamic platformFee(dynamic response) => getJsonField(
        response,
        r'''$.records[:].fields.Platform_Fee''',
      );
  dynamic packagingCharges(dynamic response) => getJsonField(
        response,
        r'''$.records[:].fields.Packaging_Charges''',
      );
  dynamic convenienceFee(dynamic response) => getJsonField(
        response,
        r'''$.records[:].fields.Convenience_Fee''',
      );
  dynamic addressID(dynamic response) => getJsonField(
        response,
        r'''$.records[:].fields.AddressID[0]''',
      );
}

class UpdateAddressCall {
  Future<ApiCallResponse> call({
    String? addressId = '919450490634',
    String? longitude = '81.961990',
    String? latitude = '27.133875',
    String? houseNumber = '01',
    String? floor = 'grd',
    String? buildingName = 'amar',
    String? landmark = '',
    String? locality = '',
    String? contactNumber = '',
    String? addressTag = 'Work',
  }) async {
    final baseUrl = AirtableApiGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "fields": {
    "Longitude": "${longitude}",
    "Latitude": "${latitude}",
    "HouseNumber": "${houseNumber}",
    "Floor": "${floor}",
    "BuildingName": "${buildingName}",
    "Landmark": "${landmark}",
    "Locality": "${locality}",
    "ContactMobile": "${contactNumber}",
    "Tag": "${addressTag}"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'UpdateAddress',
      apiUrl: '${baseUrl}/tblc0RIN7JYzFmlxm/${addressId}',
      callType: ApiCallType.PATCH,
      headers: {
        'Authorization':
            'Bearer pat70k9JHsHNESvPN.e9cda16d05774311c62e5777a9605fa4ff4eb4cea73bb0ffcea7eaa3a688e250',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdateContactIdAddressCall {
  Future<ApiCallResponse> call({
    String? longitude = '77.689245',
    String? latitude = '12.926502',
    String? recordId = 'recckAFNMzRd5saKz',
  }) async {
    final baseUrl = AirtableApiGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "fields": {
    "Longitude": "${longitude}",
    "Latitude": "${latitude}"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'UpdateContactIdAddress',
      apiUrl: '${baseUrl}/tblemoQGd9z2Ehwum/${recordId}',
      callType: ApiCallType.PATCH,
      headers: {
        'Authorization':
            'Bearer pat70k9JHsHNESvPN.e9cda16d05774311c62e5777a9605fa4ff4eb4cea73bb0ffcea7eaa3a688e250',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdateMedicineDetailsCall {
  Future<ApiCallResponse> call({
    double? totalprice = 81.65,
    double? quantity = 5,
    String? recordId = 'recx60eUVkL1Ddob4',
  }) async {
    final baseUrl = AirtableApiGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "fields": {
    "PlazzaPrice_Cart": ${totalprice},
    "Quantity_Cart": ${quantity}
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'UpdateMedicineDetails',
      apiUrl: '${baseUrl}/tblN6VE6bxbIgu0z3/${recordId}',
      callType: ApiCallType.PATCH,
      headers: {
        'Authorization':
            'Bearer pat70k9JHsHNESvPN.e9cda16d05774311c62e5777a9605fa4ff4eb4cea73bb0ffcea7eaa3a688e250',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdateSearchMedicineDetailsCall {
  Future<ApiCallResponse> call({
    double? totalprice = 81.65,
    double? quantity = 5,
    String? recordId = 'recx60eUVkL1Ddob4',
  }) async {
    final baseUrl = AirtableApiGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "fields": {
    "PlazzaPrice_Cart": ${totalprice},
    "Quantity_Cart": ${quantity},
     "Quantity":${quantity},
      "Plazza Price":${totalprice}
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'UpdateSearchMedicineDetails ',
      apiUrl: '${baseUrl}/tblN6VE6bxbIgu0z3/${recordId}',
      callType: ApiCallType.PATCH,
      headers: {
        'Authorization':
            'Bearer pat70k9JHsHNESvPN.e9cda16d05774311c62e5777a9605fa4ff4eb4cea73bb0ffcea7eaa3a688e250',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdateOrderItemPriceCall {
  Future<ApiCallResponse> call({
    double? itemPrice = 480,
    String? recordId = 'rec1XQSNz2bMZVGLM',
  }) async {
    final baseUrl = AirtableApiGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "fields": {
    "Item Total": ${itemPrice}
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'UpdateOrderItemPrice',
      apiUrl: '${baseUrl}/tblGQ0gGC4IKOo48N/${recordId}',
      callType: ApiCallType.PATCH,
      headers: {
        'Authorization':
            'Bearer pat70k9JHsHNESvPN.e9cda16d05774311c62e5777a9605fa4ff4eb4cea73bb0ffcea7eaa3a688e250',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdateOrderPrescriptionCall {
  Future<ApiCallResponse> call({
    dynamic? prescriptionJson,
    String? recordId = 'rec1XQSNz2bMZVGLM',
  }) async {
    final baseUrl = AirtableApiGroup.getBaseUrl();

    final prescription = _serializeJson(prescriptionJson, true);
    final ffApiRequestBody = '''
{
  "fields": {
    "Prescription": ${prescription}
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'UpdateOrder Prescription',
      apiUrl: '${baseUrl}/tblGQ0gGC4IKOo48N/${recordId}',
      callType: ApiCallType.PATCH,
      headers: {
        'Authorization':
            'Bearer pat70k9JHsHNESvPN.e9cda16d05774311c62e5777a9605fa4ff4eb4cea73bb0ffcea7eaa3a688e250',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class RateOrderCall {
  Future<ApiCallResponse> call({
    int? rating = 4,
    String? recordId = 'rec29O0OrfddAJQy3',
  }) async {
    final baseUrl = AirtableApiGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "fields": {
    "Rating": ${rating}
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'RateOrder',
      apiUrl: '${baseUrl}/tblGQ0gGC4IKOo48N/${recordId}',
      callType: ApiCallType.PATCH,
      headers: {
        'Authorization':
            'Bearer pat70k9JHsHNESvPN.e9cda16d05774311c62e5777a9605fa4ff4eb4cea73bb0ffcea7eaa3a688e250',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdateAddressidInOrderCall {
  Future<ApiCallResponse> call({
    String? recordId = 'rec29O0OrfddAJQy3',
    String? addressId = 'recmcPwdTQ7M4Qs9P',
  }) async {
    final baseUrl = AirtableApiGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "fields": {
    "AddressID": [
      "${addressId}"
    ]
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'update Addressid in order',
      apiUrl: '${baseUrl}/tblGQ0gGC4IKOo48N/${recordId}',
      callType: ApiCallType.PATCH,
      headers: {
        'Authorization':
            'Bearer pat70k9JHsHNESvPN.e9cda16d05774311c62e5777a9605fa4ff4eb4cea73bb0ffcea7eaa3a688e250',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? ticketId(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.fields["Ticket ID"]''',
      ));
}

class DeleteCall {
  Future<ApiCallResponse> call({
    String? tableName = 'tblGQ0gGC4IKOo48N',
    String? recordId = 'reclCc7MtKZMpHkKB',
  }) async {
    final baseUrl = AirtableApiGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Delete',
      apiUrl: '${baseUrl}/${tableName}/${recordId}',
      callType: ApiCallType.DELETE,
      headers: {
        'Authorization':
            'Bearer pat70k9JHsHNESvPN.e9cda16d05774311c62e5777a9605fa4ff4eb4cea73bb0ffcea7eaa3a688e250',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class FindOrderListDataCall {
  Future<ApiCallResponse> call({
    String? phoneNumber = '919450490634',
  }) async {
    final baseUrl = AirtableApiGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'FindOrderListData',
      apiUrl:
          '${baseUrl}/tblGQ0gGC4IKOo48N?filterByFormula=AND({Contact ID} = \'${phoneNumber}\', OR( {Order_Source} != \"Search\",  AND( {Order_Source} = \"Search\", {Status} != \"New Order\",  {Status} != \"Waiting for availability\", {Status} != \"Availability updated\",  {Status} != \"Final order ready\" )))&sortField=Ticket%20ID&sortDirection=desc',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer pat70k9JHsHNESvPN.e9cda16d05774311c62e5777a9605fa4ff4eb4cea73bb0ffcea7eaa3a688e250',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? records(dynamic response) => getJsonField(
        response,
        r'''$.records''',
        true,
      ) as List?;
}

class ArrowBarOrderCall {
  Future<ApiCallResponse> call({
    String? phoneNumber = '919971370543',
  }) async {
    final baseUrl = AirtableApiGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'ArrowBarOrder',
      apiUrl:
          '${baseUrl}/tblGQ0gGC4IKOo48N?filterByFormula=AND( {Contact ID} = \'${phoneNumber}\', {Status} != \'Order Cancelled\',{Rating}=BLANK(),OR({Order_Source} != \'Search\', AND({Order_Source} = \'Search\', {Status} != \'New Order\', {Status} != \'Waiting for availability\',{Status} != \'Availability updated\', {Status} != \'Final order ready\' )))&sortField=Ticket%20ID&sortDirection=desc',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer pat70k9JHsHNESvPN.e9cda16d05774311c62e5777a9605fa4ff4eb4cea73bb0ffcea7eaa3a688e250',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? records(dynamic response) => getJsonField(
        response,
        r'''$.records''',
        true,
      ) as List?;
}

class FindListAddressCall {
  Future<ApiCallResponse> call({
    String? phoneNumber = '919450490634',
  }) async {
    final baseUrl = AirtableApiGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'FindListAddress',
      apiUrl:
          '${baseUrl}/tblc0RIN7JYzFmlxm?filterByFormula=AND({ContactID}=\'${phoneNumber}\')',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer pat70k9JHsHNESvPN.e9cda16d05774311c62e5777a9605fa4ff4eb4cea73bb0ffcea7eaa3a688e250',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? records(dynamic response) => getJsonField(
        response,
        r'''$.records''',
        true,
      ) as List?;
}

class FindSingleOrderCall {
  Future<ApiCallResponse> call({
    int? ticketID = 484,
  }) async {
    final baseUrl = AirtableApiGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'FindSingleOrder',
      apiUrl:
          '${baseUrl}/tblGQ0gGC4IKOo48N?filterByFormula={Ticket ID}=\'${ticketID}\'',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer pat70k9JHsHNESvPN.e9cda16d05774311c62e5777a9605fa4ff4eb4cea73bb0ffcea7eaa3a688e250',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? locality(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$..fields.Locality''',
      ));
  String? recordId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.records[:].id''',
      ));
  String? addressID(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.records[:].fields.AddressID[0]''',
      ));
  String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.records[:].fields.Status''',
      ));
  String? address(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.records[:].fields.Address[0]''',
      ));
  String? deliveryAgentTrackingURL(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.records[:].fields["Delivery Agent Tracking URL"]''',
      ));
  String? deliveryAgentPhoneNumber(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.records[:].fields.DeliveryAgentPhoneNumber[0]''',
      ));
  String? deliveryAgentName(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.records[:].fields["Delivery Agent Name"][0]''',
      ));
  int? ticketID(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.records[:].fields["Ticket ID"]''',
      ));
  String? createdTime(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.records[:].createdTime''',
      ));
  int? platformfee(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.records[:].fields.Platform_Fee''',
      ));
  int? packingfee(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.records[:].fields.Packaging_Charges''',
      ));
  int? conveniencefee(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.records[:].fields.Convenience_Fee''',
      ));
  int? deliveryfee(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.records[:].fields.Delivery_Charges''',
      ));
  String? presscriptionCheck(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.records[:].fields.Prescription[0].url''',
      ));
  int? rating(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.records[:].fields.Rating''',
      ));
  String? lottieurl(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.records[:].fields.lottie_url[:].url''',
      ));
  String? orderSource(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.records[:].fields.Order_Source''',
      ));
  List? prescriptionList(dynamic response) => getJsonField(
        response,
        r'''$.records[:].fields.Prescription''',
        true,
      ) as List?;
  List<String>? prescriptionListurl(dynamic response) => (getJsonField(
        response,
        r'''$.records[:].fields.Prescription[:].url''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  String? tag(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.records[0].fields["Tag (from address_tag)"][0]''',
      ));
  String? fullAddress(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.records[0].fields["FullAddres (from AddressID)"][0]''',
      ));
}

class GetInvoiceCall {
  Future<ApiCallResponse> call({
    int? ticketID = 27,
  }) async {
    final baseUrl = AirtableApiGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'getInvoice',
      apiUrl:
          '${baseUrl}/tbl2YQpHdFU39XgfE?filterByFormula={Order ID}=\'${ticketID}\'',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer pat70k9JHsHNESvPN.e9cda16d05774311c62e5777a9605fa4ff4eb4cea73bb0ffcea7eaa3a688e250',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? invoiceUrl(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.records[:].fields["Zoho Invoice URL"]''',
      ));
}

class GetAnysingleTableDataCall {
  Future<ApiCallResponse> call({
    String? tableName = 'tblc0RIN7JYzFmlxm',
    String? recordId = 'recmcPwdTQ7M4Qs9P',
  }) async {
    final baseUrl = AirtableApiGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'getAnysingleTableData',
      apiUrl: '${baseUrl}/${tableName}/${recordId}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer pat70k9JHsHNESvPN.e9cda16d05774311c62e5777a9605fa4ff4eb4cea73bb0ffcea7eaa3a688e250',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetAddressDetailsCall {
  Future<ApiCallResponse> call({
    String? addressId = 'recq2fE5NwlzWXU7t',
  }) async {
    final baseUrl = AirtableApiGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'getAddressDetails',
      apiUrl: '${baseUrl}/tblc0RIN7JYzFmlxm/${addressId}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer pat70k9JHsHNESvPN.e9cda16d05774311c62e5777a9605fa4ff4eb4cea73bb0ffcea7eaa3a688e250',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? houseNumber(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.fields.HouseNumber''',
      ));
  String? floor(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.fields.Floor''',
      ));
  String? landmark(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.fields.Landmark''',
      ));
  String? locality(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.fields.Locality''',
      ));
  String? tag(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.fields.Tag''',
      ));
  String? buildingname(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.fields.BuildingName''',
      ));
  String? contactMobile(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.fields.ContactMobile''',
      ));
  int? pincode(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.fields.Pincode''',
      ));
  String? fullAddres(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.fields.FullAddres''',
      ));
}

class GetMedicineDetailsCall {
  Future<ApiCallResponse> call({
    int? orderTicketId = 499,
    int? quantityvalue = 0,
  }) async {
    final baseUrl = AirtableApiGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'getMedicineDetails',
      apiUrl:
          '${baseUrl}/tblN6VE6bxbIgu0z3?filterByFormula=AND(SEARCH(\'${orderTicketId}\', {Order}) , {Quantity_Cart} != ${quantityvalue})',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer pat70k9JHsHNESvPN.e9cda16d05774311c62e5777a9605fa4ff4eb4cea73bb0ffcea7eaa3a688e250',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? recordList(dynamic response) => getJsonField(
        response,
        r'''$.records''',
        true,
      ) as List?;
}

class GetLocalityCall {
  Future<ApiCallResponse> call({
    int? localitynumber = 1,
  }) async {
    final baseUrl = AirtableApiGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'getLocality',
      apiUrl:
          '${baseUrl}/tblHEwaQIZ5KDGXbW?filterByFormula={LocalityNumber}=${localitynumber}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer pat70k9JHsHNESvPN.e9cda16d05774311c62e5777a9605fa4ff4eb4cea73bb0ffcea7eaa3a688e250',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? pharmacyDeliveryFee(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$..fields.PharmacyDeliveryFee''',
      ));
  int? pharmacyDeliveryTime(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$..fields.PharmacyDeliveryTime''',
      ));
  int? platformFee(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$..fields.PharmacyPlatformFee''',
      ));
  int? convenienceFee(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$..fields.PharmacyConvenienceFee''',
      ));
  int? packagingFee(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$..fields.PharmacyPackagingFee''',
      ));
}

/// End AirtableApi Group Code

class GoogleMapApiCall {
  static Future<ApiCallResponse> call({
    String? api,
    String? latlng = '12.9485692,77.6927833',
  }) async {
    api ??= FFDevEnvironmentValues().googlemapApikey;

    return ApiManager.instance.makeApiCall(
      callName: 'GoogleMapApi',
      apiUrl:
          'https://maps.googleapis.com/maps/api/geocode/json?latlng=${latlng}&key=${api}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? locality(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results[0].address_components[1].long_name''',
      ));
  static String? pincode(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results[0].address_components[6].long_name''',
      ));
  static double? lat(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.results[0].geometry.location.lat''',
      ));
  static double? lng(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.results[0].geometry.location.lng''',
      ));
  static String? address(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results[0].formatted_address''',
      ));
}

class GoogleMapSearchCall {
  static Future<ApiCallResponse> call({
    String? api,
    String? input = 'gonda',
  }) async {
    api ??= FFDevEnvironmentValues().googlemapApikey;

    return ApiManager.instance.makeApiCall(
      callName: 'googleMapSearch',
      apiUrl:
          'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=${input}&types=geocode&key=${api}',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class FindlatlngByPlaceIdCall {
  static Future<ApiCallResponse> call({
    String? api,
    String? placeid = 'ChIJqbfllQTumTkRyjb1HybWJ8k',
  }) async {
    api ??= FFDevEnvironmentValues().googlemapApikey;

    return ApiManager.instance.makeApiCall(
      callName: 'findlatlng By Place Id',
      apiUrl:
          'https://maps.googleapis.com/maps/api/place/details/json?place_id=${placeid}&key=${api}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static double? lat(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.result.geometry.location.lat''',
      ));
  static double? lng(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.result.geometry.location.lng''',
      ));
  static String? address(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.result.formatted_address''',
      ));
}

class PaymentCaptureCall {
  static Future<ApiCallResponse> call({
    String? amount = '1',
    String? name = 'Abhi',
    String? phone = '919450490634',
    String? appTransactionId = '12123345',
    int? tickectid = 71,
  }) async {
    final ffApiRequestBody = '''
{
    "data": {
        "paymentId": "pay_PJrsHZEKBm6mcU",
        "amount": 100,
        "currency": "INR",
        "isProd": true
    }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'payment capture',
      apiUrl:
          'https://us-central1-plazza-mvp.cloudfunctions.net/capturePayment',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ServiceabilityCall {
  static Future<ApiCallResponse> call({
    String? lng = '77.6883275',
    String? lat = '12.921176',
    String? phonenumber = '919450490634',
  }) async {
    final ffApiRequestBody = '''
{
  "user_latitude": "${lat}",
  "user_longitude": "${lng}",
  "mobile_number": "${phonenumber}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Serviceability',
      apiUrl: 'https://checkserviceability-7sqe6o3vjq-uc.a.run.app/',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static bool? serviceable(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.is_serviceable''',
      ));
  static int? pharmacyDeliveryTime(dynamic response) =>
      castToType<int>(getJsonField(
        response,
        r'''$.locality.pharmacyDeliveryTime''',
      ));
  static int? localityNumber(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.locality.number''',
      ));
  static String? localityId(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.locality.id''',
      ));
  static String? name(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.locality.name''',
      ));
  static bool? closestAddress(dynamic response) =>
      castToType<bool>(getJsonField(
        response,
        r'''$.hasClosestAddress''',
      ));
  static String? addressTag(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.closestAddress.tag''',
      ));
  static String? addressId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.closestAddress.id''',
      ));
  static String? houseNumber(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.closestAddress.houseNumber''',
      ));
  static String? floor(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.closestAddress.floor''',
      ));
  static String? landmark(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.closestAddress.landmark''',
      ));
  static String? locality(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.closestAddress.locality''',
      ));
  static dynamic buildingName(dynamic response) => getJsonField(
        response,
        r'''$.closestAddress.buildingName''',
      );
}

class MedicineSearchAutoCompleteCall {
  static Future<ApiCallResponse> call({
    String? query = 'eye',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'MedicineSearch Auto Complete',
      apiUrl:
          'http://13.127.192.122:80/collections/medicines/documents/search?q=${query}&query_by=name,salt_composition&prefix=true&per_page=5',
      callType: ApiCallType.GET,
      headers: {
        'X-TYPESENSE-API-KEY': 'ts_4aXLeylmbA_438324',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? nameList(dynamic response) => (getJsonField(
        response,
        r'''$.hits[:].document.name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? document(dynamic response) => getJsonField(
        response,
        r'''$.hits[:].document''',
        true,
      ) as List?;
}

class SingleMedicineByProductIdCall {
  static Future<ApiCallResponse> call({
    String? productId = 'DRS011053',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Single Medicine By ProductId',
      apiUrl: 'http://13.202.245.86/medicine/_search?q=Product_id:${productId}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? productid(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.hits.hits[:]._source.Product_id''',
      ));
  static String? name(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.hits.hits[:]._source.name''',
      ));
  static String? prescriptionrequired(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.hits.hits[:]._source.prescription_required''',
      ));
  static String? qty(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.hits.hits[:]._source.Qty''',
      ));
  static String? mrp(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.hits.hits[:]._source.MRP''',
      ));
  static List<String>? imageurl(dynamic response) => (getJsonField(
        response,
        r'''$.hits.hits[:]._source.image_url''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static String? packagingDetail(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.hits.hits[:]._source..["Packaging Detail"]''',
      ));
}

class MedicineSearchTestsCall {
  static Future<ApiCallResponse> call({
    String? name = 'dolo',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: ' medicine Search tests',
      apiUrl:
          'http://13.202.245.86/medicine/_search?q=(name:${name}%20OR%20description:${name})AND%20medicine_type:drugs&size=240',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List? medicineData(dynamic response) => getJsonField(
        response,
        r'''$.hits.hits''',
        true,
      ) as List?;
}

class MedicineSearchsCall {
  static Future<ApiCallResponse> call({
    String? name = 'Remylin D 1000 IU',
  }) async {
    final ffApiRequestBody = '''
{
  "query": {
    "match": {
      "name": {
        "query": "${escapeStringForJson(name)}",
        "fuzziness": "AUTO"
      }
    }
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Medicine Searchs',
      apiUrl: 'http://13.202.245.86/medicine/_search?size=99',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List? medicineData(dynamic response) => getJsonField(
        response,
        r'''$.hits.hits''',
        true,
      ) as List?;
}

class CreateOrderCall {
  static Future<ApiCallResponse> call() async {
    final ffApiRequestBody = '''
{
    "data": {
        "amount": 1000,
        "currency": "INR",
        "isProd": false
    }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'createOrder',
      apiUrl:
          'https://us-central1-plazza-mvp.cloudfunctions.net/createRazorpayOrder',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
