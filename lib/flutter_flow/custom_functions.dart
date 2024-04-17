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

String? formatDateToString(String date) {
  DateTime dateTime = DateTime.parse(date);
  var formatter = DateFormat('yyyy-MM-dd HH:mm:ss');

  return formatter.format(dateTime);
}

List<dynamic> getCompanyNames(List<dynamic>? companies) {
  var names = companies!.map((item) => item["name"]).toList();
  names.insert(0, "");

  return names;
}

int? getCompanyReceiptsCount(dynamic company) {
  return company?['gamification']?["gamification_bills"].length ?? 0;
}

List<String> getOptionsList(List<String>? options) {
  return options!.isEmpty ? [] : options;
}

String? getID(List<dynamic> companies) {
  if (companies.length > 0) {
    return companies[0]?['gamification']?["id"].toString() ?? '';
  }
  return '';
}

bool isDateSet(DateTime? date) {
  return date != 0;
}

bool isEmptyString(String? string) {
  return string!.isEmpty;
}

bool? stringToBoolean(String str) {
  return str != "0";
}

int? getBillIndex(
  String billId,
  List<dynamic> billsArray,
) {
  return billsArray.indexWhere((bill) => bill["_id"] == billId);
}
