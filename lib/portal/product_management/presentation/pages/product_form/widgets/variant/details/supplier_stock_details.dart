import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/utils/form_validators.dart';
import 'package:medglobal_admin_portal/core/utils/input_formatter.dart';
import 'package:medglobal_admin_portal/core/widgets/dropdowns/supplier_dropdown.dart';
import 'package:medglobal_admin_portal/core/widgets/form/form.dart';
import 'package:medglobal_admin_portal/core/widgets/page/page.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/bloc/variant_form_cubit/variant_form_cubit.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class SupplierStockDetails extends StatefulWidget {
  const SupplierStockDetails({super.key});

  @override
  State<SupplierStockDetails> createState() => _SupplierStockDetailsState();
}

class _SupplierStockDetailsState extends State<SupplierStockDetails> {
  late VariantFormCubit _variantFormCubit;

  late TextEditingController _skuController;
  late TextEditingController _warningStockController;
  late TextEditingController _idealStockController;
  late TextEditingController _costController;

  @override
  void initState() {
    super.initState();
    _variantFormCubit = context.read<VariantFormCubit>();

    final variantFormState = _variantFormCubit.state;

    _skuController = TextEditingController(text: variantFormState.sku);
    _warningStockController = TextEditingController(text: variantFormState.warningStock?.toString());
    _idealStockController = TextEditingController(text: variantFormState.idealStock?.toString());
    _costController = TextEditingController(text: variantFormState.cost?.toString());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VariantFormCubit, VariantFormState>(
      builder: (context, state) {
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
                    onChanged: (value) => _variantFormCubit.setWarningStock(int.tryParse(value) ?? 0),
                  ),
                ),
                const UIHorizontalSpace(16),
                Expanded(
                  child: AppTextFormField.top(
                    label: 'Ideal Stock level',
                    hint: 'Enter ideal stock level',
                    controller: _idealStockController,
                    formatter: [FilteringTextInputFormatter.digitsOnly],
                    onChanged: (value) => _variantFormCubit.setIdealStock(int.tryParse(value) ?? 0),
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
                      onSelectItem: (supplier) => _variantFormCubit.addSupplier(supplier),
                      selectedItems: state.suppliers,
                      onDeleteItem: (id) => _variantFormCubit.removeSupplier(id),
                    ),
                  ),
                ),
                const UIHorizontalSpace(12),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: UITextFormField.vertical(
                      label: 'Cost (PHP)',
                      hint: 'Enter cost',
                      isRequired: true,
                      controller: _costController,
                      formatter: [NumberInputFormatter()],
                      validator: (value) => FormValidators.run(value, [
                        FormValidators.required('Please enter a cost.'),
                        FormValidators.number('Cost cannot be 0.'),
                      ]),
                      onChanged: (value) => _variantFormCubit.setCost(double.tryParse(value) ?? 0.0),
                    ),
                  ),
                ),
                const Spacer(flex: 1),
              ],
            ),
          ],
        );
      },
    );
  }
}
