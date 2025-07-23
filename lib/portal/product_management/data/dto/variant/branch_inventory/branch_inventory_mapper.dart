import 'package:medglobal_admin_portal/portal/product_management/data/dto/variant/branch_inventory/branch_inventory_dto.dart';
import 'package:medglobal_admin_portal/portal/product_management/domain/entities/branch_inventory/branch_inventory.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/data/dto/branch_mapper.dart';

class BranchInventoryMapper {
  BranchInventoryMapper._();

  /// Converts a [BranchInventoryDto] to a [BranchInventory] entity
  static BranchInventory fromDto(BranchInventoryDto dto) {
    return BranchInventory(
      id: dto.id,
      branch: BranchMapper.fromDto(dto.store),
      price: dto.price,
      quantityOnHand: dto.currentStock,
    );
  }

  /// Converts a list of [BranchInventoryDto] to [BranchInventory] entities
  static List<BranchInventory> fromDtoList(List<BranchInventoryDto> dtos) {
    return dtos.map(fromDto).toList();
  }
}
