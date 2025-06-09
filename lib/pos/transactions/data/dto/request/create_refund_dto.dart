import 'package:json_annotation/json_annotation.dart';
import 'package:medglobal_admin_portal/pos/point_of_sale/data/dto/refund/create_refund_item_dto.dart';

part 'create_refund_dto.g.dart';

@JsonSerializable()
class CreateSaleDto {
  final int registerId;
  final int saleTransactionId;
  final String? notes;
  final List<CreateRefundItemDto> items;

  CreateSaleDto({
    required this.registerId,
    required this.saleTransactionId,
    this.notes,
    required this.items,
  });

  Map<String, dynamic> toJson() => _$CreateSaleDtoToJson(this);
}
