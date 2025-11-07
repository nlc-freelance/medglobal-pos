import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/domain/entity/branch.dart';
import 'package:medglobal_admin_portal/portal/stock_management/supply_needs/domain/entities/supply_need_item.dart';

part 'supply_need.g.dart';

@JsonSerializable()
class SupplyNeed extends Equatable {
  final int? id;
  final BranchPartial? branch;
  final List<SupplyNeedItem>? items;

  const SupplyNeed({
    this.id,
    this.branch,
    this.items,
  });

  @override
  List<Object?> get props => [id, branch, items];

  factory SupplyNeed.fromJson(Map<String, dynamic> json) => _$SupplyNeedFromJson(json);
}
