import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/widgets/data_grid/data_grid.dart';
import 'package:medglobal_admin_portal/core/utils/snackbar_util.dart';
import 'package:medglobal_admin_portal/core/widgets/typeahead_search/typeahead_search.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/domain/entities/purchase_order_item.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/presentation/cubit/purchase_order_form_cubit/purchase_order_form_cubit.dart';
import 'package:medglobal_shared/medglobal_shared.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class PurchaseOrderItemsDataGrid extends StatefulWidget {
  const PurchaseOrderItemsDataGrid({super.key});

  @override
  State<PurchaseOrderItemsDataGrid> createState() => _PurchaseItemsDataGridState();
}

class _PurchaseItemsDataGridState extends State<PurchaseOrderItemsDataGrid> {
  late DataGridController _dataGridController;
  late PurchaseItemsDataSource _purchaseItemsDataSource;
  late CustomSelectionManager _customSelectionManager;

  late final PurchaseOrderFormCubit _formCubit;

  @override
  void initState() {
    super.initState();
    _dataGridController = DataGridController();
    _customSelectionManager = CustomSelectionManager(_dataGridController);

    _formCubit = context.read<PurchaseOrderFormCubit>();

    final po = _formCubit.state.purchaseOrder;
    final items = po.items ?? [];
    final tax = po.tax ?? 0;
    final discount = po.discount ?? 0;

    _purchaseItemsDataSource = PurchaseItemsDataSource(context, items, tax, discount);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const PageSectionTitle(title: 'Items to Order'),
        _buildSearch(),
        const UIVerticalSpace(20),
        BlocConsumer<PurchaseOrderFormCubit, PurchaseOrderFormState>(
          listenWhen: (previous, current) =>
              previous.purchaseOrder.items != current.purchaseOrder.items ||
              previous.purchaseOrder.discount != current.purchaseOrder.discount,
          listener: (context, state) {
            print('HERE');
            print(state.purchaseOrder.discount);
            print(state.purchaseOrder.totalAmount);
            final items = state.purchaseOrder.items ?? [];

            // Rebuild the data grid rows to update column values based on column inputs

            _purchaseItemsDataSource._items = items;

            _purchaseItemsDataSource._discount = state.purchaseOrder.discount ?? 0;

            _purchaseItemsDataSource.buildDataGridRows();
          },
          builder: (_, state) {
            final isPurchaseOrderEmpty = state.purchaseOrder.items?.isEmpty == true;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  // constraints: BoxConstraints(
                  //   maxHeight: isPurchaseOrderEmpty ? double.infinity : 500,
                  // ),
                  decoration: UIStyleContainer.topBorder,
                  child: isPurchaseOrderEmpty
                      ? DataGridNoData(
                          columns: DataGridUtil.getColumns(DataGridColumn.PO_ITEMS),
                          source: _purchaseItemsDataSource,
                        )
                      : ClipRect(
                          clipper: HorizontalBorderClipper(),
                          child: SfDataGridTheme(
                            data: DataGridUtil.cellNavigationStyle,
                            child: SfDataGrid(
                              source: _purchaseItemsDataSource,
                              columns: DataGridUtil.getColumns(DataGridColumn.PO_ITEMS),
                              controller: _dataGridController,
                              selectionManager: _customSelectionManager,
                              shrinkWrapRows: true,
                              allowEditing: true,
                              navigationMode: GridNavigationMode.cell,
                              selectionMode: SelectionMode.single,
                              columnWidthMode: ColumnWidthMode.fill,
                              headerRowHeight: 38,
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
                ),
                if (!isPurchaseOrderEmpty) ...[
                  const UIVerticalSpace(20),
                  _buildSearch(),
                ],
              ],
            );
          },
        ),
      ],
    );
  }

  @override
  void dispose() {
    _dataGridController.dispose();
    super.dispose();
  }

  Widget _buildSearch() => SizedBox(
        width: MediaQuery.sizeOf(context).width * 0.3,
        child: TypeAheadSearch(
          supplierId: _formCubit.state.purchaseOrder.supplier?.id,
          branchId: _formCubit.state.purchaseOrder.branch?.id,
          onSelected: (value) {
            if (_purchaseItemsDataSource._items.any((item) => item.variantId == value.id) == true) {
              SnackbarUtil.duplicate(context, 'Item was already added.');
              return;
            }
            final purchaseOrderItem = value.toPurchaseOrderItem();

            /// Add newly added items to the current PO in state
            _formCubit.addItem(purchaseOrderItem);
          },
        ),
      );
}

class PurchaseItemsDataSource extends DataGridSource {
  PurchaseItemsDataSource(BuildContext context, List<PurchaseOrderItem> items, double tax, double discount) {
    _context = context;
    _items = items;
    _tax = tax;
    _discount = discount;
    buildDataGridRows();
  }

  List<PurchaseOrderItem> _items = [];

  List<DataGridRow> dataGridRows = [];

  late BuildContext _context;
  late double _tax;
  late double _discount;

  void buildDataGridRows() => dataGridRows = _items.map((item) => item.toDataGridRowItems()).toList();

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
          child: _buildCell(
            colName: cell.columnName,
            cell: cell,
            itemId: row.getCells().first.value,
          ),
        );
      }).toList(),
    );
  }

  Widget _buildCell({
    required String colName,
    required DataGridCell cell,
    required int itemId,
  }) =>
      switch (colName) {
        'qty_to_order' => Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: UIColors.background,
              border: Border.all(color: UIColors.borderRegular),
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            ),
            child: cell.value == null
                ? UIText.dataGridText('0', color: UIColors.textMuted)
                : UIText.dataGridText(cell.value.toString()),
          ),
        'supplier_price' => Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: UIColors.background,
              border: Border.all(color: UIColors.borderRegular),
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            ),
            child: cell.value == null
                ? UIText.dataGridText(0.toStringAsFixed(3), color: UIColors.textMuted)
                : UIText.dataGridText((cell.value as double).toStringAsFixed(3)),
          ),
        'action' => UIButton.text(
            'Delete',
            iconBuilder: (isHover) => Assets.icons.trash.setColorOnHover(isHover),
            onClick: () => _context.read<PurchaseOrderFormCubit>().removeItem(itemId),
          ),
        _ => UIText.dataGridText(
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

  /// Help track when user taps outside, so we can submit the cell.
  FocusNode focusNode = FocusNode();

  bool isColumnOrderQty(GridColumn column) => column.columnName == 'qty_to_order';

  bool isColumnSupplierPrice(GridColumn column) => column.columnName == 'supplier_price';

  @override
  bool onCellBeginEdit(
    DataGridRow dataGridRow,
    RowColumnIndex rowColumnIndex,
    GridColumn column,
  ) {
    if (isColumnOrderQty(column) || isColumnSupplierPrice(column)) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<void> onCellSubmit(
    DataGridRow dataGridRow,
    RowColumnIndex rowColumnIndex,
    GridColumn column,
  ) async {
    final dynamic oldValue =
        dataGridRow.getCells().firstWhereOrNull((DataGridCell cell) => cell.columnName == column.columnName)?.value;

    final rowIndex = dataGridRows.indexOf(dataGridRow);
    final columnIndex = rowColumnIndex.columnIndex;
    final itemId = _items[rowIndex].id!;

    if (oldValue == newCellValue) return;

    if (isColumnOrderQty(column)) {
      dataGridRows[rowIndex].getCells()[columnIndex] = DataGridCell<int>(
        columnName: 'qty_to_order',
        value: newCellValue,
      );
      _context.read<PurchaseOrderFormCubit>().setQuantityToOrderPerItem(
            id: itemId,
            qty: newCellValue,
          );
    }

    if (isColumnSupplierPrice(column)) {
      dataGridRows[rowIndex].getCells()[columnIndex] = DataGridCell<double>(
        columnName: 'supplier_price',
        value: newCellValue,
      );
      _context.read<PurchaseOrderFormCubit>().setSupplierPricePerItem(
            id: itemId,
            price: newCellValue,
          );
    }
  }

  @override
  Widget? buildEditWidget(
    DataGridRow dataGridRow,
    RowColumnIndex rowColumnIndex,
    GridColumn column,
    CellSubmit submitCell,
  ) {
    focusNode.addListener(() {
      if (!focusNode.hasFocus) submitCell(); // Submit when focus is lost
    });

    final isOrderQtyColumn = isColumnOrderQty(column);
    final isSupplierPriceColumn = isColumnSupplierPrice(column);

    final textDisplay = dataGridRow
        .getCells()
        .firstWhereOrNull((DataGridCell dataGridCell) => dataGridCell.columnName == column.columnName)
        ?.value;

    newCellValue = textDisplay;

    return DataGridTextField(
      controller: editingController,
      textDisplay: textDisplay,
      focusNode: focusNode,
      inputFormatters: [
        if (isOrderQtyColumn) FilteringTextInputFormatter.digitsOnly,
        if (isSupplierPriceColumn) CurrencyInputFormatter(),
      ],
      onChanged: (String value) {
        if (value.isNotEmpty) {
          if (isSupplierPriceColumn) {
            newCellValue = value.toDouble();
          } else if (isOrderQtyColumn) {
            newCellValue = value.toInt();
          }
        } else {
          newCellValue = null;
        }
      },
      submitCell: submitCell,
    );
  }

  TextEditingController taxController = TextEditingController();
  TextEditingController discountController = TextEditingController();

  @override
  Widget? buildTableSummaryCellWidget(
    GridTableSummaryRow summaryRow,
    GridSummaryColumn? summaryColumn,
    RowColumnIndex rowColumnIndex,
    String summaryValue,
  ) {
    /// TODO: Tax will be a text for now
    return Container(
      padding: EdgeInsets.fromLTRB(16, 10, 16, 10),
      // padding: EdgeInsets.fromLTRB(summaryRow.title == 'Discount' ? 10 : 16, 14, 16, 10),
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
      return TextField(
        controller: discountController..text = discount.toString(),
        cursorHeight: 10.0,
        onChanged: (value) {
          _context.read<PurchaseOrderFormCubit>().setDiscount((double.tryParse(value) ?? 0));
        },
        style: UIStyleText.labelSemiBold,
        inputFormatters: [CurrencyInputFormatter()],
        decoration: InputDecoration(
          hintText: '0',
          hintStyle: UIStyleText.labelSemiBold,
          contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(color: UIColors.textGray),
          ),
        ),
      );
    }

    if (title == 'Subtotal') return UIText.labelSemiBold(summaryValue.toPesoString());
    if (title == 'Tax') return UIText.labelSemiBold('0.00');

    /// Total is subtotal less discount
    // return UIText.labelSemiBold((((double.tryParse(summaryValue) ?? 0)) - _discount).toString());
    return UIText.labelSemiBold((((double.tryParse(summaryValue) ?? 0)) - discount).toPesoString());
    // return UIText.labelSemiBold((((double.tryParse(summaryValue) ?? 0) + _tax) - _discount).toString());
  }
}
