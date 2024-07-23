import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:medglobal_admin_portal/core/widgets/dropdowns/search_dropdown/search_dropdown.dart';
import 'package:medglobal_admin_portal/portal/branches/domain/branch.dart';
import 'package:medglobal_admin_portal/portal/branches/domain/branch_repository.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_transfer/presentation/cubit/new_stock_transfer/new_stock_transfer_cubit.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class NewStockTransferForm extends StatelessWidget {
  const NewStockTransferForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SearchDropdown<Branch>.single(
          hint: 'Select source branch',
          label: 'Source Branch',
          isLeftLabel: true,
          isRequired: true,
          itemAsString: (branch) => branch.name,
          asyncItemsCallback: GetIt.I<BranchRepository>().getAllBranches(),
          onSelectItem: (Branch value) => context.read<NewStockTransferCubit>().setSourceBranchId(value.id!),
        ),
        const UIVerticalSpace(16),
        SearchDropdown<Branch>.single(
          hint: 'Select destination branch',
          label: 'Destination Branch',
          isLeftLabel: true,
          isRequired: true,
          itemAsString: (branch) => branch.name,
          asyncItemsCallback: GetIt.I<BranchRepository>().getAllBranches(),
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
