import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/widgets/dropdowns/branch_dropdown.dart';
import 'package:medglobal_admin_portal/core/widgets/dropdowns/supplier_dropdown.dart';
import 'package:medglobal_admin_portal/portal/branches/domain/entities/branch.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/presentation/cubit/new_purchase_order/new_purchase_order_cubit.dart';
import 'package:medglobal_admin_portal/portal/stock_management/supply_needs/presentation/cubit/supply_need/supply_need_cubit.dart';
import 'package:medglobal_admin_portal/portal/supplier_management/domain/entities/supplier.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class NewPurchaseOrderForm extends StatelessWidget {
  const NewPurchaseOrderForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SupplierDropdown.input_left(
          label: 'Supplier',
          hint: 'Select supplier',
          required: true,
          onSelectItem: (Supplier value) => context.read<NewPurchaseOrderCubit>().setSupplierId(value.id!),
        ),
        const UIVerticalSpace(16),
        BranchDropdown.input_left(
          label: 'Target Branch',
          hint: 'Select target branch',
          required: true,
          selectedItem: context.read<SupplyNeedCubit>().state.purchaseOrderTargetBranch,
          onSelectItem: (Branch value) => context.read<NewPurchaseOrderCubit>().setBranchId(value.id!),
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
