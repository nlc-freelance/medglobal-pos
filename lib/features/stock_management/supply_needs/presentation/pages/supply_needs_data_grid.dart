import 'package:flutter/material.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/features/branches/domain/branch.dart';
import 'package:medglobal_admin_portal/features/stock_management/supply_needs/domain/supply_need.dart';
import 'package:medglobal_admin_portal/features/supplier_management/domain/entities/supplier.dart';
import 'package:medglobal_shared/medglobal_shared.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class SupplyNeedsDataGrid extends StatefulWidget {
  const SupplyNeedsDataGrid({super.key});

  @override
  State<SupplyNeedsDataGrid> createState() => _SupplyNeedsDataGridState();
}

class _SupplyNeedsDataGridState extends State<SupplyNeedsDataGrid> {
  late DataGridController _dataGridController;
  late SupplyNeedsDataSource _supplyNeedsDataSource;

  @override
  void initState() {
    super.initState();
    _dataGridController = DataGridController();
    _supplyNeedsDataSource = SupplyNeedsDataSource(supplyNeedsMock);
    _supplyNeedsDataSource.addColumnGroup(ColumnGroup(name: 'branch', sortGroupRows: false));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: UIStyleContainer.topBorder,
      child: ClipRect(
        clipper: HorizontalBorderClipper(),
        child: SfDataGridTheme(
          data: DataGridUtil.baseStyle,
          child: SfDataGrid(
              source: _supplyNeedsDataSource,
              controller: _dataGridController,
              columns: DataGridUtil.getColumns(DataGridColumn.SUPPLY_NEEDS),
              shrinkWrapRows: true,
              allowExpandCollapseGroup: true,
              navigationMode: GridNavigationMode.row,
              columnWidthMode: ColumnWidthMode.fill,
              headerGridLinesVisibility: GridLinesVisibility.none,
              groupCaptionTitleFormat: '{Key} ({ItemsCount})',
              onQueryRowHeight: (details) => details.getIntrinsicRowHeight(details.rowIndex)),
        ),
      ),
    );
  }
}

class SupplyNeedsDataSource extends DataGridSource {
  SupplyNeedsDataSource(List<SupplyNeed> supplyNeeds) {
    _supplyNeeds = supplyNeeds;
    buildDataGridRows();
  }
  List<SupplyNeed> _supplyNeeds = [];

  List<DataGridRow> dataGridRows = [];

  void buildDataGridRows() => dataGridRows = _supplyNeeds.map((supplyNeed) => supplyNeed.toDataGridRow()).toList();

  void updateDataGridSource() => notifyListeners();

  @override
  List<DataGridRow> get rows => dataGridRows;

  @override
  Widget? buildGroupCaptionCellWidget(RowColumnIndex rowColumnIndex, String summaryValue) {
    return HoverBuilder(
      builder: (isHover) => Container(
        color: UIColors.background,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
        child: UIText.labelSemiBold(summaryValue, color: UIColors.textRegular),
      ),
    );
  }

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
      cells: row.getCells().map<Widget>((cell) {
        return Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: _buildCell(cell.columnName, cell, row.getCells().first.value),
        );
      }).toList(),
    );
  }

  Widget _buildCell(String column, DataGridCell cell, int id) => switch (column) {
        'suppliers' => Text(cell.value.toString().replaceAll(RegExp(r'[\[\]]'), '')),
        'action' => UIPopupMenuButton<SupplyNeedsAction>.icon(
            icon: Assets.icons.more.svg(),
            menu: SupplyNeedsAction.values,
            menuAsString: (option) => option.label,
            onSelect: (action) {
              if (action == SupplyNeedsAction.NEW_PURCHASE_ORDER) {
                AppRouter.router.goNamed(SideMenuTreeItem.NEW_PURCHASE_ORDER.name);
                // Supplier should be autopopulated in step 1
              }
              if (action == SupplyNeedsAction.NEW_STOCK_TRANSFER) {
                AppRouter.router.goNamed(SideMenuTreeItem.NEW_STOCK_TRANSFER.name);
                // Destination branch should be autopopulated in step 1
              }
            },
          ),
        _ => UIText.bodyRegular(cell.value.toString()),
      };
}

final supplyNeedsMock = [
  const SupplyNeed(
    id: 1,
    branch: Branch(id: 1, name: 'Manila Branch'),
    variantName: 'Product Variant 1',
    sku: 'PDV0001',
    qty: 10,
    warningStock: 20,
    idealStock: 50,
    suppliers: [],
  ),
  const SupplyNeed(
    id: 2,
    branch: Branch(id: 1, name: 'Manila Branch'),
    variantName: 'Product Variant 2',
    sku: 'PDV0002',
    qty: 15,
    warningStock: 20,
    idealStock: 80,
    suppliers: [],
  ),
  const SupplyNeed(
    id: 3,
    branch: Branch(id: 2, name: 'Pasig Branch'),
    variantName: 'Product 1 Variant 1',
    sku: 'PDV0011',
    qty: 10,
    warningStock: 30,
    idealStock: 50,
    suppliers: [
      Supplier(id: 1, name: 'ABC Mart'),
      Supplier(id: 2, name: 'UNILAB'),
    ],
  ),
  const SupplyNeed(
    id: 4,
    branch: Branch(id: 2, name: 'Pasig Branch'),
    variantName: 'Product 1 Variant 2',
    sku: 'PDV0022',
    qty: 15,
    warningStock: 30,
    idealStock: 70,
    suppliers: [],
  ),
];
