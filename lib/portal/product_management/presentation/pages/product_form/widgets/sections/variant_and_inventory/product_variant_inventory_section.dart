import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/cubit/product_form_cubit/product_form_cubit.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/cubit/variant_form_cubit/variant_form_cubit.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/cubit/variant_form_ui/variant_form_ui_cubit.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/pages/product_form/widgets/sections/variant_and_inventory/branch_inventory/branch_inventory_section.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/pages/product_form/widgets/sections/variant_and_inventory/supplier_stock/supplier_stock_section.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/pages/product_form/widgets/sections/variant_and_inventory/variant_form_dialog/variant_data_grid.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/pages/product_form/widgets/sections/variant_and_inventory/variant_form_dialog/variant_form_dialog.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class ProductVariantInventorySection extends StatefulWidget {
  const ProductVariantInventorySection({super.key});

  @override
  State<ProductVariantInventorySection> createState() => _ProductVariantInventorySectionState();
}

class _ProductVariantInventorySectionState extends State<ProductVariantInventorySection> with DialogMixin {
  late final ProductFormCubit _productFormCubit;
  late final VariantFormCubit _variantFormCubit;
  late final VariantFormUiCubit _variantFormUiCubit;

  @override
  void initState() {
    super.initState();
    _productFormCubit = context.read<ProductFormCubit>();
    _variantFormCubit = context.read<VariantFormCubit>();
    _variantFormUiCubit = context.read<VariantFormUiCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VariantFormUiCubit, bool>(
      listener: (context, showVariantFormInDialog) {
        if (showVariantFormInDialog) _openVariantFormDialog();
      },
      builder: (context, showVariantFormInDialog) => BlocBuilder<ProductFormCubit, ProductFormState>(
        builder: (context, state) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const PageSectionTitle(title: 'Variants and Inventory'),
            UIButton.secondary(
              'Add Variant',
              iconBuilder: (_) => Assets.icons.add.svg(colorFilter: UIColors.primary.toColorFilter),
              onClick: () => _onAddVariant(state.hasVariations),
            ),
            const UIVerticalSpace(24),
            if (state.hasOnlyDefaultVariant && !showVariantFormInDialog) ...[
              const SupplierStockSection(),
              const UIVerticalSpace(24),
              const BranchInventorySection(),
              const UIVerticalSpace(80),
            ] else if (state.hasVariations)
              const VariantDataGrid(),
          ],
        ),
      ),
    );
  }

  void _onAddVariant(bool hasVariants) {
    if (hasVariants) _variantFormCubit.reset();
    _variantFormUiCubit.showVariantFormUi();
  }

  void _openVariantFormDialog() {
    showCustomDialog(
      context,
      dialog: MultiBlocProvider(
        providers: [
          BlocProvider.value(value: _productFormCubit),
          BlocProvider.value(value: _variantFormCubit),
          BlocProvider.value(value: _variantFormUiCubit),
        ],
        child: const VariantFormDialog(),
      ),
    );
  }
}
