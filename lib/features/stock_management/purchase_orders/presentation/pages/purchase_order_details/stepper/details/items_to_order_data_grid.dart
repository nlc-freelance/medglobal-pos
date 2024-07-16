import 'package:flutter/material.dart';
import 'package:medglobal_admin_portal/features/stock_management/purchase_orders/domain/entities/purchase_order_item.dart';
import 'package:medglobal_admin_portal/features/stock_management/purchase_orders/presentation/pages/purchase_order_details/stepper/details/add_item.dart';
import 'package:medglobal_shared/medglobal_shared.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:medglobal_admin_portal/core/core.dart';

class ItemsToOrderDataGrid extends StatefulWidget {
  const ItemsToOrderDataGrid({super.key});

  @override
  State<ItemsToOrderDataGrid> createState() => _ItemsToOrderDataGridState();
}

class _ItemsToOrderDataGridState extends State<ItemsToOrderDataGrid> {
  List<PurchaseOrderItem> _itemsToOrder = <PurchaseOrderItem>[];
  late DataGridController _dataGridController;
  late ItemsToOrderDataSource _itemsToOrderDataSource;
  late CustomSelectionManager customSelectionManager;

  final mock = [
    const PurchaseOrderItem(
      id: 1,
      name: 'Biogesic 500mg',
      sku: 'BG0001',
      qtyOnHand: 5,
      supplierPrice: 20,
      total: 400,
    ),
    const PurchaseOrderItem(
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
    _itemsToOrderDataSource = ItemsToOrderDataSource(mock, context);
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
          title: 'Items to Order',
          action: AddItem(
            onSelectItems: (products) {
              // Add the product/variant to the data source here
              // final itemsToAdd = products.map((product) => PurchaseOrderItem());
              // _itemsToOrderDataSource._itemsToOrder.addAll(const PurchaseOrderItem(

              _itemsToOrderDataSource._itemsToOrder.add(const PurchaseOrderItem(
                id: 3,
                name: 'Biogesic 200mg',
                sku: 'BG0003',
                qtyOnHand: 5,
                supplierPrice: 20,
                total: 400,
              ));
              _itemsToOrderDataSource.buildDataGridRows();
              _itemsToOrderDataSource.updateDataGridSource();
            },
          ),
        ),
        ClipRect(
          clipper: HorizontalBorderClipper(),
          child: SfDataGridTheme(
            data: DataGridUtil.cellNavigationStyle,
            child: SfDataGrid(
              source: _itemsToOrderDataSource,
              columns: DataGridUtil.getColumns(DataGridColumn.PO_ITEMS),
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

class ItemsToOrderDataSource extends DataGridSource {
  ItemsToOrderDataSource(List<PurchaseOrderItem> itemsToOrder, BuildContext context) {
    _itemsToOrder = itemsToOrder;
    _context = context;
    buildDataGridRows();
  }

  List<PurchaseOrderItem> _itemsToOrder = [];

  List<DataGridRow> dataGridRows = [];

  late BuildContext _context;

  void buildDataGridRows() => dataGridRows = _itemsToOrder.map((item) => item.toDataGridRowItems()).toList();

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
        'qty_to_order' || 'supplier_price' => Container(
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
    if (column.columnName == 'qty_to_order' || column.columnName == 'supplier_price') {
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

    if (column.columnName == 'qty_to_order') {
      final newQtyToOrder = int.tryParse(newCellValue);

      dataGridRows[dataRowIndex].getCells()[rowColumnIndex.columnIndex] =
          DataGridCell<int>(columnName: 'qty_to_order', value: newQtyToOrder);
      _itemsToOrder[dataRowIndex].copyWith(qtyToOrder: newQtyToOrder);

      // _context.read<VariantFormCubit>().setPricePerBranch(_itemsToOrder[dataRowIndex].id!, newPrice!);
    }
    if (column.columnName == 'supplier_price') {
      final newSupplierPrice = double.tryParse(newCellValue);

      dataGridRows[dataRowIndex].getCells()[rowColumnIndex.columnIndex] =
          DataGridCell<double>(columnName: 'supplier_price', value: newSupplierPrice);
      _itemsToOrder[dataRowIndex].copyWith(supplierPrice: newSupplierPrice);

      // _context.read<VariantFormCubit>().setQohPerBranch(_itemsToOrder[dataRowIndex].id!, newQtyOnHand!);
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
      return TextField(
        controller: title == 'Tax' ? taxController : discountController,
        cursorHeight: 10.0,
        onChanged: (value) {
          /// copyWith to the PurchaseOrderItem
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
