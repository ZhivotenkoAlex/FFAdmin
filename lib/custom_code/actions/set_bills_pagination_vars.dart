// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future setBillsPaginationVars(bool? isNext) async {
  // Add your function code here!
  List<dynamic>? bills = FFAppState().bills;

  dynamic lastId = bills.isNotEmpty ? bills[0]["id"] : "";
  dynamic firstId = bills.isNotEmpty ? bills[bills.length - 1]["id"] : '';

  FFAppState().lastBillId = lastId;
  FFAppState().firstBillId = firstId;

  if (FFAppState().pageNumber >= 1) {
    if (isNext == true) FFAppState().pageNumber += 1;
    if (isNext == false) FFAppState().pageNumber -= 1;
  }
}
