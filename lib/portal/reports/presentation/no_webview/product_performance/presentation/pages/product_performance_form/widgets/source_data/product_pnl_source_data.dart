import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/widgets/form/form.dart';
import 'package:medglobal_admin_portal/portal/product_management/domain/entities/category/category.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/no_webview/product_performance/presentation/cubit/product_performance_form/product_performance_form_cubit.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/domain/entity/branch.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class ProductPNLSourceData extends StatefulWidget {
  const ProductPNLSourceData({super.key});

  @override
  State<ProductPNLSourceData> createState() => PerformanceProductPNLSourceDataState();
}

class PerformanceProductPNLSourceDataState extends State<ProductPNLSourceData> {
  late TextEditingController _topNController;

  @override
  void initState() {
    super.initState();
    _topNController = TextEditingController(
        text: context.read<ProductPerformanceFormCubit>().state.productPNLParams?.topN?.toString());
  }

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
            value: state.productPNLParams?.branch,
            getName: (branch) => branch.name,
            onChanged: (branch) => context.read<ProductPerformanceFormCubit>().setBranch(branch),
          ),
          const UIVerticalSpace(16),
          AppDropdownFormField<Category>.lazy(
            label: 'Category',
            hint: 'Select category',
            isRequired: true,
            getName: (category) => category.name,
            isMultiSelect: true,
            selectedItems: state.productPNLParams?.categories,
            onChanged: (category) => context.read<ProductPerformanceFormCubit>().toggleCategory(category),
            onRemoveFromMultiSelect: (category) => context.read<ProductPerformanceFormCubit>().removeCategory(category),
            isSelectedInMultiSelect: (category) =>
                context.read<ProductPerformanceFormCubit>().isCategorySelected(category),
          ),
          const UIVerticalSpace(16),
          AppTextFormField.top(
            label: 'Top n',
            hint: 'Enter the number of top items to include (e.g., 10 for Top 10)',
            controller: _topNController,
            isRequired: true,
            formatter: [FilteringTextInputFormatter.allow(RegExp(r'^(0|[1-9][0-9]*)$'))],
            onChanged: (value) => context.read<ProductPerformanceFormCubit>().setTopN(int.tryParse(value)),
          ),
        ],
      ),
    );
  }
}
