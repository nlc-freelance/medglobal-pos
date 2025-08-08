import 'package:json_annotation/json_annotation.dart';
import 'package:medglobal_admin_portal/portal/transactions/return/data/dto/return/update_return_item_dto.dart';
import 'package:medglobal_admin_portal/pos/transactions/domain/entities/transaction.dart';

part 'update_return_dto.g.dart';

@JsonSerializable()
class UpdateReturnDto {
  final List<UpdateReturnItemDto> items;

  UpdateReturnDto({
    required this.items,
  });

  Map<String, dynamic> toJson() => _$UpdateReturnDtoToJson(this);

  factory UpdateReturnDto.fromDomain(Transaction transaction) => UpdateReturnDto(
        items: (transaction.items ?? []).map((item) => UpdateReturnItemDto.fromDomain(item)).toList(),
      );
}
