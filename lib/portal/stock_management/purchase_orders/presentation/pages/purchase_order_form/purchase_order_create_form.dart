import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/widgets/form/form.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/domain/entity/branch.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/presentation/cubit/new_purchase_order_form/new_purchase_order_form_cubit.dart';
import 'package:medglobal_admin_portal/portal/supplier_management/domain/entities/supplier.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class PurchaseOrderCreateForm extends StatelessWidget {
  const PurchaseOrderCreateForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppDropdownFormField<Supplier>.lazy(
          labelPosition: LabelPosition.left,
          label: 'Supplier',
          hint: 'Select supplier',
          isRequired: true,
          getName: (supplier) => supplier.name,
          onChanged: (supplier) => context.read<NewPurchaseOrderFormCubit>().setSupplierId(supplier.id!),
        ),
        const UIVerticalSpace(16),
        AppDropdownFormField<BranchPartial>.lazy(
          labelPosition: LabelPosition.left,
          label: 'Target Branch',
          hint: 'Select target branch',
          isRequired: true,
          getName: (branch) => branch.name,
          onChanged: (branch) => context.read<NewPurchaseOrderFormCubit>().setBranchId(branch.id),
        ),
        const UIVerticalSpace(40),
        BlocBuilder<NewPurchaseOrderFormCubit, NewPurchaseOrderFormState>(
          builder: (context, state) {
            return AppCheckboxListTile(
              label: 'Autofill from supply needs',
              subtitle: 'Autofill your order with products below or equal to their warning stock levels',
              value: state.newPurchaseOrder.isAutoFill,
              onToggle: (value) => context.read<NewPurchaseOrderFormCubit>().setAutoFill(value),
            );
          },
        ),
        const Divider(color: UIColors.borderMuted, thickness: 0.8),
      ],
    );
  }
}
