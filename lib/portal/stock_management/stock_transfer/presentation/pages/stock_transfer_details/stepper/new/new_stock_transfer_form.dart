import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/widgets/dropdowns/branch_dropdown.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/domain/entity/branch.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_transfer/presentation/cubit/new_stock_transfer/new_stock_transfer_cubit.dart';
import 'package:medglobal_admin_portal/portal/stock_management/supply_needs/presentation/cubit/supply_need/supply_need_cubit.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class NewStockTransferForm extends StatelessWidget {
  const NewStockTransferForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BranchDropdown.input_left(
          label: 'Source Branch',
          hint: 'Select source branch',
          required: true,
          selectedItem: context.read<SupplyNeedCubit>().state.stockTransferSourceBranch,
          onSelectItem: (Branch value) => context.read<NewStockTransferCubit>().setSourceBranchId(value.id!),
        ),
        const UIVerticalSpace(16),
        BranchDropdown.input_left(
          label: 'Destination Branch',
          hint: 'Select destination branch',
          required: true,
          onSelectItem: (Branch value) => context.read<NewStockTransferCubit>().setDestinationBranchId(value.id!),
        ),
        const UIVerticalSpace(40),
        UICheckboxListTile(
          'Autofill from supply needs',
          subtitle: 'Autofill your order with products below or equal to their warning stock levels',
          onToggle: (value) => context.read<NewStockTransferCubit>().setAutoFill(value),
        ),
        const Divider(color: UIColors.borderMuted, thickness: 0.8),
        const UIVerticalSpace(30),
      ],
    );
  }
}
