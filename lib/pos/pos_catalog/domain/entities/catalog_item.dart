import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

part 'catalog_item.freezed.dart';

@freezed
class CatalogItem with _$CatalogItem {
  const factory CatalogItem({
    required int id,
    required String displayName,
    required int stock,
    required double price,
  }) = _CatalogItem;
}

extension CatalogItemExt on CatalogItem {
  DataGridRow toDataGridRow() => DataGridRow(
        cells: [
          DataGridCell<int>(columnName: 'id', value: id),
          DataGridCell<String>(columnName: 'product_name', value: displayName),
          DataGridCell<int>(columnName: 'stock', value: stock),
          DataGridCell<double>(columnName: 'price', value: price),
        ],
      );
}
