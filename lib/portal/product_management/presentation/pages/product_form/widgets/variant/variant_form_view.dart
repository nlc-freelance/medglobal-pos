import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/utils/form_validators.dart';
import 'package:medglobal_admin_portal/core/widgets/form/form.dart';
import 'package:medglobal_admin_portal/core/widgets/page/page.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/bloc/variant_form_cubit/variant_form_cubit.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/pages/product_form/widgets/variant/details/branch_inventory_details.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/pages/product_form/widgets/variant/details/supplier_stock_details.dart';

class VariantFormView extends StatefulWidget {
  const VariantFormView({super.key, this.isDialog = false});

  final bool? isDialog;

  @override
  State<VariantFormView> createState() => _VariantFormViewState();
}

class _VariantFormViewState extends State<VariantFormView> {
  late VariantFormCubit _variantFormCubit;
  late TextEditingController _nameController;

  @override
  void initState() {
    super.initState();
    _variantFormCubit = context.read<VariantFormCubit>();

    final variantName = _variantFormCubit.state.name;
    _nameController = TextEditingController(text: variantName == 'default' ? null : variantName);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (widget.isDialog == true) ...[
          PageSectionTitle.subsection(title: 'Variant'),
          AppTextFormField.top(
            label: 'Variant Name',
            hint: 'Enter variant name',
            isRequired: true,
            controller: _nameController,
            validator: FormValidators.required('Please enter a variant name.'),
            onChanged: (value) => _variantFormCubit.setName(value),
          ),
        ],
        const SupplierStockDetails(),
        const BranchInventoryDetails(),
      ],
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _variantFormCubit.reset();
    super.dispose();
  }
}
