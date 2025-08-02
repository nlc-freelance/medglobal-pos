import 'package:json_annotation/json_annotation.dart';
import 'package:medglobal_admin_portal/pos/point_of_sale/domain/entities/order_item.dart';

part 'create_sale_item_dto.g.dart';

@JsonSerializable()
class CreateSaleItemDto {
  final int variantId;
  final int quantity;
  final double? discount;
  final String? discountType;

  CreateSaleItemDto({
    required this.variantId,
    required this.quantity,
    required this.discount,
    required this.discountType,
  });

  factory CreateSaleItemDto.fromJson(Map<String, dynamic> json) => _$CreateSaleItemDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CreateSaleItemDtoToJson(this);

  factory CreateSaleItemDto.fromDomain(OrderItem item) => CreateSaleItemDto(
        variantId: item.itemId,
        quantity: item.quantity,
        discount: item.discount?.value,
        discountType: item.discountType?.name,
      );
}
