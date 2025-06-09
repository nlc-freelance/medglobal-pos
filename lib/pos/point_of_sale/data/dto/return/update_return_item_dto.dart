import 'package:json_annotation/json_annotation.dart';
import 'package:medglobal_admin_portal/pos/transactions/domain/entities/transaction_item.dart';

part 'update_return_item_dto.g.dart';

@JsonSerializable()
class UpdateReturnItemDto {
  final int id;
  final int? writeOffQuantity;
  final int? restockQuantity;
  final String? comment;

  UpdateReturnItemDto({
    required this.id,
    this.writeOffQuantity,
    this.restockQuantity,
    this.comment,
  });

  factory UpdateReturnItemDto.fromJson(Map<String, dynamic> json) => _$UpdateReturnItemDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateReturnItemDtoToJson(this);

  factory UpdateReturnItemDto.fromDomain(TransactionItem item) {
    return UpdateReturnItemDto(
      id: item.itemId,
      writeOffQuantity: item.writeOffQty,
      restockQuantity: item.restockQty,
      comment: item.comment,
    );
  }
}
