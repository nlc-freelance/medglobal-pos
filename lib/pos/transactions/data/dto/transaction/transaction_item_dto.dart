import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/stock_management/variants/product_variant_dto.dart';
import 'package:medglobal_admin_portal/pos/transactions/data/dto/price/price_dto.dart';
import 'package:medglobal_admin_portal/pos/transactions/domain/entities/transaction_item.dart';

part 'transaction_item_dto.freezed.dart';
part 'transaction_item_dto.g.dart';

@freezed
class TransactionItemDto with _$TransactionItemDto {
  const factory TransactionItemDto({
    required int id,
    ProductVariantDto? variant, // Lite
    int? quantity,
    PriceDto? price,
    // double? discountedPrice,
    // double? discount,
    double? discount,
    String? discountType,
    double? discountInPeso,
    double? subTotal,
    double? total,
    String? comment,
    int? restockQuantity,
    int? writeOffQuantity,
  }) = _TransactionItemDto;

  factory TransactionItemDto.fromJson(Map<String, dynamic> json) => _$TransactionItemDtoFromJson(json);

  factory TransactionItemDto.fromDomain(TransactionItem item) => TransactionItemDto(
        id: item.id!,
        variant: ProductVariantDto(id: item.itemId, displayName: item.name, sku: item.sku),
        quantity: item.quantity,
        price: PriceDto(price: item.price),
        discountType: item.discountType?.name,
        discount: item.discount,
        discountInPeso: item.discountAmount,
        subTotal: item.subtotal,
        total: item.total,
        comment: item.comment,
        restockQuantity: item.restockQty,
        writeOffQuantity: item.writeOffQty,
      );
}

extension TransactionItemDtoExt on TransactionItemDto {
  TransactionItem toDomain() => TransactionItem(
        id: id,
        itemId: variant?.id,
        name: variant?.displayName,
        sku: variant?.sku,
        price: price?.price,
        quantity: quantity,
        discountType: discountType == 'fixed' ? DiscountType.peso : DiscountType.percentage,
        discount: discount,
        discountAmount: discountInPeso,
        subtotal: subTotal,
        total: total,
        restockQty: restockQuantity,
        writeOffQty: writeOffQuantity,
        comment: comment,
      );
}
