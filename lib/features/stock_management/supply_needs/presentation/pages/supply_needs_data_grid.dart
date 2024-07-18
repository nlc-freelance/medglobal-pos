import 'package:flutter/material.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/features/stock_management/supply_needs/domain/entities/supply_need.dart';
import 'package:medglobal_shared/medglobal_shared.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class SupplyNeedsDataGrid extends StatefulWidget {
  const SupplyNeedsDataGrid(this.supplyNeeds, {super.key});

  final List<SupplyNeed> supplyNeeds;

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
    _supplyNeedsDataSource = SupplyNeedsDataSource(widget.supplyNeeds);
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
            // allowExpandCollapseGroup: true,
            columnWidthMode: ColumnWidthMode.fill,
            headerGridLinesVisibility: GridLinesVisibility.none,
            gridLinesVisibility: GridLinesVisibility.none,
            groupCaptionTitleFormat: '{Key} ({ItemsCount})',
            onQueryRowHeight: (details) => details.getIntrinsicRowHeight(details.rowIndex),
          ),
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
    return Container(
      decoration: rowColumnIndex.rowIndex == 1
          ? const BoxDecoration(color: UIColors.background)
          : UIStyleContainer.topBorder.copyWith(color: UIColors.background),
      padding: const EdgeInsets.only(left: 15, bottom: 0, top: 16),
      child: UIText.labelSemiBold(summaryValue, color: UIColors.textDark),
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
