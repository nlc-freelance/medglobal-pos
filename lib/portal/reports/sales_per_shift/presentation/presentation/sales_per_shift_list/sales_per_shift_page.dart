import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/widgets/date_picker_popup.dart';
import 'package:medglobal_admin_portal/core/widgets/dropdowns/branch_dropdown.dart';
import 'package:medglobal_admin_portal/portal/reports/sales_per_shift/presentation/cubit/sales_per_shift_filter/sales_per_shift_filter_cubit.dart';
import 'package:medglobal_admin_portal/portal/reports/sales_per_shift/presentation/cubit/sales_per_shift_list/sales_per_shift_list_cubit.dart';
import 'package:medglobal_admin_portal/portal/reports/sales_per_shift/presentation/presentation/sales_per_shift_list/sales_per_shift_paginated_data_grid.dart';
import 'package:medglobal_shared/medglobal_shared.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class SalesPerShiftPage extends StatefulWidget {
  const SalesPerShiftPage({super.key});

  @override
  State<SalesPerShiftPage> createState() => _SalesPerShiftPageState();
}

class _SalesPerShiftPageState extends State<SalesPerShiftPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const PageHeader(
          title: 'Sales per Shift',
          subtitle:
              'View open and closing details, transactions, and funds generated within a shift to help analyze sales performance during different timeframes of the day.',
        ),
        const UIVerticalSpace(20),
        BlocSelector<SalesPerShiftListFilterCubit, SalesPerShiftListFilterState, SalesPerShiftListFilterState>(
          selector: (state) => state,
          builder: (context, filters) {
            return DataGridToolbar(
              // reportType: ReportType.SALES_PER_SHIFT,
              // reportFilters: {
              //   'branch': filters.branchId,
              //   'startDate': filters.startDate,
              //   'endDate': filters.endDate,
              // },
              filters: [
                DatePickerPopup(
                  onRemoveSelected: () {
                    final size = context.read<SalesPerShiftListFilterCubit>().state.size;
                    final branchId = context.read<SalesPerShiftListFilterCubit>().state.branchId;

                    context.read<SalesPerShiftListCubit>().getSalesPerShift(size: size!, branchId: branchId);

                    context.read<SalesPerShiftListFilterCubit>().setStartDate(null);
                    context.read<SalesPerShiftListFilterCubit>().setEndDate(null);
                  },
                  onSelectRange: (dates) {
                    final size = context.read<SalesPerShiftListFilterCubit>().state.size;
                    final branch = context.read<SalesPerShiftListFilterCubit>().state.branchId;

                    String? endDate;
                    final startDate = DateFormat('MM-dd-yyyy').format(dates[0]!);
                    if (dates.length == 2) endDate = DateFormat('MM-dd-yyyy').format(dates[1]!);

                    context
                        .read<SalesPerShiftListCubit>()
                        .getSalesPerShift(size: size!, branchId: branch, startDate: startDate, endDate: endDate);

                    context.read<SalesPerShiftListFilterCubit>().setStartDate(startDate);
                    context.read<SalesPerShiftListFilterCubit>().setEndDate(endDate);
                  },
                  selectionMode: DateRangePickerSelectionMode.range,
                ),
                const UIHorizontalSpace(8),
                BranchDropdown.select(
                  onRemoveSelectedItem: () {
                    final size = context.read<SalesPerShiftListFilterCubit>().state.size;
                    final startDate = context.read<SalesPerShiftListFilterCubit>().state.startDate;
                    final endDate = context.read<SalesPerShiftListFilterCubit>().state.endDate;

                    context.read<SalesPerShiftListCubit>().getSalesPerShift(
                          size: size!,
                          startDate: startDate,
                          endDate: endDate,
                        );
                    context.read<SalesPerShiftListFilterCubit>().setBranch(null);
                  },
                  onSelectItem: (branch) {
                    final size = context.read<SalesPerShiftListFilterCubit>().state.size;
                    final startDate = context.read<SalesPerShiftListFilterCubit>().state.startDate;
                    final endDate = context.read<SalesPerShiftListFilterCubit>().state.endDate;

                    context.read<SalesPerShiftListCubit>().getSalesPerShift(
                          size: size!,
                          branchId: branch.id,
                          startDate: startDate,
                          endDate: endDate,
                        );
                    context.read<SalesPerShiftListFilterCubit>().setBranch(branch.id);
                  },
                ),
              ],
            );
          },
        ),
        const Expanded(child: SalesPerShiftPaginatedDataGrid()),
      ],
    );
  }
}
