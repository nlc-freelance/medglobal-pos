import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:medglobal_admin_portal/core/utils/form_validators.dart';
import 'package:medglobal_admin_portal/core/widgets/dialog/app_custom_dialog.dart';
import 'package:medglobal_admin_portal/core/widgets/form/form.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/cubit/product_form_cubit/product_form_cubit.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/cubit/variant_form_cubit/variant_form_cubit.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/cubit/variant_form_ui/variant_form_ui_cubit.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/pages/product_form/widgets/sections/variant_and_inventory/branch_inventory/branch_inventory_section.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/pages/product_form/widgets/sections/variant_and_inventory/supplier_stock/supplier_stock_section.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/pages/product_form/widgets/sections/variant_and_inventory/variant_form_dialog/variant_form_actions.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class VariantFormDialog extends StatefulWidget {
  const VariantFormDialog({super.key});

  @override
  State<VariantFormDialog> createState() => _VariantFormDialogState();
}

class _VariantFormDialogState extends State<VariantFormDialog> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late final VariantFormCubit _variantFormCubit;
  late final TextEditingController _nameController;

  @override
  void initState() {
    super.initState();
    _variantFormCubit = context.read<VariantFormCubit>();

    final variantName = _variantFormCubit.state.variant.name;
    _nameController = TextEditingController(text: variantName == 'default' ? null : variantName);
  }

  @override
  Widget build(BuildContext context) {
    return Portal(
      child: AppCustomDialog(
        maxWidth: MediaQuery.of(context).size.width * 0.6,
        maxHeight: MediaQuery.of(context).size.height * 0.8,
        title: 'Variations',
        subtitle: 'Create variants of a product and provide details regarding supplier, cost and inventory per branch.',
        contentPadding: const EdgeInsets.symmetric(horizontal: 24),
        content: Form(
          key: _formKey,
          child: Column(
            children: [
              AppTextFormField.top(
                label: 'Variant Name',
                hint: 'Enter variant name',
                isRequired: true,
                controller: _nameController,
                validator: FormValidators.required('Please enter a variant name.'),
                onChanged: (value) => _variantFormCubit.setName(value),
              ),
              const UIVerticalSpace(24),
              const SupplierStockSection(),
              const UIVerticalSpace(24),
              const BranchInventorySection(),
              const UIVerticalSpace(24),
            ],
          ),
        ),
        actions: VariantFormActions(
          formKey: _formKey,
          onCancel: _onClose,
        ),
        onClose: _onClose,
      ),
    );
  }

  void _onClose() {
    /// When the user edits the "default variant" in the form dialog but closes without saving,
    /// do not persist changes to the variant name.
    /// This ensures it continues to be treated as the "default variant".
    ///
    /// Also, keep the [isValid] flag set to `true` to prevent validation
    /// any error messages from appearing when the form is reopened.
    if (context.read<ProductFormCubit>().state.hasOnlyDefaultVariant) {
      _variantFormCubit.resetNameAndValidation();
    }

    context.read<VariantFormUiCubit>().hideVariantFormUi();
  }
}
