import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/enums/reports_enum.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/no_webview/product_performance/presentation/cubit/product_performance_form_cubit/product_performance_form_cubit.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class ProductPerformanceSelection extends StatefulWidget {
  const ProductPerformanceSelection({super.key});

  @override
  State<ProductPerformanceSelection> createState() => _ProductPerformanceSelectionState();
}

class _ProductPerformanceSelectionState extends State<ProductPerformanceSelection> {
  ProductPerformanceType? productPerformanceType;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        UIText.labelMedium('Select the type of report you want to generate'),
        const UIVerticalSpace(16),
        ...ProductPerformanceType.values.map((type) {
          return Container(
            margin: const EdgeInsets.only(bottom: 8),
            decoration: BoxDecoration(
              border: Border.all(color: productPerformanceType == type ? UIColors.primary : UIColors.borderRegular),
              borderRadius: BorderRadius.circular(8),
            ),
            child: RadioListTile<ProductPerformanceType>(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    UIText.labelMedium(type.title),
                    UIText.subtitle(type.description),
                  ],
                ),
                value: type,
                groupValue: productPerformanceType,
                onChanged: (value) {
                  setState(() => productPerformanceType = value);
                  context.read<ProductPerformanceFormCubit>().setType(value);
                }),
          );
        }),
      ],
    );
  }
}
