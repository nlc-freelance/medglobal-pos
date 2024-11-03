import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/widgets/date_picker_popup.dart';
import 'package:medglobal_admin_portal/core/widgets/dropdowns/branch_dropdown.dart';
import 'package:medglobal_admin_portal/portal/transactions/sales/presentation/cubit/sale_transaction_list_cubit.dart';
import 'package:medglobal_admin_portal/portal/transactions/sales/presentation/cubit/sale_transaction_list_filter_cubit.dart';
import 'package:medglobal_admin_portal/portal/transactions/sales/presentation/pages/sale_transaction_list/sale_transaction_paginated_data_grid.dart';
import 'package:medglobal_shared/medglobal_shared.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

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
            DatePickerPopup(
              onRemoveSelected: () {
                final size = context.read<SaleTransactionListFilterCubit>().state.size;
                final branchId = context.read<SaleTransactionListFilterCubit>().state.branchId;

                context.read<SaleTransactionListCubit>().getTransactions(size: size!, branchId: branchId);

                context.read<SaleTransactionListFilterCubit>().setStartDate(null);
                context.read<SaleTransactionListFilterCubit>().setEndDate(null);
              },
              onSelectRange: (dates) {
                final size = context.read<SaleTransactionListFilterCubit>().state.size;
                final branch = context.read<SaleTransactionListFilterCubit>().state.branchId;

                String? endDate;
                final startDate = DateFormat('MM-dd-yyyy').format(dates[0]!);
                if (dates.length == 2) endDate = DateFormat('MM-dd-yyyy').format(dates[1]!);

                context
                    .read<SaleTransactionListCubit>()
                    .getTransactions(size: size!, branchId: branch, startDate: startDate, endDate: endDate);

                context.read<SaleTransactionListFilterCubit>().setStartDate(startDate);
                context.read<SaleTransactionListFilterCubit>().setEndDate(endDate);
              },
              selectionMode: DateRangePickerSelectionMode.range,
            ),
            const UIHorizontalSpace(8),
            BranchDropdown.select(
              onRemoveSelectedItem: () {
                final size = context.read<SaleTransactionListFilterCubit>().state.size;
                final startDate = context.read<SaleTransactionListFilterCubit>().state.startDate;
                final endDate = context.read<SaleTransactionListFilterCubit>().state.endDate;

                context.read<SaleTransactionListCubit>().getTransactions(
                      size: size!,
                      startDate: startDate,
                      endDate: endDate,
                    );
                context.read<SaleTransactionListFilterCubit>().setBranch(null);
              },
              onSelectItem: (branch) {
                final size = context.read<SaleTransactionListFilterCubit>().state.size;
                final startDate = context.read<SaleTransactionListFilterCubit>().state.startDate;
                final endDate = context.read<SaleTransactionListFilterCubit>().state.endDate;

                context.read<SaleTransactionListCubit>().getTransactions(
                      size: size!,
                      branchId: branch.id,
                      startDate: startDate,
                      endDate: endDate,
                    );
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
