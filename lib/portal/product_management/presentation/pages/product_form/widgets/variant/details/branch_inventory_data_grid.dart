import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/product_management/domain/entities/product/branch_inventory.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/bloc/variant_form_cubit/variant_form_cubit.dart';
import 'package:medglobal_shared/medglobal_shared.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class BranchInventoryDataGrid extends StatefulWidget {
  const BranchInventoryDataGrid({super.key});

  @override
  State<BranchInventoryDataGrid> createState() => _BranchInventoryDataGridState();
}

class _BranchInventoryDataGridState extends State<BranchInventoryDataGrid> {
  List<BranchInventory> _branchInventories = <BranchInventory>[];
  late DataGridController _dataGridController;
  late BranchInventoryDataSource _branchInventoryDataSource;
  late CustomSelectionManager customSelectionManager;

  @override
  void initState() {
    super.initState();
    _dataGridController = DataGridController();
    _branchInventories = context.read<VariantFormCubit>().state.branchInventories;
    _branchInventoryDataSource = BranchInventoryDataSource(_branchInventories, context);
    customSelectionManager = CustomSelectionManager(_dataGridController);
  }

  @override
  void dispose() {
    _dataGridController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<VariantFormCubit, VariantFormState>(
      // listenWhen: (previous, current) => previous.variant != current.variant,
      listener: (context, state) {
        _branchInventories = state.branchInventories;

        _branchInventoryDataSource._branchInventories = _branchInventories;
        _branchInventoryDataSource.buildDataGridRows();
        _branchInventoryDataSource.updateDataGridSource();
      },
      child: Container(
        decoration: UIStyleContainer.topBorder,
        child: ClipRect(
          clipper: HorizontalBorderClipper(),
          child: SfDataGridTheme(
            data: DataGridUtil.cellNavigationStyle,
            child: SfDataGrid(
              source: _branchInventoryDataSource,
              columns: DataGridUtil.getColumns(DataGridColumn.BRANCH_INVENTORIES),
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
    );
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
          child: cellBuilder(cell.columnName, cell, row.getCells().first.value),
        );
      }).toList(),
    );
  }

  Widget cellBuilder(String key, DataGridCell cell, int id) => switch (key) {
        'price' => Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: UIColors.background,
              border: Border.all(color: UIColors.borderRegular),
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            ),
            child: UIText.bodyRegular(cell.value.toString()),
          ),
        'qty_on_hand' => id < 0
            ? Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: UIColors.background,
                  border: Border.all(color: UIColors.borderRegular),
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                ),
                child: UIText.bodyRegular(cell.value.toString()))
            : UIText.bodyRegular(cell.value.toString()),
        'action' => LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) => UIButton.text(
              'Delete',
              iconBuilder: (isHover) => Assets.icons.trash.setColorOnHover(isHover),
              onClick: () => context.read<VariantFormCubit>().removeBranchInventory(id),
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
    /// qty_on_hand can only be set upon creation. local values has an id of negative int to distinguish from db values
    if (column.columnName == 'name' ||
        column.columnName == 'action' ||
        (column.columnName == 'qty_on_hand' && dataGridRow.getCells().first.value > 0)) {
      return false;
    } else {
      return true;
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

    if (column.columnName == 'price') {
      final newPrice = double.tryParse(newCellValue) ?? 0;

      dataGridRows[dataRowIndex].getCells()[rowColumnIndex.columnIndex] =
          DataGridCell<double>(columnName: 'price', value: newPrice);
      _branchInventories[dataRowIndex].copyWith(price: newPrice);

      _context.read<VariantFormCubit>().setPricePerBranch(_branchInventories[dataRowIndex].id!, newPrice);
    }
    if (column.columnName == 'qty_on_hand') {
      final newQtyOnHand = int.tryParse(newCellValue) ?? 0;

      dataGridRows[dataRowIndex].getCells()[rowColumnIndex.columnIndex] =
          DataGridCell<int>(columnName: 'qty_on_hand', value: newQtyOnHand);
      _branchInventories[dataRowIndex].copyWith(qtyOnHand: newQtyOnHand);

      _context.read<VariantFormCubit>().setQohPerBranch(_branchInventories[dataRowIndex].id!, newQtyOnHand);
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
          if (column.columnName == 'price') CurrencyInputFormatter(),
          if (column.columnName == 'qty_on_hand') FilteringTextInputFormatter.digitsOnly,
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
}
