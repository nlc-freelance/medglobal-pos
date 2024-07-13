import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/features/product_management/domain/entities/product/product.dart';
import 'package:medglobal_admin_portal/features/product_management/domain/entities/product/variant.dart';
import 'package:medglobal_admin_portal/features/product_management/presentation/cubit/variant_form_ui/variant_form_ui_cubit.dart';
import 'package:medglobal_admin_portal/features/product_management/presentation/cubit/product_form/product_form_cubit.dart';
import 'package:medglobal_admin_portal/features/product_management/presentation/cubit/variant_form/variant_form_cubit.dart';
import 'package:medglobal_admin_portal/features/product_management/presentation/pages/product_details/widgets/inventory_and_variants/inventory_per_branch/inventory_per_branch.dart';
import 'package:medglobal_admin_portal/features/product_management/presentation/pages/product_details/widgets/inventory_and_variants/stock_keeping_unit/stock_keeping_unit_details.dart';
import 'package:medglobal_admin_portal/features/product_management/presentation/pages/product_details/widgets/inventory_and_variants/variants/variant_data_grid.dart';
import 'package:medglobal_shared/medglobal_shared.dart';
import 'variants/variant_form.dart';

class InventoryAndVariantsInformation extends StatefulWidget {
  const InventoryAndVariantsInformation({super.key, required this.formKey});

  final GlobalKey<FormState> formKey;

  @override
  State<InventoryAndVariantsInformation> createState() => _InventoryAndVariantsInformationState();
}

class _InventoryAndVariantsInformationState extends State<InventoryAndVariantsInformation> {
  late ProductFormCubit _productFormCubit;
  late VariantFormCubit _variantFormCubit;
  late VariantFormUiCubit _variantFormUiCubit;

  late TextEditingController _nameController;
  late TextEditingController _skuController;
  late TextEditingController _warningStockController;
  late TextEditingController _idealStockController;
  late TextEditingController _costController;

  @override
  void initState() {
    super.initState();
    _productFormCubit = BlocProvider.of<ProductFormCubit>(context);
    _variantFormCubit = BlocProvider.of<VariantFormCubit>(context);
    _variantFormUiCubit = BlocProvider.of<VariantFormUiCubit>(context);

    if (_productFormCubit.state.product?.variants?.first.name == 'default') {
      final defaultVariant = _productFormCubit.state.product?.variants?.first;

      /// Set default variant to state else, set an empty variant
      _variantFormCubit.setVariant(defaultVariant!);
    } else {
      _variantFormCubit.setVariant(const Variant(name: 'default'));
    }

    final currentVariant = _variantFormCubit.state.variant;

    _nameController = TextEditingController(text: currentVariant?.name == 'default' ? '' : currentVariant?.name)
      ..addListener(() => _variantFormCubit.setName(_nameController.text));
    _skuController = TextEditingController(text: currentVariant?.sku)
      ..addListener(() => _variantFormCubit.setSku(_skuController.text));
    _warningStockController = TextEditingController(text: (currentVariant?.warningStock ?? '').toString())
      ..addListener(() => _variantFormCubit.setWarningStockLevel(_warningStockController.text));
    _idealStockController = TextEditingController(text: (currentVariant?.idealStock ?? '').toString())
      ..addListener(() => _variantFormCubit.setIdealStockLevel(_idealStockController.text));
    _costController = TextEditingController(text: (currentVariant?.cost ?? '').toString())
      ..addListener(() => _variantFormCubit.setCost(_costController.text));
  }

  @override
  void dispose() {
    _nameController.dispose();
    _skuController.dispose();
    _warningStockController.dispose();
    _idealStockController.dispose();
    _costController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => BlocSelector<ProductFormCubit, ProductFormState, Product?>(
        selector: (state) => state.product,
        builder: (context, product) {
          return BlocListener<VariantFormCubit, VariantFormState>(
            listenWhen: (previous, current) =>
                previous.variant?.id != current.variant?.id || current.variant == const Variant(),
            listener: (context, state) {
              final variant = state.variant;

              _nameController.text = variant?.name ?? '';
              _skuController.text = variant?.sku ?? '';
              _warningStockController.text = (variant?.warningStock ?? '').toString();
              _idealStockController.text = (variant?.idealStock ?? '').toString();
              _costController.text = (variant?.cost ?? '').toString();
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const PageSectionTitle('Inventory and Variants'),
                if (context.select((VariantFormUiCubit cubit) => cubit.state))
                  VariantForm(
                    formKey: widget.formKey,
                    nameController: _nameController,
                    skuController: _skuController,
                    warningStockController: _warningStockController,
                    idealStockController: _idealStockController,
                    costController: _costController,
                  )
                else ...[
                  UIButton.secondary(
                    'Add Variant',
                    iconBuilder: (_) => Assets.icons.add.svg(colorFilter: UIColors.primary.toColorFilter),
                    onClick: () => _variantFormUiCubit.showVariantFormUi(),
                  ),
                  const UIVerticalSpace(30),
                  if (product?.hasVariants == false) ...[
                    StockKeepingUnitDetails(
                      skuController: _skuController,
                      warningStockController: _warningStockController,
                      idealStockController: _idealStockController,
                      costController: _costController,
                    ),
                    const InventoryPerBranch(),
                  ],
                ],
                if (product?.hasVariants == true) const VariantDataGrid(),
                const UIVerticalSpace(60),
              ],
            ),
          );
        },
      );
}
