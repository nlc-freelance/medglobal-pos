import 'package:flutter/material.dart';
import 'package:medglobal_admin_portal/features/stock_management/stock_take/domain/entities/stock_take_item.dart';
import 'package:medglobal_shared/medglobal_shared.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:medglobal_admin_portal/core/core.dart';

class UncountedItemsDataGrid extends StatefulWidget {
  const UncountedItemsDataGrid({super.key});

  @override
  State<UncountedItemsDataGrid> createState() => _UncountedItemsDataGridState();
}

class _UncountedItemsDataGridState extends State<UncountedItemsDataGrid> {
  List<StockTakeItem> _uncountedItems = <StockTakeItem>[];
  late DataGridController _dataGridController;
  late UncountedItemsDataSource _uncountedItemsDataSource;
  late CustomSelectionManager customSelectionManager;

  final mock = [
    const StockTakeItem(
      id: 1,
      name: 'Biogesic 500mg',
      sku: 'BG0001',
    ),
    const StockTakeItem(
      id: 2,
      name: 'Biogesic 1000mg',
      sku: 'BG0002',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _dataGridController = DataGridController();
    _uncountedItemsDataSource = UncountedItemsDataSource(mock, context);
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
        const PageSectionTitle(title: 'Uncounted Items'),
        const DataGridToolbar(searchPlaceholder: 'Search variant name'),
        Container(
          decoration: UIStyleContainer.topBorder,
          child: ClipRect(
            clipper: HorizontalBorderClipper(),
            child: SfDataGridTheme(
              data: DataGridUtil.cellNavigationStyle,
              child: SfDataGrid(
                source: _uncountedItemsDataSource,
                columns: DataGridUtil.getColumns(DataGridColumn.ST_UNCOUNTED_ITEMS),
                controller: _dataGridController,
                selectionManager: customSelectionManager,
                shrinkWrapRows: true,
                allowEditing: true,
                navigationMode: GridNavigationMode.cell,
                selectionMode: SelectionMode.single,
                columnWidthMode: ColumnWidthMode.fill,
                headerGridLinesVisibility: GridLinesVisibility.none,
                editingGestureType: EditingGestureType.tap,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class UncountedItemsDataSource extends DataGridSource {
  UncountedItemsDataSource(List<StockTakeItem> itemsToOrder, BuildContext context) {
    _uncountedItems = itemsToOrder;
    _context = context;
    buildDataGridRows();
  }

  List<StockTakeItem> _uncountedItems = [];

  List<DataGridRow> dataGridRows = [];

  late BuildContext _context;

  void buildDataGridRows() => dataGridRows = _uncountedItems.map((item) => item.toDataGridRowUncountedItems()).toList();

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
        'qty_counted' => Container(
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
              'Confirm',
              iconBuilder: (isHover) => Assets.icons.send.setColorOnHover(isHover),
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
    if (column.columnName == 'qty_counted') {
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

    if (column.columnName == 'qty_counted') {
      final newQtyCounted = int.tryParse(newCellValue);

      dataGridRows[dataRowIndex].getCells()[rowColumnIndex.columnIndex] =
          DataGridCell<int>(columnName: 'qty_counted', value: newQtyCounted);
      _uncountedItems[dataRowIndex].copyWith(qtyCounted: newQtyCounted);

      // _context.read<VariantFormCubit>().setPricePerBranch(_uncountedItems[dataRowIndex].id!, newPrice!);
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
}
