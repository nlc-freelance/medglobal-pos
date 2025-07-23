import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/product_management/domain/entities/category/category.dart';
import 'package:medglobal_admin_portal/portal/product_management/domain/entities/product/product.dart';
import 'package:medglobal_admin_portal/portal/product_management/domain/entities/variant/variant.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/cubit/form_models/variant_form_model.dart';

part 'product_form_state.dart';
part 'product_form_cubit.freezed.dart';

class ProductFormCubit extends Cubit<ProductFormState> {
  ProductFormCubit() : super(ProductFormState.initial());

  void loadProduct(Product product) => emit(ProductFormState.load(product));

  void setName(String value) => emit(state.copyWith(name: value));

  void setCategory(Category value) => emit(state.copyWith(category: value));

  void addVariant(VariantFormModel newVariant) {
    final updatedVariants = [...?state.variants, newVariant];
    emit(state.copyWith(variants: updatedVariants));
  }

  void removeVariant(int id) {
    final updatedVariants = (state.variants ?? []).where((variant) => variant.id != id).toList();
    emit(state.copyWith(variants: updatedVariants));
  }

  void updateVariant(VariantFormModel updatedVariant) {
    final updatedVariants = (state.variants ?? []).map((variant) {
      return variant.id == updatedVariant.id ? updatedVariant : variant;
    }).toList();

    emit(state.copyWith(variants: updatedVariants));
  }

  /// Replaces the initial default variant with a new named (specific) variant.
  ///
  /// This is used when a product started with no variations
  /// and is now being edited to have user-defined variant details.
  void upgradeDefaultVariant(VariantFormModel newVariant) {
    final updatedVariants = (state.variants ?? []).map((variant) {
      return variant.name == Strings.defaultVariantName ? newVariant : variant;
    }).toList();

    emit(state.copyWith(variants: updatedVariants));
  }

  /// Validates the product form data.
  ///
  /// Returns `true` if the form is valid, and `false`
  /// if **any** required field is missing or invalid.
  ///
  /// The following are required:
  /// - `name` must be non-null and non-empty
  /// - `variants` must not be empty
  /// - For each variant:
  ///   - For "default variant"
  ///     - `variant.name` must be non-null, non-empty
  ///   - If there are variations (one or more named variants):
  ///     - `variant.name` must be non-null, non-empty, and not named `"default"`
  ///   - `sku` must be non-null and non-empty
  ///   - `cost` must be non-null and greater than or equal to 0
  ///   - `suppliers` must be non-null
  ///   - `branchInventories` must be non-null
  ///   - Each `branchInventory` must have non-null `price` and `quantityOnHand`
  bool validate() {
    final isValid = _isFormValid();
    emit(state.copyWith(isValid: isValid));
    return isValid;
  }

  bool _isFormValid() {
    if (state.name?.trim().isEmpty ?? true) return false;

    if (state.variants?.isEmpty ?? true) return false;

    for (final variant in state.variants!) {
      final variantName = variant.name?.trim().toLowerCase();
      final isVariantNullOrEmpty = variantName == null || variantName.isEmpty;

      if (state.hasVariations) {
        if (isVariantNullOrEmpty || variantName == Strings.defaultVariantName) return false;
      } else {
        if (isVariantNullOrEmpty) return false;
      }

      if (variant.sku?.trim().isEmpty ?? true) return false;

      if (variant.cost == null || variant.cost! <= 0) return false;

      if (variant.suppliers == null || variant.suppliers!.isEmpty) return false;

      if (variant.branchInventories == null || variant.branchInventories!.isEmpty) return false;

      for (final inventory in variant.branchInventories!) {
        if (inventory.price == null) return false;
        if (inventory.quantityOnHand == null) return false;
      }
    }

    return true;
  }
}
