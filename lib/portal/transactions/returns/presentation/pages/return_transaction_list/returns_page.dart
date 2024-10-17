import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/widgets/date_picker_popup.dart';
import 'package:medglobal_admin_portal/core/widgets/dropdowns/branch_dropdown.dart';
import 'package:medglobal_admin_portal/portal/transactions/returns/presentation/cubit/return_transaction_list_cubit.dart';
import 'package:medglobal_admin_portal/portal/transactions/returns/presentation/cubit/return_transaction_list_filter_cubit.dart';
import 'package:medglobal_admin_portal/portal/transactions/returns/presentation/pages/return_transaction_list/return_transaction_paginated_data_grid.dart';
import 'package:medglobal_shared/medglobal_shared.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class ReturnTransactionsPage extends StatefulWidget {
  const ReturnTransactionsPage({super.key});

  @override
  State<ReturnTransactionsPage> createState() => _ReturnTransactionsPageState();
}

class _ReturnTransactionsPageState extends State<ReturnTransactionsPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const PageHeader(
          title: 'Returns',
          subtitle: 'View all return transactions and manage returned stocks.',
        ),
        const UIVerticalSpace(20),
        DataGridToolbar(
          search: UISearchField(
            fieldWidth: 500.0,
            hint: 'Search receipt ID',
            icon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Assets.icons.search.svg(),
            ),
            onChanged: (value) {},
          ),
          filters: [
            SizedBox(
              width: 150,
              child: DatePickerPopup(
                onSelect: (date) {},
                selectionMode: DateRangePickerSelectionMode.range,
              ),
            ),
            const UIHorizontalSpace(8),
            BranchDropdown.select(
              onRemoveSelectedItem: () {
                final returnSize = context.read<ReturnTransactionListFilterCubit>().state.size;

                context.read<ReturnTransactionListCubit>().getTransactions(size: returnSize!);
                context.read<ReturnTransactionListFilterCubit>().setBranch(null);
              },
              onSelectItem: (branch) {
                final returnSize = context.read<ReturnTransactionListFilterCubit>().state.size;

                context.read<ReturnTransactionListCubit>().getTransactions(size: returnSize!, branchId: branch.id);
                context.read<ReturnTransactionListFilterCubit>().setBranch(branch.id);
              },
            ),
          ],
        ),
        const Expanded(child: ReturnTransactionPaginatedDataGrid()),
      ],
    );
  }
}
