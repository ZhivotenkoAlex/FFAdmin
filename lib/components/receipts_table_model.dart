import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:async';
import 'receipts_table_widget.dart' show ReceiptsTableWidget;
import 'package:flutter/material.dart';

class ReceiptsTableModel extends FlutterFlowModel<ReceiptsTableWidget> {
  ///  Local state fields for this component.

  DateTime? date;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // Stores action output result for [Backend Call - API (getPaginatedBills)] action in TextField widget.
  ApiCallResponse? transactionIdRes;
  DateTime? datePicked;
  // Stores action output result for [Backend Call - API (getPaginatedBills)] action in ReceiptsDatePicker widget.
  ApiCallResponse? timeRangeRes;
  // Stores action output result for [Backend Call - API (getPaginatedBills)] action in DateRangePicker widget.
  ApiCallResponse? dateRangeRes;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // Stores action output result for [Backend Call - API (getPaginatedBills)] action in TextField widget.
  ApiCallResponse? receiptNumberRes;
  // Stores action output result for [Backend Call - API (getPaginatedBills)] action in Container widget.
  ApiCallResponse? checkBoxContainerRes;
  // State field(s) for Checkbox widget.
  bool? checkboxValue;
  // Stores action output result for [Backend Call - API (getPaginatedBills)] action in Checkbox widget.
  ApiCallResponse? checkboxRes;
  // State field(s) for StatusDropdown widget.
  String? statusDropdownValue;
  FormFieldController<String>? statusDropdownValueController;
  // Stores action output result for [Backend Call - API (getPaginatedBills)] action in StatusDropdown widget.
  ApiCallResponse? statusRes;
  // Stores action output result for [Backend Call - API (getPaginatedBills)] action in Text widget.
  ApiCallResponse? clearFilterRes;
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController =
      FlutterFlowDataTableController<dynamic>();
  // Stores action output result for [Backend Call - API (getPaginatedBills)] action in Row widget.
  ApiCallResponse? prevBillsRes;
  // Stores action output result for [Backend Call - API (getPaginatedBills)] action in Row widget.
  ApiCallResponse? nextBillsRes;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();
  }

  /// Action blocks.
  Future sss(BuildContext context) async {}
}
