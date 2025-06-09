import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medglobal_admin_portal/portal/product_management/domain/entities/product/branch_inventory.dart';
import 'package:medglobal_admin_portal/portal/product_management/domain/entities/product/variant.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/bloc/product_form_cubit/product_form_cubit.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/domain/entity/branch.dart';
import 'package:medglobal_admin_portal/portal/supplier_management/domain/entities/supplier.dart';

part 'variant_form_state.dart';
part 'variant_form_cubit.freezed.dart';

class VariantFormCubit extends Cubit<VariantFormState> {
  VariantFormCubit() : super(VariantFormState.initial());

  void loadVariant(Variant variant) {
    final variantFormModel = VariantFormModel.fromVariant(variant);
    emit(VariantFormState.load(variantFormModel));
  }

  void setName(String value) => emit(state.copyWith(name: value));

  void setSku(String value) => emit(state.copyWith(sku: value));

  void setWarningStock(int value) => emit(state.copyWith(warningStock: value));

  void setIdealStock(int value) => emit(state.copyWith(idealStock: value));

  void setCost(double value) => emit(state.copyWith(cost: value));

  void addSupplier(Supplier newSupplier) {
    if (state.suppliers.any((supplier) => supplier.id == newSupplier.id)) return;

    final updatedSuppliers = [...state.suppliers, newSupplier];
    emit(state.copyWith(suppliers: updatedSuppliers));
  }

  void removeSupplier(int id) {
    final updatedSuppliers = state.suppliers.where((supplier) => supplier.id != id).toList();
    emit(state.copyWith(suppliers: updatedSuppliers));
  }

  void addBranchInventory(BranchLite newBranch) {
    if (state.branchInventories.any((branchInventory) => branchInventory.branch.id == newBranch.id)) return;

    final newBranchInventory = BranchInventory(branch: newBranch, price: 0.0, qtyOnHand: 0);
    final updatedBranchInventories = [...state.branchInventories, newBranchInventory];

    emit(state.copyWith(branchInventories: updatedBranchInventories));
  }

  void removeBranchInventory(int id) {
    final updatedBranchInventories =
        state.branchInventories.where((branchInventory) => branchInventory.id != id).toList();
    emit(state.copyWith(branchInventories: updatedBranchInventories));
  }

  void setPricePerBranch(int id, double value) {
    final updatedBranchInventories = state.branchInventories.map((branchInventory) {
      if (branchInventory.id == id) return branchInventory.copyWith(price: value);
      return branchInventory;
    }).toList();

    emit(state.copyWith(branchInventories: updatedBranchInventories));
  }

  void setQohPerBranch(int id, int value) {
    final updatedBranchInventories = state.branchInventories.map((branchInventory) {
      if (branchInventory.id == id) return branchInventory.copyWith(qtyOnHand: value);
      return branchInventory;
    }).toList();

    emit(state.copyWith(branchInventories: updatedBranchInventories));
  }

  void reset() => emit(VariantFormState.initial());
}
