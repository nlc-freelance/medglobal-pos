import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/widgets/date_picker_popup.dart';
import 'package:medglobal_admin_portal/portal/reports/sales_per_category/domain/repositories/sales_per_category_repository.dart';
import 'package:medglobal_admin_portal/portal/reports/sales_per_category/presentation/cubit/sales_category_filter/sales_category_filter_cubit.dart';
import 'package:medglobal_admin_portal/portal/reports/sales_per_category/presentation/cubit/sales_category_group_by/sales_category_groupby_cubit.dart';
import 'package:medglobal_admin_portal/portal/reports/sales_per_category/presentation/cubit/sales_category_period/sales_category_period_cubit.dart';
import 'package:medglobal_admin_portal/portal/reports/sales_per_category/presentation/cubit/sales_per_category/sales_per_category_cubit.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class Period extends StatefulWidget {
  const Period({super.key});

  @override
  State<Period> createState() => _PeriodState();
}

class _PeriodState extends State<Period> {
  @override
  void initState() {
    super.initState();

    /// If there's selected start and end date, reset state so the selectedDateRange defaults to the current week
    if (context.read<SalesCategoryPeriodCubit>().state.startDate != null &&
        context.read<SalesCategoryPeriodCubit>().state.endDate != null) {
      context.read<SalesCategoryPeriodCubit>().reset();
    }
  }

  @override
  Widget build(BuildContext context) {
    return DatePickerPopup(
      showEndIcon: false,
      selectionMode: DateRangePickerSelectionMode.range,
      selectedDateRange: context.read<SalesCategoryPeriodCubit>().state.startDate == null &&
              context.read<SalesCategoryPeriodCubit>().state.endDate == null
          ? [
              DateTime.now().subtract(const Duration(days: 6)),
              DateTime.now(),
            ]
          : [
              DateTime.parse(context.read<SalesCategoryPeriodCubit>().state.startDate!),
              DateTime.parse(context.read<SalesCategoryPeriodCubit>().state.endDate!),
            ],
      onSelectRange: (dates) {
        final startDate = DateFormat('yyyy-MM-dd').format(dates[0]!);
        final endDate = DateFormat('yyyy-MM-dd').format(dates[1]!);

        context.read<SalesCategoryPeriodCubit>().setStartDate(startDate);
        context.read<SalesCategoryPeriodCubit>().setEndDate(endDate);

        final filters = context.read<SalesCategoryFilterCubit>().state;
        final groupBy = context.read<SalesCategoryGroupByCubit>().state;

        context.read<SalesPerCategoryCubit>().getSalesPerCategory(
              SalesPerCategoryPayload(
                startDate: startDate,
                endDate: endDate,
                branch: filters.get(FilterType.BRANCH),
                supplier: filters.get(FilterType.SUPPLIER),
                productCategory: filters.get(FilterType.PRODUCT_CATEGORY),
                productName: filters.get(FilterType.PRODUCT_NAME),
                filterOperator: filters.operator?.label,
                groupedBy: groupBy.isGrouped ? groupBy.groupedBy : null,
              ),
            );
      },
    );
  }
}
