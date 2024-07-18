import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:medglobal_admin_portal/features/product_management/data/dto/variant_dto.dart';
import 'package:medglobal_admin_portal/features/stock_management/variants/product_variant_dto.dart';
import 'package:medglobal_admin_portal/features/stock_management/stock_take/domain/entities/stock_take_item.dart';

part 'stock_take_item_dto.g.dart';

@JsonSerializable()
class StockTakeItemDto extends Equatable {
  final int? id;
  final ProductVariantDto? variant;
  @JsonKey(name: 'countedQuantity')
  final int? qtyCounted;

  const StockTakeItemDto({
    this.id,
    this.variant,
    this.qtyCounted,
  });

  @override
  List<Object?> get props => [id, variant, qtyCounted];

  factory StockTakeItemDto.fromJson(Map<String, dynamic> json) => _$StockTakeItemDtoFromJson(json);

  StockTakeItem toEntity() => StockTakeItem(
        id: id,
        name: '${variant?.product?.name} ${variant?.name}',
        sku: variant?.sku,
        qtyCounted: qtyCounted,
      );
}
