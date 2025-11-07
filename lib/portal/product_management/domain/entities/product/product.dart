import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/product_management/domain/entities/category/category.dart';
import 'package:medglobal_admin_portal/portal/product_management/domain/entities/variant/variant.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

part 'product.freezed.dart';

@freezed
class Product with _$Product {
  const factory Product({
    int? id,
    required String name,
    String? imageUrl,
    Category? category,
    required List<Variant> variants,
    @DateTimeConverter() DateTime? createdAt,
    @DateTimeConverter() DateTime? updatedAt,
  }) = _Product;
}

extension ProductExt on Product {
  DataGridRow toDataGridRow() => DataGridRow(
        cells: [
          DataGridCell<int>(columnName: 'id', value: id),
          DataGridCell<String>(columnName: 'name', value: name),
          DataGridCell<String>(columnName: 'category', value: category?.name ?? Strings.noValue),
          DataGridCell<String>(columnName: 'createdAt', value: DateFormat.yMd().format(createdAt!)),
        ],
      );
}
