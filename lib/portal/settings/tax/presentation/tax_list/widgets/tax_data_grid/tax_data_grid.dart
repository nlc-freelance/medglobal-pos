import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/widgets/data_grid/data_grid_loading.dart';
import 'package:medglobal_admin_portal/portal/settings/tax/domain/entities/tax.dart';
import 'package:medglobal_admin_portal/portal/settings/tax/presentation/bloc/tax/tax_bloc.dart';
import 'package:medglobal_admin_portal/portal/settings/tax/presentation/bloc/tax_list_bloc/tax_list_bloc.dart';
import 'package:medglobal_admin_portal/portal/settings/tax/presentation/cubit/tax_form_cubit.dart';
import 'package:medglobal_admin_portal/portal/settings/tax/presentation/tax_form/tax_form_dialog.dart';
import 'package:medglobal_admin_portal/portal/settings/tax/presentation/tax_list/widgets/tax_data_grid/data_grid_pagination.dart';
import 'package:medglobal_admin_portal/portal/settings/tax/presentation/tax_list/widgets/tax_data_grid/tax_data_grid_empty.dart';
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

  List<Tax> taxCodes = [];
  int _rowsPerPage = 20;

  @override
  void initState() {
    super.initState();
    _dataGridController = DataGridController();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TaxListBloc, TaxListState>(
      listener: (context, state) {
        state.maybeWhen(
          success: (data) {
            taxCodes = data.items;
            _taxDataGridSource = TaxDataGridSource(context, taxCodes: taxCodes);
          },
          orElse: () {},
        );
      },
      builder: (context, state) {
        return state.maybeMap(
          failure: (value) => Text(value.message),
          orElse: () => DataGridLoading(
            columns: DataGridUtil.getColumns(DataGridColumn.taxCodes),
            source: _taxDataGridSource = TaxDataGridSource(context, taxCodes: []),
          ),
          success: (value) {
            final paginatedData = value.data;
            return Column(
              children: [
                Expanded(
                  child: Container(
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
                  ),
                ),
                const UIVerticalSpace(12),
                if (paginatedData.hasItems) DataGridPagination<Tax>(paginatedData),
              ],
            );
          },
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

class TaxDataGridSource extends DataGridSource with DialogMixin {
  TaxDataGridSource(BuildContext context, {required List<Tax> taxCodes}) {
    _taxCodes = taxCodes;
    _context = context;
    buildDataGridRows();
  }

  late BuildContext _context;
  List<Tax> _taxCodes = [];
  List<DataGridRow> dataGridRows = [];

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
            tax: _taxCodes.firstWhere((tax) => tax.id == row.getCells().first.value),
          ),
        );
      }).toList(),
    );
  }

  Widget cellBuilder({
    required String colName,
    required DataGridCell cell,
    required Tax tax,
  }) =>
      switch (colName) {
        'tax_code' => HoverBuilder(
            builder: (isHover) => InkWell(
              onTap: () => _onEditTax(tax),
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
                onClick: () => _onEditTax(tax),
              ),
              const UIHorizontalSpace(32),
              UIButton.text(
                'Delete',
                iconBuilder: (isHover) => Assets.icons.trash.setColorOnHover(isHover),
                onClick: () => _onDeleteTax(tax),
              ),
            ],
          ),
        _ => UIText.dataGridText(cell.value.toString()),
      };

  void _onEditTax(Tax tax) {
    _context.read<TaxFormCubit>().initTax(tax);
    showCustomDialog(
      _context,
      dialog: TaxFormDialog(
        cubit: _context.read<TaxFormCubit>(),
        bloc: _context.read<TaxBloc>(),
      ),
    );
  }

  void _onDeleteTax(Tax tax) => showDeleteDialog(
        _context,
        subject: tax.code,
        onDelete: () => _context.read<TaxBloc>().add(TaxEvent.deleteTaxCode(tax.id!)),
      );
}
