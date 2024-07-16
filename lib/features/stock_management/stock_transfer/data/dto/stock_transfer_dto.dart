import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/features/branches/domain/branch.dart';
import 'package:medglobal_admin_portal/features/stock_management/stock_transfer/domain/entities/stock_transfer.dart';

part 'stock_transfer_dto.g.dart';

@JsonSerializable()
class StockTransferDto extends Equatable {
  final int? id;
  final Branch? sourceBranch;
  final Branch? destinationBranch;
  final String? status;
  @DateTimeConverter()
  final DateTime? completedAt;
  @DateTimeConverter()
  final DateTime? createdAt;
  @DateTimeConverter()
  final DateTime? updatedAt;

  const StockTransferDto({
    this.id,
    this.sourceBranch,
    this.destinationBranch,
    this.status,
    this.completedAt,
    this.createdAt,
    this.updatedAt,
  });

  @override
  List<Object?> get props => [id, sourceBranch, destinationBranch, status, completedAt, createdAt, updatedAt];

  factory StockTransferDto.fromJson(Map<String, dynamic> json) => _$StockTransferDtoFromJson(json);

  StockTransfer toEntity() => StockTransfer(
        id: id,
        sourceBranch: sourceBranch,
        destinationBranch: destinationBranch,
        status: StatusMapper.status(status),
        completedAt: completedAt,
        createdAt: createdAt,
        updatedAt: updatedAt,
      );
}
