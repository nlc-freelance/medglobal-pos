import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/widgets/dropdowns/supplier_dropdown.dart';
import 'package:medglobal_admin_portal/portal/product_management/domain/entities/product/variant.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/cubit/variant_form/variant_form_cubit.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class StockKeepingUnitDetails extends StatelessWidget {
  const StockKeepingUnitDetails({
    super.key,
    required this.skuController,
    required this.warningStockController,
    required this.idealStockController,
    required this.costController,
  });

  final TextEditingController skuController;
  final TextEditingController warningStockController;
  final TextEditingController idealStockController;
  final TextEditingController costController;

  @override
  Widget build(BuildContext context) => BlocSelector<VariantFormCubit, VariantFormState, Variant?>(
        selector: (state) => state.variant,
        builder: (context, variant) {
          return Column(
            children: [
              PageSectionTitle.subsection(title: 'Suppliers and Stock Details'),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: UITextFormField.topLabel(
                      label: 'SKU',
                      hint: 'Enter SKU',
                      controller: skuController,
                      showRequired: true,
                      validator: (value) {
                        if (value?.trim().isEmpty == true) return 'Please enter a unique SKU.';
                        return null;
                      },
                    ),
                  ),
                  const UIHorizontalSpace(16),
                  Expanded(
                    child: UITextFormField.topLabel(
                      label: 'Warning Stock Level',
                      hint: 'Enter warning stock',
                      controller: warningStockController,
                      formatter: [FilteringTextInputFormatter.digitsOnly],
                    ),
                  ),
                  const UIHorizontalSpace(16),
                  Expanded(
                    child: UITextFormField.topLabel(
                      label: 'Ideal Stock level',
                      hint: 'Enter ideal stock level',
                      controller: idealStockController,
                      formatter: [FilteringTextInputFormatter.digitsOnly],
                    ),
                  ),
                ],
              ),
              const UIVerticalSpace(16),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: SupplierDropdown.input_top(
                        hint: 'Select suppliers',
                        label: 'Suppliers',
                        required: true,
                        isMultiSelect: true,
                        showSelectedItems: true,
                        onSelectItem: (supplier) => context.read<VariantFormCubit>().setSuppliers(supplier),
                        selectedItems: variant?.suppliers ?? [],
                        onDeleteItem: (id) => context.read<VariantFormCubit>().removeSupplier(id),
                      ),
                    ),
                  ),
                  const UIHorizontalSpace(12),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: UITextFormField.topLabel(
                        label: 'Cost (PHP)',
                        hint: 'Enter cost',
                        showRequired: true,
                        controller: costController,
                        formatter: [CurrencyInputFormatter()],
                        validator: (value) {
                          if (value?.trim().isEmpty == true) return 'Please enter cost.';
                          if (value?.trim().isNotEmpty == true && double.tryParse(value!).toPesoString() == '0.00') {
                            return 'Cost cannot be 0.';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  const Spacer(flex: 1),
                ],
              ),
              const UIVerticalSpace(40),
            ],
          );
        },
      );
}
