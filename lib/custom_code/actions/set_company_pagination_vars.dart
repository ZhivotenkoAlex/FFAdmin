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

Future setCompanyPaginationVars(bool? isNext) async {
  // Add your function code here!
  List<dynamic>? companies = FFAppState().filteredCompanies;

  dynamic lastId = companies.isNotEmpty ? companies[0]["id"] : "";
  dynamic firstId =
      companies.isNotEmpty ? companies[companies.length - 1]["id"] : '';

  FFAppState().lastCompanyId = lastId;
  FFAppState().firstCompanyId = firstId;

  if (FFAppState().pageNumber >= 1) {
    if (isNext == true) FFAppState().pageNumber += 1;
    if (isNext == false) FFAppState().pageNumber -= 1;
  }
}
