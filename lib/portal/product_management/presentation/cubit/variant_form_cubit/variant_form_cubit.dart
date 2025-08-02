import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medglobal_admin_portal/portal/product_management/domain/entities/branch_inventory/branch_inventory.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/form_models/variant_form_model.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/domain/entity/branch.dart';
import 'package:medglobal_admin_portal/portal/supplier_management/domain/entities/supplier.dart';
import 'package:uuid/uuid.dart';

part 'variant_form_state.dart';
part 'variant_form_cubit.freezed.dart';

class VariantFormCubit extends Cubit<VariantFormState> {
  VariantFormCubit() : super(VariantFormState.initial());

  void loadVariant(VariantFormModel variant) {
    emit(VariantFormState.load(variant));
  }

  void initDefaultVariant() => emit(state.copyWith(variant: VariantFormModel.initDefault()));

  void _updateVariant(VariantFormModel Function(VariantFormModel) updateFn) {
    final updated = updateFn(state.variant);
    emit(state.copyWith(variant: updated));
  }

  void setName(String value) => _updateVariant((variant) => variant.copyWith(name: value));

  void setSku(String value) => _updateVariant((variant) => variant.copyWith(sku: value));

  void setWarningStock(int? value) => _updateVariant((variant) => variant.copyWith(warningStock: value));

  void setIdealStock(int? value) => _updateVariant((variant) => variant.copyWith(idealStock: value));

  void setCost(double? value) => _updateVariant((variant) => variant.copyWith(cost: value));

  void toggleSupplier(Supplier supplier) {
    final suppliers = state.variant.suppliers;
    final exists = suppliers?.any((s) => s.id == supplier.id) ?? false;

    if (exists) {
      removeSupplier(supplier);
      return;
    }

    final updatedSuppliers = [...?suppliers, supplier];

    final updatedVariant = state.variant.copyWith(suppliers: updatedSuppliers);
    emit(state.copyWith(variant: updatedVariant));
  }

  void removeSupplier(Supplier supplier) => _updateVariant((variant) {
        final updatedSuppliers = (variant.suppliers ?? []).where((s) => s.id != supplier.id).toList();
        return variant.copyWith(suppliers: updatedSuppliers);
      });

  void addBranchInventory(Branch branch) {
    final branchInventories = state.variant.branchInventories;
    final exists = branchInventories?.any((variant) => variant.branch.id == branch.id) ?? false;

    if (exists) return;

    final newBranchInventory = BranchInventory(
      // final newBranchInventory = BranchInventoryFormModel(
      id: -(const Uuid().v4().hashCode),
      branch: branch,
    );

    final updatedBranchInventories = [...?branchInventories, newBranchInventory];

    final updatedVariant = state.variant.copyWith(branchInventories: updatedBranchInventories);
    emit(state.copyWith(variant: updatedVariant));
  }

  void removeBranchInventory(int id) => _updateVariant((variant) {
        final updatedBranchInventories =
            (variant.branchInventories ?? []).where((branchInventory) => branchInventory.id != id).toList();
        return variant.copyWith(branchInventories: updatedBranchInventories);
      });

  void setPricePerBranch(int id, double? value) => _updateVariant((variant) {
        final updatedBranchInventories = (variant.branchInventories ?? []).map((branch) {
          if (branch.id == id) return branch.copyWith(price: value);
          return branch;
        }).toList();

        return variant.copyWith(branchInventories: updatedBranchInventories);
      });

  void setQohPerBranch(int id, int? value) => _updateVariant((variant) {
        final updatedBranchInventories = (variant.branchInventories ?? []).map((branch) {
          if (branch.id == id) return branch.copyWith(quantityOnHand: value);
          return branch;
        }).toList();

        return variant.copyWith(branchInventories: updatedBranchInventories);
      });

  bool validate() {
    final isValid = state.variant.isFormValid();
    emit(state.copyWith(isValid: isValid));
    return isValid;
  }

  /// Reset the variant name to 'default' and set isValid to true
  /// Used when closing the form while in the context of editing a new default variant
  void resetNameAndValidation() => emit(
        state.copyWith(
          variant: state.variant.copyWith(name: 'default'),
          isValid: true,
        ),
      );

  void reset() => emit(VariantFormState.initial());
}
