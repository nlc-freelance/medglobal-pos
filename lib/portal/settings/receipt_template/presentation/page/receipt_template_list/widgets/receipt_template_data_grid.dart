import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/blocs/paginated_list_bloc/paginated_list_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/widgets/data_grid/data_grid.dart';
import 'package:medglobal_admin_portal/core/widgets/page/page.dart';
import 'package:medglobal_admin_portal/portal/settings/receipt_template/domain/entity/receipt_template.dart';
import 'package:medglobal_shared/medglobal_shared.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class ReceiptTemplateDataGrid extends StatefulWidget {
  const ReceiptTemplateDataGrid({super.key});

  @override
  State<ReceiptTemplateDataGrid> createState() => _ReceiptTemplateDataGridState();
}

class _ReceiptTemplateDataGridState extends State<ReceiptTemplateDataGrid> {
  late DataGridController _dataGridController;
  late ReceiptTemplateDataGridSource _receiptTemplateDataGridSource;

  @override
  void initState() {
    super.initState();
    _dataGridController = DataGridController();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaginatedListBloc<ReceiptTemplate>, PaginatedListState<ReceiptTemplate>>(
      builder: (context, state) {
        return state.maybeWhen(
          loaded: (data) {
            final paginatedData = data;
            _receiptTemplateDataGridSource = ReceiptTemplateDataGridSource(context, templates: paginatedData.items);

            return Column(
              children: [
                Expanded(
                  child: Container(
                    decoration: DataGridUtil.verticalBorder,
                    child: SfDataGridTheme(
                      data: DataGridUtil.rowNavigationStyle,
                      child: SfDataGrid(
                        source: _receiptTemplateDataGridSource,
                        columns: DataGridUtil.getColumns(DataGridColumn.receiptTemplates),
                        controller: _dataGridController,
                        shrinkWrapRows: true,
                        navigationMode: GridNavigationMode.row,
                        columnWidthMode: ColumnWidthMode.fill,
                        headerRowHeight: 38,
                        headerGridLinesVisibility: GridLinesVisibility.none,
                        gridLinesVisibility: GridLinesVisibility.none,
                      ),
                    ),
                  ),
                ),
                const UIVerticalSpace(12),
                if (paginatedData.hasItems)
                  DataGridPagination<ReceiptTemplate>(
                    paginatedData,
                    onPageChanged: ({page, size}) => context.read<PaginatedListBloc<ReceiptTemplate>>().add(
                          PaginatedListEvent.fetch(
                            page: page,
                            size: size,
                          ),
                        ),
                  ),
              ],
            );
          },
          failure: (message) => FailureView(message),
          orElse: () => DataGridLoading(
            columns: DataGridUtil.getColumns(DataGridColumn.receiptTemplates),
            source: _receiptTemplateDataGridSource = ReceiptTemplateDataGridSource(context, templates: []),
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

class ReceiptTemplateDataGridSource extends DataGridSource with DialogMixin {
  ReceiptTemplateDataGridSource(BuildContext context, {required List<ReceiptTemplate> templates}) {
    _templates = templates;
    _context = context;
    buildDataGridRows();
  }

  late BuildContext _context;
  List<ReceiptTemplate> _templates = [];
  List<DataGridRow> dataGridRows = [];

  void buildDataGridRows() => dataGridRows = _templates.map((branch) => branch.toDataGridRow()).toList();

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
            receiptTemplateId: row.getCells().first.value,
          ),
        );
      }).toList(),
    );
  }

  Widget cellBuilder({
    required String colName,
    required DataGridCell cell,
    required int receiptTemplateId,
  }) =>
      switch (colName) {
        'receipt_template_name' => HoverBuilder(
            builder: (isHover) => InkWell(
              onTap: () => _onEditReceiptTemplate(receiptTemplateId),
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

  void _onEditReceiptTemplate(receiptTemplateId) {
    // _context.goNamed(
    //   SideMenuTreeItem.branchDetails.name,
    //   pathParameters: {'id': branchId.toString()},
    // );
  }
}
