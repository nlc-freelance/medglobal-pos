import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/blocs/paginated_list_bloc/paginated_list_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/widgets/data_grid/data_grid.dart';
import 'package:medglobal_admin_portal/core/widgets/page/page.dart';
import 'package:medglobal_admin_portal/portal/settings/register/presentation/bloc/register_bloc/register_bloc.dart';
import 'package:medglobal_admin_portal/portal/settings/register/presentation/cubit/register_form_cubit.dart';
import 'package:medglobal_admin_portal/portal/settings/register/presentation/pages/register_list/widgets/data_grid/register_data_grid_empty.dart';
import 'package:medglobal_admin_portal/portal/settings/register/presentation/pages/register_form/register_form_dialog.dart';
import 'package:medglobal_admin_portal/portal/settings/register/domain/entity/register.dart';
import 'package:medglobal_shared/medglobal_shared.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class RegisterDataGrid extends StatefulWidget {
  const RegisterDataGrid({super.key});

  @override
  State<RegisterDataGrid> createState() => _RegisterDataGridState();
}

class _RegisterDataGridState extends State<RegisterDataGrid> {
  late DataGridController _dataGridController;
  late RegisterDataGridSource _registerDataGridSource;

  @override
  void initState() {
    super.initState();
    _dataGridController = DataGridController();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaginatedListBloc<Register>, PaginatedListState<Register>>(
      builder: (context, state) {
        return state.maybeWhen(
          loaded: (data) {
            final paginatedData = data;
            _registerDataGridSource = RegisterDataGridSource(context, registers: paginatedData.items);

            return Column(
              children: [
                Expanded(
                  child: Container(
                    decoration: DataGridUtil.verticalBorder,
                    child: SfDataGridTheme(
                      data: DataGridUtil.rowNavigationStyle,
                      child: SfDataGrid(
                        source: _registerDataGridSource,
                        columns: DataGridUtil.getColumns(DataGridColumn.registers),
                        controller: _dataGridController,
                        shrinkWrapRows: true,
                        navigationMode: GridNavigationMode.row,
                        columnWidthMode: ColumnWidthMode.fill,
                        headerRowHeight: 38,
                        headerGridLinesVisibility: GridLinesVisibility.none,
                        gridLinesVisibility: GridLinesVisibility.none,
                        footerHeight: 280,
                        footer: _registerDataGridSource.rows.isEmpty ? const RegisterDataGridEmpty() : null,
                      ),
                    ),
                  ),
                ),
                const UIVerticalSpace(12),
                if (paginatedData.hasItems)
                  DataGridPagination<Register>(
                    paginatedData,
                    onPageChanged: ({page, size}) =>
                        context.read<PaginatedListBloc<Register>>().add(PaginatedListEvent<Register>.fetch(
                              page: page,
                              size: size,
                            )),
                  ),
              ],
            );
          },
          failure: (message) => FailureView(message),
          orElse: () => DataGridLoading(
            columns: DataGridUtil.getColumns(DataGridColumn.registers),
            source: _registerDataGridSource = RegisterDataGridSource(context, registers: []),
          ),
        );
      },
    );
  }
}

class RegisterDataGridSource extends DataGridSource with DialogMixin {
  RegisterDataGridSource(BuildContext context, {required List<Register> registers}) {
    _registers = registers;
    _context = context;
    buildDataGridRows();
  }

  late BuildContext _context;

  List<Register> _registers = [];

  List<DataGridRow> dataGridRows = [];

  void update() => notifyListeners();

  void buildDataGridRows() => dataGridRows = _registers.map((register) => register.toDataGridRow()).toList();

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
            register: _registers.firstWhere((register) => register.id == row.getCells().first.value),
          ),
        );
      }).toList(),
    );
  }

  Widget cellBuilder({
    required String colName,
    required DataGridCell cell,
    required Register register,
  }) =>
      switch (colName) {
        'register_name' => HoverBuilder(
            builder: (isHover) => InkWell(
              onTap: () => _onEditRegister(register),
              hoverColor: UIColors.transparent,
              child: UIText.dataGridText(
                cell.value.toString(),
                color: isHover ? UIColors.buttonPrimaryHover : UIColors.textRegular,
                textDecoration: TextDecoration.underline,
              ),
            ),
          ),
        'action' => Wrap(
            children: [
              UIButton.text(
                'Edit',
                iconBuilder: (isHover) => Assets.icons.edit2.setColorOnHover(isHover),
                onClick: () => _onEditRegister(register),
              ),
              const UIHorizontalSpace(32),
              UIButton.text(
                'Delete',
                iconBuilder: (isHover) => Assets.icons.trash.setColorOnHover(isHover),
                onClick: () => _onDeleteRegister(register),
              ),
            ],
          ),
        _ => UIText.dataGridText(cell.value.toString()),
      };

  void _onEditRegister(Register register) {
    _context.read<RegisterFormCubit>().initRegister(register);
    showCustomDialog(
      _context,
      dialog: MultiBlocProvider(
        providers: [
          BlocProvider.value(value: _context.read<RegisterFormCubit>()),
          BlocProvider.value(value: _context.read<RegisterBloc>()),
        ],
        child: const RegisterFormDialog(),
      ),
    );
  }

  void _onDeleteRegister(Register register) => showDeleteDialog(
        _context,
        subject: 'POS Register',
        item: register.name,
        onDelete: () => _context.read<RegisterBloc>().add(RegisterEvent.deleteRegister(register)),
      );
}
