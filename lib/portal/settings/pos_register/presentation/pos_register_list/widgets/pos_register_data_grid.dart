import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/branches/domain/entities/branch.dart';
import 'package:medglobal_admin_portal/portal/settings/pos_register/domain/pos_register.dart';
import 'package:medglobal_admin_portal/portal/settings/pos_register/presentation/cubit/pos_register_form_cubit.dart';
import 'package:medglobal_admin_portal/portal/settings/pos_register/presentation/pos_register_list/widgets/pos_register_data_grid_empty.dart';
import 'package:medglobal_admin_portal/portal/settings/pos_register/presentation/pos_register_form/pos_register_form_dialog.dart';
import 'package:medglobal_shared/medglobal_shared.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class PosRegisterDataGrid extends StatefulWidget {
  const PosRegisterDataGrid({super.key});

  @override
  State<PosRegisterDataGrid> createState() => _PosRegisterDataGridState();
}

class _PosRegisterDataGridState extends State<PosRegisterDataGrid> {
  late DataGridController _dataGridController;
  late PosRegisterDataGridSource _taxDataGridSource;

  @override
  void initState() {
    super.initState();
    _dataGridController = DataGridController();
    _taxDataGridSource = PosRegisterDataGridSource(
      [
        const PosRegister(
          id: 1,
          name: 'Las Pinas Register 1',
          assignedBranch: Branch(id: 1, name: 'Las Pinas'),
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
          source: _taxDataGridSource,
          columns: DataGridUtil.getColumns(DataGridColumn.registers),
          controller: _dataGridController,
          shrinkWrapRows: true,
          navigationMode: GridNavigationMode.row,
          columnWidthMode: ColumnWidthMode.fill,
          headerRowHeight: 38,
          headerGridLinesVisibility: GridLinesVisibility.none,
          gridLinesVisibility: GridLinesVisibility.none,
          footerHeight: 280,
          footer: _taxDataGridSource.rows.isEmpty ? const PosRegisterDataGridEmpty() : null,
        ),
      ),
    );
  }
}

class PosRegisterDataGridSource extends DataGridSource with DialogMixin {
  PosRegisterDataGridSource(List<PosRegister> registers, BuildContext context) {
    _registers = registers;
    _context = context;
    buildDataGridRows();
  }

  late BuildContext _context;

  List<PosRegister> _registers = [];

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
            registerName: row.getCells().firstWhere((e) => e.columnName == 'register_name').value,
            registerId: row.getCells().first.value,
            rowIdx: row.id - 1,
          ),
        );
      }).toList(),
    );
  }

  Widget cellBuilder({
    required String colName,
    required DataGridCell cell,
    required String registerName,
    required int registerId,
    required int rowIdx,
  }) =>
      switch (colName) {
        'register_name' => HoverBuilder(
            builder: (isHover) => InkWell(
              onTap: () => _onEditRegister(rowIdx),
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
                onClick: () => _onEditRegister(rowIdx),
              ),
              const UIHorizontalSpace(32),
              UIButton.text(
                'Delete',
                iconBuilder: (isHover) => Assets.icons.trash.setColorOnHover(isHover),
                onClick: () => _onDeleteRegister(registerName),
              ),
            ],
          ),
        _ => UIText.dataGridText(cell.value.toString()),
      };

  void _onEditRegister(int rowIdx) {
    _context.read<PosRegisterFormCubit>().initPosRegister(_registers[rowIdx]);
    showCustomDialog(_context, dialog: PosRegisterFormDialog(cubit: _context.read<PosRegisterFormCubit>()));
  }

  void _onDeleteRegister(String taxCode) => showDeleteDialog(
        _context,
        subject: taxCode,
        onDelete: () {}, // TODO ND1: DeleteRegister Bloc Event
      );
}
