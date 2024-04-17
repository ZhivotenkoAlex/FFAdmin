import '/flutter_flow/flutter_flow_util.dart';
import 'input_number_modal_widget.dart' show InputNumberModalWidget;
import 'package:flutter/material.dart';

class InputNumberModalModel extends FlutterFlowModel<InputNumberModalWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
