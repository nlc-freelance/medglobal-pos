import 'package:json_annotation/json_annotation.dart';
import 'package:medglobal_admin_portal/pos/transactions/domain/entities/refund_item.dart';
import 'package:medglobal_admin_portal/pos/transactions/domain/entities/transaction_item.dart';

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

  factory CreateRefundItemDto.fromDomain(RefundItem item) => CreateRefundItemDto(
        variantId: item.id,
        quantity: item.quantity,
      );
}
