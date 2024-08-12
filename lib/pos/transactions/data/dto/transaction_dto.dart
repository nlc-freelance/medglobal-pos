import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/pos/transactions/domain/entities/transaction.dart';

part 'transaction_dto.g.dart';

@JsonSerializable()
class TransactionDto extends Equatable {
  final int? id;
  final TransactionType? type;
  @JsonKey(name: 'amountPaid')
  final double? total;
  @DateTimeConverter()
  final DateTime? createdAt;

  const TransactionDto({
    this.id,
    this.type,
    this.total,
    this.createdAt,
  });

  @override
  List<Object?> get props => [id, type, total, createdAt];

  factory TransactionDto.fromJson(Map<String, dynamic> json) => _$TransactionDtoFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionDtoToJson(this);

  Transaction toEntity() => Transaction(
        id: id,
        type: type,
        total: total,
        createdAt: createdAt,
      );
}
