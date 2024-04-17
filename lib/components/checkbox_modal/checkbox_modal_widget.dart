import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'checkbox_modal_model.dart';
export 'checkbox_modal_model.dart';

class CheckboxModalWidget extends StatefulWidget {
  const CheckboxModalWidget({
    super.key,
    required this.cellValue,
    required this.rowId,
    required this.cellName,
    required this.pathName,
  });

  final bool? cellValue;
  final String? rowId;
  final String? cellName;
  final String? pathName;

  @override
  State<CheckboxModalWidget> createState() => _CheckboxModalWidgetState();
}

class _CheckboxModalWidgetState extends State<CheckboxModalWidget> {
  late CheckboxModalModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CheckboxModalModel());

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
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                    color: const Color(0xFF51575A),
                  ),
                ),
                child: Theme(
                  data: ThemeData(
                    checkboxTheme: CheckboxThemeData(
                      visualDensity: VisualDensity.compact,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    unselectedWidgetColor: const Color(0xFF565656),
                  ),
                  child: CheckboxListTile(
                    value: _model.checkboxListTileValue ??= widget.cellValue!,
                    onChanged: (newValue) async {
                      setState(() => _model.checkboxListTileValue = newValue!);
                    },
                    title: Text(
                      'Mark',
                      style: FlutterFlowTheme.of(context).titleLarge.override(
                            fontFamily: 'Outfit',
                            color: const Color(0xFF181717),
                            letterSpacing: 0.0,
                          ),
                    ),
                    subtitle: Text(
                      'to check',
                      style: FlutterFlowTheme.of(context).labelMedium.override(
                            fontFamily: 'Readex Pro',
                            color: const Color(0xFF565656),
                            letterSpacing: 0.0,
                          ),
                    ),
                    tileColor: const Color(0xFFECECF3),
                    activeColor: const Color(0xFF4474ED),
                    checkColor: const Color(0xFFECECF3),
                    dense: false,
                    controlAffinity: ListTileControlAffinity.trailing,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
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
                      _model.apiResult4ot = await UpdateBillCall.call(
                        token: currentJwtToken,
                        billId: widget.rowId,
                        pathName: widget.pathName,
                        data: _model.checkboxListTileValue?.toString(),
                      );
                      shouldSetState = true;
                      if ((_model.apiResult4ot?.succeeded ?? true)) {
                        setState(() {
                          FFAppState().updateBillsAtIndex(
                            functions.getBillIndex(
                                widget.rowId!, FFAppState().bills.toList())!,
                            (_) => getJsonField(
                              (_model.apiResult4ot?.jsonBody ?? ''),
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
