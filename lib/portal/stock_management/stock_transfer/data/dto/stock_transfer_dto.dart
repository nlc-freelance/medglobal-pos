import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/branches/domain/entities/branch.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_transfer/data/dto/stock_transfer_item_dto.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_transfer/domain/entities/stock_transfer.dart';

part 'stock_transfer_dto.g.dart';

@JsonSerializable()
class StockTransferDto extends Equatable {
  final int? id;
  @JsonKey(name: 'fromStore')
  final Branch? sourceBranch;
  @JsonKey(name: 'toStore')
  final Branch? destinationBranch;
  final String? status;
  @JsonKey(name: 'stockTransferDetails')
  final List<StockTransferItemDto>? items;
  final String? notes;
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
    this.notes,
    this.completedAt,
    this.createdAt,
    this.updatedAt,
  });

  @override
  List<Object?> get props =>
      [id, sourceBranch, destinationBranch, status, items, notes, completedAt, createdAt, updatedAt];

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
        notes: notes,
      );
}
