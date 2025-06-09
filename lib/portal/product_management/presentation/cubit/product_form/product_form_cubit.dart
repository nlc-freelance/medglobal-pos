// import 'dart:core';

// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';
// import 'package:medglobal_admin_portal/portal/product_management/domain/entities/category/category.dart';
// import 'package:medglobal_admin_portal/portal/product_management/domain/entities/product/product.dart';
// import 'package:medglobal_admin_portal/portal/product_management/domain/entities/product/variant.dart';

// part 'product_form_state.dart';

// class ProductFormCubit extends Cubit<ProductFormState> {
//   ProductFormCubit() : super(ProductFormState.initial());

//   void setProduct(Product product) => emit(ProductFormState(product));

//   void setName(String value) {
//     emit(ProductFormState(state.product?.copyWith(name: value)));
//   }

//   void setCategory(Category value) => emit(ProductFormState(state.product?.copyWith(category: value)));
//   void setImageUrl(String value) => emit(ProductFormState(state.product?.copyWith(imageUrl: value)));

//   void setDefaultVariant(Variant value) {
//     List<Variant> defaultVariant = [];
//     defaultVariant = [value.copyWith(name: 'default')];
//     emit(ProductFormState(state.product?.copyWith(variants: defaultVariant)));
//   }

//   void addVariant(Variant value) {
//     final variants = state.product?.variants?.toList();
//     final updatedVariants = [...?variants, value];

//     emit(ProductFormState(state.product?.copyWith(variants: updatedVariants)));
//   }

//   void updateVariant(int id, Variant value) {
//     final variants = state.product?.variants?.toList() ?? [];

//     variants.removeWhere((variant) => variant.id == id);

//     final updatedVariants = [...variants, value];

//     emit(ProductFormState(state.product?.copyWith(variants: updatedVariants)));
//   }

//   void removeVariant(int id) {
//     final variants = state.product?.variants?.toList() ?? [];
//     variants.removeWhere((variant) => variant.id == id);

//     emit(ProductFormState(state.product?.copyWith(variants: variants)));
//   }
// }
