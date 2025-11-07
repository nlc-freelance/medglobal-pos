import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/widgets/data_grid/data_grid.dart';
import 'package:medglobal_admin_portal/portal/product_management/domain/entities/branch_inventory/branch_inventory.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/cubit/variant_form_cubit/variant_form_cubit.dart';
import 'package:medglobal_shared/medglobal_shared.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class BranchInventoryDataGrid extends StatefulWidget {
  const BranchInventoryDataGrid({super.key});

  @override
  State<BranchInventoryDataGrid> createState() => _VariantBranchDataGridState();
}

class _VariantBranchDataGridState extends State<BranchInventoryDataGrid> {
  List<BranchInventory> _branchInventories = <BranchInventory>[];
  late DataGridController _dataGridController;
  late BranchInventoryDataSource _branchInventoryDataSource;
  late CustomSelectionManager customSelectionManager;

  @override
  void initState() {
    super.initState();
    _dataGridController = DataGridController();
    _branchInventories = context.read<VariantFormCubit>().state.variant.branchInventories ?? [];
    _branchInventoryDataSource = BranchInventoryDataSource(_branchInventories, context);
    customSelectionManager = CustomSelectionManager(_dataGridController);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<VariantFormCubit, VariantFormState>(
      listener: (context, state) {
        _branchInventories = state.variant.branchInventories ?? [];

        _branchInventoryDataSource._branchInventories = _branchInventories;
        _branchInventoryDataSource.buildDataGridRows();

        // Since we are only using BlocListener here, call this to rebuild the datagrid
        _branchInventoryDataSource.updateDataGridSource();
      },
      child: Container(
        decoration: DataGridUtil.verticalBorder,
        child: SfDataGridTheme(
          data: DataGridUtil.cellNavigationStyle,
          child: SfDataGrid(
            source: _branchInventoryDataSource,
            columns: DataGridUtil.getColumns(DataGridColumn.branchInventories),
            controller: _dataGridController,
            selectionManager: customSelectionManager,
            shrinkWrapRows: true,
            allowEditing: true,
            editingGestureType: EditingGestureType.tap,
            selectionMode: SelectionMode.single,
            navigationMode: GridNavigationMode.cell,
            columnWidthMode: ColumnWidthMode.fill,
            headerRowHeight: 38,
            headerGridLinesVisibility: GridLinesVisibility.none,
            gridLinesVisibility: GridLinesVisibility.none,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _dataGridController.dispose();
    super.dispose();
  }
}

class CustomSelectionManager extends RowSelectionManager {
  CustomSelectionManager(this.dataGridController);
  DataGridController dataGridController;
  @override
  Future<void> handleKeyEvent(KeyEvent keyEvent) async {
    if (keyEvent.logicalKey == LogicalKeyboardKey.tab ||
        keyEvent.logicalKey == LogicalKeyboardKey.arrowDown ||
        keyEvent.logicalKey == LogicalKeyboardKey.arrowUp ||
        keyEvent.logicalKey == LogicalKeyboardKey.arrowLeft ||
        keyEvent.logicalKey == LogicalKeyboardKey.arrowRight) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        dataGridController.beginEdit(dataGridController.currentCell);
      });
    }
    super.handleKeyEvent(keyEvent);
  }
}

class BranchInventoryDataSource extends DataGridSource {
  BranchInventoryDataSource(List<BranchInventory> branchInventories, BuildContext context) {
    _branchInventories = branchInventories;
    _context = context;
    buildDataGridRows();
  }

  List<BranchInventory> _branchInventories = [];

  List<DataGridRow> dataGridRows = [];

  late BuildContext _context;

  void buildDataGridRows() => dataGridRows = _branchInventories.map((inventory) => inventory.toDataGridRow()).toList();

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
            branchInventoryId: row.getCells().first.value,
          ),
        );
      }).toList(),
    );
  }

  Widget _buildCell({
    required String colName,
    required DataGridCell cell,
    required int branchInventoryId,
  }) =>
      switch (colName) {
        'price' => Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: UIColors.background,
              border: Border.all(color: UIColors.borderRegular),
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            ),
            child: cell.value == null
                ? UIText.dataGridText('Enter price', color: UIColors.textMuted)
                : UIText.dataGridText(cell.value.toString()),
          ),
        'qty_on_hand' => branchInventoryId.isNegative
            ? Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: UIColors.background,
                  border: Border.all(color: UIColors.borderRegular),
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                ),
                child: cell.value == null
                    ? UIText.dataGridText('Enter QOH', color: UIColors.textMuted)
                    : UIText.dataGridText(cell.value.toString()),
              )
            : UIText.dataGridText((cell.value).toString()),
        'action' => LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) => UIButton.text(
              'Delete',
              iconBuilder: (isHover) => Assets.icons.trash.setColorOnHover(isHover),
              onClick: () => context.read<VariantFormCubit>().removeBranchInventory(branchInventoryId),
            ),
          ),
        _ => UIText.dataGridText(cell.value.toString()),
      };

  /// Helps to hold the new value of all editable widget.
  /// Based on the new value we will commit the new value into the corresponding
  /// [DataGridCell] on [onSubmitCell] method.
  dynamic newCellValue;

  /// Help to control the editable text in [TextField] widget.
  TextEditingController editingController = TextEditingController();

  /// Help track when user taps outside, so we can submit the cell.
  FocusNode focusNode = FocusNode();

  bool isColumnPrice(GridColumn column) => column.columnName == 'price';

  bool isColumnQOH(GridColumn column) => column.columnName == 'qty_on_hand';

  @override
  bool onCellBeginEdit(
    DataGridRow dataGridRow,
    RowColumnIndex rowColumnIndex,
    GridColumn column,
  ) {
    final isBranchInventoryDraft = (dataGridRow.getCells().first.value as int).isNegative;
    if (isColumnPrice(column) || (isColumnQOH(column) && isBranchInventoryDraft)) {
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
    final branchInventoryId = _branchInventories[rowIndex].id;

    if (oldValue == newCellValue) return;

    /// Visually reflect the updated value in the data grid.
    ///
    /// - `dataGridRows` is your list of DataGridRow objects representing what's shown in the grid.
    /// - `rowIndex` refers to the index of the row currently being edited.
    /// - `.getCells()` gets the list of DataGridCell objects in that row.
    /// - `columnIndex` gets the specific column being edited (based on the column index).
    /// Replace that cell with a new DataGridCell<double> using the new value.
    ///
    /// Persist the updated value to the underlying state in the FormCubit.
    /// This keeps the state in sync with the grid changes and ensures consistency when saving the form.

    if (isColumnPrice(column)) {
      dataGridRows[rowIndex].getCells()[columnIndex] = DataGridCell<double>(
        columnName: 'price',
        value: newCellValue,
      );
      _context.read<VariantFormCubit>().setPricePerBranch(branchInventoryId, newCellValue);
    }
    if (isColumnQOH(column)) {
      dataGridRows[rowIndex].getCells()[columnIndex] = DataGridCell<int>(
        columnName: 'qty_on_hand',
        value: newCellValue,
      );
      _context.read<VariantFormCubit>().setQohPerBranch(branchInventoryId, newCellValue);
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

    final isPriceColumn = isColumnPrice(column);
    final isQOHColumn = isColumnQOH(column);

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
        if (isPriceColumn) NumberInputFormatter(),
        if (isQOHColumn) FilteringTextInputFormatter.digitsOnly,
      ],
      onChanged: (String value) {
        if (value.isNotEmpty) {
          if (isPriceColumn) {
            newCellValue = value.toDouble();
          } else if (isQOHColumn) {
            newCellValue = value.toInt();
          }
        } else {
          newCellValue = null;
        }
      },
      submitCell: submitCell,
    );
  }
}
