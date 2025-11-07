import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/models/models.dart';
import 'package:medglobal_admin_portal/core/utils/null_check_util.dart';
import 'package:medglobal_admin_portal/core/widgets/data_grid/data_grid.dart';
import 'package:medglobal_admin_portal/core/widgets/page/page.dart';
import 'package:medglobal_admin_portal/core/blocs/paginated_list_bloc/paginated_list_bloc.dart';
import 'package:medglobal_admin_portal/portal/settings/tax/domain/entity/tax.dart';
import 'package:medglobal_admin_portal/portal/settings/tax/presentation/bloc/tax_bloc/tax_bloc.dart';
import 'package:medglobal_admin_portal/portal/settings/tax/presentation/cubit/tax_form_cubit.dart';
import 'package:medglobal_admin_portal/portal/settings/tax/presentation/pages/tax_form/tax_form_dialog.dart';
import 'package:medglobal_admin_portal/portal/settings/tax/presentation/pages/tax_list/widgets/data_grid/tax_data_grid_empty.dart';
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
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaginatedListBloc<Tax>, PaginatedListState<Tax>>(
      builder: (context, state) {
        return state.maybeWhen(
          loaded: (data) {
            final paginatedData = data;
            _taxDataGridSource = TaxDataGridSource(context, taxCodes: paginatedData.items);

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
                if (paginatedData.hasItems)
                  DataGridPagination<Tax>(
                    paginatedData,
                    onPageChanged: ({required page, required size}) =>
                        context.read<PaginatedListBloc<Tax>>().add(PaginatedListEvent<Tax>.fetch(
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
            columns: DataGridUtil.getColumns(DataGridColumn.taxCodes),
            source: _taxDataGridSource = TaxDataGridSource(context, taxCodes: []),
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
            tax: _taxCodes.firstWhereOrNull((tax) => tax.id == row.getCells().first.value),
          ),
        );
      }).toList(),
    );
  }

  Widget cellBuilder({
    required String colName,
    required DataGridCell cell,
    Tax? tax,
  }) =>
      switch (colName) {
        'tax_code' => HoverBuilder(
            builder: (isHover) => InkWell(
              onTap: () => _onEditTax(tax),
              hoverColor: UIColors.transparent,
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  UIText.dataGridText(
                    cell.value.toString(),
                    color: isHover ? UIColors.buttonPrimaryHover : UIColors.textRegular,
                    textDecoration: TextDecoration.underline,
                  ),
                  if (tax?.isDefault == true) ...[
                    const UIHorizontalSpace(8),
                    UIText.dataGridHeader('(DEFAULT)'),
                  ],
                ],
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

  void _onEditTax(Tax? tax) {
    NullCheckUtil.checkAndCall<Tax>(
      _context,
      value: tax,
      onValid: (tax) {
        _context.read<TaxFormCubit>().loadTax(tax);
        showCustomDialog(
          _context,
          dialog: MultiBlocProvider(
            providers: [
              BlocProvider.value(value: _context.read<TaxFormCubit>()),
              BlocProvider.value(value: _context.read<TaxBloc>()),
            ],
            child: const TaxFormDialog(),
          ),
        );
      },
    );
  }

  void _onDeleteTax(Tax? tax) {
    NullCheckUtil.checkAndCall<Tax>(
      _context,
      value: tax,
      onValid: (tax) {
        showDeleteDialog(
          _context,
          subject: 'Tax Code',
          item: tax.code,
          onDelete: () => _context.read<TaxBloc>().add(TaxEvent.deleteTaxCode(tax.id!, tax)),
        );
      },
    );
  }
}
