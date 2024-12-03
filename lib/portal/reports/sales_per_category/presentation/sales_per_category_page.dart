import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/reports/sales_per_category/domain/repositories/sales_per_category_repository.dart';
import 'package:medglobal_admin_portal/portal/reports/sales_per_category/presentation/cubit/sales_category_filter/sales_category_filter_cubit.dart';
import 'package:medglobal_admin_portal/portal/reports/sales_per_category/presentation/cubit/sales_category_group_by/sales_category_groupby_cubit.dart';
import 'package:medglobal_admin_portal/portal/reports/sales_per_category/presentation/cubit/sales_category_period/sales_category_period_cubit.dart';
import 'package:medglobal_admin_portal/portal/reports/sales_per_category/presentation/sales_per_category_data_grid.dart';
import 'package:medglobal_admin_portal/portal/reports/sales_per_category/presentation/widgets/advanced_filters.dart';
import 'package:medglobal_admin_portal/portal/reports/sales_per_category/presentation/widgets/group_by.dart';
import 'package:medglobal_admin_portal/portal/reports/sales_per_category/presentation/widgets/period.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

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
            const Period(),
            const UIHorizontalSpace(8),
            const AdvancedFilters(),
            const UIHorizontalSpace(8),
            const GroupBy(),
            const UIHorizontalSpace(8),
            const Spacer(),
            BlocSelector<SalesCategoryPeriodCubit, SalesCategoryPeriodState, SalesCategoryPeriodState>(
              selector: (state) => state,
              builder: (context, period) {
                return BlocSelector<SalesCategoryGroupByCubit, SalesCategoryGroupByState, SalesCategoryGroupByState>(
                  selector: (state) => state,
                  builder: (context, groupBy) {
                    return BlocSelector<SalesCategoryFilterCubit, SalesCategoryFilterState, SalesCategoryFilterState>(
                      selector: (state) => state,
                      builder: (context, filters) {
                        return DownloadReportButton(
                          ReportType.SALES_PER_CATEGORY,
                          filters: SalesPerCategoryPayload(
                            startDate: period.startDate,
                            endDate: period.endDate,
                            branch: filters.get(FilterType.BRANCH),
                            supplier: filters.get(FilterType.SUPPLIER),
                            productCategory: filters.get(FilterType.PRODUCT_CATEGORY),
                            productName: filters.get(FilterType.PRODUCT_NAME),
                            filterOperator: filters.operator?.label,
                            groupedBy: groupBy.isGrouped ? groupBy.groupedBy : null,
                          ).toJson(),
                        );
                      },
                    );
                  },
                );
              },
            ),
          ],
        ),
        const UIVerticalSpace(20),
        const Expanded(child: SalesPerCategoryDataGrid()),
      ],
    );
  }
}
