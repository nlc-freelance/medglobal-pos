import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/product_sales_history/domain/entities/product_sale_history_item.dart';

part 'product_sale_history_item_dto.freezed.dart';
part 'product_sale_history_item_dto.g.dart';

@freezed
class ProductSaleHistoryItemDto with _$ProductSaleHistoryItemDto {
  const factory ProductSaleHistoryItemDto({
    required int saleTransactionId,
    @DateTimeConverter() required DateTime transactionDateTime,
    required String transactionType,
    required double unitCost,
    required double sellingPrice,
    required int volumeSold,
    required double grossSales,
    required double discount,
    required double netSales,
  }) = _ProductSaleHistoryItemDto;

  factory ProductSaleHistoryItemDto.fromJson(Map<String, dynamic> json) => _$ProductSaleHistoryItemDtoFromJson(json);
}

extension ProductSaleHistoryItemDtoExt on ProductSaleHistoryItemDto {
  ProductSaleHistoryItem toDomain() {
    return ProductSaleHistoryItem(
      transactionId: saleTransactionId,
      transactionDateTime: transactionDateTime,
      transactionType: transactionType == 'sale' ? TransactionType.sale : TransactionType.refund,
      unitCost: unitCost,
      sellingPrice: sellingPrice,
      volumeSold: volumeSold,
      grossSales: grossSales,
      discount: discount,
      netSales: netSales,
    );
  }
}
