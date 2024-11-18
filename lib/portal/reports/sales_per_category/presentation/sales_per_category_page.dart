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
import 'package:medglobal_admin_portal/portal/reports/sales_per_category/presentation/sales_per_category_data_grid.dart';
import 'package:medglobal_admin_portal/portal/reports/sales_per_category/presentation/widgets/advanced_filters.dart';
import 'package:medglobal_admin_portal/portal/reports/sales_per_category/presentation/widgets/group_by.dart';
import 'package:medglobal_shared/medglobal_shared.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class SalesPerCategoryPage extends StatelessWidget {
  const SalesPerCategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const PageHeader(
          title: 'Sales per Category',
          subtitle: 'View sales per category to analyze performance of different product categories.',
        ),
        const UIVerticalSpace(20),
        Row(
          children: [
            DatePickerPopup(
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
            ),
            const UIHorizontalSpace(8),
            const AdvancedFilters(),
            const UIHorizontalSpace(8),
            const GroupBy(),
            const UIHorizontalSpace(8),
            const Spacer(),
            const DownloadReportButton(ReportType.SALES_PER_CATEGORY),
          ],
        ),
        const UIVerticalSpace(20),
        const Expanded(child: SalesPerCategoryDataGrid()),
      ],
    );
  }
}
