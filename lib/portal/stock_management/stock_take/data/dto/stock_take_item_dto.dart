import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:medglobal_admin_portal/portal/stock_management/variants/product_variant_dto.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/domain/entities/stock_take_item.dart';

part 'stock_take_item_dto.g.dart';

@JsonSerializable()
class StockTakeItemDto extends Equatable {
  final int? id;
  final ProductVariantDto? variant;
  @JsonKey(name: 'quantity')
  final int? qtyCounted;
  @JsonKey(name: 'quantityDifference')
  final int? difference;
  final double? costDifference;

  const StockTakeItemDto({
    this.id,
    this.variant,
    this.qtyCounted,
    this.difference,
    this.costDifference,
  });

  @override
  List<Object?> get props => [id, variant, qtyCounted];

  factory StockTakeItemDto.fromJson(Map<String, dynamic> json) => _$StockTakeItemDtoFromJson(json);

  StockTakeItem toEntity() => StockTakeItem(
        id: id,
        variantId: variant?.id,
        name: '${variant?.product?.name} ${variant?.name}',
        sku: variant?.sku,
        qtyCounted: qtyCounted,
        qtyExpected: variant?.qtyOnHand,
        difference: difference,
        costDifference: costDifference,
      );
}
