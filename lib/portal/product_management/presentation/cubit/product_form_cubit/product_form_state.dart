part of 'product_form_cubit.dart';

@freezed
class ProductFormState with _$ProductFormState {
  const factory ProductFormState({
    int? id,
    String? name,
    Category? category,
    String? imageUrl,
    List<VariantFormModel>? variants,
    @Default(true) bool isValid,
  }) = _ProductFormState;

  factory ProductFormState.initial() => const ProductFormState();

  factory ProductFormState.load(Product product) {
    print('load here');
    return ProductFormState(
      id: product.id,
      name: product.name,
      category: product.category,
      variants: product.variants.map((variant) => VariantFormModel.fromVariant(variant)).toList(),
    );
  }
}

extension ProductFormStateExt on ProductFormState {
  /// Checks if there is exactly one variant in the variant list.
  bool get hasOnlyOneVariant => (variants?.length ?? 0) == 1;

  /// Returns the first variant assuming there is exactly one variant in the list.
  ///
  /// **Precondition:** `variants` must contain exactly one variant.
  /// Calling this when the list is empty will throw an error.
  VariantFormModel get onlyVariant => variants!.first;

  /// Determines whether the product has only the default variant and no other variations.
  ///
  /// A product is considered to have only the default variant if:
  /// - It has exactly one variant, and
  /// - That variant is named "default".
  bool get hasOnlyDefaultVariant => hasOnlyOneVariant && onlyVariant.name == Strings.defaultVariantName;

  /// Determines whether the product has variations.
  ///
  /// A product is considered to have variations if:
  /// - It has one or more variant, and
  /// - None of the variants are named "default".
  bool get hasVariations =>
      (variants?.length ?? 0) >= 1 &&
      variants?.where((variant) => variant.name == Strings.defaultVariantName).isEmpty == true;

  /// Converts the list of variant form models into a list of variant entities.
  List<Variant> get toVariantEntities => variants?.map((form) => form.toVariant()).toList() ?? [];

  /// Converts the current form model into a [Product] entity.
  /// Assumes all required fields are non-null due to validation.
  Product toProduct() => Product(
        id: id,
        name: name!,
        category: category,
        imageUrl: imageUrl,
        variants: variants
                ?.map((variant) => Variant(
                      // Add temporary ID for default variant. This does not get included on the payload.
                      // True variants have their own temporary ID.
                      id: variant.id ?? -(const Uuid().v4().hashCode),
                      name: variant.name!,
                      warningStock: variant.warningStock,
                      idealStock: variant.idealStock,
                      sku: variant.sku!,
                      cost: variant.cost!,
                      suppliers: variant.suppliers!,
                      branchInventories: variant.branchInventories!,
                    ))
                .toList() ??
            [],
      );
}
