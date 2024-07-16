import 'package:flutter/material.dart';
import 'package:medglobal_admin_portal/features/stock_management/stock_transfer/domain/entities/stock_transfer_item.dart';
import 'package:medglobal_shared/medglobal_shared.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:medglobal_admin_portal/core/core.dart';

// isShipped, all columns same qty at source deducted but qty at destination not yet. no more editable field

class ItemsToTransferDataGrid extends StatefulWidget {
  const ItemsToTransferDataGrid({super.key, required this.isShipped});

  final bool isShipped;

  @override
  State<ItemsToTransferDataGrid> createState() => _ItemsToTransferDataGridState();
}

class _ItemsToTransferDataGridState extends State<ItemsToTransferDataGrid> {
  List<StockTransferItem> _itemsToTransfer = <StockTransferItem>[];
  late DataGridController _dataGridController;
  late ItemsToTransferDataSource _itemsToTransferDataSource;
  late CustomSelectionManager customSelectionManager;

  final mock = [
    const StockTransferItem(
      id: 1,
      name: 'Biogesic 500mg',
      sku: 'BG0001',
    ),
    const StockTransferItem(
      id: 2,
      name: 'Biogesic 1000mg',
      sku: 'BG0002',
      qtyToTransfer: 20,
      cost: 30.25,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _dataGridController = DataGridController();
    _itemsToTransferDataSource = ItemsToTransferDataSource(mock, context, widget.isShipped);
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
          title: 'Items to Transfer',
          action: widget.isShipped
              ? null
              : UIButton.text(
                  'Add item',
                  iconBuilder: (isHover) => Assets.icons.add.setColorOnHover(isHover),
                  onClick: () {
                    // Show Dialog with dropdown fetching the products available from the current supplier PO
                    // Add the variant to the data source
                    _itemsToTransferDataSource._itemsToTransfer.add(const StockTransferItem(
                      id: 3,
                      name: 'Biogesic 200mg',
                      sku: 'BG0003',
                    ));
                    _itemsToTransferDataSource.buildDataGridRows();
                    _itemsToTransferDataSource.updateDataGridSource();
                  },
                ),
        ),
        ClipRect(
          clipper: HorizontalBorderClipper(),
          child: SfDataGridTheme(
            data: DataGridUtil.cellNavigationStyle,
            child: SfDataGrid(
              source: _itemsToTransferDataSource,
              columns: DataGridUtil.getColumns(DataGridColumn.STOCK_TRANSFER_ITEMS),
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
                  title: 'Total',
                  columns: [
                    const GridSummaryColumn(
                      name: '',
                      columnName: 'cost',
                      summaryType: GridSummaryType.sum,
                    ),
                    const GridSummaryColumn(
                      name: '',
                      columnName: 'subtotal',
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

class ItemsToTransferDataSource extends DataGridSource {
  ItemsToTransferDataSource(List<StockTransferItem> itemsToTransfer, BuildContext context, bool isShipped) {
    _itemsToTransfer = itemsToTransfer;
    _context = context;
    _isShipped = isShipped;
    buildDataGridRows();
  }

  List<StockTransferItem> _itemsToTransfer = [];

  List<DataGridRow> dataGridRows = [];

  late bool _isShipped;

  late BuildContext _context;

  void buildDataGridRows() => dataGridRows = _itemsToTransfer.map((item) => item.toDataGridRow()).toList();

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
        'qty_to_transfer' => _isShipped
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
    if (column.columnName == 'qty_to_transfer' && !_isShipped) {
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

    if (column.columnName == 'qty_to_transfer') {
      final newQtyToTransfer = int.tryParse(newCellValue);

      dataGridRows[dataRowIndex].getCells()[rowColumnIndex.columnIndex] =
          DataGridCell<int>(columnName: 'qty_to_transfer', value: newQtyToTransfer);
      _itemsToTransfer[dataRowIndex].copyWith(qtyToTransfer: newQtyToTransfer);

      // _context.read<VariantFormCubit>().setPricePerBranch(_itemsToTransfer[dataRowIndex].id!, newPrice!);
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

  @override
  Widget? buildTableSummaryCellWidget(GridTableSummaryRow summaryRow, GridSummaryColumn? summaryColumn,
      RowColumnIndex rowColumnIndex, String summaryValue) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 10),
      child: summaryColumn?.columnName == 'cost'
          ? UIText.labelSemiBold(
              summaryRow.title!,
              align: TextAlign.end,
            )
          : UIText.labelSemiBold(summaryValue),
    );
  }
}
