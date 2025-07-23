import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:medglobal_admin_portal/core/blocs/paginated_list_bloc/paginated_list_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/models/models.dart';
import 'package:medglobal_admin_portal/core/widgets/data_grid/data_grid.dart';
import 'package:medglobal_admin_portal/core/widgets/page/page.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/domain/entity/branch.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/presentation/pages/branch_list/widgets/data_grid/branch_data_grid_empty.dart';
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
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaginatedListBloc<Branch>, PaginatedListState<Branch>>(
      builder: (context, state) {
        return state.maybeWhen(
          loaded: (data) {
            final paginatedData = data;
            _branchDataGridSource = BranchDataGridSource(context, branches: paginatedData.items);

            return Column(
              children: [
                Expanded(
                  child: Container(
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
                  ),
                ),
                const UIVerticalSpace(12),
                if (paginatedData.hasItems)
                  DataGridPagination<Branch>(
                    paginatedData,
                    onPageChanged: ({required page, required size}) =>
                        context.read<PaginatedListBloc<Branch>>().add(PaginatedListEvent<Branch>.fetch(
                              query: PageQuery(
                                page: page,
                                size: size,
                              ),
                            )),
                  ),
              ],
            );
          },
          failure: (message) => FailureView(message),
          orElse: () => DataGridLoading(
            columns: DataGridUtil.getColumns(DataGridColumn.branches),
            source: _branchDataGridSource = BranchDataGridSource(context, branches: []),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _dataGridController.dispose();
    super.dispose();
  }
}

class BranchDataGridSource extends DataGridSource with DialogMixin {
  BranchDataGridSource(BuildContext context, {required List<Branch> branches}) {
    _branches = branches;
    _context = context;
    buildDataGridRows();
  }

  late BuildContext _context;
  List<Branch> _branches = [];
  List<DataGridRow> dataGridRows = [];

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
            branchId: row.getCells().first.value,
          ),
        );
      }).toList(),
    );
  }

  Widget cellBuilder({
    required String colName,
    required DataGridCell cell,
    required int branchId,
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
