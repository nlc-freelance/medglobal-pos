import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:medglobal_admin_portal/core/enums/reports_enum.dart';
import 'package:medglobal_admin_portal/core/utils/debouncer.dart';
import 'package:medglobal_admin_portal/core/widgets/data_grid/data_grid.dart';
import 'package:medglobal_admin_portal/core/widgets/date_picker_popup.dart';
import 'package:medglobal_admin_portal/core/widgets/dropdowns/branch_dropdown.dart';
import 'package:medglobal_admin_portal/gen/assets.gen.dart';
import 'package:medglobal_admin_portal/portal/transactions/sale/presentation/cubit/sale_transaction_list_cubit.dart';
import 'package:medglobal_admin_portal/portal/transactions/sale/presentation/cubit/sale_transaction_list_filter_cubit.dart';
import 'package:medglobal_shared/medglobal_shared.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class SaleTransactionListToolbar extends StatefulWidget {
  const SaleTransactionListToolbar({super.key});

  @override
  State<SaleTransactionListToolbar> createState() => _SaleTransactionListToolbarState();
}

class _SaleTransactionListToolbarState extends State<SaleTransactionListToolbar> {
  final _debouncer = Debouncer(milliseconds: 500);

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
              context.read<SaleTransactionListFilterCubit>().setSearch(value);
              context.read<SaleTransactionListCubit>().getTransactions(
                    search: value,
                    size: context.read<SaleTransactionListFilterCubit>().state.size ?? 20,
                    startDate: context.read<SaleTransactionListFilterCubit>().state.startDate,
                    endDate: context.read<SaleTransactionListFilterCubit>().state.endDate,
                    branchId: context.read<SaleTransactionListFilterCubit>().state.branchId,
                  );
            }),
          ),
        ),
        const Spacer(),
        DatePickerPopup(
          onRemoveSelected: () {
            final size = context.read<SaleTransactionListFilterCubit>().state.size;
            final branchId = context.read<SaleTransactionListFilterCubit>().state.branchId;
            final search = context.read<SaleTransactionListFilterCubit>().state.search;

            context.read<SaleTransactionListCubit>().getTransactions(
                  size: size!,
                  search: search,
                  branchId: branchId,
                );

            context.read<SaleTransactionListFilterCubit>().setStartDate(null);
            context.read<SaleTransactionListFilterCubit>().setEndDate(null);
          },
          onSelectRange: (dates) {
            final size = context.read<SaleTransactionListFilterCubit>().state.size;
            final search = context.read<SaleTransactionListFilterCubit>().state.search;
            final branch = context.read<SaleTransactionListFilterCubit>().state.branchId;

            String? endDate;
            final startDate = DateFormat('MM-dd-yyyy').format(dates[0]!);
            if (dates.length == 2) endDate = DateFormat('MM-dd-yyyy').format(dates[1]!);

            context.read<SaleTransactionListCubit>().getTransactions(
                  size: size!,
                  search: search,
                  branchId: branch,
                  startDate: startDate,
                  endDate: endDate,
                );

            context.read<SaleTransactionListFilterCubit>().setStartDate(startDate);
            context.read<SaleTransactionListFilterCubit>().setEndDate(endDate);
          },
          selectionMode: DateRangePickerSelectionMode.range,
        ),
        BranchDropdown.select(
          onRemoveSelectedItem: () {
            final size = context.read<SaleTransactionListFilterCubit>().state.size;
            final startDate = context.read<SaleTransactionListFilterCubit>().state.startDate;
            final endDate = context.read<SaleTransactionListFilterCubit>().state.endDate;
            final search = context.read<SaleTransactionListFilterCubit>().state.search;

            context.read<SaleTransactionListCubit>().getTransactions(
                  size: size!,
                  startDate: startDate,
                  endDate: endDate,
                  search: search,
                );
            context.read<SaleTransactionListFilterCubit>().setBranch(null);
          },
          onSelectItem: (branch) {
            final size = context.read<SaleTransactionListFilterCubit>().state.size;
            final startDate = context.read<SaleTransactionListFilterCubit>().state.startDate;
            final endDate = context.read<SaleTransactionListFilterCubit>().state.endDate;
            final search = context.read<SaleTransactionListFilterCubit>().state.search;

            context.read<SaleTransactionListCubit>().getTransactions(
                  size: size!,
                  branchId: branch.id,
                  startDate: startDate,
                  endDate: endDate,
                  search: search,
                );
            context.read<SaleTransactionListFilterCubit>().setBranch(branch.id);
          },
        ),
        BlocSelector<SaleTransactionListFilterCubit, SaleTransactionListFilterState, Map<String, dynamic>>(
          selector: (state) => state.filters,
          builder: (context, filters) => ExportButton(
            type: ReportType.sales,
            filters: filters,
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _debouncer.dispose();
    super.dispose();
  }
}
