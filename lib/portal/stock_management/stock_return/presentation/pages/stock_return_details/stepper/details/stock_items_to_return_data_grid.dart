import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/widgets/data_grid/data_grid_no_data.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_return/domain/entities/stock_return_item.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_return/presentation/cubit/stock_return/stock_return_cubit.dart';
import 'package:medglobal_admin_portal/portal/stock_management/variants/autocomplete_dropdown.dart';
import 'package:medglobal_shared/medglobal_shared.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class StockItemsToReturnDataGrid extends StatefulWidget {
  const StockItemsToReturnDataGrid({super.key});

  @override
  State<StockItemsToReturnDataGrid> createState() => _StockItemsToReturnDataGridState();
}

class _StockItemsToReturnDataGridState extends State<StockItemsToReturnDataGrid> {
  List<StockReturnItem> _itemsToReturn = <StockReturnItem>[];

  late DataGridController _dataGridController;
  late StockItemsToReturnDataSource _stockItemsToReturnDataSource;
  late CustomSelectionManager customSelectionManager;

  @override
  void initState() {
    super.initState();
    _dataGridController = DataGridController();
    customSelectionManager = CustomSelectionManager(_dataGridController);

    final stockReturn = context.read<StockReturnCubit>().state.stockReturn;
    final tax = stockReturn.tax ?? 0;
    final discount = stockReturn.discount ?? 0;

    _itemsToReturn = stockReturn.items ?? [];
    _stockItemsToReturnDataSource = StockItemsToReturnDataSource(_itemsToReturn, context, tax, discount);
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
        const PageSectionTitle(title: 'Items to Return'),
        DataGridToolbar(
          isImportCSV: true,
          search: SizedBox(
            width: MediaQuery.sizeOf(context).width * 0.3,
            child: AutocompleteDropdown(
              supplierId: context.read<StockReturnCubit>().state.stockReturn.supplier?.id,
              branchId: context.read<StockReturnCubit>().state.stockReturn.branch?.id,
              onSelected: (value) {
                final purchaseOrderItem = value.toStockReturnItem();

                /// Add newly added items to the current stock return in state
                context.read<StockReturnCubit>().addItem(purchaseOrderItem);
              },
            ),
          ),
        ),
        BlocConsumer<StockReturnCubit, StockReturnState>(
          listenWhen: (previous, current) =>
              previous.stockReturn.items != current.stockReturn.items ||
              previous.stockReturn.totalAmount != current.stockReturn.totalAmount,
          listener: (context, state) {
            _stockItemsToReturnDataSource._itemsToReturn = state.stockReturn.items ?? [];
            _stockItemsToReturnDataSource._tax = state.stockReturn.tax ?? 0;
            _stockItemsToReturnDataSource._discount = state.stockReturn.discount ?? 0;

            _stockItemsToReturnDataSource.buildDataGridRows();
            _stockItemsToReturnDataSource.updateDataGridSource();
          },
          buildWhen: (previous, current) => previous.stockReturn.items != current.stockReturn.items,
          builder: (_, state) => Container(
            decoration: UIStyleContainer.topBorder,
            child: state.stockReturn.items?.isEmpty == true
                ? DataGridNoData(
                    columns: DataGridUtil.getColumns(DataGridColumn.SR_ITEMS), source: _stockItemsToReturnDataSource)
                : ClipRect(
                    clipper: HorizontalBorderClipper(),
                    child: SfDataGridTheme(
                      data: DataGridUtil.cellNavigationStyle,
                      child: SfDataGrid(
                        source: _stockItemsToReturnDataSource,
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
                        footerHeight: 80,
                        footer: Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                width: MediaQuery.sizeOf(context).width * 0.3,
                                child: AutocompleteDropdown(
                                  supplierId: context.read<StockReturnCubit>().state.stockReturn.supplier?.id,
                                  branchId: context.read<StockReturnCubit>().state.stockReturn.branch?.id,
                                  onSelected: (value) {
                                    final purchaseOrderItem = value.toStockReturnItem();

                                    /// Add newly added items to the current stock return in state
                                    context.read<StockReturnCubit>().addItem(purchaseOrderItem);
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
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
          ),
        ),
      ],
    );
  }
}

class StockItemsToReturnDataSource extends DataGridSource {
  StockItemsToReturnDataSource(List<StockReturnItem> itemsToReturn, BuildContext context, double tax, double discount) {
    _itemsToReturn = itemsToReturn;
    _context = context;
    _tax = tax;
    _discount = discount;
    buildDataGridRows();
  }

  List<StockReturnItem> _itemsToReturn = [];

  List<DataGridRow> dataGridRows = [];

  late double _tax;
  late double _discount;

  late BuildContext _context;

  void buildDataGridRows() => dataGridRows = _itemsToReturn.map((item) => item.toDataGridRowItemsToReturn()).toList();

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
        'qty_to_return' || 'supplier_price' => Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: UIColors.background,
              border: Border.all(color: UIColors.borderRegular),
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            ),
            child: key == 'supplier_price'
                ? UIText.bodyRegular((cell.value as double).toStringAsFixed(3))
                : UIText.bodyRegular(cell.value.toString()),
          ),
        'action' => LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) => UIButton.text(
              'Delete',
              iconBuilder: (isHover) => Assets.icons.trash.setColorOnHover(isHover),
              onClick: () => context.read<StockReturnCubit>().removeItem(id),
            ),
          ),
        _ => UIText.bodyRegular(
            cell.runtimeType.toString().contains('double')
                ? (cell.value as double).toPesoString()
                : cell.value.toString(),
          ),
      };

  /// Helps to hold the new value of all editable widget.
  /// Based on the new value we will commit the new value into the corresponding
  /// [DataGridCell] on [onSubmitCell] method.
  dynamic newCellValue;

  /// Help to control the editable text in [TextField] widget.
  TextEditingController editingController = TextEditingController();

  @override
  bool onCellBeginEdit(DataGridRow dataGridRow, RowColumnIndex rowColumnIndex, GridColumn column) {
    if (column.columnName == 'qty_to_return' || column.columnName == 'supplier_price') {
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
      final newQtyToOrder = int.tryParse(newCellValue);
      double supplierPrice = dataGridRows[dataRowIndex].getCells()[5].value;

      dataGridRows[dataRowIndex].getCells()[rowColumnIndex.columnIndex] =
          DataGridCell<int>(columnName: 'qty_to_return', value: newQtyToOrder);

      /// Compute new total and update the value in the DataGridRows
      double newTotal = (newQtyToOrder ?? 0) * (supplierPrice);
      dataGridRows[dataRowIndex].getCells()[6] = DataGridCell<double>(columnName: 'total', value: newTotal);

      _context.read<StockReturnCubit>().setQuantityToReturnPerItem(
            id: _itemsToReturn[dataRowIndex].id!,
            qty: newQtyToOrder!,
            total: newTotal,
          );
    }
    if (column.columnName == 'supplier_price') {
      final newSupplierPrice = double.tryParse(newCellValue) ?? 0;
      double qtyToReturn = dataGridRows[dataRowIndex].getCells()[4].value;

      dataGridRows[dataRowIndex].getCells()[rowColumnIndex.columnIndex] =
          DataGridCell<double>(columnName: 'supplier_price', value: newSupplierPrice);

      /// Compute new total and update the value in the DataGridRows
      double newTotal = (newSupplierPrice) * (qtyToReturn);
      dataGridRows[dataRowIndex].getCells()[6] = DataGridCell<double>(columnName: 'total', value: newTotal);

      _context.read<StockReturnCubit>().setSupplierPricePerItem(
            id: _itemsToReturn[dataRowIndex].id!,
            price: newSupplierPrice,
            total: newTotal,
          );
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
        inputFormatters: [
          if (column.columnName == 'supplier_price') CurrencyInputFormatter(),
          if (column.columnName == 'qty_to_return') FilteringTextInputFormatter.digitsOnly,
        ],
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
    /// TODO: Tax will be a text for now
    return Container(
      padding: EdgeInsets.fromLTRB(summaryRow.title == 'Discount' ? 10 : 16, 14, 16, 10),
      // padding: EdgeInsets.fromLTRB(summaryRow.title == 'Tax' || summaryRow.title == 'Discount' ? 10 : 16, 14, 16, 10),
      child: summaryColumn?.columnName == 'supplier_price'
          ? Text(
              summaryRow.title!,
              textAlign: TextAlign.end,
              style: UIStyleText.labelSemiBold,
            )
          : _buildSummaryCell(summaryRow.title, summaryValue, _tax, _discount),
    );
  }

  Widget _buildSummaryCell(String? title, String summaryValue, double tax, double discount) {
    if (title == 'Discount') {
      // if (title == 'Tax' || title == 'Discount') {
      return Focus(
        onFocusChange: (value) {
          if (value == false) {
            _context
                .read<StockReturnCubit>()
                .setTotal(((double.parse(summaryValue)) - (double.tryParse(discountController.text) ?? 0)));
            // ((double.parse(summaryValue) + (double.tryParse(taxController.text) ?? 0)) -
            //         (double.tryParse(discountController.text) ?? 0)));
          }
        },
        child: TextField(
          controller: discountController..text = discount.toString(),
          // controller: title == 'Tax'
          //     ? (taxController..text = tax.toString())
          //     : (discountController..text = discount.toString()),
          cursorHeight: 10.0,
          onChanged: (value) {
            // if (title == 'Tax') _context.read<StockReturnCubit>().setTax(double.tryParse(value) ?? 0);
            if (title == 'Discount') _context.read<StockReturnCubit>().setDiscount(double.tryParse(value) ?? 0);
          },
          style: UIStyleText.bodyRegular,
          inputFormatters: [CurrencyInputFormatter()],
          decoration: const InputDecoration(
            hintText: '0',
            contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(color: UIColors.textGray),
            ),
          ),
        ),
      );
    }

    if (title == 'Subtotal') return UIText.bodyRegular(summaryValue.toPesoString());
    if (title == 'Tax') return UIText.bodyRegular('0.00');

    /// Total is subtotal less discount
    return UIText.label((((double.tryParse(summaryValue) ?? 0)) - _discount).toPesoString());
    // return UIText.heading6((((double.tryParse(summaryValue) ?? 0) + _tax) - _discount).toString());
  }
}
