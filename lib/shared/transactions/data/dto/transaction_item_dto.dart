import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/stock_management/variants/product_variant_dto.dart';
import 'package:medglobal_admin_portal/shared/transactions/data/dto/price_dto.dart';
import 'package:medglobal_admin_portal/shared/transactions/domain/entities/transaction_item.dart';

part 'transaction_item_dto.g.dart';

@JsonSerializable()
class TransactionItemDto extends Equatable {
  final int? id;
  @JsonKey(name: 'variant')
  final ProductVariantDto? item;
  @JsonKey(name: 'quantity')
  final int? qty;
  final PriceDto? price;
  final double? discountedPrice;
  final double? discount;
  final String? discountType;
  final double? discountInPeso;
  @JsonKey(name: 'subTotal')
  final double? subtotal;
  final double? total;
  final String? comment;
  @JsonKey(name: 'restockQuantity')
  final int? restockQty;
  @JsonKey(name: 'writeOffQuantity')
  final int? writeOffQty;

  const TransactionItemDto({
    this.id,
    this.item,
    this.qty,
    this.price,
    this.discountedPrice,
    this.discount,
    this.discountType,
    this.discountInPeso,
    this.subtotal,
    this.total,
    this.restockQty,
    this.writeOffQty,
    this.comment,
  });

  @override
  List<Object?> get props => [
        id,
        item,
        qty,
        price,
        subtotal,
        discount,
        discountType,
        discountInPeso,
        discountedPrice,
        total,
        restockQty,
        writeOffQty,
        comment
      ];

  factory TransactionItemDto.fromJson(Map<String, dynamic> json) => _$TransactionItemDtoFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionItemDtoToJson(this);

  TransactionItem toEntity() => TransactionItem(
        id: id,
        itemId: item?.id,
        name: item?.displayName,
        sku: item?.sku,
        price: price?.price,
        qty: qty,
        discount: discount,
        discountType: discountType == 'fixed' ? DiscountType.PESO : DiscountType.PERCENT,
        discountInPeso: discountInPeso,
        subtotal: subtotal,
        total: total,
        restockQty: restockQty,
        writeOffQty: writeOffQty,
        comment: comment,
      );
}
