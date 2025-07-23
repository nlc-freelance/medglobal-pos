import 'package:medglobal_admin_portal/portal/product_management/data/dto/variant/branch_inventory/branch_inventory_mapper.dart';
import 'package:medglobal_admin_portal/portal/product_management/data/dto/variant/variant_dto.dart';
import 'package:medglobal_admin_portal/portal/product_management/domain/entities/variant/variant.dart';

class VariantMapper {
  VariantMapper._();

  /// Converts a [VariantDto] to a [Variant] entity
  static Variant fromDto(VariantDto dto) {
    return Variant(
      id: dto.id,
      name: dto.name,
      sku: dto.sku,
      warningStock: dto.warningStock,
      idealStock: dto.idealStock,
      cost: dto.cost,
      suppliers: dto.suppliers.map((supplier) => supplier.toDomain()).toList(),
      branchInventories: dto.variantStoreDetails.map((detail) => BranchInventoryMapper.fromDto(detail)).toList(),
    );
  }

  /// Converts a list of [VariantDto] to [Variant] entities
  static List<Variant> fromDtoList(List<VariantDto> dtos) {
    return dtos.map(fromDto).toList();
  }
}
