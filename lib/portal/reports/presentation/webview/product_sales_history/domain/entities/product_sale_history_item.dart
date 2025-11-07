import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

part 'product_sale_history_item.freezed.dart';

@freezed
class ProductSaleHistoryItem with _$ProductSaleHistoryItem {
  const factory ProductSaleHistoryItem({
    required int transactionId,
    @DateTimeConverter() required DateTime transactionDateTime,
    required TransactionType transactionType,
    required double unitCost,
    required double sellingPrice,
    required int volumeSold,
    required double grossSales,
    required double discount,
    required double netSales,
  }) = _ProductSaleHistoryItem;
}

extension ProductSaleHistoryItemExt on ProductSaleHistoryItem {
  DataGridRow toDataGridRow() => DataGridRow(
        cells: [
          DataGridCell<int>(columnName: 'id', value: transactionId),
          DataGridCell<String>(columnName: 'datetime', value: transactionDateTime.toFormattedDateTime24Hr()),
          DataGridCell<TransactionType>(columnName: 'type', value: transactionType),
          DataGridCell<double>(columnName: 'unit_cost', value: unitCost),
          DataGridCell<double>(columnName: 'selling_price', value: sellingPrice),
          DataGridCell<int>(columnName: 'volume_sold', value: volumeSold),
          DataGridCell<double>(columnName: 'gross_sales', value: grossSales),
          DataGridCell<double>(columnName: 'discount', value: discount),
          DataGridCell<double>(columnName: 'net_sales', value: netSales),
        ],
      );
}
