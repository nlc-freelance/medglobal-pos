import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:medglobal_admin_portal/core/enums/reports_enum.dart';
import 'package:medglobal_admin_portal/core/widgets/data_grid/data_grid.dart';
import 'package:medglobal_admin_portal/core/widgets/date_picker_popup.dart';
import 'package:medglobal_admin_portal/core/widgets/dropdowns/app_dropdown.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/domain/entity/branch.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_return/presentation/cubit/stock_return_list_filter/stock_return_list_filter_cubit.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_return/presentation/cubit/stock_return_list_remote/stock_return_list_remote_cubit.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class StockReturnToolbar extends StatelessWidget {
  const StockReturnToolbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      children: [
        DatePickerPopup(
          onRemoveSelected: () {
            final size = context.read<StockReturnListFilterCubit>().state.size;
            final status = context.read<StockReturnListFilterCubit>().state.status;
            final branchId = context.read<StockReturnListFilterCubit>().state.branchId;

            context.read<StockReturnListRemoteCubit>().getStockReturns(size: size!, status: status, branchId: branchId);

            context.read<StockReturnListFilterCubit>().setStartDate(null);
            context.read<StockReturnListFilterCubit>().setEndDate(null);
          },
          onSelectRange: (dates) {
            final size = context.read<StockReturnListFilterCubit>().state.size;
            final status = context.read<StockReturnListFilterCubit>().state.status;
            final branch = context.read<StockReturnListFilterCubit>().state.branchId;

            String? endDate;
            final startDate = DateFormat('MM-dd-yyyy').format(dates[0]!);
            if (dates.length == 2) endDate = DateFormat('MM-dd-yyyy').format(dates[1]!);

            context
                .read<StockReturnListRemoteCubit>()
                .getStockReturns(size: size!, status: status, branchId: branch, startDate: startDate, endDate: endDate);

            context.read<StockReturnListFilterCubit>().setStartDate(startDate);
            context.read<StockReturnListFilterCubit>().setEndDate(endDate);
          },
          selectionMode: DateRangePickerSelectionMode.range,
        ),
        AppDropdown<Branch>.lazy(
          hasInlineLabel: true,
          inlineLabel: 'Branch',
          hint: 'All Branches',
          getName: (branch) => branch.name,
          onSelectItem: (branch) {
            final size = context.read<StockReturnListFilterCubit>().state.size;
            final status = context.read<StockReturnListFilterCubit>().state.status;
            final startDate = context.read<StockReturnListFilterCubit>().state.startDate;
            final endDate = context.read<StockReturnListFilterCubit>().state.endDate;

            context.read<StockReturnListRemoteCubit>().getStockReturns(
                  size: size!,
                  status: status,
                  branchId: branch.id,
                  startDate: startDate,
                  endDate: endDate,
                );
            context.read<StockReturnListFilterCubit>().setBranch(branch.id);
          },
          onRemoveSelectedItem: () {
            final size = context.read<StockReturnListFilterCubit>().state.size;
            final status = context.read<StockReturnListFilterCubit>().state.status;
            final startDate = context.read<StockReturnListFilterCubit>().state.startDate;
            final endDate = context.read<StockReturnListFilterCubit>().state.endDate;

            context.read<StockReturnListRemoteCubit>().getStockReturns(
                  size: size!,
                  status: status,
                  startDate: startDate,
                  endDate: endDate,
                );
            context.read<StockReturnListFilterCubit>().setBranch(null);
          },
        ),
        const Spacer(),
        BlocSelector<StockReturnListFilterCubit, StockReturnListFilterState, Map<String, dynamic>>(
          selector: (state) => state.filters,
          builder: (context, filters) => ExportButton(
            type: ReportType.stockReturn,
            filters: filters,
          ),
        ),
      ],
    );
  }
}
