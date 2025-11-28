import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medglobal_admin_portal/core/models/models.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/product_sales_history/domain/entities/product_sale_history_item.dart';

part 'product_sale_history.freezed.dart';

@freezed
class ProductSaleHistory with _$ProductSaleHistory {
  const factory ProductSaleHistory({
    required String displayName,
    required String sku,
    required String category,
    required PaginatedList<ProductSaleHistoryItem> transactions,
  }) = _ProductSaleHistory;
}
