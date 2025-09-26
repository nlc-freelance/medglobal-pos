import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/product_management/data/dto/variant/variant_dto.dart';
import 'package:medglobal_admin_portal/portal/product_management/domain/entities/variant/variant.dart';
import 'package:medglobal_admin_portal/portal/stock_management/variants/product_variant_dto.dart';
import 'package:medglobal_admin_portal/pos/transactions/data/dto/price/price_dto.dart';
import 'package:medglobal_admin_portal/pos/transactions/domain/entities/transaction_item.dart';

// part 'transaction_item_dto.g.dart';

// @JsonSerializable()
// class TransactionItemDto extends Equatable {
//   final int? id;
//   @JsonKey(name: 'variant')
//   final ProductVariantDto? item;
//   @JsonKey(name: 'quantity')
//   final int? qty;
//   final PriceDto? price;
//   final double? discountedPrice;
//   final double? discount;
//   final String? discountType;
//   final double? discountInPeso;
//   @JsonKey(name: 'subTotal')
//   final double? subtotal;
//   final double? total;
//   final String? comment;
//   @JsonKey(name: 'restockQuantity')
//   final int? restockQty;
//   @JsonKey(name: 'writeOffQuantity')
//   final int? writeOffQty;

//   const TransactionItemDto({
//     this.id,
//     this.item,
//     this.qty,
//     this.price,
//     this.discountedPrice,
//     this.discount,
//     this.discountType,
//     this.discountInPeso,
//     this.subtotal,
//     this.total,
//     this.restockQty,
//     this.writeOffQty,
//     this.comment,
//   });

//   @override
//   List<Object?> get props => [
//         id,
//         item,
//         qty,
//         price,
//         subtotal,
//         discount,
//         discountType,
//         discountInPeso,
//         discountedPrice,
//         total,
//         restockQty,
//         writeOffQty,
//         comment
//       ];

//   factory TransactionItemDto.fromJson(Map<String, dynamic> json) => _$TransactionItemDtoFromJson(json);

//   Map<String, dynamic> toJson() => _$TransactionItemDtoToJson(this);

//   TransactionItem toEntity() => TransactionItem(
//         id: id,
//         itemId: item?.id,
//         name: item?.displayName,
//         sku: item?.sku,
//         price: price?.price,
//         qty: qty,
//         discount: discount,
//         discountType: discountType == 'fixed' ? DiscountType.PESO : DiscountType.PERCENT,
//         discountInPeso: discountInPeso,
//         subtotal: subtotal,
//         total: total,
//         restockQty: restockQty,
//         writeOffQty: writeOffQty,
//         comment: comment,
//       );
// }

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
