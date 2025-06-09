part of 'product_form_cubit.dart';

@freezed
class ProductFormState with _$ProductFormState {
  const factory ProductFormState({
    int? id,
    String? name,
    Category? category,
    String? imageUrl,
    required List<VariantFormModel> variants,
  }) = _ProductFormState;

  const ProductFormState._();

  factory ProductFormState.initial() => ProductFormState(variants: [VariantFormModel.initDefault()]);

  factory ProductFormState.fromProduct(Product product) => ProductFormState(
        id: product.id,
        name: product.name,
        category: product.category,
        variants: product.variants.map((variant) => VariantFormModel.fromVariant(variant)).toList(),
      );

  /// Returns true if there's at least one variant not named "default"
  bool get hasVariants => variants.any((variant) => variant.name.toLowerCase() != 'default');
}

class VariantFormModel {
  final int? id;
  final String name;
  final String? sku;
  final int? warningStock;
  final int? idealStock;
  final double? cost;
  final List<Supplier>? suppliers;
  final List<BranchInventory>? branchInventories;

  const VariantFormModel({
    this.id,
    required this.name,
    this.sku,
    this.warningStock,
    this.idealStock,
    this.cost,
    this.suppliers,
    this.branchInventories,
  });

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
