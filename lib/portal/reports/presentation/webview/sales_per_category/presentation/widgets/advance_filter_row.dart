import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/widgets/dropdowns/app_dropdown.dart';
import 'package:medglobal_admin_portal/core/widgets/typeahead_search/product_typeahead_search.dart';
import 'package:medglobal_admin_portal/portal/product_management/domain/entities/category/category.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/sales_per_category/domain/entities/filter.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/sales_per_category/presentation/cubit/sales_category_filter/sales_category_filter_cubit.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/domain/entity/branch.dart';
import 'package:medglobal_admin_portal/portal/supplier_management/domain/entities/supplier.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class AdvanceFilterRow extends StatefulWidget {
  const AdvanceFilterRow({
    super.key,
    required this.filter,
    required this.index,
    required this.onRemoveFilter,
  });

  final Filter filter;
  final int index;
  final void Function(int index) onRemoveFilter;

  @override
  State<AdvanceFilterRow> createState() => _AdvanceFilterRowState();
}

class _AdvanceFilterRowState extends State<AdvanceFilterRow> {
  @override
  Widget build(BuildContext context) {
    return BlocSelector<SalesCategoryFilterCubit, SalesCategoryFilterState, LogicalOperator?>(
      selector: (state) => state.operator,
      builder: (context, operator) {
        return Row(
          children: [
            if (widget.index == 0)
              SizedBox(width: 100, child: UIText.labelSemiBold('Where', align: TextAlign.end))
            else if (widget.index == 1)
              SizedBox(
                width: 100,
                child: AppDropdown<LogicalOperator>.static(
                  hint: LogicalOperator.AND.label,
                  highlightOnSelect: false,
                  items: LogicalOperator.values,
                  getName: (operator) => operator.label.toUpperCase(),
                  value: operator,
                  onSelectItem: (operator) => context.read<SalesCategoryFilterCubit>().updateLogicalOperation(operator),
                ),
              )
            else
              SizedBox(
                width: 100,
                child: UIText.labelSemiBold(
                  operator!.label.toUpperCase(),
                  align: TextAlign.end,
                ),
              ),
            const UIHorizontalSpace(8),
            SizedBox(
              width: 200,
              child: AppDropdown<FilterType>.static(
                hint: 'Field name',
                highlightOnSelect: false,
                items: FilterType.values,
                getName: (type) => type.label,
                value: widget.filter.type,
                onSelectItem: (type) {
                  context.read<SalesCategoryFilterCubit>().updateFilterValue(widget.filter.id, null);
                  context.read<SalesCategoryFilterCubit>().updateFilterType(widget.filter.id, type);
                },
              ),
            ),
            const UIHorizontalSpace(8),
            SizedBox(
              width: 100,
              child: AppDropdown<FilterRule>.static(
                hint: FilterRule.IS.label,
                highlightOnSelect: false,
                items: FilterRule.values,
                getName: (rule) => rule.label,
                value: widget.filter.rule,
                onSelectItem: (rule) =>
                    context.read<SalesCategoryFilterCubit>().updateFilterRule(widget.filter.id, rule),
              ),
            ),
            const UIHorizontalSpace(8),
            getFilterValueField(context, widget.filter),
            const UIHorizontalSpace(8),
            InkWell(
              onTap: () => widget.onRemoveFilter(widget.filter.id),
              borderRadius: BorderRadius.circular(50),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Assets.icons.minusSquare.setSize(12),
              ),
            ),
          ],
        );
      },
    );
  }
}

Widget getFilterValueField(BuildContext context, Filter filter) {
  final id = filter.id;

  switch (filter.type) {
    case FilterType.PRODUCT_CATEGORY:
      return AppDropdown<Category>.lazy(
        hint: 'Select category',
        highlightOnSelect: false,
        getName: (category) => category.name,
        value: filter.value,
        onSelectItem: (category) => context.read<SalesCategoryFilterCubit>().updateFilterValue(id, category),
        onRemoveSelectedItem: () => context.read<SalesCategoryFilterCubit>().updateFilterValue(id, null),
      );
    case FilterType.PRODUCT_NAME:
      return SizedBox(
        width: 250,
        child: ProductTypeAheadSearch(
          selectedItem: filter.value,
          onSelected: (value) => context.read<SalesCategoryFilterCubit>().updateFilterValue(id, value),
        ),
      );
    case FilterType.SUPPLIER:
      return AppDropdown<Supplier>.lazy(
        hint: 'Select supplier',
        highlightOnSelect: false,
        getName: (supplier) => supplier.name,
        value: filter.value,
        onSelectItem: (supplier) => context.read<SalesCategoryFilterCubit>().updateFilterValue(id, supplier),
        onRemoveSelectedItem: () => context.read<SalesCategoryFilterCubit>().updateFilterValue(id, null),
      );
    case FilterType.BRANCH:
      return AppDropdown<Branch>.lazy(
        hint: 'Select branch',
        highlightOnSelect: false,
        getName: (branch) => branch.name,
        value: filter.value,
        onSelectItem: (branch) => context.read<SalesCategoryFilterCubit>().updateFilterValue(id, branch),
        onRemoveSelectedItem: () => context.read<SalesCategoryFilterCubit>().updateFilterValue(id, null),
      );
    default:
      return SizedBox(
        width: 230,
        child: TextField(
          cursorHeight: 14.0,
          enabled: false,
          decoration: const InputDecoration(
            hintText: 'Value',
            contentPadding: EdgeInsets.symmetric(vertical: 10.2, horizontal: 8),
          ),
          style: UIStyleText.bodyRegular,
        ),
      );
  }
}
