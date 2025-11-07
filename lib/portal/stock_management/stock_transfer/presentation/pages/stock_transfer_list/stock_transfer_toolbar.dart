import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:medglobal_admin_portal/core/enums/reports_enum.dart';
import 'package:medglobal_admin_portal/core/widgets/data_grid/data_grid.dart';
import 'package:medglobal_admin_portal/core/widgets/date_picker_popup.dart';
import 'package:medglobal_admin_portal/core/widgets/dropdowns/branch_dropdown.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_transfer/presentation/cubit/stock_transfer_list_filter/stock_transfer_list_filter_cubit.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_transfer/presentation/cubit/stock_transfer_list_remote/stock_transfer_list_remote_cubit.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class StockTransferToolbar extends StatelessWidget {
  const StockTransferToolbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      children: [
        DatePickerPopup(
          onRemoveSelected: () {
            final size = context.read<StockTransferListFilterCubit>().state.size;
            final status = context.read<StockTransferListFilterCubit>().state.status;
            final sourceBranchId = context.read<StockTransferListFilterCubit>().state.sourceBranch?.id;
            final destinationBranchId = context.read<StockTransferListFilterCubit>().state.destinationBranch?.id;

            context.read<StockTransferListRemoteCubit>().getStockTransfers(
                  size: size!,
                  status: status,
                  sourceBranchId: sourceBranchId,
                  destinationBranchId: destinationBranchId,
                );

            context.read<StockTransferListFilterCubit>().setStartDate(null);
            context.read<StockTransferListFilterCubit>().setEndDate(null);
          },
          onSelectRange: (dates) {
            final size = context.read<StockTransferListFilterCubit>().state.size;
            final status = context.read<StockTransferListFilterCubit>().state.status;
            final sourceBranchId = context.read<StockTransferListFilterCubit>().state.sourceBranch?.id;
            final destinationBranchId = context.read<StockTransferListFilterCubit>().state.destinationBranch?.id;

            String? endDate;
            final startDate = DateFormat('MM-dd-yyyy').format(dates[0]!);
            if (dates.length == 2) endDate = DateFormat('MM-dd-yyyy').format(dates[1]!);

            context.read<StockTransferListRemoteCubit>().getStockTransfers(
                  size: size!,
                  status: status,
                  sourceBranchId: sourceBranchId,
                  destinationBranchId: destinationBranchId,
                  startDate: startDate,
                  endDate: endDate,
                );

            context.read<StockTransferListFilterCubit>().setStartDate(startDate);
            context.read<StockTransferListFilterCubit>().setEndDate(endDate);
          },
          selectionMode: DateRangePickerSelectionMode.range,
        ),
        BranchDropdown.select(
          hint: 'Source',
          isInlineHint: true,
          onRemoveSelectedItem: () {
            final size = context.read<StockTransferListFilterCubit>().state.size;
            final status = context.read<StockTransferListFilterCubit>().state.status;
            final destinationBranchId = context.read<StockTransferListFilterCubit>().state.destinationBranch?.id;
            final startDate = context.read<StockTransferListFilterCubit>().state.startDate;
            final endDate = context.read<StockTransferListFilterCubit>().state.endDate;

            context.read<StockTransferListRemoteCubit>().getStockTransfers(
                  size: size!,
                  status: status,
                  sourceBranchId: null,
                  destinationBranchId: destinationBranchId,
                  startDate: startDate,
                  endDate: endDate,
                );
            context.read<StockTransferListFilterCubit>().setSourceBranch(null);
          },
          onSelectItem: (branch) {
            final size = context.read<StockTransferListFilterCubit>().state.size;
            final status = context.read<StockTransferListFilterCubit>().state.status;
            final destinationBranchId = context.read<StockTransferListFilterCubit>().state.destinationBranch?.id;
            final startDate = context.read<StockTransferListFilterCubit>().state.startDate;
            final endDate = context.read<StockTransferListFilterCubit>().state.endDate;

            context.read<StockTransferListRemoteCubit>().getStockTransfers(
                  size: size!,
                  status: status,
                  sourceBranchId: branch.id,
                  destinationBranchId: destinationBranchId,
                  startDate: startDate,
                  endDate: endDate,
                );
            context.read<StockTransferListFilterCubit>().setSourceBranch(branch);
          },
        ),
        BranchDropdown.select(
          hint: 'Destination',
          isInlineHint: true,
          onRemoveSelectedItem: () {
            final size = context.read<StockTransferListFilterCubit>().state.size;
            final status = context.read<StockTransferListFilterCubit>().state.status;
            final sourceBranchId = context.read<StockTransferListFilterCubit>().state.sourceBranch?.id;
            final startDate = context.read<StockTransferListFilterCubit>().state.startDate;
            final endDate = context.read<StockTransferListFilterCubit>().state.endDate;

            context.read<StockTransferListRemoteCubit>().getStockTransfers(
                  size: size!,
                  status: status,
                  sourceBranchId: sourceBranchId,
                  destinationBranchId: null,
                  startDate: startDate,
                  endDate: endDate,
                );
            context.read<StockTransferListFilterCubit>().setDestinationBranch(null);
          },
          onSelectItem: (branch) {
            final size = context.read<StockTransferListFilterCubit>().state.size;
            final status = context.read<StockTransferListFilterCubit>().state.status;
            final sourceBranchId = context.read<StockTransferListFilterCubit>().state.sourceBranch?.id;
            final startDate = context.read<StockTransferListFilterCubit>().state.startDate;
            final endDate = context.read<StockTransferListFilterCubit>().state.endDate;

            context.read<StockTransferListRemoteCubit>().getStockTransfers(
                  size: size!,
                  status: status,
                  sourceBranchId: sourceBranchId,
                  destinationBranchId: branch.id,
                  startDate: startDate,
                  endDate: endDate,
                );
            context.read<StockTransferListFilterCubit>().setDestinationBranch(branch);
          },
        ),
        const Spacer(),
        BlocSelector<StockTransferListFilterCubit, StockTransferListFilterState, Map<String, dynamic>>(
          selector: (state) => state.filters,
          builder: (context, filters) => ExportButton(
            type: ReportType.stockTransfer,
            filters: filters,
          ),
        ),
      ],
    );
  }
}
