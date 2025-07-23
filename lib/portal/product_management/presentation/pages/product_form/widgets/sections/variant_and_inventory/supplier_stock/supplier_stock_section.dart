import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/utils/form_validators.dart';
import 'package:medglobal_admin_portal/core/widgets/form/app_currency_form_field.dart';
import 'package:medglobal_admin_portal/core/widgets/form/form.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/cubit/variant_form_cubit/variant_form_cubit.dart';
import 'package:medglobal_admin_portal/portal/supplier_management/domain/entities/supplier.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class SupplierStockSection extends StatefulWidget {
  const SupplierStockSection({super.key});

  @override
  State<SupplierStockSection> createState() => _SupplierStockSectionState();
}

class _SupplierStockSectionState extends State<SupplierStockSection> {
  late VariantFormCubit _variantFormCubit;

  late TextEditingController _skuController;
  late TextEditingController _warningStockController;
  late TextEditingController _idealStockController;

  @override
  void initState() {
    super.initState();
    _variantFormCubit = context.read<VariantFormCubit>();

    final variant = _variantFormCubit.state.variant;

    _skuController = TextEditingController(text: variant.sku);
    _warningStockController = TextEditingController(text: variant.warningStock?.toString());
    _idealStockController = TextEditingController(text: variant.idealStock?.toString());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VariantFormCubit, VariantFormState>(
      builder: (context, state) {
        final variant = state.variant;

        return Column(
          children: [
            PageSectionTitle.subsection(title: 'Suppliers and Stock Details'),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: AppTextFormField.top(
                    label: 'SKU',
                    hint: 'Enter SKU',
                    controller: _skuController,
                    isRequired: true,
                    validator: FormValidators.required('Please enter a unique SKU.'),
                    onChanged: (value) => _variantFormCubit.setSku(value),
                  ),
                ),
                const UIHorizontalSpace(16),
                Expanded(
                  child: AppTextFormField.top(
                    label: 'Warning Stock Level',
                    hint: 'Enter warning stock',
                    controller: _warningStockController,
                    formatter: [FilteringTextInputFormatter.digitsOnly],
                    onChanged: (value) => _variantFormCubit.setWarningStock(value.toInt()),
                  ),
                ),
                const UIHorizontalSpace(16),
                Expanded(
                  child: AppTextFormField.top(
                    label: 'Ideal Stock level',
                    hint: 'Enter ideal stock level',
                    controller: _idealStockController,
                    formatter: [FilteringTextInputFormatter.digitsOnly],
                    onChanged: (value) => _variantFormCubit.setIdealStock(value.toInt()),
                  ),
                ),
              ],
            ),
            const UIVerticalSpace(16),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppDropdownFormField<Supplier>.lazy(
                        hint: variant.suppliers?.isEmpty ?? true
                            ? 'Select suppliers'
                            : '${variant.suppliers!.length} supplier(s) selected',
                        label: 'Suppliers',
                        isRequired: true,
                        getName: (supplier) => supplier.name,
                        isMultiSelect: true,
                        showSelectedItems: false,
                        selectedItems: variant.suppliers,
                        onChanged: (supplier) => _variantFormCubit.toggleSupplier(supplier),
                        onRemoveFromMultiSelect: (supplier) => _variantFormCubit.removeSupplier(supplier),
                        isSelectedInMultiSelect: (supplier) => _variantFormCubit.state.isSupplierSelected(supplier),
                      ),
                      if (variant.suppliers?.isNotEmpty ?? false) ...[
                        const UIVerticalSpace(8),
                        Wrap(
                          direction: Axis.horizontal,
                          runAlignment: WrapAlignment.center,
                          runSpacing: 6,
                          spacing: 4,
                          children: variant.suppliers!
                              .map(
                                (item) => Chip(
                                  label: Text(item.name, style: UIStyleText.chip),
                                  deleteButtonTooltipMessage: 'Remove supplier',
                                  backgroundColor: UIColors.whiteBg,
                                  deleteIcon: Assets.icons.close.svg(),
                                  onDeleted: () => _variantFormCubit.removeSupplier(item),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    side: const BorderSide(color: UIColors.borderMuted, width: 0.8),
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ],
                    ],
                  ),
                ),
                const UIHorizontalSpace(16),
                Expanded(
                  child: AppCurrencyFormField(
                    label: 'Cost (PHP)',
                    hint: 'Enter cost',
                    value: variant.cost,
                    isRequired: true,
                    validators: [
                      FormValidators.required('Please enter a cost.'),
                      FormValidators.isGreaterThanZero('Cost cannot be 0.'),
                    ],
                    onChanged: (value) => _variantFormCubit.setCost(value.toDouble()),
                  ),
                ),
                const UIHorizontalSpace(16),
                const Spacer(flex: 1),
              ],
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _skuController.dispose();
    _warningStockController.dispose();
    _idealStockController.dispose();
    super.dispose();
  }
}
