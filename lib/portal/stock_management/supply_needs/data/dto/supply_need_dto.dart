import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/data/dto/branch_dto.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/data/dto/branch_mapper.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/domain/entity/branch.dart';
import 'package:medglobal_admin_portal/portal/stock_management/supply_needs/data/dto/supply_need_item_dto.dart';
import 'package:medglobal_admin_portal/portal/stock_management/supply_needs/domain/entities/supply_need.dart';

part 'supply_need_dto.g.dart';

@JsonSerializable()
class SupplyNeedDto extends Equatable {
  final int? id;
  final BranchDto? branch;
  @JsonKey(name: 'productList')
  final List<SupplyNeedItemDto>? items;

  const SupplyNeedDto({
    this.id,
    this.branch,
    this.items,
  });

  @override
  List<Object?> get props => [id, branch, items];

  factory SupplyNeedDto.fromJson(Map<String, dynamic> json) => _$SupplyNeedDtoFromJson(json);

  SupplyNeed toEntity() => SupplyNeed(
        id: id,
        branch: branch == null ? null : BranchMapper.fromDto(branch!),
        items:
            items?.map((item) => item.toEntity(branch == null ? null : BranchMapper.fromDto(branch!))).toList() ?? [],
      );
}
