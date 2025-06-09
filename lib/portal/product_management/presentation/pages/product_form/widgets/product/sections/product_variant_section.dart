import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/bloc/product_form_cubit/product_form_cubit.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/bloc/variant_form_cubit/variant_form_cubit.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/pages/product_form/widgets/variant/variant_data_grid.dart';
// import 'package:medglobal_admin_portal/portal/product_management/presentation/pages/product_details/widgets/inventory_and_variants/variants/variant_data_grid.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/pages/product_form/widgets/variant/variant_form_dialog.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/pages/product_form/widgets/variant/variant_form_view.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class ProductVariantSection extends StatefulWidget {
  const ProductVariantSection({super.key});

  @override
  State<ProductVariantSection> createState() => _ProductVariantSectionState();
}

class _ProductVariantSectionState extends State<ProductVariantSection> with DialogMixin {
  bool _isVariantDialogOpen = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductFormCubit, ProductFormState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const PageSectionTitle(title: 'Inventory and Variants'),
            UIButton.secondary(
              'Add Variant',
              iconBuilder: (_) => Assets.icons.add.svg(colorFilter: UIColors.primary.toColorFilter),
              onClick: _onAddVariant,
            ),
            if (!_isVariantDialogOpen) const VariantFormView(),
            const UIVerticalSpace(30),
            if (state.hasVariants == true) const VariantDataGrid(),
          ],
        );
      },
    );
  }

  void _onAddVariant() {
    setState(() => _isVariantDialogOpen = true);
    showCustomDialog(
      context,
      dialog: BlocProvider.value(
        value: context.read<VariantFormCubit>(),
        child: const VariantFormDialog(),
      ),
    );
    setState(() => _isVariantDialogOpen = false);
  }
}
