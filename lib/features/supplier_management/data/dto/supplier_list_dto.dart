import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:medglobal_admin_portal/features/supplier_management/domain/entities/supplier_list.dart';

import 'supplier_dto.dart';

part 'supplier_list_dto.g.dart';

@JsonSerializable()
class SupplierListDto extends Equatable {
  final List<SupplierDto>? suppliers;
  final int? currentPage;
  final int? totalPages;
  final int? totalCount;

  const SupplierListDto({
    this.suppliers,
    this.currentPage,
    this.totalPages,
    this.totalCount,
  });

  @override
  List<Object?> get props => [suppliers, currentPage, totalPages];

  factory SupplierListDto.fromJson(Map<String, dynamic> json) => _$SupplierListDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SupplierListDtoToJson(this);

  SupplierList toEntity() => SupplierList(
        suppliers: suppliers?.map((supplier) => supplier.toEntity()).toList() ?? [],
        currentPage: currentPage,
        totalPages: totalPages,
        totalCount: totalCount,
      );
}
