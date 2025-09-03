import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/widgets/form/app_dropdown_form_field.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/no_webview/product_performance/presentation/cubit/product_performance_form_cubit/product_performance_form_cubit.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/no_webview/product_performance/presentation/pages/product_performance_form/widgets/source_data/product_abc_source_data.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/no_webview/product_performance/presentation/pages/product_performance_form/widgets/source_data/product_pnl_source_data.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/no_webview/product_performance/presentation/pages/product_performance_form/widgets/report_period_selector.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class ProductPerformanceForm extends StatelessWidget {
  const ProductPerformanceForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductPerformanceFormCubit, ProductPerformanceFormState>(
      builder: (context, state) {
        final isABC = state.type == ProductPerformanceType.abc;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UIText.labelMedium('Please provide the source data needed to generate ${state.type!.title}.'),
            const UIVerticalSpace(16),
            isABC ? const ProductABCSourceData() : const ProductPNLSourceData(),
            const UIVerticalSpace(16),
            AppDropdownFormField<RankingCriteria>.static(
              items: RankingCriteria.values,
              label: 'Ranking Criteria',
              hint: 'Select ranking criteria',
              isRequired: true,
              value: state.rankingCriteria,
              getName: (criteria) => criteria.name.capitalized,
              onChanged: (criteria) => context.read<ProductPerformanceFormCubit>().setRankingCriteria(criteria),
            ),
            const UIVerticalSpace(16),
            const ReportPeriodSelector(),
          ],
        );
      },
    );
  }
}
