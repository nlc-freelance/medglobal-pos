import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/features/product_management/domain/entities/product/branch_inventory.dart';
import 'package:medglobal_admin_portal/features/product_management/presentation/cubit/variant_form/variant_form_cubit.dart';
import 'package:medglobal_shared/medglobal_shared.dart';
import 'package:pluto_grid/pluto_grid.dart';

class InventoryPerBranchGrid extends StatefulWidget {
  const InventoryPerBranchGrid({super.key, required this.branchInventories});

  final List<BranchInventory> branchInventories;

  @override
  State<InventoryPerBranchGrid> createState() => _InventoryPerBranchGridState();
}

class _InventoryPerBranchGridState extends State<InventoryPerBranchGrid> {
  final List<PlutoColumn> columns = [];
  late List<PlutoRow> rows = [];

  late PlutoGridStateManager stateManager;

  late List<BranchInventory> _branchInventories = [];

  @override
  void initState() {
    super.initState();
    _branchInventories = widget.branchInventories;

    columns.addAll([
      PlutoColumn(
        title: 'ID',
        field: 'id',
        hide: true,
        type: PlutoColumnType.number(),
      ),
      PlutoColumn(
        title: 'Branch',
        field: 'branch_name',
        enableEditingMode: false,
        enableContextMenu: false,
        enableColumnDrag: false,
        enableDropToResize: false,
        enableSorting: false,
        type: PlutoColumnType.text(),
      ),
      PlutoColumn(
        title: 'Price (PHP)',
        field: 'price',
        enableContextMenu: false,
        enableColumnDrag: false,
        enableDropToResize: false,
        enableSorting: false,
        type: PlutoColumnType.currency(
          decimalDigits: 2,
          symbol: '',
        ),
        renderer: (rendererContext) => Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: UIColors.background,
            border: Border.all(color: UIColors.borderRegular),
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          ),
          child: UIText.bodyRegular(rendererContext.cell.value.toStringAsFixed(2)),
        ),
      ),
      PlutoColumn(
        title: 'Qty on Hand',
        field: 'qty_on_hand',
        enableContextMenu: false,
        enableColumnDrag: false,
        enableDropToResize: false,
        enableSorting: false,
        type: PlutoColumnType.number(),
        renderer: (rendererContext) => Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: UIColors.background,
            border: Border.all(color: UIColors.borderRegular),
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          ),
          child: UIText.bodyRegular(rendererContext.cell.value.toString()),
        ),
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
            BlocProvider.of<VariantFormCubit>(context).removeBranchInventory(rendererContext.cell.value);
            stateManager.removeRows([rendererContext.row]);
          },
        ),
      ),
    ]);

    for (var branchInventory in _branchInventories) {
      rows.add(PlutoRow(
        cells: {
          'id': PlutoCell(value: branchInventory.id),
          'branch_name': PlutoCell(value: branchInventory.branch?.name),
          'price': PlutoCell(value: branchInventory.price),
          'qty_on_hand': PlutoCell(value: branchInventory.qtyOnHand),
          'action': PlutoCell(value: branchInventory.id),
        },
      ));
    }
  }

  @override
  void didUpdateWidget(covariant InventoryPerBranchGrid oldWidget) {
    /// When adding a new branch
    if (widget.branchInventories.any((branchInventory) => branchInventory.id! < 0)) {
      _branchInventories = widget.branchInventories;

      final newBranchInventoryIds = _branchInventories.map((e) => e.id).toList();

      final oldRows = stateManager.refRows.originalList
          .where((row) => !newBranchInventoryIds.contains(row.toJson()['id']))
          .toList();
      stateManager.removeRows(oldRows);

      final List<PlutoRow> newAddedRows = [];

      for (var branchInventory in _branchInventories) {
        if (!oldWidget.branchInventories.any((oldBranchInventory) => oldBranchInventory.id == branchInventory.id)) {
          newAddedRows.add(PlutoRow(
            cells: {
              'id': PlutoCell(value: branchInventory.id),
              'branch_name': PlutoCell(value: branchInventory.branch?.name),
              'price': PlutoCell(value: branchInventory.price),
              'qty_on_hand': PlutoCell(value: branchInventory.qtyOnHand),
              'action': PlutoCell(value: branchInventory.id),
            },
          ));
        }
      }

      final int lastRowIndex = stateManager.refRows.originalList.length;
      stateManager.insertRows(lastRowIndex, newAddedRows);
    } else {
      /// When clicking a variant to display the branch inventory details
      stateManager.removeAllRows();

      _branchInventories = widget.branchInventories;

      final List<PlutoRow> newRows = [];

      for (var branchInventory in _branchInventories) {
        newRows.add(PlutoRow(
          cells: {
            'id': PlutoCell(value: branchInventory.id),
            'branch_name': PlutoCell(value: branchInventory.branch?.name),
            'price': PlutoCell(value: branchInventory.price),
            'qty_on_hand': PlutoCell(value: branchInventory.qtyOnHand),
            'action': PlutoCell(value: branchInventory.id),
          },
        ));
      }

      stateManager.insertRows(0, newRows);
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        inputDecorationTheme: UIStyleInput.input.copyWith(isDense: false),
      ),
      child: PlutoGrid(
        columns: columns,
        rows: rows,
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
            cellColorInEditState: UIColors.transparent,
            cellTextStyle: UIStyleText.bodyRegular,
            columnTextStyle: UIStyleText.labelSemiBold,
            defaultCellPadding: const EdgeInsets.fromLTRB(8, 8, 16, 8),
          ),
        ),
        onLoaded: (PlutoGridOnLoadedEvent event) {
          event.stateManager
            ..setSelectingMode(PlutoGridSelectingMode.cell)
            ..setAutoEditing(true);
          stateManager = event.stateManager;
        },
        onChanged: (PlutoGridOnChangedEvent event) {
          final data = event.row.toJson();
          final id = data['id'];

          context.read<VariantFormCubit>().setPricePerBranch(id, data['price']);
          context.read<VariantFormCubit>().setQohPerBranch(id, data['qty_on_hand']);
        },
      ),
    );
  }
}
