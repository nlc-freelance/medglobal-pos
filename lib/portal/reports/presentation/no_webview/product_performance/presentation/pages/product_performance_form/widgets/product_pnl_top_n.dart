import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/widgets/form/form.dart';
import 'package:medglobal_admin_portal/portal/product_management/domain/entities/category/category.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/no_webview/product_performance/presentation/cubit/product_performance_form/product_performance_form_cubit.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/domain/entity/branch.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class ProductPNLTopN extends StatefulWidget {
  const ProductPNLTopN({super.key});

  @override
  State<ProductPNLTopN> createState() => PerformanceProductPNLTopNState();
}

class PerformanceProductPNLTopNState extends State<ProductPNLTopN> {
  late TextEditingController _topNController;

  @override
  void initState() {
    super.initState();
    _topNController = TextEditingController(text: context.read<ProductPerformanceFormCubit>().state.topN?.toString());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductPerformanceFormCubit, ProductPerformanceFormState>(
      builder: (context, state) => AppTextFormField.top(
        label: 'Top n',
        hint: 'Enter the number of top items to include (e.g., 10 for Top 10)',
        controller: _topNController,
        isRequired: true,
        formatter: [FilteringTextInputFormatter.allow(RegExp(r'^(0|[1-9][0-9]*)$'))],
        onChanged: (value) => context.read<ProductPerformanceFormCubit>().setTopN(int.tryParse(value)),
      ),
    );
  }
}
