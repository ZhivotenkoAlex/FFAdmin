import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/components/checkbox_modal/checkbox_modal_widget.dart';
import '/components/date_input_modal/date_input_modal_widget.dart';
import '/components/dropdown_modal/dropdown_modal_widget.dart';
import '/components/input_text_modal/input_text_modal_widget.dart';
import '/components/products_table_widget.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'receipts_table_model.dart';
export 'receipts_table_model.dart';

class ReceiptsTableWidget extends StatefulWidget {
  const ReceiptsTableWidget({
    super.key,
    required this.companyId,
  });

  final String? companyId;

  @override
  State<ReceiptsTableWidget> createState() => _ReceiptsTableWidgetState();
}

class _ReceiptsTableWidgetState extends State<ReceiptsTableWidget> {
  late ReceiptsTableModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ReceiptsTableModel());

    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??= TextEditingController();
    _model.textFieldFocusNode2 ??= FocusNode();

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

    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFFECECF3),
        border: Border.all(
          color: const Color(0xFFECECF3),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: double.infinity,
            child: Form(
              key: _model.formKey,
              autovalidateMode: AutovalidateMode.always,
              child: Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                  child: Wrap(
                    spacing: 10.0,
                    runSpacing: 10.0,
                    alignment: WrapAlignment.spaceBetween,
                    crossAxisAlignment: WrapCrossAlignment.end,
                    direction: Axis.horizontal,
                    runAlignment: WrapAlignment.center,
                    verticalDirection: VerticalDirection.down,
                    clipBehavior: Clip.none,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 53.0,
                            decoration: const BoxDecoration(),
                            child: SizedBox(
                              width: MediaQuery.sizeOf(context).width <
                                      kBreakpointLarge
                                  ? 300.0
                                  : 250.0,
                              child: TextFormField(
                                controller: _model.textController1,
                                focusNode: _model.textFieldFocusNode1,
                                onChanged: (_) => EasyDebounce.debounce(
                                  '_model.textController1',
                                  const Duration(milliseconds: 2000),
                                  () async {
                                    var shouldSetState = false;
                                    _model.transactionIdRes =
                                        await GetPaginatedBillsCall.call(
                                      companyId: widget.companyId,
                                      lastId: FFAppState().lastBillId,
                                      firstId: FFAppState().firstBillId,
                                      toNext: null,
                                      transactionId:
                                          _model.textController1.text,
                                      startDate: FFAppState()
                                          .startRangeDate
                                          ?.toString(),
                                      endDate:
                                          FFAppState().endRangeDate?.toString(),
                                      receiptNumber:
                                          _model.textController2.text,
                                      isMarked:
                                          FFAppState().isMarkedCheckboxActive
                                              ? _model.checkboxValue?.toString()
                                              : null,
                                      token: currentJwtToken,
                                      status: _model.statusDropdownValue,
                                    );
                                    shouldSetState = true;
                                    if ((_model.transactionIdRes?.succeeded ??
                                        true)) {
                                      setState(() {
                                        FFAppState().bills = getJsonField(
                                          (_model.transactionIdRes?.jsonBody ??
                                              ''),
                                          r'''$.data''',
                                          true,
                                        )!
                                            .toList()
                                            .cast<dynamic>();
                                        FFAppState().pageNumber = 1;
                                      });
                                    } else {
                                      unawaited(
                                        () async {
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                title: const Text(
                                                    'No receipts were found.'),
                                                content: const Text(
                                                    'Please, change filter settings'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext),
                                                    child: const Text('Ok'),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        }(),
                                      );
                                      if (shouldSetState) setState(() {});
                                      return;
                                    }

                                    if (shouldSetState) setState(() {});
                                  },
                                ),
                                autofocus: false,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Transaction id',
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .labelLarge
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: const Color(0xFF525D66),
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                      ),
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: const Color(0xFF525D66),
                                        letterSpacing: 0.0,
                                      ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0xFF51575A),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color: const Color(0xFF0C0C0D),
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                    ),
                                maxLines: null,
                                validator: _model.textController1Validator
                                    .asValidator(context),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (false)
                            Container(
                              width: MediaQuery.sizeOf(context).width <
                                      kBreakpointLarge
                                  ? 300.0
                                  : 250.0,
                              height: 52.0,
                              decoration: BoxDecoration(
                                color: const Color(0xFFECECF3),
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(
                                  color: const Color(0xFF51575A),
                                  width: 1.0,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    5.0, 0.0, 5.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    var shouldSetState = false;
                                    final datePickedDate =
                                        await showDatePicker(
                                      context: context,
                                      initialDate: getCurrentTimestamp,
                                      firstDate: DateTime(1900),
                                      lastDate: DateTime(2050),
                                      builder: (context, child) {
                                        return wrapInMaterialDatePickerTheme(
                                          context,
                                          child!,
                                          headerBackgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                          headerForegroundColor:
                                              FlutterFlowTheme.of(context).info,
                                          headerTextStyle:
                                              FlutterFlowTheme.of(context)
                                                  .headlineLarge
                                                  .override(
                                                    fontFamily: 'Outfit',
                                                    fontSize: 32.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                          pickerBackgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          pickerForegroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                          selectedDateTimeBackgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                          selectedDateTimeForegroundColor:
                                              FlutterFlowTheme.of(context).info,
                                          actionButtonForegroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                          iconSize: 24.0,
                                        );
                                      },
                                    );

                                    if (datePickedDate != null) {
                                      safeSetState(() {
                                        _model.datePicked = DateTime(
                                          datePickedDate.year,
                                          datePickedDate.month,
                                          datePickedDate.day,
                                        );
                                      });
                                    }
                                    setState(() {
                                      _model.date = _model.datePicked;
                                    });
                                    _model.timeRangeRes =
                                        await GetPaginatedBillsCall.call(
                                      companyId: widget.companyId,
                                      lastId: FFAppState().lastBillId,
                                      firstId: FFAppState().firstBillId,
                                      toNext: null,
                                      transactionId:
                                          _model.textController1.text,
                                      startDate: FFAppState()
                                          .startRangeDate
                                          ?.toString(),
                                      endDate:
                                          FFAppState().endRangeDate?.toString(),
                                      receiptNumber:
                                          _model.textController2.text,
                                      isMarked:
                                          FFAppState().isMarkedCheckboxActive
                                              ? _model.checkboxValue?.toString()
                                              : null,
                                      token: currentJwtToken,
                                    );
                                    shouldSetState = true;
                                    if ((_model.timeRangeRes?.succeeded ??
                                        true)) {
                                      setState(() {
                                        FFAppState().bills = getJsonField(
                                          (_model.timeRangeRes?.jsonBody ?? ''),
                                          r'''$.data''',
                                          true,
                                        )!
                                            .toList()
                                            .cast<dynamic>();
                                      });
                                    } else {
                                      unawaited(
                                        () async {
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                title: const Text(
                                                    'No receipts were found.'),
                                                content: const Text(
                                                    'Please, change filter settings'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext),
                                                    child: const Text('Ok'),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        }(),
                                      );
                                      if (shouldSetState) setState(() {});
                                      return;
                                    }

                                    if (shouldSetState) setState(() {});
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      const Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 10.0, 0.0),
                                        child: Icon(
                                          Icons.date_range,
                                          color: Color(0xFF51575A),
                                          size: 24.0,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 10.0, 0.0),
                                        child: Text(
                                          dateTimeFormat('d/M/y', _model.date),
                                          style: FlutterFlowTheme.of(context)
                                              .titleSmall
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                color: const Color(0xFF0C0C0D),
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              setState(() {
                                FFAppState().startRangeDate =
                                    getCurrentTimestamp;
                                FFAppState().endRangeDate = getCurrentTimestamp;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color(0xFFECECF3),
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(
                                  width: 1.0,
                                ),
                              ),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  setState(() {});
                                },
                                child: SizedBox(
                                  width: 250.0,
                                  height: 50.0,
                                  child: custom_widgets.DateRangePicker(
                                    width: 250.0,
                                    height: 50.0,
                                    fontColor: const Color(0xCC1C1C1C),
                                    backgroundColor: const Color(0xFFECECF3),
                                    initialStartDate:
                                        FFAppState().startRangeDate,
                                    initialEndDate: FFAppState().endRangeDate,
                                    updatePageUI: () async {
                                      var shouldSetState = false;
                                      _model.dateRangeRes =
                                          await GetPaginatedBillsCall.call(
                                        companyId: widget.companyId,
                                        lastId: FFAppState().lastBillId,
                                        firstId: FFAppState().firstBillId,
                                        toNext: null,
                                        transactionId:
                                            _model.textController1.text,
                                        startDate: FFAppState()
                                            .startRangeDate
                                            ?.toString(),
                                        endDate: FFAppState()
                                            .endRangeDate
                                            ?.toString(),
                                        receiptNumber:
                                            _model.textController2.text,
                                        isMarked: FFAppState()
                                                .isMarkedCheckboxActive
                                            ? _model.checkboxValue?.toString()
                                            : null,
                                        token: currentJwtToken,
                                        status: _model.statusDropdownValue,
                                      );
                                      shouldSetState = true;
                                      if ((_model.dateRangeRes?.succeeded ??
                                          true)) {
                                        setState(() {
                                          FFAppState().bills = getJsonField(
                                            (_model.dateRangeRes?.jsonBody ??
                                                ''),
                                            r'''$.data''',
                                            true,
                                          )!
                                              .toList()
                                              .cast<dynamic>();
                                          FFAppState().pageNumber = 1;
                                        });
                                      } else {
                                        unawaited(
                                          () async {
                                            await showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return AlertDialog(
                                                  title: const Text(
                                                      'No receipts were found.'),
                                                  content: const Text(
                                                      'Please, change filter settings'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext),
                                                      child: const Text('Ok'),
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          }(),
                                        );
                                        if (shouldSetState) setState(() {});
                                        return;
                                      }

                                      if (shouldSetState) setState(() {});
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 53.0,
                            decoration: const BoxDecoration(),
                            child: SizedBox(
                              width: MediaQuery.sizeOf(context).width <
                                      kBreakpointLarge
                                  ? 300.0
                                  : 250.0,
                              child: TextFormField(
                                controller: _model.textController2,
                                focusNode: _model.textFieldFocusNode2,
                                onChanged: (_) => EasyDebounce.debounce(
                                  '_model.textController2',
                                  const Duration(milliseconds: 2000),
                                  () async {
                                    var shouldSetState = false;
                                    _model.receiptNumberRes =
                                        await GetPaginatedBillsCall.call(
                                      companyId: widget.companyId,
                                      lastId: FFAppState().lastBillId,
                                      firstId: FFAppState().firstBillId,
                                      toNext: null,
                                      transactionId:
                                          _model.textController1.text,
                                      startDate: FFAppState()
                                          .startRangeDate
                                          ?.toString(),
                                      endDate:
                                          FFAppState().endRangeDate?.toString(),
                                      receiptNumber:
                                          _model.textController2.text,
                                      isMarked:
                                          FFAppState().isMarkedCheckboxActive
                                              ? _model.checkboxValue?.toString()
                                              : null,
                                      token: currentJwtToken,
                                      status: _model.statusDropdownValue,
                                    );
                                    shouldSetState = true;
                                    if ((_model.receiptNumberRes?.succeeded ??
                                        true)) {
                                      setState(() {
                                        FFAppState().bills = getJsonField(
                                          (_model.receiptNumberRes?.jsonBody ??
                                              ''),
                                          r'''$.data''',
                                          true,
                                        )!
                                            .toList()
                                            .cast<dynamic>();
                                        FFAppState().pageNumber = 1;
                                      });
                                    } else {
                                      unawaited(
                                        () async {
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                title: const Text(
                                                    'No receipts were found.'),
                                                content: const Text(
                                                    'Please, change filter settings'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext),
                                                    child: const Text('Ok'),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        }(),
                                      );
                                      if (shouldSetState) setState(() {});
                                      return;
                                    }

                                    if (shouldSetState) setState(() {});
                                  },
                                ),
                                autofocus: false,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Receipt number',
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .labelLarge
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: const Color(0xFF525D66),
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                      ),
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: const Color(0xFF525D66),
                                        letterSpacing: 0.0,
                                      ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0xFF51575A),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color: const Color(0xFF0C0C0D),
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                    ),
                                maxLines: null,
                                validator: _model.textController2Validator
                                    .asValidator(context),
                              ),
                            ),
                          ),
                        ],
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          var shouldSetState = false;
                          // Update isMarkedChecboxActive
                          setState(() {
                            FFAppState().isMarkedCheckboxActive = true;
                          });
                          if (_model.checkboxValue == true) {
                            setState(() {
                              _model.checkboxValue = !_model.checkboxValue!;
                            });
                          } else {
                            setState(() {
                              _model.checkboxValue = !_model.checkboxValue!;
                            });
                          }

                          _model.checkBoxContainerRes =
                              await GetPaginatedBillsCall.call(
                            companyId: widget.companyId,
                            lastId: FFAppState().lastBillId,
                            firstId: FFAppState().firstBillId,
                            toNext: null,
                            transactionId: _model.textController1.text,
                            startDate: FFAppState().startRangeDate?.toString(),
                            endDate: FFAppState().endRangeDate?.toString(),
                            receiptNumber: _model.textController2.text,
                            isMarked: FFAppState().isMarkedCheckboxActive
                                ? _model.checkboxValue?.toString()
                                : null,
                            token: currentJwtToken,
                            status: _model.statusDropdownValue,
                          );
                          shouldSetState = true;
                          if ((_model.checkBoxContainerRes?.succeeded ??
                              true)) {
                            // Update bills
                            setState(() {
                              FFAppState().bills = getJsonField(
                                (_model.checkBoxContainerRes?.jsonBody ?? ''),
                                r'''$.data''',
                                true,
                              )!
                                  .toList()
                                  .cast<dynamic>();
                              FFAppState().pageNumber = 1;
                            });
                          } else {
                            unawaited(
                              () async {
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return AlertDialog(
                                      title: const Text('No receipts were found.'),
                                      content: const Text(
                                          'Please, change filter settings'),
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
                              }(),
                            );
                            if (shouldSetState) setState(() {});
                            return;
                          }

                          if (shouldSetState) setState(() {});
                        },
                        child: Container(
                          width: MediaQuery.sizeOf(context).width <
                                  kBreakpointLarge
                              ? 300.0
                              : 250.0,
                          height: 53.0,
                          decoration: BoxDecoration(
                            color: const Color(0xFFECECF3),
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(
                              color: const Color(0xFF51575A),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                5.0, 0.0, 5.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 10.0, 0.0),
                                  child: Text(
                                    'Marked to check',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: const Color(0xFF525D66),
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                                Theme(
                                  data: ThemeData(
                                    checkboxTheme: CheckboxThemeData(
                                      visualDensity: VisualDensity.compact,
                                      materialTapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                      ),
                                    ),
                                    unselectedWidgetColor:
                                        FlutterFlowTheme.of(context)
                                            .secondaryText,
                                  ),
                                  child: Checkbox(
                                    value: _model.checkboxValue ??= false,
                                    onChanged: (newValue) async {
                                      setState(() =>
                                          _model.checkboxValue = newValue!);
                                      if (newValue!) {
                                        var shouldSetState = false;
                                        setState(() {
                                          FFAppState().isMarkedCheckboxActive =
                                              true;
                                        });
                                        _model.checkboxRes =
                                            await GetPaginatedBillsCall.call(
                                          companyId: widget.companyId,
                                          lastId: FFAppState().lastBillId,
                                          firstId: FFAppState().firstBillId,
                                          toNext: null,
                                          transactionId:
                                              _model.textController1.text,
                                          startDate: FFAppState()
                                              .startRangeDate
                                              ?.toString(),
                                          endDate: FFAppState()
                                              .endRangeDate
                                              ?.toString(),
                                          receiptNumber:
                                              _model.textController2.text,
                                          isMarked: FFAppState()
                                                  .isMarkedCheckboxActive
                                              ? _model.checkboxValue?.toString()
                                              : null,
                                          token: currentJwtToken,
                                          status: _model.statusDropdownValue,
                                        );
                                        shouldSetState = true;
                                        if ((_model.checkboxRes?.succeeded ??
                                            true)) {
                                          setState(() {
                                            FFAppState().bills = getJsonField(
                                              (_model.checkboxRes?.jsonBody ??
                                                  ''),
                                              r'''$.data''',
                                              true,
                                            )!
                                                .toList()
                                                .cast<dynamic>();
                                            FFAppState().pageNumber = 1;
                                          });
                                        } else {
                                          unawaited(
                                            () async {
                                              await showDialog(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return AlertDialog(
                                                    title: const Text(
                                                        'No receipts were found.'),
                                                    content: const Text(
                                                        'Please, change filter settings'),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                alertDialogContext),
                                                        child: const Text('Ok'),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              );
                                            }(),
                                          );
                                          if (shouldSetState) setState(() {});
                                          return;
                                        }

                                        if (shouldSetState) setState(() {});
                                      }
                                    },
                                    side: BorderSide(
                                      width: 2,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                    ),
                                    activeColor:
                                        FlutterFlowTheme.of(context).primary,
                                    checkColor:
                                        FlutterFlowTheme.of(context).info,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          FlutterFlowDropDown<String>(
                            controller: _model.statusDropdownValueController ??=
                                FormFieldController<String>(null),
                            options: functions.getOptionsList(
                                FFAppConstants.statusList.toList()),
                            onChanged: (val) async {
                              setState(() => _model.statusDropdownValue = val);
                              var shouldSetState = false;
                              _model.statusRes =
                                  await GetPaginatedBillsCall.call(
                                companyId: widget.companyId,
                                lastId: FFAppState().lastBillId,
                                firstId: FFAppState().firstBillId,
                                toNext: null,
                                transactionId: _model.textController1.text,
                                startDate:
                                    FFAppState().startRangeDate?.toString(),
                                endDate: FFAppState().endRangeDate?.toString(),
                                receiptNumber: _model.textController2.text,
                                isMarked: FFAppState().isMarkedCheckboxActive
                                    ? _model.checkboxValue?.toString()
                                    : null,
                                token: currentJwtToken,
                                status: _model.statusDropdownValue,
                              );
                              shouldSetState = true;
                              if ((_model.statusRes?.succeeded ?? true)) {
                                setState(() {
                                  FFAppState().bills = getJsonField(
                                    (_model.statusRes?.jsonBody ?? ''),
                                    r'''$.data''',
                                    true,
                                  )!
                                      .toList()
                                      .cast<dynamic>();
                                  FFAppState().pageNumber = 1;
                                });
                              } else {
                                unawaited(
                                  () async {
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          title:
                                              const Text('No receipts were found.'),
                                          content: const Text(
                                              'Please, change filter settings'),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext),
                                              child: const Text('Ok'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  }(),
                                );
                                if (shouldSetState) setState(() {});
                                return;
                              }

                              if (shouldSetState) setState(() {});
                            },
                            width: MediaQuery.sizeOf(context).width <
                                    kBreakpointLarge
                                ? 300.0
                                : 250.0,
                            height: 53.0,
                            textStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: const Color(0xFF525D66),
                                  fontSize: 10.0,
                                  letterSpacing: 0.0,
                                ),
                            hintText: 'Select status',
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
                            margin: const EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 4.0),
                            hidesUnderline: true,
                            isOverButton: true,
                            isSearchable: false,
                            isMultiSelect: false,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 5.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    var shouldSetState = false;
                    setState(() {
                      _model.statusDropdownValueController?.reset();
                    });
                    setState(() {
                      _model.textController1?.clear();
                      _model.textController2?.clear();
                    });
                    setState(() {
                      _model.checkboxValue = false;
                    });
                    setState(() {
                      FFAppState().isMarkedCheckboxActive = false;
                      FFAppState().pageNumber = 1;
                    });
                    _model.updatePage(() {
                      _model.date = null;
                    });
                    setState(() {
                      FFAppState().startRangeDate = null;
                      FFAppState().endRangeDate = null;
                    });
                    _model.clearFilterRes = await GetPaginatedBillsCall.call(
                      companyId: widget.companyId,
                      lastId: FFAppState().lastBillId,
                      firstId: FFAppState().firstBillId,
                      toNext: null,
                      transactionId: _model.textController1.text,
                      startDate: FFAppState().startRangeDate?.toString(),
                      endDate: FFAppState().endRangeDate?.toString(),
                      receiptNumber: _model.textController2.text,
                      isMarked: FFAppState().isMarkedCheckboxActive
                          ? _model.checkboxValue?.toString()
                          : null,
                      token: currentJwtToken,
                    );
                    shouldSetState = true;
                    if ((_model.clearFilterRes?.succeeded ?? true)) {
                      setState(() {
                        FFAppState().bills = getJsonField(
                          (_model.clearFilterRes?.jsonBody ?? ''),
                          r'''$.data''',
                          true,
                        )!
                            .toList()
                            .cast<dynamic>();
                      });
                    } else {
                      unawaited(
                        () async {
                          await showDialog(
                            context: context,
                            builder: (alertDialogContext) {
                              return AlertDialog(
                                title: const Text('No receipts were found.'),
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
                        }(),
                      );
                      if (shouldSetState) setState(() {});
                      return;
                    }

                    if (shouldSetState) setState(() {});
                  },
                  child: Text(
                    'Clear filters',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Readex Pro',
                          color: const Color(0xFF4474ED),
                          letterSpacing: 0.0,
                          decoration: TextDecoration.underline,
                        ),
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Flexible(
                    child: Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        decoration: const BoxDecoration(),
                        child: Visibility(
                          visible: FFAppState().bills.isNotEmpty,
                          child: Builder(
                            builder: (context) {
                              final bills = FFAppState().bills.toList();
                              return FlutterFlowDataTable<dynamic>(
                                controller: _model.paginatedDataTableController,
                                data: bills,
                                columnsBuilder: (onSortChanged) => [
                                  DataColumn2(
                                    label: DefaultTextStyle.merge(
                                      softWrap: true,
                                      child: Text(
                                        'Picture',
                                        style: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              color: const Color(0xFFFBF9F9),
                                              fontSize: 12.0,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                  ),
                                  DataColumn2(
                                    label: DefaultTextStyle.merge(
                                      softWrap: true,
                                      child: Text(
                                        'Profile ID',
                                        style: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              color: const Color(0xFFFBF9F9),
                                              fontSize: 12.0,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                  ),
                                  DataColumn2(
                                    label: DefaultTextStyle.merge(
                                      softWrap: true,
                                      child: Text(
                                        'Upload time',
                                        style: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              color: const Color(0xFFFBF9F9),
                                              fontSize: 12.0,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                  ),
                                  DataColumn2(
                                    label: DefaultTextStyle.merge(
                                      softWrap: true,
                                      child: Text(
                                        'Status',
                                        style: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              color: const Color(0xFFFBF9F9),
                                              fontSize: 12.0,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                  ),
                                  DataColumn2(
                                    label: DefaultTextStyle.merge(
                                      softWrap: true,
                                      child: Text(
                                        'Marked to check',
                                        style: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              color: const Color(0xFFFBF9F9),
                                              fontSize: 12.0,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                  ),
                                  DataColumn2(
                                    label: DefaultTextStyle.merge(
                                      softWrap: true,
                                      child: Text(
                                        'Rejection reason',
                                        style: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              color: const Color(0xFFFBF9F9),
                                              fontSize: 12.0,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                  ),
                                  DataColumn2(
                                    label: DefaultTextStyle.merge(
                                      softWrap: true,
                                      child: Text(
                                        'Date',
                                        style: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              color: const Color(0xFFFBF9F9),
                                              fontSize: 12.0,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                  ),
                                  DataColumn2(
                                    label: DefaultTextStyle.merge(
                                      softWrap: true,
                                      child: Text(
                                        'Receipt number',
                                        style: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              color: const Color(0xFFFBF9F9),
                                              fontSize: 12.0,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                  ),
                                  DataColumn2(
                                    label: DefaultTextStyle.merge(
                                      softWrap: true,
                                      child: Text(
                                        'Sum',
                                        style: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              color: const Color(0xFFFBF9F9),
                                              fontSize: 12.0,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                  ),
                                  DataColumn2(
                                    label: DefaultTextStyle.merge(
                                      softWrap: true,
                                      child: Text(
                                        'Products',
                                        style: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              color: const Color(0xFFFBF9F9),
                                              fontSize: 12.0,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                    fixedWidth: 250.0,
                                  ),
                                  DataColumn2(
                                    label: DefaultTextStyle.merge(
                                      softWrap: true,
                                      child: Text(
                                        'Points',
                                        style: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              color: const Color(0xFFFBF9F9),
                                              fontSize: 12.0,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                  ),
                                  DataColumn2(
                                    label: DefaultTextStyle.merge(
                                      softWrap: true,
                                      child: Text(
                                        'Comment from user',
                                        style: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              color: const Color(0xFFFBF9F9),
                                              fontSize: 12.0,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                  ),
                                ],
                                dataRowBuilder: (billsItem, billsIndex,
                                        selected, onSelectChanged) =>
                                    DataRow(
                                  color: MaterialStateProperty.all(
                                    billsIndex % 2 == 0
                                        ? const Color(0xFFECECF3)
                                        : const Color(0xFFFBF9F9),
                                  ),
                                  cells: [
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        await Navigator.push(
                                          context,
                                          PageTransition(
                                            type: PageTransitionType.fade,
                                            child: FlutterFlowExpandedImageView(
                                              image: Image.network(
                                                getJsonField(
                                                  billsItem,
                                                  r'''$.bill_image''',
                                                ).toString(),
                                                fit: BoxFit.contain,
                                                errorBuilder: (context, error,
                                                        stackTrace) =>
                                                    Image.asset(
                                                  'assets/images/error_image.png',
                                                  fit: BoxFit.contain,
                                                ),
                                              ),
                                              allowRotation: true,
                                              tag: getJsonField(
                                                billsItem,
                                                r'''$.bill_image''',
                                              ).toString(),
                                              useHeroAnimation: true,
                                            ),
                                          ),
                                        );
                                      },
                                      child: Hero(
                                        tag: getJsonField(
                                          billsItem,
                                          r'''$.bill_image''',
                                        ).toString(),
                                        transitionOnUserGestures: true,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          child: Image.network(
                                            getJsonField(
                                              billsItem,
                                              r'''$.bill_image''',
                                            ).toString(),
                                            width: double.infinity,
                                            height: double.infinity,
                                            fit: BoxFit.fitWidth,
                                            errorBuilder:
                                                (context, error, stackTrace) =>
                                                    Image.asset(
                                              'assets/images/error_image.png',
                                              width: double.infinity,
                                              height: double.infinity,
                                              fit: BoxFit.fitWidth,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      getJsonField(
                                        billsItem,
                                        r'''$.user_id''',
                                      ).toString(),
                                      style: const TextStyle(
                                        color: Color(0xFF0C0C0D),
                                      ),
                                    ),
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        await showModalBottomSheet(
                                          isScrollControlled: true,
                                          backgroundColor: Colors.transparent,
                                          enableDrag: false,
                                          context: context,
                                          builder: (context) {
                                            return Padding(
                                              padding: MediaQuery.viewInsetsOf(
                                                  context),
                                              child: DateInputModalWidget(
                                                cellValue: functions
                                                    .formatDateToString(
                                                        getJsonField(
                                                  billsItem,
                                                  r'''$.date''',
                                                ).toString())!,
                                                rowId: getJsonField(
                                                  billsItem,
                                                  r'''$._id''',
                                                ).toString(),
                                                cellName: 'upload date',
                                                pathName: 'time_added',
                                              ),
                                            );
                                          },
                                        ).then((value) => safeSetState(() {}));
                                      },
                                      child: Text(
                                        functions
                                            .formatDateToString(getJsonField(
                                          billsItem,
                                          r'''$.time_added''',
                                        ).toString())!,
                                        style: const TextStyle(
                                          color: Color(0xFF0C0C0D),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        await showModalBottomSheet(
                                          isScrollControlled: true,
                                          backgroundColor: Colors.transparent,
                                          enableDrag: false,
                                          context: context,
                                          builder: (context) {
                                            return Padding(
                                              padding: MediaQuery.viewInsetsOf(
                                                  context),
                                              child: DropdownModalWidget(
                                                cellValue: getJsonField(
                                                  billsItem,
                                                  r'''$.status''',
                                                ).toString(),
                                                rowId: getJsonField(
                                                  billsItem,
                                                  r'''$._id''',
                                                ).toString(),
                                                cellName: 'status',
                                                options:
                                                    functions.getOptionsList(
                                                        FFAppConstants
                                                            .statusList
                                                            .toList()),
                                                pathName: 'status',
                                              ),
                                            );
                                          },
                                        ).then((value) => safeSetState(() {}));
                                      },
                                      child: Text(
                                        getJsonField(
                                          billsItem,
                                          r'''$.status''',
                                        ).toString(),
                                        style: const TextStyle(
                                          color: Color(0xFF0C0C0D),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        await showModalBottomSheet(
                                          isScrollControlled: true,
                                          backgroundColor: Colors.transparent,
                                          enableDrag: false,
                                          context: context,
                                          builder: (context) {
                                            return Padding(
                                              padding: MediaQuery.viewInsetsOf(
                                                  context),
                                              child: CheckboxModalWidget(
                                                cellValue:
                                                    functions.stringToBoolean(
                                                        getJsonField(
                                                  billsItem,
                                                  r'''$.marked_by_user_to_recheck''',
                                                ).toString())!,
                                                rowId: getJsonField(
                                                  billsItem,
                                                  r'''$._id''',
                                                ).toString(),
                                                cellName:
                                                    'marked by user to recheck',
                                                pathName:
                                                    'marked_by_user_to_recheck',
                                              ),
                                            );
                                          },
                                        ).then((value) => safeSetState(() {}));
                                      },
                                      child: Text(
                                        valueOrDefault<String>(
                                          functions
                                              .stringToBoolean(getJsonField(
                                                billsItem,
                                                r'''$.marked_by_user_to_recheck''',
                                              ).toString())
                                              ?.toString(),
                                          'false',
                                        ),
                                        style: const TextStyle(
                                          color: Color(0xFF0C0C0D),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        await showModalBottomSheet(
                                          isScrollControlled: true,
                                          backgroundColor: Colors.transparent,
                                          enableDrag: false,
                                          context: context,
                                          builder: (context) {
                                            return Padding(
                                              padding: MediaQuery.viewInsetsOf(
                                                  context),
                                              child: DropdownModalWidget(
                                                cellValue: getJsonField(
                                                  billsItem,
                                                  r'''$.title_1''',
                                                ).toString(),
                                                rowId: getJsonField(
                                                  billsItem,
                                                  r'''$._id''',
                                                ).toString(),
                                                cellName: 'rejection reason',
                                                options:
                                                    functions.getOptionsList(
                                                        FFAppConstants
                                                            .rejectionReasonList
                                                            .toList()),
                                                pathName: 'title_1',
                                              ),
                                            );
                                          },
                                        ).then((value) => safeSetState(() {}));
                                      },
                                      child: Text(
                                        getJsonField(
                                          billsItem,
                                          r'''$.title_1''',
                                        ).toString(),
                                        style: const TextStyle(
                                          color: Color(0xFF0C0C0D),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        await showModalBottomSheet(
                                          isScrollControlled: true,
                                          backgroundColor: Colors.transparent,
                                          enableDrag: false,
                                          context: context,
                                          builder: (context) {
                                            return Padding(
                                              padding: MediaQuery.viewInsetsOf(
                                                  context),
                                              child: DateInputModalWidget(
                                                cellValue: functions
                                                    .formatDateToString(
                                                        getJsonField(
                                                  billsItem,
                                                  r'''$.date''',
                                                ).toString())!,
                                                rowId: getJsonField(
                                                  billsItem,
                                                  r'''$._id''',
                                                ).toString(),
                                                cellName: 'date',
                                                pathName: 'date',
                                              ),
                                            );
                                          },
                                        ).then((value) => safeSetState(() {}));
                                      },
                                      child: Text(
                                        functions
                                            .formatDateToString(getJsonField(
                                          billsItem,
                                          r'''$.date''',
                                        ).toString())!,
                                        style: const TextStyle(
                                          color: Color(0xFF0C0C0D),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        await showModalBottomSheet(
                                          isScrollControlled: true,
                                          backgroundColor: Colors.transparent,
                                          enableDrag: false,
                                          context: context,
                                          builder: (context) {
                                            return Padding(
                                              padding: MediaQuery.viewInsetsOf(
                                                  context),
                                              child: InputTextModalWidget(
                                                cellValue: getJsonField(
                                                  billsItem,
                                                  r'''$.number''',
                                                ).toString(),
                                                rowId: getJsonField(
                                                  billsItem,
                                                  r'''$._id''',
                                                ).toString(),
                                                cellName: 'receipt number',
                                                pathName: 'number',
                                              ),
                                            );
                                          },
                                        ).then((value) => safeSetState(() {}));
                                      },
                                      child: Text(
                                        getJsonField(
                                          billsItem,
                                          r'''$.number''',
                                        ).toString(),
                                        style: const TextStyle(
                                          color: Color(0xFF0C0C0D),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        await showModalBottomSheet(
                                          isScrollControlled: true,
                                          backgroundColor: Colors.transparent,
                                          enableDrag: false,
                                          context: context,
                                          builder: (context) {
                                            return Padding(
                                              padding: MediaQuery.viewInsetsOf(
                                                  context),
                                              child: InputTextModalWidget(
                                                cellValue: getJsonField(
                                                  billsItem,
                                                  r'''$.sum''',
                                                ).toString(),
                                                rowId: getJsonField(
                                                  billsItem,
                                                  r'''$._id''',
                                                ).toString(),
                                                cellName: 'sum',
                                                pathName: 'sum',
                                              ),
                                            );
                                          },
                                        ).then((value) => safeSetState(() {}));
                                      },
                                      child: Text(
                                        getJsonField(
                                          billsItem,
                                          r'''$.sum''',
                                        ).toString(),
                                        style: const TextStyle(
                                          color: Color(0xFF0C0C0D),
                                        ),
                                      ),
                                    ),
                                    ProductsTableWidget(
                                      key: Key(
                                          'Keyuyk_${billsIndex}_of_${bills.length}'),
                                      productList: getJsonField(
                                        billsItem,
                                        r'''$.products''',
                                        true,
                                      )!,
                                    ),
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        await showModalBottomSheet(
                                          isScrollControlled: true,
                                          backgroundColor: Colors.transparent,
                                          enableDrag: false,
                                          context: context,
                                          builder: (context) {
                                            return Padding(
                                              padding: MediaQuery.viewInsetsOf(
                                                  context),
                                              child: InputTextModalWidget(
                                                cellValue: getJsonField(
                                                  billsItem,
                                                  r'''$.points''',
                                                ).toString(),
                                                rowId: getJsonField(
                                                  billsItem,
                                                  r'''$._id''',
                                                ).toString(),
                                                cellName: 'points',
                                                pathName: 'points',
                                              ),
                                            );
                                          },
                                        ).then((value) => safeSetState(() {}));
                                      },
                                      child: Text(
                                        getJsonField(
                                          billsItem,
                                          r'''$.points''',
                                        ).toString(),
                                        style: const TextStyle(
                                          color: Color(0xFF0C0C0D),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      getJsonField(
                                        billsItem,
                                        r'''$.user_comment''',
                                      ).toString(),
                                      style: const TextStyle(
                                        color: Color(0xFF0C0C0D),
                                      ),
                                    ),
                                  ].map((c) => DataCell(c)).toList(),
                                ),
                                paginated: false,
                                selectable: false,
                                width: double.infinity,
                                dataRowHeight: 200.0,
                                columnSpacing: 20.0,
                                headingRowColor: const Color(0xFF4474ED),
                                borderRadius: BorderRadius.circular(10.0),
                                addHorizontalDivider: true,
                                addTopAndBottomDivider: true,
                                hideDefaultHorizontalDivider: true,
                                horizontalDividerColor: const Color(0xFFFBF9F9),
                                horizontalDividerThickness: 1.0,
                                addVerticalDivider: true,
                                verticalDividerColor: const Color(0xFFFBF9F9),
                                verticalDividerThickness: 1.0,
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ]
                    .addToStart(const SizedBox(width: 10.0))
                    .addToEnd(const SizedBox(width: 10.0)),
              ),
            ),
          ),
          Align(
            alignment: const AlignmentDirectional(0.0, 0.0),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 20.0, 10.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      var shouldSetState = false;
                      if (FFAppState().pageNumber > 1) {
                        _model.prevBillsRes = await GetPaginatedBillsCall.call(
                          companyId: widget.companyId,
                          lastId: null,
                          firstId: FFAppState().firstBillId,
                          toNext: 'false',
                          token: currentJwtToken,
                          transactionId: _model.textController1.text,
                          startDate: FFAppState().startRangeDate?.toString(),
                          endDate: FFAppState().endRangeDate?.toString(),
                          receiptNumber: _model.textController2.text,
                          isMarked: FFAppState().isMarkedCheckboxActive
                              ? _model.checkboxValue?.toString()
                              : null,
                          status: _model.statusDropdownValue,
                        );
                        shouldSetState = true;
                        if ((_model.prevBillsRes?.succeeded ?? true)) {
                          setState(() {
                            FFAppState().bills = getJsonField(
                              (_model.prevBillsRes?.jsonBody ?? ''),
                              r'''$.data''',
                              true,
                            )!
                                .toList()
                                .cast<dynamic>();
                          });
                        } else {
                          await showDialog(
                            context: context,
                            builder: (alertDialogContext) {
                              return AlertDialog(
                                title: const Text('It is the first page'),
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

                        await actions.setBillsPaginationVars(
                          false,
                        );
                      } else {
                        await showDialog(
                          context: context,
                          builder: (alertDialogContext) {
                            return AlertDialog(
                              title: const Text('It is the first page'),
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

                      if (shouldSetState) setState(() {});
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Icon(
                          Icons.chevron_left,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 24.0,
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              10.0, 0.0, 0.0, 0.0),
                          child: Text(
                            'Prev',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                      child: Text(
                        'Page ${valueOrDefault<String>(
                          FFAppState().pageNumber.toString(),
                          '1',
                        )}',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              color: const Color(0xFF0C0C0D),
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                  ),
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      var shouldSetState = false;
                      _model.nextBillsRes = await GetPaginatedBillsCall.call(
                        companyId: widget.companyId,
                        lastId: FFAppState().lastBillId,
                        firstId: null,
                        toNext: 'true',
                        token: currentJwtToken,
                        transactionId: _model.textController1.text,
                        startDate: FFAppState().startRangeDate?.toString(),
                        endDate: FFAppState().endRangeDate?.toString(),
                        receiptNumber: _model.textController2.text,
                        isMarked: FFAppState().isMarkedCheckboxActive
                            ? _model.checkboxValue?.toString()
                            : null,
                        status: _model.statusDropdownValue,
                      );
                      shouldSetState = true;
                      if ((_model.nextBillsRes?.succeeded ?? true)) {
                        setState(() {
                          FFAppState().bills = getJsonField(
                            (_model.nextBillsRes?.jsonBody ?? ''),
                            r'''$.data''',
                            true,
                          )!
                              .toList()
                              .cast<dynamic>();
                          FFAppState().lastBillId = getJsonField(
                            (_model.nextBillsRes?.jsonBody ?? ''),
                            r'''$.data[9].id''',
                          ).toString();
                          FFAppState().firstBillId = getJsonField(
                            (_model.nextBillsRes?.jsonBody ?? ''),
                            r'''$.data[0].id''',
                          ).toString();
                        });
                      } else {
                        await showDialog(
                          context: context,
                          builder: (alertDialogContext) {
                            return AlertDialog(
                              title: const Text('It is the last page'),
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

                      await actions.setBillsPaginationVars(
                        true,
                      );
                      if (shouldSetState) setState(() {});
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 10.0, 0.0),
                          child: Text(
                            'Next',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                        Icon(
                          Icons.chevron_right,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 24.0,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
