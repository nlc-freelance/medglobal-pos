import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:medglobal_admin_portal/features/product_management/data/dto/variant_dto.dart';
import 'package:medglobal_admin_portal/features/stock_management/variants/product_variant_dto.dart';
import 'package:medglobal_admin_portal/features/stock_management/stock_return/domain/entities/stock_return_item.dart';

part 'stock_return_item_dto.g.dart';

@JsonSerializable()
class StockReturnItemDto extends Equatable {
  final int? id;
  final ProductVariantDto? variant;
  @JsonKey(name: 'quantity')
  final int? qtyToReturn;
  final double? supplierPrice;

  const StockReturnItemDto({
    this.id,
    this.variant,
    this.qtyToReturn,
    this.supplierPrice,
  });

  @override
  List<Object?> get props => [id, variant, qtyToReturn, supplierPrice];

  factory StockReturnItemDto.fromJson(Map<String, dynamic> json) => _$StockReturnItemDtoFromJson(json);

  StockReturnItem toEntity() => StockReturnItem(
        id: id,
        name: '${variant?.product?.name} ${variant?.name}',
        sku: variant?.sku,
        qtyOnHand: variant?.qtyOnHand,
        qtyToReturn: qtyToReturn,
        supplierPrice: supplierPrice,
        total: (qtyToReturn ?? 0) * (supplierPrice ?? 0),
      );
}
