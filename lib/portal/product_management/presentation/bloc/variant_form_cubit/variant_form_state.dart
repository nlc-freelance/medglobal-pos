part of 'variant_form_cubit.dart';

@freezed
class VariantFormState with _$VariantFormState {
  const factory VariantFormState({
    int? id,
    String? name,
    String? sku,
    int? warningStock,
    int? idealStock,
    double? cost,
    @Default([]) List<Supplier> suppliers,
    @Default([]) List<BranchInventory> branchInventories,
    @Default(true) bool isValid,
  }) = _VariantFormState;

  const VariantFormState._();

  factory VariantFormState.initial() => const VariantFormState();

  factory VariantFormState.load(VariantFormModel variant) => VariantFormState(
        id: variant.id,
        name: variant.name,
        sku: variant.sku,
        warningStock: variant.warningStock,
        idealStock: variant.idealStock,
        cost: variant.cost,
        suppliers: variant.suppliers ?? [],
        branchInventories: variant.branchInventories ?? [],
      );

  List<BranchLite> get branches => branchInventories.map((branchInventory) => branchInventory.branch).toList();
}
