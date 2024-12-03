import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/reports/sales_per_category/domain/repositories/sales_per_category_repository.dart';
import 'package:medglobal_admin_portal/portal/reports/sales_per_category/presentation/cubit/sales_category_filter/sales_category_filter_cubit.dart';
import 'package:medglobal_admin_portal/portal/reports/sales_per_category/presentation/cubit/sales_category_group_by/sales_category_groupby_cubit.dart';
import 'package:medglobal_admin_portal/portal/reports/sales_per_category/presentation/cubit/sales_category_period/sales_category_period_cubit.dart';
import 'package:medglobal_admin_portal/portal/reports/sales_per_category/presentation/cubit/sales_per_category/sales_per_category_cubit.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class GroupBy extends StatefulWidget {
  const GroupBy({super.key});

  @override
  State<GroupBy> createState() => _GroupByState();
}

class _GroupByState extends State<GroupBy> {
  final GlobalKey _groupByKey = GlobalKey();
  bool _isVisible = false;
  List<SalesPerCategoryGroupBy> _selectedGroupBy = [];
  TimeVariance? _selectedTimeVariance;

  String label(SalesCategoryGroupByState state) {
    final categories = [...?state.groupBy, state.timeVariance];

    String appliedGrouping = '';

    if (categories.contains(SalesPerCategoryGroupBy.BRANCH)) appliedGrouping += 'Branch';

    if (categories.contains(SalesPerCategoryGroupBy.TIME_VARIANCE)) {
      if (categories.any((category) => category.runtimeType == TimeVariance)) {
        if (appliedGrouping.isNotEmpty) appliedGrouping += ', ';
        appliedGrouping += 'Time Variance: ${state.timeVariance!.label}';
      }
    }

    return 'Group by $appliedGrouping';
  }

  @override
  void initState() {
    super.initState();
    if (context.read<SalesCategoryGroupByCubit>().state.isGrouped) {
      context.read<SalesCategoryGroupByCubit>().reset();
    }
  }

  @override
  Widget build(BuildContext context) {
    return UIPopupMenuOverlay(
      menu: InkWell(
        hoverColor: UIColors.transparent,
        highlightColor: UIColors.transparent,
        borderRadius: const BorderRadius.all(Radius.circular(12.0)),
        onTap: () => setState(() => _isVisible = true),
        child: BlocBuilder<SalesCategoryGroupByCubit, SalesCategoryGroupByState>(
          builder: (context, state) {
            return HoverBuilder(
              builder: (isHover) {
                final highlight = label(state) != 'Group by ';

                return Container(
                  key: _groupByKey,
                  constraints: const BoxConstraints(minWidth: 180),
                  padding: const EdgeInsets.symmetric(vertical: 7.2, horizontal: 16.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: highlight
                        ? UIColors.secondary
                        : isHover
                            ? UIColors.whiteBg
                            : UIColors.background,
                    border: Border.all(color: highlight ? UIColors.primary.withOpacity(0.2) : UIColors.borderRegular),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      UIText.labelMedium(
                        label(state),
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
            );
          },
        ),
      ),
      body: Builder(
        builder: (context) => Container(
          decoration: BoxDecoration(
            color: UIColors.background,
            border: Border.all(color: UIColors.borderRegular),
            borderRadius: BorderRadius.circular(12),
          ),
          width: (_groupByKey.currentContext?.findRenderObject() as RenderBox).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              UICheckboxGroup<SalesPerCategoryGroupBy>(
                items: SalesPerCategoryGroupBy.values,
                itemAsString: (groupBy) => groupBy.label,
                direction: Axis.vertical,
                selectedItems: _selectedGroupBy,
                onSelectItems: (items) {
                  setState(() => _selectedGroupBy = items);

                  if (!items.contains(SalesPerCategoryGroupBy.TIME_VARIANCE)) {
                    setState(() => _selectedTimeVariance = null);
                  }
                },
              ),
              if (_selectedGroupBy.contains(SalesPerCategoryGroupBy.TIME_VARIANCE))
                Padding(
                  padding: const EdgeInsets.only(left: 18),
                  child: UIRadioGroup<TimeVariance>(
                    items: TimeVariance.values,
                    itemAsString: (variable) => variable.label,
                    direction: Axis.vertical,
                    selectedItem: _selectedTimeVariance,
                    onSelect: (value) {
                      setState(() => _selectedTimeVariance = value);
                    },
                  ),
                ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    if (_selectedGroupBy.isNotEmpty) ...[
                      BlocSelector<SalesCategoryGroupByCubit, SalesCategoryGroupByState,
                          List<SalesPerCategoryGroupBy>?>(
                        selector: (state) => state.groupBy,
                        builder: (context, groupBy) {
                          return UIButton.text(
                            'Clear All',
                            onClick: () {
                              setState(() {
                                _selectedGroupBy = [];
                                _selectedTimeVariance = null;
                                _isVisible = false;
                              });

                              /// If applied state grouping is not empty, re-fetch
                              if (groupBy?.isNotEmpty == true) {
                                context.read<SalesCategoryGroupByCubit>().reset();
                                _getSalesPerCategory(clear: true);
                              }
                            },
                          );
                        },
                      ),
                      const Spacer(),
                    ],
                    UIButton.text(
                      'Apply',
                      onClick: () {
                        context.read<SalesCategoryGroupByCubit>().setGroupBy(_selectedGroupBy);
                        if (_selectedTimeVariance != null) {
                          context.read<SalesCategoryGroupByCubit>().setTimeVariance(_selectedTimeVariance!);
                        }

                        _getSalesPerCategory();
                        setState(() => _isVisible = false);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      visible: _isVisible,
      onClose: () {
        final state = context.read<SalesCategoryGroupByCubit>().state;

        final groupByInState = [...?state.groupBy];
        final groupByInWidget = [..._selectedGroupBy];

        /// If there's no state grouping yet, clear the widget grouping and close the menu
        if (state.groupBy?.isEmpty ?? true) {
          setState(() {
            _selectedGroupBy = [];
            _selectedTimeVariance = null;
            _isVisible = false;
          });
        }

        /// If there's no change on state grouping and widget grouping, close the menu
        if ((groupByInWidget.every((item) => groupByInState.contains(item) == true)) &&
            _selectedTimeVariance == state.timeVariance) {
          setState(() => _isVisible = false);
        }
      },
    );
  }

  void _getSalesPerCategory({bool clear = false}) {
    final startDate = context.read<SalesCategoryPeriodCubit>().state.startDate;
    final endDate = context.read<SalesCategoryPeriodCubit>().state.endDate;
    final filters = context.read<SalesCategoryFilterCubit>().state;

    context.read<SalesPerCategoryCubit>().getSalesPerCategory(
          SalesPerCategoryPayload(
            startDate: startDate,
            endDate: endDate,
            branch: filters.get(FilterType.BRANCH),
            supplier: filters.get(FilterType.SUPPLIER),
            productCategory: filters.get(FilterType.PRODUCT_CATEGORY),
            productName: filters.get(FilterType.PRODUCT_NAME),
            filterOperator: filters.operator?.label,
            groupedBy: clear
                ? null
                : {
                    'branch': _selectedGroupBy.contains(SalesPerCategoryGroupBy.BRANCH),
                    if (_selectedTimeVariance != null) 'timeVariance': _selectedTimeVariance?.name,
                  },
          ),
        );
  }
}
