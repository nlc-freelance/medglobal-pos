import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:medglobal_admin_portal/core/blocs/paginated_list_bloc/paginated_list_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/models/models.dart';
import 'package:medglobal_admin_portal/core/widgets/data_grid/data_grid.dart';
import 'package:medglobal_admin_portal/core/widgets/page/page.dart';
import 'package:medglobal_admin_portal/portal/employee_management/domain/entities/employee.dart';
import 'package:medglobal_admin_portal/portal/employee_management/presentation/cubit/employee_list_filter_cubit/employee_list_filter_cubit.dart';
import 'package:medglobal_admin_portal/portal/employee_management/presentation/pages/employee_form/widgets/sections/access_control/role_section.dart';
import 'package:medglobal_admin_portal/portal/employee_management/presentation/pages/employee_list/widgets/data_grid/employee_data_grid_empty.dart';
import 'package:medglobal_shared/medglobal_shared.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class EmployeeDataGrid extends StatefulWidget {
  const EmployeeDataGrid({super.key});

  @override
  State<EmployeeDataGrid> createState() => _EmployeeDataGridState();
}

class _EmployeeDataGridState extends State<EmployeeDataGrid> {
  late DataGridController _dataGridController;
  late EmployeeDataGridSource _employeeDataGridSource;

  @override
  void initState() {
    super.initState();
    _dataGridController = DataGridController();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaginatedListBloc<Employee>, PaginatedListState<Employee>>(
      builder: (context, state) {
        return state.maybeWhen(
          loaded: (data) {
            final paginatedData = data;
            _employeeDataGridSource = EmployeeDataGridSource(context, employees: paginatedData.items);

            return Column(
              children: [
                Expanded(
                  child: Container(
                    decoration: DataGridUtil.verticalBorder,
                    child: SfDataGridTheme(
                      data: DataGridUtil.rowNavigationStyle,
                      child: SfDataGrid(
                        source: _employeeDataGridSource,
                        columns: DataGridUtil.getColumns(DataGridColumn.employees),
                        controller: _dataGridController,
                        shrinkWrapRows: true,
                        navigationMode: GridNavigationMode.row,
                        columnWidthMode: ColumnWidthMode.fill,
                        headerRowHeight: 38,
                        headerGridLinesVisibility: GridLinesVisibility.none,
                        gridLinesVisibility: GridLinesVisibility.none,
                        footerHeight: 280,
                        footer: _employeeDataGridSource.rows.isEmpty ? const EmployeeDataGridEmpty() : null,
                      ),
                    ),
                  ),
                ),
                const UIVerticalSpace(12),
                if (paginatedData.hasItems)
                  BlocSelector<EmployeeListFilterCubit, EmployeeListFilterState, PageQuery>(
                    selector: (state) => state.toPageQuery,
                    builder: (context, query) {
                      return DataGridPagination<Employee>(
                        paginatedData,
                        onPageChanged: ({required page, required size}) {
                          context.read<EmployeeListFilterCubit>().setPageAndSize(page, size);
                          context.read<PaginatedListBloc<Employee>>().add(PaginatedListEvent<Employee>.fetch(
                                query: query,
                              ));
                        },
                      );
                    },
                  ),
              ],
            );
          },
          failure: (message) => FailureView(message),
          orElse: () => DataGridLoading(
            columns: DataGridUtil.getColumns(DataGridColumn.employees),
            source: _employeeDataGridSource = EmployeeDataGridSource(context, employees: []),
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

class EmployeeDataGridSource extends DataGridSource with DialogMixin {
  EmployeeDataGridSource(BuildContext context, {required List<Employee> employees}) {
    _employees = employees;
    _context = context;
    buildDataGridRows();
  }

  late BuildContext _context;
  List<Employee> _employees = [];
  List<DataGridRow> dataGridRows = [];

  void buildDataGridRows() => dataGridRows = _employees.map((employee) => employee.toDataGridRow()).toList();

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
            employeeId: row.getCells().first.value,
          ),
        );
      }).toList(),
    );
  }

  Widget cellBuilder({
    required String colName,
    required DataGridCell cell,
    required int employeeId,
  }) =>
      switch (colName) {
        'employee_name' => HoverBuilder(
            builder: (isHover) => InkWell(
              onTap: () => _onEditEmployee(employeeId),
              hoverColor: UIColors.transparent,
              child: UIText.dataGridText(
                cell.value.toString(),
                color: isHover ? UIColors.buttonPrimaryHover : UIColors.textRegular,
                textDecoration: TextDecoration.underline,
              ),
            ),
          ),
        'role' => Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: (cell.value as EmployeeRole).colors.entries.first.key,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  (cell.value as EmployeeRole).name.capitalized,
                  style: UIStyleText.hint.copyWith(
                    color: (cell.value as EmployeeRole).colors.entries.first.value,
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        _ => UIText.dataGridText(cell.value.toString()),
      };

  void _onEditEmployee(employeeId) {
    _context.goNamed(
      SideMenuTreeItem.employeeDetails.name,
      pathParameters: {'id': employeeId.toString()},
    );
  }
}
