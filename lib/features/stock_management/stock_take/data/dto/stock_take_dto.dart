import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/features/branches/domain/branch.dart';
import 'package:medglobal_admin_portal/features/stock_management/stock_take/domain/entities/stock_take.dart';
import 'package:medglobal_admin_portal/features/supplier_management/domain/entities/supplier.dart';

part 'stock_take_dto.g.dart';

@JsonSerializable()
class StockTakeDto extends Equatable {
  final int? id;
  @JsonKey(name: 'store')
  final Branch? branch;
  final Supplier? supplier;
  final bool? isAllSupplier;
  final String? status;
  final double? totalQtyDifference;
  final double? totalCostDifference;
  @JsonKey(name: 'notes')
  final String? description;
  @DateTimeConverter()
  final DateTime? completedAt;
  @DateTimeConverter()
  final DateTime? createdAt;
  @DateTimeConverter()
  final DateTime? updatedAt;

  const StockTakeDto({
    this.id,
    this.branch,
    this.supplier,
    this.status,
    this.isAllSupplier,
    this.description,
    this.totalQtyDifference,
    this.totalCostDifference,
    this.completedAt,
    this.createdAt,
    this.updatedAt,
  });

  @override
  List<Object?> get props => [
        id,
        branch,
        supplier,
        status,
        isAllSupplier,
        description,
        totalQtyDifference,
        totalCostDifference,
        completedAt,
        createdAt,
        updatedAt
      ];

  factory StockTakeDto.fromJson(Map<String, dynamic> json) => _$StockTakeDtoFromJson(json);

  StockTake toEntity() => StockTake(
        id: id,
        branch: branch,
        supplier: supplier,
        isAllSupplier: isAllSupplier,
        status: StatusMapper.status(status),
        description: description,
        totalQtyDifference: totalQtyDifference,
        totalCostDifference: totalCostDifference,
        completedAt: completedAt,
        createdAt: createdAt,
        updatedAt: updatedAt,
      );
}
