import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dropdown_modal_model.dart';
export 'dropdown_modal_model.dart';

class DropdownModalWidget extends StatefulWidget {
  const DropdownModalWidget({
    super.key,
    required this.cellValue,
    required this.rowId,
    required this.cellName,
    required this.options,
    required this.pathName,
  });

  final String? cellValue;
  final String? rowId;
  final String? cellName;
  final List<String>? options;
  final String? pathName;

  @override
  State<DropdownModalWidget> createState() => _DropdownModalWidgetState();
}

class _DropdownModalWidgetState extends State<DropdownModalWidget> {
  late DropdownModalModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DropdownModalModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: const AlignmentDirectional(0.0, 0.0),
      child: Container(
        width: 300.0,
        height: 300.0,
        decoration: BoxDecoration(
          color: const Color(0xFFECECF3),
          boxShadow: const [
            BoxShadow(
              blurRadius: 4.0,
              color: Color(0x33000000),
              offset: Offset(
                0.0,
                2.0,
              ),
            )
          ],
          borderRadius: BorderRadius.circular(10.0),
        ),
        alignment: const AlignmentDirectional(0.0, 0.0),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Pick to edit ${widget.cellName}',
                style: FlutterFlowTheme.of(context).titleLarge.override(
                      fontFamily: 'Outfit',
                      fontSize: () {
                        if (MediaQuery.sizeOf(context).width <
                            kBreakpointSmall) {
                          return 18.0;
                        } else if (MediaQuery.sizeOf(context).width <
                            kBreakpointMedium) {
                          return 20.0;
                        } else if (MediaQuery.sizeOf(context).width <
                            kBreakpointLarge) {
                          return 22.0;
                        } else {
                          return 22.0;
                        }
                      }(),
                      letterSpacing: 0.0,
                    ),
              ),
              Container(
                width: double.infinity,
                height: 52.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                    color: const Color(0xFF51575A),
                    width: 1.0,
                  ),
                ),
                child: FlutterFlowDropDown<String>(
                  controller: _model.dropDownValueController ??=
                      FormFieldController<String>(null),
                  options: widget.options!,
                  onChanged: (val) =>
                      setState(() => _model.dropDownValue = val),
                  width: MediaQuery.sizeOf(context).width * 0.15,
                  height: 45.0,
                  textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Readex Pro',
                        color: const Color(0xFF51575A),
                        fontSize: 10.0,
                        letterSpacing: 0.0,
                      ),
                  hintText: 'Select option',
                  icon: Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    size: 24.0,
                  ),
                  fillColor: const Color(0xFFECECF3),
                  elevation: 2.0,
                  borderColor: const Color(0xFF51575A),
                  borderWidth: 1.0,
                  borderRadius: 10.0,
                  margin: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 4.0),
                  hidesUnderline: true,
                  isOverButton: true,
                  isSearchable: false,
                  isMultiSelect: false,
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FFButtonWidget(
                    onPressed: () async {
                      Navigator.pop(context);
                      FFAppState().isCompanyFiltered = true;
                    },
                    text: 'Cancel',
                    options: FFButtonOptions(
                      height: 40.0,
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      iconPadding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Readex Pro',
                                color: Colors.white,
                                letterSpacing: 0.0,
                              ),
                      elevation: 3.0,
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  FFButtonWidget(
                    onPressed: () async {
                      var shouldSetState = false;
                      setState(() {
                        FFAppState().isCompanyFiltered = false;
                      });
                      _model.apiResult6ot = await UpdateBillCall.call(
                        token: currentJwtToken,
                        billId: widget.rowId,
                        pathName: widget.pathName,
                        data: _model.dropDownValue,
                      );
                      shouldSetState = true;
                      if ((_model.apiResult6ot?.succeeded ?? true)) {
                        setState(() {
                          FFAppState().updateBillsAtIndex(
                            functions.getBillIndex(
                                widget.rowId!, FFAppState().bills.toList())!,
                            (_) => getJsonField(
                              (_model.apiResult6ot?.jsonBody ?? ''),
                              r'''$.data''',
                            ),
                          );
                        });
                      } else {
                        await showDialog(
                          context: context,
                          builder: (alertDialogContext) {
                            return AlertDialog(
                              title: const Text('Error'),
                              content: const Text('Something went wrong. Try Again.'),
                              actions: [
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(alertDialogContext),
                                  child: const Text('Ok'),
                                ),
                              ],
                            );
                          },
                        );
                        if (shouldSetState) setState(() {});
                        return;
                      }

                      Navigator.pop(context);
                      if (shouldSetState) setState(() {});
                    },
                    text: 'Update',
                    options: FFButtonOptions(
                      height: 40.0,
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      iconPadding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Readex Pro',
                                color: Colors.white,
                                letterSpacing: 0.0,
                              ),
                      elevation: 3.0,
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
