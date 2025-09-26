import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_refund_dto.freezed.dart';
part 'create_refund_dto.g.dart';

@freezed
class CreateRefundDto with _$CreateRefundDto {
  const factory CreateRefundDto({
    required int registerId,
    required int saleTransactionId,
    required List<CreateRefundItemDto> items,
    String? notes,
  }) = _CreateRefundDto;

  factory CreateRefundDto.fromJson(Map<String, dynamic> json) => _$CreateRefundDtoFromJson(json);
}

@freezed
class CreateRefundItemDto with _$CreateRefundItemDto {
  const factory CreateRefundItemDto({
    required int variantId,
    required int quantity,
  }) = _CreateRefundItemDto;

  factory CreateRefundItemDto.fromJson(Map<String, dynamic> json) => _$CreateRefundItemDtoFromJson(json);
}
