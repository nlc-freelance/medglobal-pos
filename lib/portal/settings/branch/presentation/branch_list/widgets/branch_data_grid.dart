import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/domain/branch1.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/presentation/branch_list/widgets/branch_data_grid_empty.dart';
import 'package:medglobal_shared/medglobal_shared.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class BranchDataGrid extends StatefulWidget {
  const BranchDataGrid({super.key});

  @override
  State<BranchDataGrid> createState() => _BranchDataGridState();
}

class _BranchDataGridState extends State<BranchDataGrid> {
  late DataGridController _dataGridController;
  late BranchDataGridSource _branchDataGridSource;

  @override
  void initState() {
    super.initState();
    _dataGridController = DataGridController();
    _branchDataGridSource = BranchDataGridSource(
      [
        const Branch1(
          id: 1,
          name: 'Martinez',
          street: '5 Street Emerald',
          barangay: 'Ortigas Avenue',
          city: 'Pasig City',
          province: 'Pasig',
          postalCode: '1101',
          country: 'Philippines',
          phone: '09368434557',
          businessRegistrationNumber: '123456',
        )
      ],
      context,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: DataGridUtil.verticalBorder,
      child: SfDataGridTheme(
        data: DataGridUtil.rowNavigationStyle,
        child: SfDataGrid(
          source: _branchDataGridSource,
          columns: DataGridUtil.getColumns(DataGridColumn.branches),
          controller: _dataGridController,
          shrinkWrapRows: true,
          navigationMode: GridNavigationMode.row,
          columnWidthMode: ColumnWidthMode.fill,
          headerRowHeight: 38,
          headerGridLinesVisibility: GridLinesVisibility.none,
          gridLinesVisibility: GridLinesVisibility.none,
          footerHeight: 280,
          footer: _branchDataGridSource.rows.isEmpty ? const BranchDataGridEmpty() : null,
        ),
      ),
    );
  }
}

class BranchDataGridSource extends DataGridSource with DialogMixin {
  BranchDataGridSource(List<Branch1> branches, BuildContext context) {
    _branches = branches;
    _context = context;
    buildDataGridRows();
  }

  late BuildContext _context;

  List<Branch1> _branches = [];

  List<DataGridRow> dataGridRows = [];

  void update() => notifyListeners();

  void buildDataGridRows() => dataGridRows = _branches.map((branch) => branch.toDataGridRow()).toList();

  @override
  List<DataGridRow> get rows => dataGridRows;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
      cells: row.getCells().map<Widget>((cell) {
        return Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: cellBuilder(
            colName: cell.columnName,
            cell: cell,
            branchName: row.getCells().firstWhere((e) => e.columnName == 'branch_name').value,
            branchId: row.getCells().first.value,
            rowIdx: row.id - 1,
          ),
        );
      }).toList(),
    );
  }

  Widget cellBuilder({
    required String colName,
    required DataGridCell cell,
    required String branchName,
    required int branchId,
    required int rowIdx,
  }) =>
      switch (colName) {
        'branch_name' => HoverBuilder(
            builder: (isHover) => InkWell(
              onTap: () => _onEditBranch(branchId),
              hoverColor: UIColors.transparent,
              child: UIText.dataGridText(
                cell.value.toString(),
                color: isHover ? UIColors.buttonPrimaryHover : UIColors.textRegular,
                textDecoration: TextDecoration.underline,
              ),
            ),
          ),
        _ => UIText.dataGridText(cell.value.toString()),
      };

  void _onEditBranch(branchId) {
    // Go to details page
    // In the details page, fetch the branch by the given id and init it in the BranchFormCubit
    _context.goNamed(
      SideMenuTreeItem.branchDetails.name,
      pathParameters: {'id': branchId.toString()},
    );
  }
}
