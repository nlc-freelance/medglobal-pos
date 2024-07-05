import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/features/product_management/domain/entities/product/product.dart';
import 'package:medglobal_shared/medglobal_shared.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class ProductDataSource extends BaseDataSource {
  final List<Product> products;

  ProductDataSource({required this.products});

  @override
  List<DataGridRow> get rows => dataGridRows;

  void _build() => dataGridRows = products
      .map(
        (product) => DataGridRow(
          cells: [
            DataGridCell<int>(columnName: 'id', value: product.id),
            DataGridCell<String>(columnName: 'name', value: product.name),
            DataGridCell<String>(columnName: 'category', value: product.category?.name ?? Strings.empty),
            DataGridCell<String>(columnName: 'createdAt', value: DateFormat.yMd().format(product.createdAt!)),
          ],
        ),
      )
      .toList();

  @override
  List<DataGridRow> build() {
    _build();
    return dataGridRows;
  }

  @override
  void update() => notifyListeners();

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
      cells: row.getCells().map<Widget>((cell) {
        return Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: cell.columnName == 'name'
              ? HoverBuilder(
                  builder: (isHover) => InkWell(
                        onTap: () => AppRouter.router
                            .goNamed('Product Details', pathParameters: {'id': row.getCells().first.value.toString()}),
                        // onTap: () => print(row.getCells().first.value),
                        hoverColor: UIColors.transparent,
                        child: UIText.bodyRegular(
                          cell.value.toString(),
                          color: isHover ? UIColors.buttonPrimaryHover : UIColors.textRegular,
                          textDecoration: isHover ? TextDecoration.underline : TextDecoration.none,
                        ),
                      ))
              : UIText.bodyRegular(cell.value.toString()),
        );
      }).toList(),
    );
  }
}
