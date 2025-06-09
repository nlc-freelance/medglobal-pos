import 'package:json_annotation/json_annotation.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/pos/point_of_sale/data/dto/refund/create_refund_item_dto.dart';
import 'package:medglobal_admin_portal/pos/transactions/domain/entities/transaction.dart';

part 'create_refund_dto.g.dart';

@JsonSerializable()
class CreateRefundDto {
  final int registerId;
  final int saleTransactionId;
  final List<CreateRefundItemDto> items;
  final String? notes;

  CreateRefundDto({
    required this.registerId,
    required this.saleTransactionId,
    required this.items,
    this.notes,
  });

  Map<String, dynamic> toJson() => _$CreateRefundDtoToJson(this);

  // factory CreateRefundDto.fromDomain(Transaction transaction) {
  //   if (transaction.type != TransactionType.refund) {
  //     throw ArgumentError('Expected a refund transaction');
  //   }
  //   if (transaction.saleTransactionId == null) {
  //     throw ArgumentError('Missing saleTransactionId for refund');
  //   }

  //   return CreateRefundDto(
  //     registerId: transaction.register.id,
  //     saleTransactionId: transaction.saleTransactionId!,
  //     items: transaction.items.map((item) => CreateRefundItemDto.fromDomain(item)).toList(),
  //     notes:
  //   );
  // }
}
