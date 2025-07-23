import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/data/dto/branch_dto.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/data/dto/branch_mapper.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/domain/entity/branch.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_return/data/dto/stock_return_item_dto.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_return/domain/entities/stock_return.dart';
import 'package:medglobal_admin_portal/portal/supplier_management/domain/entities/supplier.dart';

part 'stock_return_dto.g.dart';

@JsonSerializable()
class StockReturnDto extends Equatable {
  final int? id;
  @JsonKey(name: 'store')
  final BranchDto? branch;
  final Supplier? supplier;
  final String? status;
  final double? totalAmount;
  final double? tax;
  final double? discount;
  final String? notes;
  final List<StockReturnItemDto>? items;
  @DateTimeConverter()
  final DateTime? createdAt;
  @DateTimeConverter()
  final DateTime? updatedAt;

  const StockReturnDto({
    this.id,
    this.branch,
    this.supplier,
    this.status,
    this.totalAmount,
    this.tax,
    this.discount,
    this.notes,
    this.items,
    this.createdAt,
    this.updatedAt,
  });

  @override
  List<Object?> get props =>
      [id, branch, supplier, status, totalAmount, notes, items, tax, discount, createdAt, updatedAt];

  factory StockReturnDto.fromJson(Map<String, dynamic> json) => _$StockReturnDtoFromJson(json);

  StockReturn toEntity() => StockReturn(
        id: id,
        branch: branch == null ? null : BranchMapper.fromDto(branch!),
        supplier: supplier,
        status: StatusMapper.status(status),
        tax: tax,
        discount: discount,
        totalAmount: totalAmount,
        notes: notes,
        items: items?.map((item) => item.toEntity()).toList() ?? List.empty(),
        createdAt: createdAt,
        updatedAt: updatedAt,
      );
}
