import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:medglobal_admin_portal/features/product_management/domain/entities/product/variant.dart';
import 'package:medglobal_admin_portal/features/supplier_management/domain/entities/supplier.dart';

part 'variant_form_state.dart';

class VariantFormCubit extends Cubit<VariantFormState> {
  VariantFormCubit() : super(VariantFormState.initial());

  void setVariant(Variant variant) => emit(VariantFormState(variant));

  void setSku(String value) => emit(VariantFormState(state.variant?.copyWith(sku: value)));
  void setWarningStockLevel(int value) => emit(VariantFormState(state.variant?.copyWith(warningStock: value)));
  void setIdealStockLevel(int value) => emit(VariantFormState(state.variant?.copyWith(idealStock: value)));
  void setSuppliers(List<Supplier> value) => emit(VariantFormState(state.variant?.copyWith(suppliers: value)));
}
