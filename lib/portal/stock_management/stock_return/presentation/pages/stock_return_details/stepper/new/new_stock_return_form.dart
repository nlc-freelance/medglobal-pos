import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/widgets/dropdowns/branch_dropdown.dart';
import 'package:medglobal_admin_portal/core/widgets/dropdowns/supplier_dropdown.dart';
import 'package:medglobal_admin_portal/portal/branches/domain/entities/branch.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_return/presentation/cubit/new_stock_return/new_stock_return_cubit.dart';
import 'package:medglobal_admin_portal/portal/supplier_management/domain/entities/supplier.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class NewStockReturnForm extends StatelessWidget {
  const NewStockReturnForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SupplierDropdown.input_left(
            label: 'Supplier',
            hint: 'Select supplier',
            required: true,
            onSelectItem: (Supplier value) => context.read<NewStockReturnCubit>().setSupplierId(value.id!),
          ),
          const UIVerticalSpace(16),
          BranchDropdown.input_left(
            label: 'Return from Branch',
            hint: 'Select branch',
            required: true,
            onSelectItem: (Branch value) => context.read<NewStockReturnCubit>().setBranchId(value.id!),
          ),
          const UIVerticalSpace(40),
          const Divider(color: UIColors.borderMuted, thickness: 0.8),
          const UIVerticalSpace(30),
        ],
      ),
    );
  }
}
