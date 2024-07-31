import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:medglobal_admin_portal/core/core.dart';

part 'transaction.g.dart';

@JsonSerializable()
class Transaction extends Equatable {
  final int? id;
  final TransactionType? type;
  final double? total;
  @DateTimeConverter()
  final DateTime? createdAt;

  const Transaction({
    this.id,
    this.type,
    this.total,
    this.createdAt,
  });

  @override
  List<Object?> get props => [id, type, total, createdAt];

  Map<String, dynamic> toJson() => _$TransactionToJson(this);
}
