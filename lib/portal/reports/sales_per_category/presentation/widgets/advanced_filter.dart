import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/reports/sales_per_category/domain/entities/filter.dart';
import 'package:medglobal_admin_portal/portal/reports/sales_per_category/domain/repositories/sales_per_category_repository.dart';
import 'package:medglobal_admin_portal/portal/reports/sales_per_category/presentation/cubit/sales_category_filter/sales_category_filter_cubit.dart';
import 'package:medglobal_admin_portal/portal/reports/sales_per_category/presentation/cubit/sales_category_group_by/sales_category_groupby_cubit.dart';
import 'package:medglobal_admin_portal/portal/reports/sales_per_category/presentation/cubit/sales_category_period/sales_category_period_cubit.dart';
import 'package:medglobal_admin_portal/portal/reports/sales_per_category/presentation/cubit/sales_per_category/sales_per_category_cubit.dart';
import 'package:medglobal_admin_portal/portal/reports/sales_per_category/presentation/widgets/advance_filter_row.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class AdvancedFilter extends StatefulWidget {
  const AdvancedFilter({super.key});

  @override
  State<AdvancedFilter> createState() => _SalesCategoryFilterState();
}

class _SalesCategoryFilterState extends State<AdvancedFilter> {
  List<Filter> _filters = [];

  @override
  void initState() {
    super.initState();
    if (context.read<SalesCategoryFilterCubit>().state.filters == null) {
      context.read<SalesCategoryFilterCubit>().addFilter();
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () => showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => StatefulBuilder(
          builder: (BuildContext context, void Function(void Function()) setState) {
            return Portal(
              child: Dialog(
                shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12.0))),
                backgroundColor: UIColors.background,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                  height: 380,
                  width: MediaQuery.sizeOf(context).width * 0.45,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          UIText.labelMedium('In this view, show items', color: UIColors.textLight),
                          BlocSelector<SalesCategoryFilterCubit, SalesCategoryFilterState, SalesCategoryFilterState>(
                            selector: (state) => state,
                            builder: (context, state) {
                              return Visibility(
                                visible: !state.hasFiltersChanged(_filters) || _filters.isEmpty,
                                child: InkWell(
                                  onTap: () {
                                    /// If there's no applied filters, clear the state
                                    if (_filters.isEmpty) context.read<SalesCategoryFilterCubit>().clearAll();
                                    Navigator.pop(context);
                                  },
                                  borderRadius: BorderRadius.circular(12),
                                  child: Assets.icons.close.svg(colorFilter: UIColors.textLight.toColorFilter),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                      const UIVerticalSpace(16),
                      Expanded(
                        child: BlocSelector<SalesCategoryFilterCubit, SalesCategoryFilterState, List<Filter>?>(
                          selector: (state) => state.filters ?? [],
                          builder: (context, filters) {
                            return ListView.separated(
                              itemCount: filters!.length,
                              itemBuilder: (_, index) => AdvanceFilterRow(
                                filter: filters[index],
                                index: index,
                                onRemoveFilter: (id) {
                                  if (filters.length == 1) {
                                    context.read<SalesCategoryFilterCubit>().resetLastFilterRow(id);
                                  } else {
                                    context.read<SalesCategoryFilterCubit>().removeFilter(id);
                                  }
                                },
                              ),
                              separatorBuilder: (_, __) => const UIVerticalSpace(12),
                            );
                          },
                        ),
                      ),
                      const UIVerticalSpace(16),
                      BlocSelector<SalesCategoryFilterCubit, SalesCategoryFilterState, SalesCategoryFilterState>(
                        selector: (state) => state,
                        builder: (context, state) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              UIButton.text(
                                'Add rule',
                                iconBuilder: (isHover) => Assets.icons.add.setColorOnHover(isHover),
                                onClick: () => context.read<SalesCategoryFilterCubit>().addFilter(),
                              ),
                              const Spacer(),
                              if (state.hasFilters || _filters.isNotEmpty) ...[
                                UIButton.outlined(
                                  'Clear All',
                                  onClick: () {
                                    if (_filters.isNotEmpty) _getSalesPerCategory();
                                    context.read<SalesCategoryFilterCubit>().clearAll();

                                    ///  Reset _filters to empty list
                                    Navigator.pop(context, true);
                                  },
                                ),
                                const UIHorizontalSpace(8),
                                if (state.hasFiltersChanged(_filters) || _filters.isEmpty)
                                  UIButton.filled(
                                    'Apply filters',
                                    onClick: () {
                                      final filters = state.filters
                                              ?.where((filter) => filter.type != null && filter.value != null)
                                              .toList() ??
                                          <Filter>[];

                                      _getSalesPerCategory(state);

                                      ///  Close and pass the filters to update the filter label
                                      Navigator.pop(context, filters);
                                    },
                                  ),
                              ],
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ).then((value) {
        if (value == true) {
          /// Reset _filters if value == true (on Clear All)
          setState(() => _filters = []);
        } else if (value == null) {
          /// Do nothing if value == null (on Close)
          () {};
        } else {
          /// Assign value to _filters (on Apply filters)
          setState(() => _filters = value);
        }
      }),
      child: HoverBuilder(
        builder: (isHover) {
          final highlight = _filters.isNotEmpty;
          return Container(
            constraints: const BoxConstraints(minWidth: 150),
            padding: const EdgeInsets.symmetric(vertical: 7.2, horizontal: 16.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: highlight
                  ? UIColors.secondary
                  : isHover
                      ? UIColors.whiteBg
                      : UIColors.background,
              border: Border.all(
                color: highlight ? UIColors.primary.withOpacity(0.2) : UIColors.borderRegular,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                UIText.labelMedium(
                  highlight ? 'Filters (${_filters.length})' : 'Filters',
                  color: highlight ? UIColors.primary : UIColors.textLight,
                ),
                const UIHorizontalSpace(10),
                Assets.icons.arrowDown.svg(
                  height: 10,
                  colorFilter: highlight ? UIColors.primary.toColorFilter : null,
                )
              ],
            ),
          );
        },
      ),
    );
  }

  void _getSalesPerCategory([SalesCategoryFilterState? filters]) {
    final startDate = context.read<SalesCategoryPeriodCubit>().state.startDate;
    final endDate = context.read<SalesCategoryPeriodCubit>().state.endDate;
    final groupBy = context.read<SalesCategoryGroupByCubit>().state;

    context.read<SalesPerCategoryCubit>().getSalesPerCategory(
          SalesPerCategoryPayload(
            startDate: startDate,
            endDate: endDate,
            branch: filters?.get(FilterType.BRANCH),
            supplier: filters?.get(FilterType.SUPPLIER),
            productCategory: filters?.get(FilterType.PRODUCT_CATEGORY),
            productName: filters?.get(FilterType.PRODUCT_NAME),
            filterOperator: filters?.operator?.label,
            groupedBy: groupBy.isGrouped ? groupBy.groupedBy : null,
          ),
        );
  }
}
