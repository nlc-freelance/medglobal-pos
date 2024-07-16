// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/features/stock_management/purchase_orders/domain/entities/purchase_order_item.dart';
import 'package:medglobal_admin_portal/features/stock_management/stock_return/domain/entities/stock_return_item.dart';
import 'package:medglobal_shared/medglobal_shared.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/utils/data_grid_util.dart';
import 'package:medglobal_admin_portal/features/product_management/domain/entities/product/branch_inventory.dart';
import 'package:medglobal_admin_portal/features/product_management/presentation/cubit/variant_form/variant_form_cubit.dart';

class StockReturnItemDataGrid extends StatefulWidget {
  const StockReturnItemDataGrid({super.key, required this.isCompleted});

  final bool isCompleted;

  @override
  State<StockReturnItemDataGrid> createState() => _StockReturnItemDataGridState();
}

class _StockReturnItemDataGridState extends State<StockReturnItemDataGrid> {
  List<StockReturnItem> _itemsToReturn = <StockReturnItem>[];
  late DataGridController _dataGridController;
  late StockReturnItemDataSource _itemsToReturnDataSource;
  late CustomSelectionManager customSelectionManager;

  final mock = [
    const StockReturnItem(
      id: 1,
      name: 'Biogesic 500mg',
      sku: 'BG0001',
      qtyOnHand: 5,
      supplierPrice: 20,
      total: 400,
    ),
    const StockReturnItem(
      id: 2,
      name: 'Biogesic 1000mg',
      sku: 'BG0002',
      qtyOnHand: 5,
      total: 400,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _dataGridController = DataGridController();
    _itemsToReturnDataSource = StockReturnItemDataSource(mock, context, widget.isCompleted);
    customSelectionManager = CustomSelectionManager(_dataGridController);
  }

  @override
  void dispose() {
    _dataGridController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PageSectionTitle(
          title: 'Items to Return',
          action: UIButton.text(
            'Add item',
            iconBuilder: (isHover) => Assets.icons.add.setColorOnHover(isHover),
            onClick: () {
              // Show Dialog with dropdown fetching the products available from the current supplier PO
              // Add the variant to the data source
              _itemsToReturnDataSource._itemsToReturn.add(StockReturnItem(
                id: 3,
                name: 'Biogesic 200mg',
                sku: 'BG0003',
                qtyOnHand: 5,
                supplierPrice: 20,
                total: 400,
              ));
              _itemsToReturnDataSource.buildDataGridRows();
              _itemsToReturnDataSource.updateDataGridSource();
            },
          ),
        ),
        ClipRect(
          clipper: HorizontalBorderClipper(),
          child: SfDataGridTheme(
            data: DataGridUtil.cellNavigationStyle,
            child: SfDataGrid(
              source: _itemsToReturnDataSource,
              columns: DataGridUtil.getColumns(DataGridColumn.SR_ITEMS),
              controller: _dataGridController,
              selectionManager: customSelectionManager,
              shrinkWrapRows: true,
              allowEditing: true,
              navigationMode: GridNavigationMode.cell,
              selectionMode: SelectionMode.single,
              columnWidthMode: ColumnWidthMode.fill,
              headerGridLinesVisibility: GridLinesVisibility.none,
              editingGestureType: EditingGestureType.tap,
              tableSummaryRows: [
                GridTableSummaryRow(
                  color: UIColors.background,
                  position: GridTableSummaryRowPosition.bottom,
                  showSummaryInRow: false,
                  title: 'Subtotal',
                  columns: [
                    const GridSummaryColumn(
                      name: '',
                      columnName: 'supplier_price',
                      summaryType: GridSummaryType.sum,
                    ),
                    const GridSummaryColumn(
                      name: '',
                      columnName: 'total',
                      summaryType: GridSummaryType.sum,
                    ),
                  ],
                ),
                GridTableSummaryRow(
                  color: UIColors.background,
                  position: GridTableSummaryRowPosition.bottom,
                  showSummaryInRow: false,
                  title: 'Tax',
                  columns: [
                    const GridSummaryColumn(
                      name: '',
                      columnName: 'supplier_price',
                      summaryType: GridSummaryType.sum,
                    ),
                    const GridSummaryColumn(
                      name: '',
                      columnName: 'total',
                      summaryType: GridSummaryType.sum,
                    ),
                  ],
                ),
                GridTableSummaryRow(
                  color: UIColors.background,
                  position: GridTableSummaryRowPosition.bottom,
                  showSummaryInRow: false,
                  title: 'Discount',
                  columns: [
                    const GridSummaryColumn(
                      name: '',
                      columnName: 'supplier_price',
                      summaryType: GridSummaryType.sum,
                    ),
                    const GridSummaryColumn(
                      name: '',
                      columnName: 'total',
                      summaryType: GridSummaryType.sum,
                    ),
                  ],
                ),
                GridTableSummaryRow(
                  color: UIColors.background,
                  position: GridTableSummaryRowPosition.bottom,
                  showSummaryInRow: false,
                  title: 'Total',
                  columns: [
                    const GridSummaryColumn(
                      name: '',
                      columnName: 'supplier_price',
                      summaryType: GridSummaryType.sum,
                    ),
                    const GridSummaryColumn(
                      name: '',
                      columnName: 'total',
                      summaryType: GridSummaryType.sum,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class StockReturnItemDataSource extends DataGridSource {
  StockReturnItemDataSource(List<StockReturnItem> itemsToOrder, BuildContext context, bool isCompleted) {
    _itemsToReturn = itemsToOrder;
    _context = context;
    _isCompleted = isCompleted;
    buildDataGridRows();
  }

  List<StockReturnItem> _itemsToReturn = [];

  List<DataGridRow> dataGridRows = [];

  late bool _isCompleted;

  late BuildContext _context;

  void buildDataGridRows() => dataGridRows = _itemsToReturn.map((item) => item.toDataGridRowItems()).toList();

  void updateDataGridSource() => notifyListeners();

  @override
  List<DataGridRow> get rows => dataGridRows;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
      cells: row.getCells().map<Widget>((cell) {
        return Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: cellBuilder(cell.columnName, cell, row.getCells().first.value),
        );
      }).toList(),
    );
  }

  Widget cellBuilder(String key, DataGridCell cell, int id) => switch (key) {
        'qty_to_return' || 'supplier_price' => _isCompleted
            ? UIText.bodyRegular(cell.value.toString())
            : Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: UIColors.background,
                  border: Border.all(color: UIColors.borderRegular),
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                ),
                child: UIText.bodyRegular(cell.value.toString()),
              ),
        'action' => LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) => UIButton.text(
              'Delete',
              iconBuilder: (isHover) => Assets.icons.trash.setColorOnHover(isHover),
              onClick: () {},
            ),
          ),
        _ => UIText.bodyRegular(cell.value.toString()),
      };

  /// Helps to hold the new value of all editable widget.
  /// Based on the new value we will commit the new value into the corresponding
  /// [DataGridCell] on [onSubmitCell] method.
  dynamic newCellValue;

  /// Help to control the editable text in [TextField] widget.
  TextEditingController editingController = TextEditingController();

  @override
  bool onCellBeginEdit(DataGridRow dataGridRow, RowColumnIndex rowColumnIndex, GridColumn column) {
    if (!_isCompleted && (column.columnName == 'qty_to_return' || column.columnName == 'supplier_price')) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<void> onCellSubmit(DataGridRow dataGridRow, RowColumnIndex rowColumnIndex, GridColumn column) async {
    final dynamic oldValue = dataGridRow
            .getCells()
            .firstWhere((DataGridCell dataGridCell) => dataGridCell.columnName == column.columnName)
            .value ??
        '';

    final int dataRowIndex = dataGridRows.indexOf(dataGridRow);

    if (newCellValue == null || oldValue == newCellValue) {
      return;
    }

    if (column.columnName == 'qty_to_return') {
      final newQtyToReturn = int.tryParse(newCellValue);

      dataGridRows[dataRowIndex].getCells()[rowColumnIndex.columnIndex] =
          DataGridCell<int>(columnName: 'qty_to_return', value: newQtyToReturn);
      _itemsToReturn[dataRowIndex].copyWith(qtyToReturn: newQtyToReturn);

      // _context.read<VariantFormCubit>().setPricePerBranch(_itemsToReturn[dataRowIndex].id!, newPrice!);
    }
    if (column.columnName == 'supplier_price') {
      final newSupplierPrice = double.tryParse(newCellValue);

      dataGridRows[dataRowIndex].getCells()[rowColumnIndex.columnIndex] =
          DataGridCell<double>(columnName: 'supplier_price', value: newSupplierPrice);
      _itemsToReturn[dataRowIndex].copyWith(supplierPrice: newSupplierPrice);

      // _context.read<VariantFormCubit>().setQohPerBranch(_itemsToReturn[dataRowIndex].id!, newQtyOnHand!);
    }
  }

  @override
  Widget? buildEditWidget(
      DataGridRow dataGridRow, RowColumnIndex rowColumnIndex, GridColumn column, CellSubmit submitCell) {
    // Text going to display on editable widget
    final String displayText = dataGridRow
            .getCells()
            .firstWhere((DataGridCell dataGridCell) => dataGridCell.columnName == column.columnName)
            .value
            ?.toString() ??
        '';

    // The new cell value must be reset.
    // To avoid committing the [DataGridCell] value that was previously edited
    // into the current non-modified [DataGridCell].
    newCellValue = null;

    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: TextField(
        controller: editingController..text = displayText,
        autofocus: true,
        cursorHeight: 15.0,
        style: UIStyleText.bodyRegular,
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(color: UIColors.textGray),
          ),
        ),
        onTapOutside: (event) => submitCell(),
        onChanged: (String value) => newCellValue = value.isNotEmpty ? value : null,
        onSubmitted: (String value) {
          /// Call [CellSubmit] callback to fire the canSubmitCell and
          /// onCellSubmit to commit the new value in single place.
          submitCell();
        },
      ),
    );
  }

  TextEditingController taxController = TextEditingController();
  TextEditingController discountController = TextEditingController();

  @override
  Widget? buildTableSummaryCellWidget(GridTableSummaryRow summaryRow, GridSummaryColumn? summaryColumn,
      RowColumnIndex rowColumnIndex, String summaryValue) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 10),
      child: summaryColumn?.columnName == 'supplier_price'
          ? UIText.labelSemiBold(
              summaryRow.title!,
              align: TextAlign.end,
            )
          : _buildSummaryCell(summaryRow.title, summaryValue),
    );
  }

  // double getTotal(String subtotalValue) {
  //   double tax = double.tryParse(taxController.text) ?? 0;
  //   double discount = double.tryParse(discountController.text) ?? 0;

  //   double subtotal = double.tryParse(subtotalValue) ?? 0;

  //   return (subtotal + tax) - discount;
  // }

  Widget _buildSummaryCell(String? title, String summaryValue) {
    if (title == 'Tax' || title == 'Discount') {
      return _isCompleted
          ? UIText.labelSemiBold('0')
          : TextField(
              controller: title == 'Tax' ? taxController : discountController,
              cursorHeight: 10.0,
              onChanged: (value) {
                /// copyWith to the StockReturnItem
                /// then call it in the return below to compute the grand total
              },
              style: UIStyleText.bodyRegular,
              decoration: const InputDecoration(
                hintText: '0.00',
                contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(color: UIColors.textGray),
                ),
              ),
            );
    }

    if (title == 'Subtotal') return UIText.labelSemiBold(summaryValue);

    /// Total of subtotal, tax and discount
    return UIText.labelSemiBold(summaryValue);
  }
}
