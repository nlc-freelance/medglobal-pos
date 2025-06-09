import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medglobal_admin_portal/portal/product_management/domain/entities/category/category.dart';
import 'package:medglobal_admin_portal/portal/product_management/domain/entities/product/branch_inventory.dart';
import 'package:medglobal_admin_portal/portal/product_management/domain/entities/product/product.dart';
import 'package:medglobal_admin_portal/portal/product_management/domain/entities/product/variant.dart';
import 'package:medglobal_admin_portal/portal/supplier_management/domain/entities/supplier.dart';

part 'product_form_state.dart';
part 'product_form_cubit.freezed.dart';

class ProductFormCubit extends Cubit<ProductFormState> {
  ProductFormCubit() : super(ProductFormState.initial());

  void loadProduct(Product product) => emit(ProductFormState.fromProduct(product));

  void setName(String value) => emit(state.copyWith(name: value));

  void setCategory(Category value) => emit(state.copyWith(category: value));

  void addVariant(Variant variant) {
    final newVariant = VariantFormModel.fromVariant(variant);

    final updatedVariants = [...state.variants, newVariant];
    emit(state.copyWith(variants: updatedVariants));
  }

  void removeVariant(int id) {
    final updatedVariants = state.variants.where((variant) => variant.id != id).toList();
    emit(state.copyWith(variants: updatedVariants.isEmpty ? [VariantFormModel.initDefault()] : updatedVariants));
  }

  void updateVariant(Variant variant) {
    final updatedVariant = VariantFormModel.fromVariant(variant);

    final updatedVariants = state.variants.map((variant) {
      return variant.id == updatedVariant.id ? updatedVariant : variant;
    }).toList();
    emit(state.copyWith(variants: updatedVariants));
  }
}
