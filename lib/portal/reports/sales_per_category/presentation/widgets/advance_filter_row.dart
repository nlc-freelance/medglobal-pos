import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/widgets/dropdowns/branch_dropdown.dart';
import 'package:medglobal_admin_portal/core/widgets/dropdowns/supplier_dropdown.dart';
import 'package:medglobal_admin_portal/core/widgets/typeahead_search/product_typeahead_search.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/pages/widgets/category_dropdown.dart';
import 'package:medglobal_admin_portal/portal/reports/sales_per_category/domain/entities/filter.dart';
import 'package:medglobal_admin_portal/portal/reports/sales_per_category/presentation/cubit/sales_category_filter/sales_category_filter_cubit.dart';
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
                child: UIDropdownButton<LogicalOperator>.noLabel(
                  suffixIcon: Assets.icons.arrowDown.svg(),
                  items: LogicalOperator.values,
                  itemBuilder: (operator) => operator.label.toUpperCase(),
                  value: operator,
                  onSelect: (operator) => context.read<SalesCategoryFilterCubit>().updateLogicalOperation(operator),
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
              child: UIDropdownButton<FilterType>.noLabel(
                hint: 'Field name',
                suffixIcon: Assets.icons.arrowDown.svg(),
                items: FilterType.values,
                itemBuilder: (type) => type.label,
                value: widget.filter.type,
                onSelect: (type) {
                  context.read<SalesCategoryFilterCubit>().updateFilterValue(widget.filter.id, null);
                  context.read<SalesCategoryFilterCubit>().updateFilterType(widget.filter.id, type);
                },
              ),
            ),
            const UIHorizontalSpace(8),
            SizedBox(
              width: 100,
              child: UIDropdownButton<FilterRule>.noLabel(
                suffixIcon: Assets.icons.arrowDown.svg(),
                items: FilterRule.values,
                itemBuilder: (rule) => rule.label,
                value: widget.filter.rule,
                onSelect: (rule) => context.read<SalesCategoryFilterCubit>().updateFilterRule(widget.filter.id, rule),
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
      return CategoryDropdown(
        isSelectType: true,
        selectedItem: filter.value,
        onChanged: (value) => context.read<SalesCategoryFilterCubit>().updateFilterValue(id, value),
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
      return SupplierDropdown.select(
        isSelectInputType: true,
        selectedItem: filter.value,
        onSelectItem: (value) => context.read<SalesCategoryFilterCubit>().updateFilterValue(id, value),
      );
    case FilterType.BRANCH:
      return BranchDropdown.select(
        isSelectInputType: true,
        selectedItem: filter.value,
        onSelectItem: (value) => context.read<SalesCategoryFilterCubit>().updateFilterValue(id, value),
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
