import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/settings/tax/domain/entities/tax.dart';
import 'package:medglobal_admin_portal/portal/settings/tax/presentation/cubit/tax_form_cubit.dart';
import 'package:medglobal_admin_portal/portal/settings/tax/presentation/tax_form/tax_form_dialog.dart';
import 'package:medglobal_admin_portal/portal/settings/tax/presentation/tax_list/widgets/tax_data_grid_empty.dart';
import 'package:medglobal_shared/medglobal_shared.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class TaxDataGrid extends StatefulWidget {
  const TaxDataGrid({super.key});

  @override
  State<TaxDataGrid> createState() => _TaxDataGridState();
}

class _TaxDataGridState extends State<TaxDataGrid> {
  late DataGridController _dataGridController;
  late TaxDataGridSource _taxDataGridSource;

  @override
  void initState() {
    super.initState();
    _dataGridController = DataGridController();
    _taxDataGridSource = TaxDataGridSource(
      [const Tax(id: 1, code: 'VAT', rate: 12, isDefault: true)],
      context,
      // [],
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
          columns: DataGridUtil.getColumns(DataGridColumn.taxCodes),
          controller: _dataGridController,
          shrinkWrapRows: true,
          navigationMode: GridNavigationMode.row,
          columnWidthMode: ColumnWidthMode.fill,
          headerRowHeight: 38,
          headerGridLinesVisibility: GridLinesVisibility.none,
          gridLinesVisibility: GridLinesVisibility.none,
          footerHeight: 280,
          footer: _taxDataGridSource.rows.isEmpty ? const TaxDataGridEmpty() : null,
        ),
      ),
    );
  }
}

class TaxDataGridSource extends DataGridSource with DialogMixin {
  TaxDataGridSource(List<Tax> taxCodes, BuildContext context) {
    _taxCodes = taxCodes;
    _context = context;
    buildDataGridRows();
  }

  late BuildContext _context;

  List<Tax> _taxCodes = [];

  List<DataGridRow> dataGridRows = [];

  void update() => notifyListeners();

  void buildDataGridRows() => dataGridRows = _taxCodes.map((tax) => tax.toDataGridRow()).toList();

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
            taxCode: row.getCells().firstWhere((e) => e.columnName == 'tax_code').value,
            taxId: row.getCells().first.value,
            rowIdx: row.id - 1,
          ),
        );
      }).toList(),
    );
  }

  Widget cellBuilder({
    required String colName,
    required DataGridCell cell,
    required String taxCode,
    required int taxId,
    required int rowIdx,
  }) =>
      switch (colName) {
        'tax_code' => HoverBuilder(
            builder: (isHover) => InkWell(
              onTap: () => _onEditTax(rowIdx),
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
                onClick: () => _onEditTax(rowIdx),
              ),
              const UIHorizontalSpace(32),
              UIButton.text(
                'Delete',
                iconBuilder: (isHover) => Assets.icons.trash.setColorOnHover(isHover),
                onClick: () => _onDeleteTax(taxCode),
              ),
            ],
          ),
        _ => UIText.dataGridText(cell.value.toString()),
      };

  void _onEditTax(int rowIdx) {
    _context.read<TaxFormCubit>().initTax(_taxCodes[rowIdx]);
    showCustomDialog(_context, dialog: TaxFormDialog(cubit: _context.read<TaxFormCubit>()));
  }

  void _onDeleteTax(String taxCode) => showDeleteDialog(
        _context,
        subject: taxCode,
        onDelete: () {}, // TODO ND1: DeleteTax Bloc Event
      );
}
