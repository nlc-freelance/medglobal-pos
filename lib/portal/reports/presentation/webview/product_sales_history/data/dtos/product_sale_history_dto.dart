import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medglobal_admin_portal/core/models/models.dart';
import 'package:medglobal_admin_portal/core/network/new/api/response/paginated.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/product_sales_history/data/dtos/product_sale_history_item_dto.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/product_sales_history/domain/entities/product_sale_history.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/product_sales_history/domain/entities/product_sale_history_item.dart';

part 'product_sale_history_dto.freezed.dart';

@freezed
class ProductSaleHistoryDto with _$ProductSaleHistoryDto {
  const factory ProductSaleHistoryDto({
    required String displayName,
    required String sku,
    required String category,
    required Paginated<ProductSaleHistoryItemDto> transactions,
  }) = _ProductSaleHistoryDto;

  factory ProductSaleHistoryDto.fromJson(Map<String, dynamic> json) {
    return ProductSaleHistoryDto(
      displayName: json['displayName'],
      sku: json['sku'],
      category: json['category'],
      transactions: Paginated.fromJson(json['transactions'], ProductSaleHistoryItemDto.fromJson),
    );
  }
}

extension ProductSaleHistoryDtoExt on ProductSaleHistoryDto {
  ProductSaleHistory toDomain() {
    return ProductSaleHistory(
      displayName: displayName,
      sku: sku,
      category: category,
      transactions: PaginatedList<ProductSaleHistoryItem>(
        items: transactions.items.map((item) => item.toDomain()).toList(),
        currentPage: transactions.page,
        currentSize: transactions.size,
        totalCount: transactions.totalCount,
        totalPages: transactions.totalPages,
      ),
    );
  }
}
