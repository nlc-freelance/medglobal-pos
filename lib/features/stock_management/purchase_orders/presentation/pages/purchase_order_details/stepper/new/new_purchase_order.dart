import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:medglobal_admin_portal/core/widgets/dropdowns/search_dropdown/search_dropdown.dart';
import 'package:medglobal_admin_portal/features/branches/domain/branch.dart';
import 'package:medglobal_admin_portal/features/branches/domain/branch_repository.dart';
import 'package:medglobal_admin_portal/features/stock_management/purchase_orders/presentation/cubit/new_purchase_order/new_purchase_order_cubit.dart';
import 'package:medglobal_admin_portal/features/supplier_management/domain/entities/supplier.dart';
import 'package:medglobal_admin_portal/features/supplier_management/domain/repositories/supplier_repository.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class NewPurchaseOrder extends StatelessWidget {
  const NewPurchaseOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SearchDropdown<Supplier>.single(
          hint: 'Select supplier',
          label: 'Supplier',
          isLeftLabel: true,
          isRequired: true,
          itemAsString: (supplier) => supplier.name,
          asyncItemsCallback: GetIt.I<SupplierRepository>().getAllSuppliers(),
          onSelectItem: (Supplier value) => context.read<NewPurchaseOrderCubit>().setSupplierId(value.id!),
        ),
        const UIVerticalSpace(16),
        SearchDropdown<Branch>.single(
          hint: 'Select target branch',
          label: 'Target Branch',
          isLeftLabel: true,
          isRequired: true,
          itemAsString: (branch) => branch.name,
          asyncItemsCallback: GetIt.I<BranchRepository>().getAllBranches(),
          onSelectItem: (Branch value) => context.read<NewPurchaseOrderCubit>().setBranchId(value.id),
        ),
        const UIVerticalSpace(40),
        UICheckboxListTile(
          'Autofill from supply needs',
          subtitle: 'Autofill your order with products below or equal to their warning stock levels',
          onToggle: (value) => context.read<NewPurchaseOrderCubit>().setAutoFill(value),
        ),
        const Divider(color: UIColors.borderMuted, thickness: 0.8),
        const UIVerticalSpace(30),
      ],
    );
  }
}
