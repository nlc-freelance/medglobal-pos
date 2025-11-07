import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:medglobal_admin_portal/core/utils/debouncer.dart';
import 'package:medglobal_admin_portal/core/widgets/date_picker_popup.dart';
import 'package:medglobal_admin_portal/core/widgets/dropdowns/branch_dropdown.dart';
import 'package:medglobal_admin_portal/gen/assets.gen.dart';
import 'package:medglobal_admin_portal/portal/transactions/return/presentation/cubit/return_transaction_list_cubit.dart';
import 'package:medglobal_admin_portal/portal/transactions/return/presentation/cubit/return_transaction_list_filter_cubit.dart';
import 'package:medglobal_shared/medglobal_shared.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class ReturnsToolbar extends StatefulWidget {
  const ReturnsToolbar({super.key});

  @override
  State<ReturnsToolbar> createState() => _ReturnsToolbarState();
}

class _ReturnsToolbarState extends State<ReturnsToolbar> {
  final _debouncer = Debouncer(milliseconds: 500);

  @override
  void initState() {
    super.initState();
    context.read<ReturnTransactionListFilterCubit>().reset();
  }

  @override
  void dispose() {
    _debouncer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      children: [
        UISearchField(
          fieldWidth: 450.0,
          hint: 'Search receipt ID',
          icon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Assets.icons.search.svg(),
          ),
          onChanged: (value) => _debouncer.run(
            (() {
              context.read<ReturnTransactionListFilterCubit>().setSearch(value);
              context.read<ReturnTransactionListCubit>().getTransactions(
                    search: value,
                    size: context.read<ReturnTransactionListFilterCubit>().state.size ?? 20,
                    startDate: context.read<ReturnTransactionListFilterCubit>().state.startDate,
                    endDate: context.read<ReturnTransactionListFilterCubit>().state.endDate,
                    branchId: context.read<ReturnTransactionListFilterCubit>().state.branchId,
                  );
            }),
          ),
        ),
        const Spacer(),
        DatePickerPopup(
          onRemoveSelected: () {
            final size = context.read<ReturnTransactionListFilterCubit>().state.size;
            final branchId = context.read<ReturnTransactionListFilterCubit>().state.branchId;
            final search = context.read<ReturnTransactionListFilterCubit>().state.search;

            context.read<ReturnTransactionListCubit>().getTransactions(
                  size: size!,
                  search: search,
                  branchId: branchId,
                );

            context.read<ReturnTransactionListFilterCubit>().setStartDate(null);
            context.read<ReturnTransactionListFilterCubit>().setEndDate(null);
          },
          onSelectRange: (dates) {
            final size = context.read<ReturnTransactionListFilterCubit>().state.size;
            final branch = context.read<ReturnTransactionListFilterCubit>().state.branchId;
            final search = context.read<ReturnTransactionListFilterCubit>().state.search;

            String? endDate;
            final startDate = DateFormat('MM-dd-yyyy').format(dates[0]!);
            if (dates.length == 2) endDate = DateFormat('MM-dd-yyyy').format(dates[1]!);

            context.read<ReturnTransactionListCubit>().getTransactions(
                  size: size!,
                  search: search,
                  branchId: branch,
                  startDate: startDate,
                  endDate: endDate,
                );

            context.read<ReturnTransactionListFilterCubit>().setStartDate(startDate);
            context.read<ReturnTransactionListFilterCubit>().setEndDate(endDate);
          },
          selectionMode: DateRangePickerSelectionMode.range,
        ),
        BranchDropdown.select(
          onRemoveSelectedItem: () {
            final size = context.read<ReturnTransactionListFilterCubit>().state.size;
            final startDate = context.read<ReturnTransactionListFilterCubit>().state.startDate;
            final endDate = context.read<ReturnTransactionListFilterCubit>().state.endDate;
            final search = context.read<ReturnTransactionListFilterCubit>().state.search;

            context.read<ReturnTransactionListCubit>().getTransactions(
                  size: size!,
                  search: search,
                  startDate: startDate,
                  endDate: endDate,
                );
            context.read<ReturnTransactionListFilterCubit>().setBranch(null);
          },
          onSelectItem: (branch) {
            final size = context.read<ReturnTransactionListFilterCubit>().state.size;
            final startDate = context.read<ReturnTransactionListFilterCubit>().state.startDate;
            final endDate = context.read<ReturnTransactionListFilterCubit>().state.endDate;
            final search = context.read<ReturnTransactionListFilterCubit>().state.search;

            context.read<ReturnTransactionListCubit>().getTransactions(
                  size: size!,
                  search: search,
                  branchId: branch.id,
                  startDate: startDate,
                  endDate: endDate,
                );
            context.read<ReturnTransactionListFilterCubit>().setBranch(branch.id);
          },
        ),
      ],
    );
  }
}
