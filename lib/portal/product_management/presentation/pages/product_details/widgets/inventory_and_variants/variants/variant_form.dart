import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/product_management/domain/entities/product/variant.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/cubit/product_form/product_form_cubit.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/cubit/variant_form/variant_form_cubit.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/cubit/variant_form_ui/variant_form_ui_cubit.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/pages/product_details/widgets/inventory_and_variants/inventory_per_branch/inventory_per_branch.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/pages/product_details/widgets/inventory_and_variants/stock_keeping_unit/stock_keeping_unit_details.dart';
import 'package:medglobal_shared/medglobal_shared.dart';
import 'package:uuid/uuid.dart';

class VariantForm extends StatefulWidget {
  const VariantForm({
    super.key,
    required this.skuController,
    required this.nameController,
    required this.warningStockController,
    required this.idealStockController,
    required this.costController,
  });

  final TextEditingController nameController;
  final TextEditingController skuController;
  final TextEditingController warningStockController;
  final TextEditingController idealStockController;
  final TextEditingController costController;

  @override
  State<VariantForm> createState() => _VariantFormState();
}

class _VariantFormState extends State<VariantForm> {
  late VariantFormCubit _variantFormCubit;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? _hasMissingRequiredFieldsError;

  @override
  void initState() {
    super.initState();
    _variantFormCubit = BlocProvider.of<VariantFormCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: BlocSelector<VariantFormCubit, VariantFormState, Variant?>(
        selector: (state) => state.variant,
        builder: (context, variant) {
          return Column(
            children: [
              const PageSectionTitle(
                title: 'Variations',
                subtitle:
                    'Create variants of a product and include details regarding the supplier, stock levels, and inventory for each branch.',
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const UIVerticalSpace(16),
                      PageSectionTitle.subsection(title: 'Variant'),
                      UITextFormField.vertical(
                        label: 'Variant Name',
                        hint: 'Enter variant name',
                        isRequired: true,
                        controller: widget.nameController,
                        validator: (value) {
                          if (value?.isEmpty == true || value == 'default') {
                            return 'Please enter a variant name.';
                          }
                          return null;
                        },
                        // TODO: Refactor product form state management
                        onChanged: (_) {},
                      ),
                      const UIVerticalSpace(40),
                      StockKeepingUnitDetails(
                        skuController: widget.skuController,
                        warningStockController: widget.warningStockController,
                        idealStockController: widget.idealStockController,
                        costController: widget.costController,
                      ),
                      const InventoryPerBranch(),
                    ],
                  ),
                ),
              ),
              const UIVerticalSpace(30),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  if (_hasMissingRequiredFieldsError != null) ...[
                    UIText.labelSemiBold(_hasMissingRequiredFieldsError!, color: UIColors.buttonDanger),
                    const Spacer(),
                  ],
                  UIButton.outlined(
                    'Cancel',
                    onClick: () {
                      context.read<VariantFormUiCubit>().hideVariantFormUi();

                      /// If variant name is default, meaning the product has no variant initially
                      /// Therefore if user decides to try and add a variant and change his mind,
                      /// the values will still exist outside the variant form
                      // if (widget.nameController.text.isNotEmpty) _variantFormCubit.resetForm();

                      Navigator.pop(context);
                    },
                  ),
                  const UIHorizontalSpace(8),
                  UIButton.filled(
                    'Save variant',
                    onClick: () {
                      final variant = _variantFormCubit.state.variant;

                      if (_formKey.currentState?.validate() == true &&
                          variant?.hasSuppliers == true &&
                          variant?.hasBranchInventories == true) {
                        if (variant?.id == null) {
                          final newVariant = variant?.copyWith(id: -(const Uuid().v4().hashCode));
                          context.read<ProductFormCubit>().addVariant(newVariant!);
                        } else {
                          context.read<ProductFormCubit>().updateVariant(variant!.id!, variant);
                        }

                        setState(() => _hasMissingRequiredFieldsError = null);

                        _variantFormCubit.resetForm();
                        context.read<VariantFormUiCubit>().hideVariantFormUi();
                        Navigator.pop(context);
                      } else {
                        setState(() => _hasMissingRequiredFieldsError =
                            'One or more required fields are empty. Please check your inputs.');
                      }
                    },
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
