import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/utils/data_grid_util.dart';
import 'package:medglobal_admin_portal/portal/product_management/domain/entities/product/variant.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/cubit/product_form/product_form_cubit.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/cubit/variant_form/variant_form_cubit.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/cubit/variant_form_ui/variant_form_ui_cubit.dart';
import 'package:medglobal_shared/medglobal_shared.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class VariantDataGrid extends StatefulWidget {
  const VariantDataGrid({super.key});

  @override
  VariantDataGridState createState() => VariantDataGridState();
}

class VariantDataGridState extends State<VariantDataGrid> {
  List<Variant> _variants = <Variant>[];
  late DataGridController _dataGridController;
  late VariantDataSource _variantDataSource;

  @override
  void initState() {
    super.initState();
    _dataGridController = DataGridController();
    _variants = context.read<ProductFormCubit>().state.product?.variants ?? [];
    _variantDataSource = VariantDataSource(_variants);
  }

  @override
  void dispose() {
    _dataGridController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProductFormCubit, ProductFormState>(
      listenWhen: (previous, current) => previous.product != current.product,
      listener: (context, state) {
        _variants = state.product?.variants ?? [];

        _variantDataSource._variants = _variants;
        _variantDataSource.buildDataGridRows();
        _variantDataSource.updateDataGridSource();
      },
      child: Container(
        decoration: UIStyleContainer.topBorder,
        child: ClipRect(
          clipper: HorizontalBorderClipper(),
          child: SfDataGridTheme(
            data: DataGridUtil.rowNavigationStyle,
            child: SfDataGrid(
                source: _variantDataSource,
                columns: DataGridUtil.getColumns(DataGridColumn.VARIANTS),
                controller: _dataGridController,
                shrinkWrapRows: true,
                navigationMode: GridNavigationMode.row,
                selectionMode: SelectionMode.single,
                columnWidthMode: ColumnWidthMode.fill,
                headerGridLinesVisibility: GridLinesVisibility.none,
                onCellTap: (details) {
                  final id = _variantDataSource.rows[details.rowColumnIndex.rowIndex - 1].getCells().first.value;

                  context.read<VariantFormCubit>().resetForm();
                  context.read<VariantFormCubit>().setVariant(_variants.firstWhere((variant) => variant.id == id));
                  context.read<VariantFormUiCubit>().showVariantFormUi();
                }),
          ),
        ),
      ),
    );
  }
}

class VariantDataSource extends DataGridSource {
  VariantDataSource(List<Variant> variants) {
    _variants = variants;
    buildDataGridRows();
  }

  List<Variant> _variants = [];

  List<DataGridRow> dataGridRows = [];

  void buildDataGridRows() => dataGridRows = _variants.map((variant) => variant.toDataGridRow()).toList();

  void updateDataGridSource() => notifyListeners();

  @override
  List<DataGridRow> get rows => dataGridRows;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
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
        'name' => HoverBuilder(
            builder: (isHover) => UIText.bodyRegular(
              cell.value.toString(),
              color: isHover ? UIColors.buttonPrimaryHover : UIColors.textRegular,
              textDecoration: isHover ? TextDecoration.underline : TextDecoration.none,
            ),
          ),
        'action' => LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) => UIButton.text('Delete',
                iconBuilder: (isHover) => Assets.icons.trash.setColorOnHover(isHover),
                onClick: () => context.read<ProductFormCubit>().removeVariant(id)),
          ),
        'branches' => Text(cell.value.toString().replaceAll(RegExp(r'[\[\]]'), '')),
        'suppliers' => Text(cell.value.toString().replaceAll(RegExp(r'[\[\]]'), '')),
        _ => UIText.bodyRegular(cell.value.toString()),
      };
}
