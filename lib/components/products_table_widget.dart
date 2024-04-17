import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'products_table_model.dart';
export 'products_table_model.dart';

class ProductsTableWidget extends StatefulWidget {
  const ProductsTableWidget({
    super.key,
    required this.productList,
  });

  final List<dynamic>? productList;

  @override
  State<ProductsTableWidget> createState() => _ProductsTableWidgetState();
}

class _ProductsTableWidgetState extends State<ProductsTableWidget> {
  late ProductsTableModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProductsTableModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFFECECF3),
      ),
      child: Visibility(
        visible: widget.productList!.isNotEmpty,
        child: Builder(
          builder: (context) {
            final list = widget.productList!.toList();
            return FlutterFlowDataTable<dynamic>(
              controller: _model.paginatedDataTableController,
              data: list,
              columnsBuilder: (onSortChanged) => [
                DataColumn2(
                  label: DefaultTextStyle.merge(
                    softWrap: true,
                    child: const Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Name',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFFFBF9F9),
                            fontSize: 8.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  fixedWidth: 50.0,
                ),
                DataColumn2(
                  label: DefaultTextStyle.merge(
                    softWrap: true,
                    child: const Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Count',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFFFBF9F9),
                            fontSize: 8.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                DataColumn2(
                  label: DefaultTextStyle.merge(
                    softWrap: true,
                    child: const Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Text(
                            'Single price',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFFFBF9F9),
                              fontSize: 8.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                DataColumn2(
                  label: DefaultTextStyle.merge(
                    softWrap: true,
                    child: const Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Total',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFFFBF9F9),
                            fontSize: 8.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
              dataRowBuilder:
                  (listItem, listIndex, selected, onSelectChanged) => DataRow(
                color: MaterialStateProperty.all(
                  listIndex % 2 == 0 ? const Color(0xFFECECF3) : const Color(0xFFF1F0F0),
                ),
                cells: [
                  Text(
                    getJsonField(
                      listItem,
                      r'''$.name''',
                    ).toString(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Color(0xFF0C0C0D),
                      fontSize: 8.0,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                  Text(
                    getJsonField(
                      listItem,
                      r'''$.number''',
                    ).toString(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Color(0xFF0C0C0D),
                      fontSize: 8.0,
                    ),
                  ),
                  Text(
                    getJsonField(
                      listItem,
                      r'''$.price_single''',
                    ).toString(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Color(0xFF0C0C0D),
                      fontSize: 8.0,
                    ),
                  ),
                  Text(
                    getJsonField(
                      listItem,
                      r'''$.price_total''',
                    ).toString(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Color(0xFF0C0C0D),
                      fontSize: 8.0,
                    ),
                  ),
                ].map((c) => DataCell(c)).toList(),
              ),
              paginated: false,
              selectable: false,
              width: MediaQuery.sizeOf(context).width * 1.0,
              height: MediaQuery.sizeOf(context).height * 1.0,
              headingRowHeight: 30.0,
              columnSpacing: 5.0,
              headingRowColor: const Color(0xFF4474ED),
              borderRadius: BorderRadius.circular(0.0),
              addHorizontalDivider: true,
              addTopAndBottomDivider: false,
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
    );
  }
}
