import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/widgets/form/app_dropdown_form_field.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/no_webview/product_performance/presentation/cubit/product_performance_form/product_performance_form_cubit.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/domain/entity/branch.dart';

class ProductABCSourceData extends StatelessWidget {
  const ProductABCSourceData({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductPerformanceFormCubit, ProductPerformanceFormState>(
      builder: (context, state) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppDropdownFormField<Branch>.lazy(
            label: 'Branch',
            hint: 'Select branch',
            isRequired: true,
            value: state.productABCParams?.branch,
            getName: (branch) => branch.name,
            onChanged: (branch) => context.read<ProductPerformanceFormCubit>().setBranch(branch),
          ),
        ],
      ),
    );
  }
}
