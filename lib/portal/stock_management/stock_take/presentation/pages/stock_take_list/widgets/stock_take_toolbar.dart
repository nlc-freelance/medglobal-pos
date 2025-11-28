import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:medglobal_admin_portal/core/enums/reports_enum.dart';
import 'package:medglobal_admin_portal/core/widgets/data_grid/data_grid_toolbar/export_button.dart';
import 'package:medglobal_admin_portal/core/widgets/date_picker_popup.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/presentation/cubit/stock_take_list_remote/stock_take_list_filter_cubit.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/presentation/cubit/stock_take_list_remote/stock_take_list_remote_cubit.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class StockTakeToolbar extends StatelessWidget {
  const StockTakeToolbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      children: [
        DatePickerPopup(
          onRemoveSelected: () {
            final size = context.read<StockTakeListFilterCubit>().state.size;
            final status = context.read<StockTakeListFilterCubit>().state.status;

            context.read<StockTakeListRemoteCubit>().getStockTakes(size: size!, status: status);

            context.read<StockTakeListFilterCubit>().setStartDate(null);
            context.read<StockTakeListFilterCubit>().setEndDate(null);
          },
          onSelectRange: (dates) {
            final size = context.read<StockTakeListFilterCubit>().state.size;
            final status = context.read<StockTakeListFilterCubit>().state.status;

            String? endDate;
            final startDate = DateFormat('MM-dd-yyyy').format(dates[0]!);
            if (dates.length == 2) endDate = DateFormat('MM-dd-yyyy').format(dates[1]!);

            context
                .read<StockTakeListRemoteCubit>()
                .getStockTakes(size: size!, status: status, startDate: startDate, endDate: endDate);

            context.read<StockTakeListFilterCubit>().setStartDate(startDate);
            context.read<StockTakeListFilterCubit>().setEndDate(endDate);
          },
          selectionMode: DateRangePickerSelectionMode.range,
        ),
        const Spacer(),
        BlocSelector<StockTakeListFilterCubit, StockTakeListFilterState, Map<String, dynamic>>(
          selector: (state) => state.filters,
          builder: (context, filters) => ExportButton(
            type: ReportType.stockTake,
            filters: filters,
          ),
        ),
      ],
    );
  }
}
