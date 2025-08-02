import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/product_management/domain/entities/branch_inventory/branch_inventory.dart';
import 'package:medglobal_admin_portal/portal/product_management/domain/entities/variant/variant.dart';
import 'package:medglobal_admin_portal/portal/supplier_management/domain/entities/supplier.dart';

part 'variant_form_model.freezed.dart';

@freezed
class VariantFormModel with _$VariantFormModel {
  const factory VariantFormModel({
    int? id,
    String? name,
    String? sku,
    int? warningStock,
    int? idealStock,
    double? cost,
    List<Supplier>? suppliers,
    List<BranchInventory>? branchInventories,
  }) = _VariantFormModel;

  factory VariantFormModel.initDefault() => const VariantFormModel(name: 'default');

  factory VariantFormModel.fromVariant(Variant variant) => VariantFormModel(
        id: variant.id,
        name: variant.name,
        sku: variant.sku,
        warningStock: variant.warningStock,
        idealStock: variant.idealStock,
        cost: variant.cost,
        suppliers: variant.suppliers,
        branchInventories: variant.branchInventories,
      );
}

extension VariantFormModelExt on VariantFormModel {
  bool isFormValid() {
    final variantName = name?.trim().toLowerCase();
    if (variantName == null || variantName.isEmpty || variantName == Strings.defaultVariantName) {
      return false;
    }
    if (sku?.trim().isEmpty ?? true) return false;

    if (cost == null || cost! <= 0) return false;

    if (suppliers == null || suppliers!.isEmpty) return false;

    if (branchInventories == null || branchInventories!.isEmpty) return false;

    for (final inventory in branchInventories!) {
      if (inventory.price == null) return false;
      if (inventory.quantityOnHand == null) return false;
    }

    return true;
  }

  Variant toVariant() => Variant(
        id: id!,
        name: name!,
        sku: sku!,
        warningStock: warningStock,
        idealStock: idealStock,
        cost: cost!,
        suppliers: suppliers!,
        branchInventories: branchInventories!,
      );
}
