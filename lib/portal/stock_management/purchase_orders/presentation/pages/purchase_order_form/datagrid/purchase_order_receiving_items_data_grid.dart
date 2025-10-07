import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart' hide FilterType;
import 'package:medglobal_admin_portal/core/widgets/data_grid/data_grid_text_field.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/domain/entities/purchase_order_item.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/presentation/cubit/purchase_order_form_cubit/purchase_order_form_cubit.dart';
import 'package:medglobal_shared/medglobal_shared.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class PurchaseOrderReceivingItemsDataGrid extends StatefulWidget {
  const PurchaseOrderReceivingItemsDataGrid({super.key});

  @override
  State<PurchaseOrderReceivingItemsDataGrid> createState() => _PurchaseOrderItemsToReceiveDataGridState();
}

class _PurchaseOrderItemsToReceiveDataGridState extends State<PurchaseOrderReceivingItemsDataGrid> {
  final _searchController = TextEditingController();

  late DataGridController _dataGridController;
  late PurchaseItemsToReceiveDataSource _purchaseItemsToReceiveDataSource;
  late _SelectionManager customSelectionManager;

  @override
  void initState() {
    super.initState();
    _dataGridController = DataGridController();
    customSelectionManager = _SelectionManager(_dataGridController);

    final po = context.read<PurchaseOrderFormCubit>().state.purchaseOrder;
    final items = po.items ?? [];
    final discount = po.discount ?? 0;

    _purchaseItemsToReceiveDataSource = PurchaseItemsToReceiveDataSource(context, items, discount);
  }

  @override
  void dispose() {
    _searchController.dispose();
    _dataGridController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const PageSectionTitle(title: 'Items to Receive'),
        UISearchField(
          fieldWidth: 500,
          icon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Assets.icons.search.svg(),
          ),
          hint: 'Search variant name',
          controller: _searchController,
          onChanged: (value) {
            _purchaseItemsToReceiveDataSource.clearFilters(columnName: 'variant_name');
            if (value.isNotEmpty) {
              _purchaseItemsToReceiveDataSource.addFilter(
                'variant_name',
                FilterCondition(
                  value: value,
                  filterBehavior: FilterBehavior.stringDataType,
                  type: FilterType.contains,
                ),
              );
            }
            _purchaseItemsToReceiveDataSource.updateDataGridSource();
          },
        ),
        const UIVerticalSpace(20),
        BlocConsumer<PurchaseOrderFormCubit, PurchaseOrderFormState>(
          listener: (context, state) {
            final po = state.purchaseOrder;

            // Update items with the new items and rebuild the data grid rows
            // to update cell values based on cell inputs
            _purchaseItemsToReceiveDataSource._itemsToReceive = po.items ?? [];
            _purchaseItemsToReceiveDataSource._discount = po.discount;

            _purchaseItemsToReceiveDataSource.buildDataGridRows();
          },
          builder: (context, state) => Container(
            decoration: UIStyleContainer.topBorder,
            constraints: const BoxConstraints(maxHeight: 480),
            child: ClipRect(
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

                    // If selection lands on a non-editable column (not 4),
                    // programmatically move focus to column 4 (first editable column)

                    final columnIndex = _dataGridController.currentCell.columnIndex;

                    // if (columnIndex != 4) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      _dataGridController.beginEdit(RowColumnIndex(_dataGridController.currentCell.rowIndex, 4));
                    });
                    // }

                    print(_dataGridController.currentCell);
                    print(_dataGridController.currentCell);
                  },
                  source: _purchaseItemsToReceiveDataSource,
                  columns: DataGridUtil.getColumns(DataGridColumn.PO_ITEMS_RECEIVED),
                  controller: _dataGridController,
                  selectionManager: customSelectionManager,
                  allowEditing: true,
                  navigationMode: GridNavigationMode.cell,
                  selectionMode: SelectionMode.single,
                  columnWidthMode: ColumnWidthMode.fill,
                  headerRowHeight: 38,
                  headerGridLinesVisibility: GridLinesVisibility.none,
                  editingGestureType: EditingGestureType.tap,
                  isScrollbarAlwaysShown: true,
                  tableSummaryRows:
                      ['Subtotal', 'Tax', 'Discount', 'Total'].map((title) => _buildTableSummaryRow(title)).toList(),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

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
        dataGridController.beginEdit(RowColumnIndex(dataGridController.currentCell.rowIndex, 4));
      });
    }

    super.handleKeyEvent(keyEvent);
  }
}

class PurchaseItemsToReceiveDataSource extends DataGridSource {
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

  bool isColumnReceivedQty(GridColumn column) => column.columnName == 'qty_received';

  PurchaseItemsToReceiveDataSource(
    BuildContext context,
    List<PurchaseOrderItem> itemsToReceive,
    double? discount,
  ) {
    _context = context;
    _itemsToReceive = itemsToReceive;
    _discount = discount;
    buildDataGridRows();
  }

  List<PurchaseOrderItem> _itemsToReceive = [];

  List<DataGridRow> dataGridRows = [];

  late BuildContext _context;
  late double? _discount;

  void buildDataGridRows() => dataGridRows = _itemsToReceive.map((item) => item.toDataGridRowItemsReceived()).toList();

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
          child: cellBuilder(
            colName: cell.columnName,
            cell: cell,
            itemId: row.getCells().first.value,
          ),
        );
      }).toList(),
    );
  }

  Widget cellBuilder({
    required String colName,
    required DataGridCell cell,
    required int itemId,
  }) =>
      switch (colName) {
        'qty_received' => Container(
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
        'supplier_price' => UIText.dataGridText((cell.value as double).toStringAsFixed(3)),
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
    if (isColumnReceivedQty(column)) {
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
    final itemId = _itemsToReceive[rowIndex].id!;

    if (oldValue == newCellValue) return;

    if (isColumnReceivedQty(column)) {
      dataGridRows[rowIndex].getCells()[columnIndex] = DataGridCell<int>(
        columnName: 'qty_received',
        value: newCellValue,
      );
      _context.read<PurchaseOrderFormCubit>().setQuantityReceivedPerItem(
            id: itemId,
            qty: newCellValue,
          );
    }

    // final int dataRowIndex = dataGridRows.indexOf(dataGridRow);
    //
    // if (oldValue == newCellValue) return;
    //
    // if (column.columnName == 'qty_received') {
    //   final newQtyReceived = int.tryParse(newCellValue.toString());
    //   double cost = dataGridRows[dataRowIndex].getCells()[5].value;
    //
    //   dataGridRows[dataRowIndex].getCells()[rowColumnIndex.columnIndex] =
    //       DataGridCell<int>(columnName: 'qty_received', value: newQtyReceived);
    //
    //   /// Compute new total per item and update the value in the DataGridRows
    //   double newTotalPerItem = (newQtyReceived ?? 0) * (cost);
    //   dataGridRows[dataRowIndex].getCells()[6] = DataGridCell<double>(columnName: 'total', value: newTotalPerItem);
    //
    //   _context.read<PurchaseOrderFormCubit>().setQuantityReceivedPerItem(
    //         id: _itemsToReceive[dataRowIndex].id!,
    //         qty: newQtyReceived,
    //       );
    // }
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

    final textDisplay = dataGridRow
        .getCells()
        .firstWhereOrNull((DataGridCell dataGridCell) => dataGridCell.columnName == column.columnName)
        ?.value;

    newCellValue = textDisplay;

    return DataGridTextField(
      controller: editingController,
      textDisplay: textDisplay,
      focusNode: focusNode,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      onChanged: (String value) {
        if (value.isNotEmpty) {
          newCellValue = value.toInt();
        } else {
          newCellValue = null;
        }
      },
      submitCell: submitCell,
    );

    // // Text going to display on editable widget
    // final String displayText = dataGridRow
    //         .getCells()
    //         .firstWhere((DataGridCell dataGridCell) => dataGridCell.columnName == column.columnName)
    //         .value
    //         ?.toString() ??
    //     '';
    //
    // newCellValue = displayText;
    //
    // return Container(
    //   alignment: Alignment.centerLeft,
    //   padding: const EdgeInsets.symmetric(horizontal: 16.0),
    //   child: TextField(
    //     controller: editingController..text = displayText,
    //     autofocus: true,
    //     cursorHeight: 15.0,
    //     style: UIStyleText.bodyRegular,
    //     inputFormatters: [FilteringTextInputFormatter.digitsOnly],
    //     decoration: const InputDecoration(
    //       contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
    //       focusedBorder: OutlineInputBorder(
    //         borderRadius: BorderRadius.all(Radius.circular(10.0)),
    //         borderSide: BorderSide(color: UIColors.textGray),
    //       ),
    //     ),
    //     onTapOutside: (event) => submitCell(),
    //     onChanged: (String value) => newCellValue = value.isNotEmpty ? value : null,
    //     onSubmitted: (String value) {
    //       /// Call [CellSubmit] callback to fire the canSubmitCell and
    //       /// onCellSubmit to commit the new value in single place.
    //       submitCell();
    //     },
    //   ),
    // );
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
      padding: const EdgeInsets.all(16),
      child: summaryColumn?.columnName == 'supplier_price'
          ? Text(
              summaryRow.title!,
              textAlign: TextAlign.end,
              style: UIStyleText.labelSemiBold,
            )
          : Text(
              _summaryCellValue(_context, summaryRow.title!, summaryValue),
              style: UIStyleText.labelSemiBold,
            ),
    );
  }

  String _summaryCellValue(BuildContext context, String summaryRowTitle, String summaryValue) {
    if (summaryRowTitle == 'Subtotal') {
      return summaryValue.toPesoString();
    }
    if (summaryRowTitle == 'Tax') {
      return '0'.toPesoString();
    }
    if (summaryRowTitle == 'Discount') {
      return _discount.toPesoString();
    }
    return ((summaryValue.toDouble() ?? 0) - (_discount ?? 0)).toPesoString();
  }
}
