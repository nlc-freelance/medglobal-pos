import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:medglobal_admin_portal/features/branches/domain/branch.dart';
import 'package:medglobal_admin_portal/features/product_management/domain/entities/product/branch_inventory.dart';
import 'package:medglobal_admin_portal/features/product_management/domain/entities/product/variant.dart';
import 'package:medglobal_admin_portal/features/supplier_management/domain/entities/supplier.dart';
import 'package:uuid/uuid.dart';

part 'variant_form_state.dart';

class VariantFormCubit extends Cubit<VariantFormState> {
  VariantFormCubit() : super(VariantFormState.initial());

  void setVariant(Variant variant) => emit(VariantFormState(variant));

  void resetForm() => emit(const VariantFormState(Variant()));

  void setName(String value) => emit(VariantFormState(state.variant?.copyWith(name: value)));

  void setSku(String value) => emit(VariantFormState(state.variant?.copyWith(sku: value)));

  void setWarningStockLevel(String value) =>
      emit(VariantFormState(state.variant?.copyWith(warningStock: int.tryParse(value))));

  void setIdealStockLevel(String value) =>
      emit(VariantFormState(state.variant?.copyWith(idealStock: int.tryParse(value))));

  void setCost(String value) => emit(VariantFormState(state.variant?.copyWith(cost: double.tryParse(value))));

  void setSuppliers(List<Supplier> value) => emit(VariantFormState(state.variant?.copyWith(suppliers: value)));

  void addBranchInventory(List<Branch> branches) {
    final branchInventories = state.variant?.branchInventories?.toList() ?? [];

    for (var branch in branches) {
      if (!branchInventories.map((data) => data.branch).toList().contains(branch) || branchInventories.isEmpty) {
        final mappedBranchInventory =
            BranchInventory(id: -(const Uuid().v4().hashCode), branch: branch, price: 0, qtyOnHand: 0);

        branchInventories.add(mappedBranchInventory);
      }
    }

    emit(VariantFormState(state.variant?.copyWith(branchInventories: branchInventories)));
  }

  void removeBranchInventory(int id) {
    final branchInventories = state.variant?.branchInventories?.toList() ?? [];
    branchInventories.removeWhere((branchInventory) => branchInventory.id == id);
    emit(VariantFormState(state.variant?.copyWith(branchInventories: branchInventories)));
  }

  void setPricePerBranch(int id, double value) {
    final branchInventories = state.variant?.branchInventories?.toList() ?? [];
    final updatedBranchInventories = branchInventories.map((branchInventory) {
      if (branchInventory.id == id) return branchInventory.copyWith(price: value);
      return branchInventory;
    }).toList();

    emit(VariantFormState(state.variant?.copyWith(branchInventories: updatedBranchInventories)));
  }

  void setQohPerBranch(int id, int value) {
    final branchInventories = state.variant?.branchInventories?.toList();
    final updatedBranchInventories = branchInventories?.map((branchInventory) {
      if (branchInventory.id == id) return branchInventory.copyWith(qtyOnHand: value);
      return branchInventory;
    }).toList();

    emit(VariantFormState(state.variant?.copyWith(branchInventories: updatedBranchInventories)));
  }
}
