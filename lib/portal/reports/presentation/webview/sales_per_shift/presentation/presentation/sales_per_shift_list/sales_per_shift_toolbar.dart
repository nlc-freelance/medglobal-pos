import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:medglobal_admin_portal/core/enums/reports_enum.dart';
import 'package:medglobal_admin_portal/core/widgets/data_grid/data_grid.dart';
import 'package:medglobal_admin_portal/core/widgets/date_picker_popup.dart';
import 'package:medglobal_admin_portal/core/widgets/dropdowns/branch_dropdown.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/sales_per_shift/presentation/cubit/sales_per_shift_filter/sales_per_shift_filter_cubit.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/sales_per_shift/presentation/cubit/sales_per_shift_list/sales_per_shift_list_cubit.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class SalesPerShiftToolbar extends StatelessWidget {
  const SalesPerShiftToolbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      children: [
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
        const Spacer(),
        BlocSelector<SalesPerShiftListFilterCubit, SalesPerShiftListFilterState, Map<String, dynamic>>(
          selector: (state) => state.filters,
          builder: (context, filters) => ExportButton(
            type: ReportType.salesPerShift,
            filters: filters,
          ),
        ),
      ],
    );
  }
}
