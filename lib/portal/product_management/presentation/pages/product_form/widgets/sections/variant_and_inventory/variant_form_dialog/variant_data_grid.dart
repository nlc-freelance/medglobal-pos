import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/product_management/domain/entities/variant/variant.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/cubit/product_form_cubit/product_form_cubit.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/cubit/variant_form_cubit/variant_form_cubit.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/cubit/variant_form_ui/variant_form_ui_cubit.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/form_models/variant_form_model.dart';
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
    _variants = context.read<ProductFormCubit>().state.toVariantEntities;
    _variantDataSource = VariantDataSource(_variants);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProductFormCubit, ProductFormState>(
      listener: (context, state) {
        _variants = state.toVariantEntities;

        _variantDataSource._variants = _variants;
        _variantDataSource.buildDataGridRows();
        _variantDataSource.updateDataGridSource();
      },
      child: Container(
        decoration: DataGridUtil.verticalBorder,
        child: SfDataGridTheme(
          data: DataGridUtil.baseStyle,
          child: SfDataGrid(
            source: _variantDataSource,
            columns: DataGridUtil.getColumns(DataGridColumn.variants),
            controller: _dataGridController,
            shrinkWrapRows: true,
            navigationMode: GridNavigationMode.row,
            columnWidthMode: ColumnWidthMode.fill,
            headerRowHeight: 38,
            headerGridLinesVisibility: GridLinesVisibility.none,
            gridLinesVisibility: GridLinesVisibility.none,
            onCellTap: (details) {
              if (details.rowColumnIndex.rowIndex != 0) {
                final id = _variantDataSource.rows[details.rowColumnIndex.rowIndex - 1].getCells().first.value;

                context.read<VariantFormCubit>().reset();
                context
                    .read<VariantFormCubit>()
                    .loadVariant(VariantFormModel.fromVariant(_variants.firstWhere((variant) => variant.id == id)));
                context.read<VariantFormUiCubit>().showVariantFormUi();
              }
            },
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _dataGridController.dispose();
    super.dispose();
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
          child: _buildCell(
            colName: cell.columnName,
            cell: cell,
            variantId: row.getCells().first.value,
          ),
        );
      }).toList(),
    );
  }

  Widget _buildCell({
    required String colName,
    required DataGridCell cell,
    required int variantId,
  }) =>
      switch (colName) {
        'name' => HoverBuilder(
            builder: (isHover) => UIText.dataGridText(
              cell.value.toString(),
              color: isHover ? UIColors.buttonPrimaryHover : UIColors.textRegular,
              textDecoration: TextDecoration.underline,
            ),
          ),
        'action' => LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) => UIButton.text(
              'Delete',
              iconBuilder: (isHover) => Assets.icons.trash.setColorOnHover(isHover),
              onClick: () {
                final productFormCubit = context.read<ProductFormCubit>();
                final variantFormCubit = context.read<VariantFormCubit>();

                /// When there's only one variant left in the list,
                /// instead of removing it, convert it to a "default" variant
                /// to preserve essential data (like SKU, cost, suppliers, etc.).
                ///
                /// This prevents loss of data when the user attempts to remove
                /// the last remaining variant in the list.
                ///
                /// - If there's only one variant:
                ///   - Rename it to 'default'
                ///   - Update it in the product form state
                ///   - Load it into the variant form for editing
                /// - Otherwise:
                ///   - Proceed with normal deletion
                if (productFormCubit.state.hasOnlyOneVariant) {
                  final variant = productFormCubit.state.onlyVariant.copyWith(
                    name: Strings.defaultVariantName,
                  );

                  productFormCubit.updateVariant(variant);
                  variantFormCubit.loadVariant(variant);
                } else {
                  productFormCubit.removeVariant(variantId);
                }
              },
            ),
          ),
        _ => UIText.dataGridText(cell.value.toString()),
      };
}
