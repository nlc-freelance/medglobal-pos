import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/data/dto/branch_dto.dart';

part 'branch_inventory_dto.freezed.dart';
part 'branch_inventory_dto.g.dart';

@freezed
class BranchInventoryDto with _$BranchInventoryDto {
  const factory BranchInventoryDto({
    required int id,
    required BranchPartialDto store,
    required double price,
    required int currentStock,
  }) = _BranchInventoryDto;

  factory BranchInventoryDto.fromJson(Map<String, dynamic> json) => _$BranchInventoryDtoFromJson(json);
}
