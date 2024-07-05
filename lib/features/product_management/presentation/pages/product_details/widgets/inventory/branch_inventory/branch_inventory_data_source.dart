import 'package:flutter/material.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_shared/medglobal_shared.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class BranchInventoryGridModel {
  int id;
  String name;
  double price;
  int qtyOnHand;

  BranchInventoryGridModel({
    required this.id,
    required this.name,
    required this.price,
    required this.qtyOnHand,
  });
}

class BranchInventoryDataSource extends BaseDataSource {
  final List<BranchInventoryGridModel> branches;

  BranchInventoryDataSource({required this.branches});

  void _build() => dataGridRows = branches
      .map(
        (branch) => DataGridRow(
          cells: [
            DataGridCell<int>(columnName: 'id', value: branch.id),
            DataGridCell<String>(columnName: 'name', value: branch.name),
            DataGridCell<double>(columnName: 'price', value: branch.price),
            DataGridCell<int>(columnName: 'qtyOnHand', value: branch.qtyOnHand),
          ],
        ),
      )
      .toList();

  @override
  List<DataGridRow> build() {
    _build();
    return dataGridRows;
  }

  @override
  List<DataGridRow> get rows => dataGridRows;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
      cells: row.getCells().map<Widget>((cell) {
        return Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: cellBuilder(cell.columnName, cell),
        );
      }).toList(),
    );
  }

  dynamic newCellValue;
  TextEditingController editingController = TextEditingController();

  @override
  Future<void> onCellSubmit(DataGridRow dataGridRow, RowColumnIndex rowColumnIndex, GridColumn column) {
    // final dynamic oldValue = dataGridRow
    //         .getCells()
    //         .firstWhere((DataGridCell dataGridCell) => dataGridCell.columnName == column.columnName)
    //         .value ??
    //     Strings.empty;

    final int dataRowIndex = dataGridRows.indexOf(dataGridRow);

    // if (newCellValue == null || oldValue == newCellValue) {
    //   return super.onCellSubmit(dataGridRow, rowColumnIndex, column);
    // }

    if (column.columnName == 'price') {
      dataGridRows[dataRowIndex].getCells()[rowColumnIndex.columnIndex] =
          DataGridCell<int>(columnName: 'price', value: newCellValue);
      branches[dataRowIndex].price = newCellValue as double;
    } else if (column.columnName == 'qtyOnHand') {
      dataGridRows[dataRowIndex].getCells()[rowColumnIndex.columnIndex] =
          DataGridCell<String>(columnName: 'qtyOnHand', value: newCellValue);
      branches[dataRowIndex].qtyOnHand = newCellValue as int;
    }

    return super.onCellSubmit(dataGridRow, rowColumnIndex, column);
  }

  @override
  Widget? buildEditWidget(
    DataGridRow dataGridRow,
    RowColumnIndex rowColumnIndex,
    GridColumn column,
    CellSubmit submitCell,
  ) {
    // Text going to display on editable widget
    final String displayText = dataGridRow
            .getCells()
            .firstWhere((DataGridCell dataGridCell) => dataGridCell.columnName == column.columnName)
            .value
            ?.toString() ??
        Strings.empty;

    // The new cell value must be reset.
    // To avoid committing the [DataGridCell] value that was previously edited
    // into the current non-modified [DataGridCell].
    newCellValue = null;

    final bool isDoubleType = column.columnName == 'price';
    final bool isNumericType = column.columnName == 'qtyOnHand';

    return Container(
      padding: const EdgeInsets.all(8.0),
      alignment: isNumericType ? Alignment.centerRight : Alignment.centerLeft,
      child: TextField(
        autofocus: true,
        controller: editingController..text = displayText,
        textAlign: isNumericType ? TextAlign.right : TextAlign.left,
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 16.0),
        ),
        onChanged: (String value) {
          if (value.isNotEmpty) {
            if (isNumericType) {
              newCellValue = int.parse(value);
            } else if (isDoubleType) {
              newCellValue = double.parse(value);
            } else {
              newCellValue = value;
            }
          } else {
            newCellValue = null;
          }
        },
        onSubmitted: (String value) {
          // In Mobile Platform.
          // Call [CellSubmit] callback to fire the canSubmitCell and
          // onCellSubmit to commit the new value in single place.
          submitCell();
        },
      ),
    );
  }

  @override
  void update() => notifyListeners();

  Widget cellBuilder(String key, DataGridCell cell) => switch (key) {
        'action' => UIButton.text(
            'Delete',
            iconBuilder: (isHover) => Assets.icons.trash.setColorOnHover(isHover),
            onClick: () {
              // TODO: Add Product - Delete a branch
            },
          ),
        'suppliers' => Text(cell.value.toString().replaceAll(RegExp(r'[\[\]]'), '')),
        _ => UIText.bodyRegular(cell.value.toString()),
      };
}
