import '/backend/api_requests/api_calls.dart';
import '/components/companies_table_widget.dart';
import '/components/loader/loader_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:flutter/material.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - API (getPaginatedCompanyList )] action in HomePage widget.
  ApiCallResponse? initialCompanyRes;
  // Stores action output result for [Backend Call - API (getCompanyNames)] action in HomePage widget.
  ApiCallResponse? companyNamesRes;
  DateTime? datePicked1;
  DateTime? datePicked2;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for NameDropDown widget.
  String? nameDropDownValue;
  FormFieldController<String>? nameDropDownValueController;
  // Stores action output result for [Backend Call - API (getPaginatedCompanyList )] action in Button widget.
  ApiCallResponse? filterRes;
  // Model for CompaniesTable component.
  late CompaniesTableModel companiesTableModel;
  // Stores action output result for [Backend Call - API (getPaginatedCompanyList )] action in Row widget.
  ApiCallResponse? prevCompaniesRes;
  // Stores action output result for [Backend Call - API (getPaginatedCompanyList )] action in Row widget.
  ApiCallResponse? nextCompaniesRes;
  // Model for Loader component.
  late LoaderModel loaderModel;

  @override
  void initState(BuildContext context) {
    companiesTableModel = createModel(context, () => CompaniesTableModel());
    loaderModel = createModel(context, () => LoaderModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    companiesTableModel.dispose();
    loaderModel.dispose();
  }
}
