import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

String milisecondsToSeconds(int miliseconds) {
  double seconds = miliseconds / 1000;
  return seconds.toStringAsFixed(0);
}

String getLng(LatLng latLng) {
  return latLng.longitude.toString();
  // pass latlng return lat
}

String? getTwoDigit(String? displayName) {
  if (displayName == null || displayName.length < 2) {
    return 'AP';
  }

  // Extract the first two characters and convert them to uppercase
  return displayName.substring(0, 2).toUpperCase();
}

String getLet(LatLng latLng) {
  return latLng.latitude.toString();
  // pass latlng return lat
}

String? getNumber(String? number) {
  // pass mobile number remove +91 and return 10 digit number
  if (number == null || number.length < 10) {
    return null;
  }

  // Remove the country code if it starts with +91
  if (number.startsWith('+91')) {
    number = number.substring(3);
  }

  // Return the last 10 digits
  return number.substring(number.length - 10);
}

int wordCounter(String searchtext) {
  return searchtext.length;
}

LatLng? getLatlng(
  String? lat,
  String? lng,
) {
  // pass the lat lng in string return latlng
  if (lat != null && lng != null) {
    double latitude = double.tryParse(lat) ?? 0.0;
    double longitude = double.tryParse(lng) ?? 0.0;
    return LatLng(latitude, longitude);
  } else {
    return null;
  }
}

String? latlngConvertString(LatLng? latlng) {
  // latlng convert to the string
  if (latlng != null) {
    return latlng.toString();
  } else {
    return null;
  }
}

int getIntergerByString(String distance) {
  // pass string get int
  try {
    return int.parse(distance);
  } catch (e) {
    return 0;
  }
}

String getphoneNumber(String phone) {
  // pass the phone number remove +
  return phone.replaceAll('+', '');
}

String getImagePath(String url) {
  // // pass the string url check the extaion are image then retun image path
  final List<String> imageExtensions = [
    '.jpg',
    '.jpeg',
    '.png',
    '.gif',
    '.bmp'
  ];
  final String extension = url.substring(url.lastIndexOf('.'));
  if (imageExtensions.contains(extension.toLowerCase())) {
    return url;
  } else {
    return '';
  }
}

double stringToDouble(String stringData) {
  // Pass String convert to double
  double value = double.parse(stringData);
  return double.parse(value.toStringAsFixed(2));
}

double addListData(List<double> listDouble) {
  // pass list of double value return add total value of list
  return listDouble.reduce((value, element) => value + element);
}

double getMinus(double rate) {
  // pass double change minus
  return -rate;
}

DateTime stringToTimestamp(String dataTime) {
  // String convert to date time
  DateTime parsedDate = DateTime.parse(dataTime);
  DateTime istDate = parsedDate.toUtc().add(Duration(hours: 5, minutes: 30));

  return istDate;
}

int lenghtfind(String? otp) {
  // pass string data find lenght
  if (otp != null) {
    return otp.length;
  } else {
    return 0;
  }
}

int? checklistContains(
  List<String> productidlist,
  String productid,
) {
  // pass productidlist this list contains productid then return index
  return productidlist.indexOf(productid);
}

int addlist(List<int> count) {
  // add integer list data
  int sum = 0;
  for (int num in count) {
    sum += num;
  }
  return sum;
}

int? removeSpaceInPhonenumber(String? phone) {
  // pass phone number with space return only phone number
  return int.parse(phone!.replaceAll(' ', ''));
}

String jsonConvertToString(dynamic json) {
  // json convert to string and remove ""
  return jsonEncode(json).replaceAll('"', '');
}

bool checkInt(dynamic price) {
  // pass the json  value is int return true
  if (price is int) {
    return true;
  } else {
    return false;
  }
}

double jsonToDouble(dynamic json) {
  double result;

  // Convert JSON to double
  if (json is int) {
    result = json.toDouble();
  } else if (json is double) {
    result = json;
  } else if (json is String) {
    result = double.parse(json);
  } else {
    throw Exception('Invalid JSON type for conversion to double');
  }

  // Ensure result has two decimal places
  return double.parse(result.toStringAsFixed(2));
}

List<dynamic> singleimageToList(String imageurl) {
  // single image path convert to list of json with single item
  return [
    {
      'image_url': imageurl,
    }
  ];
}

int doubleToInt(double doublevalue) {
  // pass value * by 100 return int
  return (doublevalue * 100).toInt();
}

double valueOneMultiplayByvalueTwo(
  int quantity,
  int price,
) {
  double result = (quantity * price) / 100;
  return double.parse(result.toStringAsFixed(2));
}
