import '/backend/api_requests/api_calls.dart';
import '/components/receipts_table_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'receipts_page_widget.dart' show ReceiptsPageWidget;
import 'package:flutter/material.dart';

class ReceiptsPageModel extends FlutterFlowModel<ReceiptsPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (getPaginatedBills)] action in ReceiptsPage widget.
  ApiCallResponse? initialBillsRes;
  // Model for ReceiptsTable component.
  late ReceiptsTableModel receiptsTableModel;

  @override
  void initState(BuildContext context) {
    receiptsTableModel = createModel(context, () => ReceiptsTableModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    receiptsTableModel.dispose();
  }
}
