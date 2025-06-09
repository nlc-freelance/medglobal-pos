import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/data/dto/response/branch_dto.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/domain/entity/branch.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/data/dto/response/purchase_order_item_dto.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/domain/entities/purchase_order.dart';
import 'package:medglobal_admin_portal/portal/supplier_management/data/dto/supplier_dto.dart';
import 'package:medglobal_admin_portal/portal/supplier_management/domain/entities/supplier.dart';

// part 'purchase_order_dto.g.dart';

// @JsonSerializable()
// class PurchaseOrderDto extends Equatable {
//   final int? id;
//   @JsonKey(name: 'store')
//   final BranchLiteDto? branch;
//   final Supplier? supplier;
//   final String? status;
//   final double? totalAmount;
//   final double? tax;
//   final double? discount;
//   final String? notes;
//   final List<PurchaseOrderItemDto>? items;
//   @DateTimeConverter()
//   final DateTime? estimatedDateOfArrival;
//   @DateTimeConverter()
//   final DateTime? createdAt;
//   @DateTimeConverter()
//   final DateTime? updatedAt;

//   const PurchaseOrderDto({
//     this.id,
//     this.branch,
//     this.supplier,
//     this.status,
//     this.totalAmount,
//     this.tax,
//     this.discount,
//     this.notes,
//     this.items,
//     this.estimatedDateOfArrival,
//     this.createdAt,
//     this.updatedAt,
//   });

//   @override
//   List<Object?> get props => [
//         id,
//         estimatedDateOfArrival,
//         branch,
//         supplier,
//         status,
//         totalAmount,
//         tax,
//         discount,
//         items,
//         notes,
//         createdAt,
//         updatedAt
//       ];

//   factory PurchaseOrderDto.fromJson(Map<String, dynamic> json) => _$PurchaseOrderDtoFromJson(json);
//   Map<String, dynamic> toJson() => _$PurchaseOrderDtoToJson(this);

//   PurchaseOrder toEntity() => PurchaseOrder(
//         id: id,
//         branch: branch?.toDomain(),
//         supplier: supplier,
//         status: StatusMapper.status(status),
//         totalAmount: totalAmount,
//         tax: tax,
//         discount: discount,
//         estimatedDateOfArrival: estimatedDateOfArrival,
//         notes: notes,
//         items: items?.map((item) => item.toEntity()).toList() ?? [],
//         createdAt: createdAt,
//         updatedAt: updatedAt,
//       );
// }

part 'purchase_order_dto.freezed.dart';
part 'purchase_order_dto.g.dart';

@freezed
class PurchaseOrderDto with _$PurchaseOrderDto {
  const factory PurchaseOrderDto({
    required int id,
    BranchLiteDto? store,
    SupplierDto? supplier,
    String? status,
    double? totalAmount,
    double? tax,
    double? discount,
    String? notes,
    List<PurchaseOrderItemDto>? items,
    @DateTimeConverter() DateTime? estimatedDateOfArrival,
    @DateTimeConverter() DateTime? createdAt,
    @DateTimeConverter() DateTime? updatedAt,
  }) = _PurchaseOrderDto;

  const PurchaseOrderDto._();

  factory PurchaseOrderDto.fromJson(Map<String, dynamic> json) => _$PurchaseOrderDtoFromJson(json);

  PurchaseOrder toDomain() => PurchaseOrder(
        id: id,
        branch: store?.toDomain(),
        supplier: supplier?.toDomain(),
        status: StatusMapper.status(status),
        totalAmount: totalAmount,
        tax: tax,
        discount: discount,
        estimatedDateOfArrival: estimatedDateOfArrival,
        notes: notes,
        items: items?.map((item) => item.toDomain()).toList() ?? [],
        createdAt: createdAt,
        updatedAt: updatedAt,
      );
}
