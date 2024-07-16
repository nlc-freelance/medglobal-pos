import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/utils/datetime_converter.dart';
import 'package:medglobal_admin_portal/features/branches/domain/branch.dart';
import 'package:medglobal_admin_portal/features/stock_management/purchase_orders/data/dto/purchase_order_item_dto.dart';
import 'package:medglobal_admin_portal/features/stock_management/purchase_orders/domain/entities/purchase_order.dart';
import 'package:medglobal_admin_portal/features/supplier_management/domain/entities/supplier.dart';

part 'purchase_order_dto.g.dart';

@JsonSerializable()
class PurchaseOrderDto extends Equatable {
  final int? id;
  final Branch? branch;
  final Supplier? supplier;
  final String? status;
  final double? totalAmount;
  final double? tax;
  final double? discount;
  final String? notes;
  final List<PurchaseOrderItemDto>? items;
  @DateTimeConverter()
  final DateTime? estimatedDateOfArrival;
  @DateTimeConverter()
  final DateTime? createdAt;
  @DateTimeConverter()
  final DateTime? updatedAt;

  const PurchaseOrderDto({
    this.id,
    this.branch,
    this.supplier,
    this.status,
    this.totalAmount,
    this.tax,
    this.discount,
    this.notes,
    this.items,
    this.estimatedDateOfArrival,
    this.createdAt,
    this.updatedAt,
  });

  @override
  List<Object?> get props =>
      [id, estimatedDateOfArrival, branch, supplier, status, totalAmount, items, notes, createdAt, updatedAt];

  factory PurchaseOrderDto.fromJson(Map<String, dynamic> json) => _$PurchaseOrderDtoFromJson(json);

  PurchaseOrder toEntity() => PurchaseOrder(
        id: id,
        branch: branch,
        supplier: supplier,
        status: StatusMapper.status(status),
        totalAmount: totalAmount,
        estimatedDateOfArrival: estimatedDateOfArrival,
        notes: notes,
        createdAt: createdAt,
        updatedAt: updatedAt,
      );
}
