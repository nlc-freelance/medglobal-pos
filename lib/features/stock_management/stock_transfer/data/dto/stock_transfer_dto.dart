import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/features/branches/domain/branch.dart';
import 'package:medglobal_admin_portal/features/stock_management/stock_transfer/data/dto/stock_transfer_item_dto.dart';
import 'package:medglobal_admin_portal/features/stock_management/stock_transfer/domain/entities/stock_transfer.dart';

part 'stock_transfer_dto.g.dart';

@JsonSerializable()
class StockTransferDto extends Equatable {
  final int? id;
  final Branch? sourceBranch;
  final Branch? destinationBranch;
  final String? status;
  final List<StockTransferItemDto>? items;
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
    this.items,
    this.completedAt,
    this.createdAt,
    this.updatedAt,
  });

  @override
  List<Object?> get props => [id, sourceBranch, destinationBranch, status, items, completedAt, createdAt, updatedAt];

  factory StockTransferDto.fromJson(Map<String, dynamic> json) => _$StockTransferDtoFromJson(json);

  StockTransfer toEntity() => StockTransfer(
        id: id,
        sourceBranch: sourceBranch,
        destinationBranch: destinationBranch,
        status: StatusMapper.status(status),
        items: items?.map((item) => item.toEntity()).toList() ?? [],
        completedAt: completedAt,
        createdAt: createdAt,
        updatedAt: updatedAt,
      );
}
