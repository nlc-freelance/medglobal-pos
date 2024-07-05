import 'package:flutter/widgets.dart';
import 'package:medglobal_admin_portal/core/constants/styles.dart';
import 'package:medglobal_admin_portal/core/widgets/data_grid/base_data_source.dart';
import 'package:medglobal_admin_portal/core/widgets/data_grid/data_grid.dart';
import 'package:medglobal_admin_portal/features/branches/domain/branch.dart';
import 'package:medglobal_admin_portal/features/product_management/presentation/pages/product_details/widgets/inventory/branch_inventory/branch_inventory_data_source.dart';
import 'package:medglobal_shared/medglobal_shared.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class BranchInventoryDataGrid extends StatelessWidget {
  const BranchInventoryDataGrid({super.key, required this.branches});

  final List<Branch> branches;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const UIVerticalSpace(16),
        DataGrid<BranchInventoryGridModel>(
          columns: DataGridUtil.getGridColumns(BRANCH_COLUMNS),
          data: branches
              // Create new
              .map((branch) => BranchInventoryGridModel(
                    id: branch.id,
                    name: branch.name,
                    price: 0.0,
                    qtyOnHand: 0,
                  ))
              .toList(),
          allowEditing: true,
          navigationMode: GridNavigationMode.cell,
          selectionMode: SelectionMode.single,
          style: StyleDataGrid.base,
        ),
      ],
    );
  }

  List<ColumnData> get BRANCH_COLUMNS => [
        ColumnData('id', 'ID'),
        ColumnData('name', 'Branch', minWidth: 300.0),
        ColumnData('price', 'Price', minWidth: 200.0, isEditable: true),
        ColumnData('qtyOnHand', 'Qty on Hand', minWidth: 200.0, isEditable: true), // editable only for product creation
      ];
}
