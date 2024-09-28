import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/widgets/date_picker_popup.dart';
import 'package:medglobal_admin_portal/core/widgets/dropdowns/branch_dropdown.dart';
import 'package:medglobal_admin_portal/portal/transactions/sales/presentation/cubit/sale_transaction_list_cubit.dart';
import 'package:medglobal_admin_portal/portal/transactions/sales/presentation/cubit/sale_transaction_list_filter_cubit.dart';
import 'package:medglobal_admin_portal/portal/transactions/sales/presentation/pages/sale_transaction_list/sale_transaction_paginated_data_grid.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class SaleTransactionsPage extends StatefulWidget {
  const SaleTransactionsPage({super.key});

  @override
  State<SaleTransactionsPage> createState() => _SaleTransactionsPageState();
}

class _SaleTransactionsPageState extends State<SaleTransactionsPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const PageHeader(
          title: 'Sales',
          subtitle: 'View all sale transactions to analyze sales performance.',
        ),
        const UIVerticalSpace(20),
        DataGridToolbar(
          isDownloadable: true,
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
              child: DatePickerPopup(onSelect: (date) {}),
            ),
            const UIHorizontalSpace(8),
            BranchDropdown.select(
              onRemoveSelectedItem: () {
                final saleSize = context.read<SaleTransactionListFilterCubit>().state.size;

                context.read<SaleTransactionListCubit>().getTransactions(size: saleSize!);
                context.read<SaleTransactionListFilterCubit>().setBranch(null);
              },
              onSelectItem: (branch) {
                final saleSize = context.read<SaleTransactionListFilterCubit>().state.size;

                context.read<SaleTransactionListCubit>().getTransactions(size: saleSize!, branchId: branch.id);
                context.read<SaleTransactionListFilterCubit>().setBranch(branch.id);
              },
            ),
          ],
        ),
        const Expanded(child: SaleTransactionPaginatedDataGrid()),
      ],
    );
  }
}
