import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/widgets/form/app_dropdown_form_field.dart';
import 'package:medglobal_admin_portal/portal/product_management/domain/entities/category/category.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/no_webview/product_performance/presentation/cubit/product_performance_form/product_performance_form_cubit.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/no_webview/product_performance/presentation/pages/product_performance_form/widgets/product_pnl_top_n.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/no_webview/product_performance/presentation/pages/product_performance_form/widgets/report_period_selector.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/domain/entity/branch.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class ProductPerformanceForm extends StatelessWidget {
  const ProductPerformanceForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductPerformanceFormCubit, ProductPerformanceFormState>(
      builder: (context, state) {
        final isPNL = state.type == ProductPerformanceType.pnl;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 16,
          children: [
            UIText.labelMedium('Please provide the source data needed to generate ${state.type!.title}.'),
            AppDropdownFormField<Branch>.lazy(
              label: 'Branch',
              hint: 'Select branch',
              isRequired: true,
              value: state.branch,
              getName: (branch) => branch.name,
              onChanged: (branch) => context.read<ProductPerformanceFormCubit>().setBranch(branch),
            ),
            AppDropdownFormField<Category>.lazy(
              label: 'Category',
              hint: 'All Categories',
              showProminentHint: true,
              getName: (category) => category.name,
              isMultiSelect: true,
              selectedItems: state.categories,
              onChanged: (category) => context.read<ProductPerformanceFormCubit>().toggleCategory(category),
              onRemoveFromMultiSelect: (category) =>
                  context.read<ProductPerformanceFormCubit>().removeCategory(category),
              onRemoveAllFromMultiSelect: () => context.read<ProductPerformanceFormCubit>().removeAllCategory(),
              isSelectedInMultiSelect: (category) =>
                  context.read<ProductPerformanceFormCubit>().isCategorySelected(category),
            ),
            if (isPNL) const ProductPNLTopN(),
            AppDropdownFormField<RankingCriteria>.static(
              items: RankingCriteria.values,
              label: 'Ranking Criteria',
              hint: 'Select ranking criteria',
              isRequired: true,
              value: state.rankingCriteria,
              getName: (criteria) => criteria.name.capitalized,
              onChanged: (criteria) => context.read<ProductPerformanceFormCubit>().setRankingCriteria(criteria),
            ),
            const ReportPeriodSelector(),
          ],
        );
      },
    );
  }
}
