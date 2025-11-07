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
  final DataGridController _dataGridController = DataGridController();
  late PurchaseItemsDataSource _dataGridSource;
  late _SelectionManager _selectionManager;

  @override
  void initState() {
    super.initState();
    _selectionManager = _SelectionManager(_dataGridController);

    final po = context.read<PurchaseOrderFormCubit>().state.purchaseOrder;
    final items = po.items ?? [];
    final discount = po.discount;

    _dataGridSource = PurchaseItemsDataSource(context, items, discount);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PurchaseOrderFormCubit, PurchaseOrderFormState>(
      listener: (context, state) {
        final po = state.purchaseOrder;

        // Update items with the new items and rebuild the data grid rows
        // to update cell values based on cell inputs
        _dataGridSource._items = po.items ?? [];
        _dataGridSource._discount = po.discount;

        _dataGridSource.buildDataGridRows();
      },
      builder: (_, state) {
        final items = state.purchaseOrder.items ?? [];
        final itemCount = items.length;

        // const maxDataGridHeight = 480.0; // Maximum height allowed for the DataGrid
        // const itemHeight = 58.0; // Fixed height per data row
        //
        // // Calculate total height based on item count plus 4 fixed summary rows.
        // final baseHeight = (itemCount + 4) * itemHeight;
        //
        // // If there are more than 5 items, cap the height to max; else allow it to expand.
        // final dataGridHeight = itemCount >= 5 ? maxDataGridHeight : baseHeight;

        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const PageSectionTitle(title: 'Items to Order'),
            // PageSectionTitle(title: 'Items to Order (${_dataGridSource._items.length})'),
            _buildSearch(),
            const UIVerticalSpace(20),
            Container(
              decoration: UIStyleContainer.topBorder,
              child: items.isEmpty
                  ? DataGridNoData(
                      columns: DataGridUtil.getColumns(DataGridColumn.PO_ITEMS),
                      source: _dataGridSource,
                      showTopBorder: false,
                    )
                  : // constraints: BoxConstraints(maxHeight: dataGridHeight),
                  ClipRect(
                      clipper: HorizontalBorderClipper(),
                      child: SfDataGridTheme(
                        data: DataGridUtil.cellNavigationStyle,
                        child: SfDataGrid(
                          onCurrentCellActivated: (row, __) {
                            // When a cell is activated (e.g., clicked or navigated to),
                            // update the selected row index in the controller.
                            //
                            // This ensures that row selection reflects user interaction
                            // via clicks or keyboard navigation, and keeps the visual
                            // selection (e.g., row highlight) in sync with the active cell.
                            //
                            // `row.rowIndex` is the index of the row containing the activated cell.
                            _dataGridController.selectedIndex = row.rowIndex;
                          },
                          onSelectionChanged: (_, __) {
                            // Handles selection change in the SfDataGrid.
                            // Useful for keyboard navigation or mouse click selection.

                            // If selection lands on a non-editable column (not 5 or 6),
                            // programmatically move focus to column 5 (first editable column)
                            final columnIndex = _dataGridController.currentCell.columnIndex;

                            if (columnIndex != 5 && columnIndex != 6) {
                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                _dataGridController
                                    .beginEdit(RowColumnIndex(_dataGridController.currentCell.rowIndex, 5));
                              });
                            }
                          },
                          source: _dataGridSource,
                          columns: DataGridUtil.getColumns(DataGridColumn.PO_ITEMS),
                          controller: _dataGridController,
                          selectionManager: _selectionManager,
                          allowEditing: true,
                          shrinkWrapRows: true,
                          navigationMode: GridNavigationMode.cell,
                          selectionMode: SelectionMode.single,
                          columnWidthMode: ColumnWidthMode.fill,
                          headerRowHeight: 38,
                          headerGridLinesVisibility: GridLinesVisibility.none,
                          editingGestureType: EditingGestureType.tap,
                          isScrollbarAlwaysShown: true,
                          tableSummaryRows: ['Subtotal', 'Tax', 'Discount', 'Total']
                              .map((title) => _buildTableSummaryRow(title))
                              .toList(),
                        ),
                      ),
                    ),
            ),
            if (items.isNotEmpty) ...[
              if (itemCount >= 5 || itemCount == 1) const UIVerticalSpace(16),
              _buildSearch(),
            ],
          ],
        );
      },
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
          supplierId: context.read<PurchaseOrderFormCubit>().state.purchaseOrder.supplier?.id,
          branchId: context.read<PurchaseOrderFormCubit>().state.purchaseOrder.branch?.id,
          onSelected: (value) {
            if (_dataGridSource._items.any((item) => item.variantId == value.id) == true) {
              SnackbarUtil.duplicate(context, '${value.productVariantName} was already added.');
              return;
            }
            final purchaseOrderItem = value.toPurchaseOrderItem();

            // Visualize new added item
            // if (_dataGridSource.dataGridRows.length > 5) {
            //   _dataGridController.scrollToRow(
            //     (_dataGridController.getVisibleRowEndIndex(RowRegion.body) ?? 0) + 1,
            //     canAnimate: true,
            //   );
            // }

            /// Add newly added items to the current PO in state
            context.read<PurchaseOrderFormCubit>().addItem(purchaseOrderItem);
          },
        ),
      );

  GridTableSummaryRow _buildTableSummaryRow(String title) => GridTableSummaryRow(
        color: UIColors.background,
        position: GridTableSummaryRowPosition.bottom,
        showSummaryInRow: false,
        title: title,
        columns: [
          const GridSummaryColumn(
            name: Strings.empty,
            columnName: 'supplier_price',
            summaryType: GridSummaryType.sum,
          ),
          const GridSummaryColumn(
            name: Strings.empty,
            columnName: 'total',
            summaryType: GridSummaryType.sum,
          ),
        ],
      );
}

class _SelectionManager extends RowSelectionManager {
  _SelectionManager(this.dataGridController);

  DataGridController dataGridController;

  @override
  Future<void> handleKeyEvent(KeyEvent keyEvent) async {
    final shouldBeginEdit = keyEvent.logicalKey == LogicalKeyboardKey.tab ||
        keyEvent.logicalKey == LogicalKeyboardKey.arrowDown ||
        keyEvent.logicalKey == LogicalKeyboardKey.arrowUp ||
        keyEvent.logicalKey == LogicalKeyboardKey.arrowLeft ||
        keyEvent.logicalKey == LogicalKeyboardKey.arrowRight ||
        keyEvent.logicalKey == LogicalKeyboardKey.enter;

    if (shouldBeginEdit) {
      // Scrolls the DataGrid to bring the current row into view
      // 'position: center' aligns the row in the center of the viewport.
      dataGridController.scrollToRow(
        dataGridController.currentCell.rowIndex.toDouble(),
        canAnimate: true,
        position: DataGridScrollPosition.center,
      );
      // Wait until after the frame renders to begin editing (avoids timing issues)
      WidgetsBinding.instance.addPostFrameCallback((_) {
        // Only begin editing if the selected column is either 5 or 6
        // These are presumably editable columns (e.g., Quantity, Status, etc.)
        if (dataGridController.currentCell.columnIndex == 5 || dataGridController.currentCell.columnIndex == 6) {
          dataGridController.beginEdit(dataGridController.currentCell);
        }
      });
    }

    super.handleKeyEvent(keyEvent);
  }
}

class PurchaseItemsDataSource extends DataGridSource {
  /// Holds the new value of all editable widget in the [DataGridCell].
  /// Based on the new value we will commit the new value into the corresponding
  /// [DataGridCell] on [onSubmitCell] method.
  dynamic newCellValue;

  /// [DataGridCell] focus nodes
  /// Help track when user taps outside, so we can submit the cell.
  FocusNode focusNode = FocusNode();

  /// [DataGridCell] text editing controllers
  /// Help to control the editable text in the text field.
  TextEditingController editingController = TextEditingController();

  /// [GridTableSummaryRow] text editing controllers
  late TextEditingController _discountController;

  bool isColumnOrderQty(GridColumn column) => column.columnName == 'qty_to_order';

  bool isColumnSupplierPrice(GridColumn column) => column.columnName == 'supplier_price';

  PurchaseItemsDataSource(
    BuildContext context,
    List<PurchaseOrderItem> items,
    double? discount,
  ) {
    _context = context;
    _items = items;
    _discount = discount;
    _discountController = TextEditingController(text: _discount?.toPesoString());
    buildDataGridRows();
  }

  List<PurchaseOrderItem> _items = [];

  List<DataGridRow> dataGridRows = [];

  late BuildContext _context;
  late double? _discount;

  void buildDataGridRows() => dataGridRows = _items.map((item) => item.toDataGridRowItems()).toList();

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
    if (rowIndex == -1) return; // Prevents index range -1 when tapping outside the cell text field

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
      if (!focusNode.hasFocus) submitCell();
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

  @override
  Widget? buildTableSummaryCellWidget(
    GridTableSummaryRow summaryRow,
    GridSummaryColumn? summaryColumn,
    RowColumnIndex rowColumnIndex,
    String summaryValue,
  ) {
    /// TODO: Tax will be a text for now
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
      child: summaryColumn?.columnName == 'supplier_price'
          ? Text(
              summaryRow.title!,
              textAlign: TextAlign.end,
              style: UIStyleText.labelSemiBold,
            )
          : _buildSummaryCell(
              summaryRow.title,
              summaryValue,
            ),
    );
  }

  Widget _buildSummaryCell(String? title, String summaryValue) {
    /// Set the text of the discount controller only if a discount value exists,
    /// allowing the hint text to display when the value is null or empty.
    if (_discount != null) _discountController.text = _discount.toPesoString();

    if (title == 'Discount') {
      return Focus(
        onFocusChange: (value) {
          if (value == false) {
            if (_discountController.text.isNotEmpty) {
              _context.read<PurchaseOrderFormCubit>().setDiscount(_discountController.text.toDouble());
            }
          }
        },
        child: TextField(
          controller: _discountController,
          cursorHeight: 10.0,
          style: UIStyleText.chip.copyWith(fontSize: 13),
          inputFormatters: [NumberInputFormatter()],
          decoration: InputDecoration(
            hintText: 0.00.toPesoString(),
            hintStyle: UIStyleText.chip.copyWith(fontSize: 13, color: UIColors.textMuted),
            contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(color: UIColors.textGray),
            ),
          ),
          onSubmitted: (value) => _context.read<PurchaseOrderFormCubit>().setDiscount(value.toDouble()),
        ),
      );
    }

    if (title == 'Subtotal') return UIText.labelSemiBold(summaryValue.toPesoString());
    if (title == 'Tax') return UIText.labelSemiBold('0.00');

    final total = (summaryValue.toDouble() ?? 0) - (_discount ?? 0);
    return UIText.labelSemiBold(total.toPesoString());
  }
}
