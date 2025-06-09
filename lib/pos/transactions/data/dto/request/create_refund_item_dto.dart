import 'package:json_annotation/json_annotation.dart';

part 'create_refund_item_dto.g.dart';

@JsonSerializable()
class CreateRefundItemDto {
  final int variantId;
  final int quantity;

  CreateRefundItemDto({
    required this.variantId,
    required this.quantity,
  });

  factory CreateRefundItemDto.fromJson(Map<String, dynamic> json) => _$CreateRefundItemDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CreateRefundItemDtoToJson(this);
}
