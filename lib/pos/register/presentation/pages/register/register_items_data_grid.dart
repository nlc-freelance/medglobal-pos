import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/pos/register/domain/entities/order/order_item.dart';
import 'package:medglobal_admin_portal/pos/register/domain/entities/register_items/register_item.dart';
import 'package:medglobal_admin_portal/pos/register/presentation/bloc/register_shift_bloc.dart';
import 'package:medglobal_admin_portal/pos/register/presentation/cubit/order/order_cubit.dart';
import 'package:medglobal_shared/medglobal_shared.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:uuid/uuid.dart';

class RegisterItemsDataGrid extends StatefulWidget {
  const RegisterItemsDataGrid(this.items, {super.key});

  final List<RegisterItem> items;

  @override
  State<RegisterItemsDataGrid> createState() => _RegisterItemsDataGridState();
}

class _RegisterItemsDataGridState extends State<RegisterItemsDataGrid> {
  late DataGridController _dataGridController;
  late RegisterItemsDataSource _registerItemsDataSource;

  @override
  void initState() {
    super.initState();
    _dataGridController = DataGridController();
    _registerItemsDataSource = RegisterItemsDataSource(widget.items);
  }

  @override
  void dispose() {
    _dataGridController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterShiftBloc, RegisterShiftState>(
      builder: (context, state) => Container(
        decoration: UIStyleContainer.topBorder,
        child: ClipRect(
          clipper: HorizontalBorderClipper(),
          child: SfDataGridTheme(
            data: DataGridUtil.rowNavigationStyle,
            child: SfDataGrid(
              source: _registerItemsDataSource,
              columns: DataGridUtil.getColumns(DataGridColumn.REGISTER_ITEMS),
              controller: _dataGridController,
              // shrinkWrapRows: true,
              rowHeight: 70,
              navigationMode: GridNavigationMode.row,
              columnWidthMode: ColumnWidthMode.fill,
              headerGridLinesVisibility: GridLinesVisibility.none,
              footerHeight: 100,
              footer: _registerItemsDataSource.rows.isEmpty
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Assets.icons.cube.svg(),
                          const UIVerticalSpace(12),
                          UIText.labelMedium('No data available'),
                        ],
                      ),
                    )
                  : null,
              onCellTap: (details) {
                print(state.toString());
                if (state is! RegisterShiftOpen) {
                  showDialog(
                    context: context,
                    builder: (context) => Dialog(
                      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12.0))),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 0.35,
                        color: UIColors.background,
                        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            UIText.heading6('Item cannot be added to cart.'),
                            const UIVerticalSpace(4),
                            UIText.bodyRegular('Please open a shift before making a transaction.'),
                            const UIVerticalSpace(12),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: UIButton.filled('OK', onClick: () => Navigator.pop(context)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }
                if (details.rowColumnIndex.rowIndex != 0 && state is RegisterShiftOpen) {
                  final id = _registerItemsDataSource.rows[details.rowColumnIndex.rowIndex - 1].getCells().first.value;
                  final item = _registerItemsDataSource._items.firstWhere((item) => item.id == id);

                  context.read<OrderCubit>().addItem(OrderItem(
                        id: const Uuid().v4().hashCode,
                        itemId: item.id,
                        name: item.displayName,
                        price: item.price,
                      ));
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}

class RegisterItemsDataSource extends DataGridSource {
  RegisterItemsDataSource(List<RegisterItem> items) {
    _items = items;
    buildDataGridRows();
  }

  List<RegisterItem> _items = [];

  List<DataGridRow> dataGridRows = [];

  void buildDataGridRows() => dataGridRows = _items.map((item) => item.toDataGridRow()).toList();

  void updateDataGridSource() => notifyListeners();

  @override
  List<DataGridRow> get rows => dataGridRows;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
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
        'product_name' => Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              /// Product thumbnail
              Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: UIColors.whiteBg,
                ),
              ),
              const UIHorizontalSpace(16),
              Expanded(
                child: Text(
                  cell.value,
                  style: UIStyleText.bodyRegular.copyWith(fontSize: 15),
                ),
              ),
            ],
          ),
        _ => Text(
            (cell.value ?? '').toString(),
            style: UIStyleText.bodyRegular.copyWith(fontSize: 15),
          ),
      };
}
