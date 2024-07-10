import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/features/product_management/domain/entities/product/variant.dart';
import 'package:medglobal_admin_portal/features/product_management/presentation/cubit/variant_form_ui/variant_form_ui_cubit.dart';
import 'package:medglobal_admin_portal/features/product_management/presentation/cubit/product_form/product_form_cubit.dart';
import 'package:medglobal_admin_portal/features/product_management/presentation/cubit/variant_form/variant_form_cubit.dart';
import 'package:medglobal_shared/medglobal_shared.dart';
import 'package:pluto_grid/pluto_grid.dart';

class VariantGrid extends StatefulWidget {
  const VariantGrid({super.key, required this.variants, required this.rows});

  final List<Variant> variants;
  final List<PlutoRow> rows;

  @override
  State<VariantGrid> createState() => _VariantGridState();
}

class _VariantGridState extends State<VariantGrid> {
  final List<PlutoColumn> columns = [];
  late List<PlutoRow> rows = [];

  late PlutoGridStateManager stateManager;

  late List<Variant> _variants = [];

  @override
  void initState() {
    super.initState();
    _variants = widget.variants;

    columns.addAll([
      PlutoColumn(
        title: 'ID',
        field: 'id',
        hide: true,
        type: PlutoColumnType.number(),
      ),
      PlutoColumn(
        title: 'Variant Name',
        field: 'variant_name',
        enableEditingMode: false,
        enableContextMenu: false,
        enableColumnDrag: false,
        enableDropToResize: false,
        enableSorting: false,
        type: PlutoColumnType.text(),
      ),
      PlutoColumn(
        title: 'SKU',
        field: 'sku',
        enableEditingMode: false,
        enableContextMenu: false,
        enableColumnDrag: false,
        enableDropToResize: false,
        enableSorting: false,
        type: PlutoColumnType.text(),
      ),
      PlutoColumn(
        title: 'Branches',
        field: 'branches',
        enableEditingMode: false,
        enableContextMenu: false,
        enableColumnDrag: false,
        enableDropToResize: false,
        enableSorting: false,
        type: PlutoColumnType.text(),
      ),
      PlutoColumn(
        title: 'Suppliers',
        field: 'suppliers',
        enableEditingMode: false,
        enableContextMenu: false,
        enableColumnDrag: false,
        enableDropToResize: false,
        enableSorting: false,
        type: PlutoColumnType.text(),
      ),
      PlutoColumn(
        title: 'Action',
        field: 'action',
        enableEditingMode: false,
        enableContextMenu: false,
        enableColumnDrag: false,
        enableDropToResize: false,
        enableSorting: false,
        type: PlutoColumnType.text(),
        renderer: (rendererContext) => UIButton.text(
          'Delete',
          iconBuilder: (isHover) => Assets.icons.trash.setColorOnHover(isHover),
          onClick: () {
            context.read<ProductFormCubit>().removeVariant(rendererContext.cell.value);
            stateManager.removeRows([rendererContext.row]);
          },
        ),
      ),
    ]);

    for (var variant in _variants) {
      rows.add(PlutoRow(
        cells: {
          'id': PlutoCell(value: variant.id),
          'variant_name': PlutoCell(value: variant.name),
          'sku': PlutoCell(value: variant.sku),
          'branches': PlutoCell(
            value: variant
                .getAllBranches()
                .map((branch) => branch.name)
                .toList()
                .toString()
                .replaceAll(RegExp(r'[\[\]]'), ''),
          ),
          'suppliers': PlutoCell(
            value: (variant.suppliers ?? []).map((branch) => branch.name).toList().toString().replaceAll(
                  RegExp(r'[\[\]]'),
                  '',
                ),
          ),
          'action': PlutoCell(value: variant.id),
        },
      ));
    }
  }

  @override
  void didUpdateWidget(covariant VariantGrid oldWidget) {
    _variants = widget.variants;

    final List<PlutoRow> newAddedRows = [];

    for (var variant in _variants) {
      if (oldWidget.variants.any((oldVariant) => oldVariant != variant)) {
        int index = rows.indexWhere((row) => row.toJson()['id'] == variant.id);
        if (index != -1) {
          rows[index] = PlutoRow(
            cells: {
              'id': PlutoCell(value: variant.id),
              'variant_name': PlutoCell(value: variant.name),
              'sku': PlutoCell(value: variant.sku),
              'branches': PlutoCell(
                value: variant
                    .getAllBranches()
                    .map((branch) => branch.name)
                    .toList()
                    .toString()
                    .replaceAll(RegExp(r'[\[\]]'), ''),
              ),
              'suppliers': PlutoCell(
                value: (variant.suppliers ?? []).map((branch) => branch.name).toList().toString().replaceAll(
                      RegExp(r'[\[\]]'),
                      '',
                    ),
              ),
              'action': PlutoCell(value: variant.id),
            },
          );
        }
      }
      if (!oldWidget.variants.any((oldVariant) => oldVariant.id == variant.id)) {
        newAddedRows.add(PlutoRow(
          cells: {
            'id': PlutoCell(value: variant.id),
            'variant_name': PlutoCell(value: variant.name),
            'sku': PlutoCell(value: variant.sku),
            'branches': PlutoCell(
              value: variant
                  .getAllBranches()
                  .map((branch) => branch.name)
                  .toList()
                  .toString()
                  .replaceAll(RegExp(r'[\[\]]'), ''),
            ),
            'suppliers': PlutoCell(
              value: (variant.suppliers ?? []).map((branch) => branch.name).toList().toString().replaceAll(
                    RegExp(r'[\[\]]'),
                    '',
                  ),
            ),
            'action': PlutoCell(value: variant.id),
          },
        ));
      }
    }

    final int lastRowIndex = stateManager.refRows.originalList.length + 1;
    stateManager.insertRows(lastRowIndex, newAddedRows);

    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return PlutoGrid(
      key: UniqueKey(),
      columns: columns,
      rows: rows,
      mode: PlutoGridMode.selectWithOneTap,
      configuration: PlutoGridConfiguration(
        enableMoveHorizontalInEditing: true,
        columnSize: const PlutoGridColumnSizeConfig(autoSizeMode: PlutoAutoSizeMode.equal),
        style: PlutoGridStyleConfig(
          enableCellBorderVertical: false,
          enableColumnBorderHorizontal: false,
          enableColumnBorderVertical: false,
          borderColor: UIColors.borderMuted,
          gridBorderColor: UIColors.transparent,
          activatedColor: UIColors.transparent,
          activatedBorderColor: UIColors.transparent,
          inactivatedBorderColor: UIColors.transparent,
          cellColorInEditState: UIColors.whiteBg,
          cellTextStyle: UIStyleText.bodyRegular,
          columnTextStyle: UIStyleText.labelSemiBold,
          defaultCellPadding: const EdgeInsets.fromLTRB(8, 8, 16, 8),
        ),
      ),
      onLoaded: (PlutoGridOnLoadedEvent event) {
        event.stateManager.setSelectingMode(PlutoGridSelectingMode.row);
        stateManager = event.stateManager;
      },
      onSelected: (PlutoGridOnSelectedEvent event) {
        final id = event.row?.toJson()['id'];

        context.read<VariantFormCubit>().resetForm();
        context.read<VariantFormCubit>().setVariant(widget.variants.firstWhere((variant) => variant.id == id));
        context.read<VariantFormUiCubit>().showVariantFormUi();
      },
    );
  }
}
