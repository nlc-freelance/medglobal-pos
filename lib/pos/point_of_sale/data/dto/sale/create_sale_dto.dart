import 'package:json_annotation/json_annotation.dart';
import 'package:medglobal_admin_portal/pos/point_of_sale/data/dto/sale/create_sale_item_dto.dart';
import 'package:medglobal_admin_portal/pos/point_of_sale/domain/entities/order.dart';

part 'create_sale_dto.g.dart';

@JsonSerializable()
class CreateSaleDto {
  final int registerId;
  final List<CreateSaleItemDto> items;
  final double amountPaid;

  CreateSaleDto({
    required this.registerId,
    required this.items,
    required this.amountPaid,
  });

  Map<String, dynamic> toJson() => _$CreateSaleDtoToJson(this);

  factory CreateSaleDto.fromDomain(int registerId, Order order) {
    if (order.amountPaid == null) {
      throw ArgumentError('Missing amountPaid');
    }

    return CreateSaleDto(
      registerId: registerId,
      items: order.items.map((item) => CreateSaleItemDto.fromDomain(item)).toList(),
      amountPaid: order.amountPaid!,
    );
  }
}
