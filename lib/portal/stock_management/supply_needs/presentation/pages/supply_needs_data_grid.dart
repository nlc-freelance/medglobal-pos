import 'package:flutter/material.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/stock_management/supply_needs/domain/entities/supply_need_item.dart';
import 'package:medglobal_shared/medglobal_shared.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class SupplyNeedsDataGrid extends StatefulWidget {
  const SupplyNeedsDataGrid(this.supplyNeeds, {super.key});

  final List<SupplyNeedItem> supplyNeeds;

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
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 60),
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
            columnWidthMode: ColumnWidthMode.fill,
            headerGridLinesVisibility: GridLinesVisibility.none,
            gridLinesVisibility: GridLinesVisibility.none,
            onQueryRowHeight: (details) => details.getIntrinsicRowHeight(details.rowIndex),
          ),
        ),
      ),
    );
  }
}

class SupplyNeedsDataSource extends DataGridSource {
  SupplyNeedsDataSource(List<SupplyNeedItem> supplyNeeds) {
    _supplyNeeds = supplyNeeds;
    buildDataGridRows();
  }
  List<SupplyNeedItem> _supplyNeeds = [];

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
        _ => UIText.bodyRegular(cell.value.toString()),
      };
}
