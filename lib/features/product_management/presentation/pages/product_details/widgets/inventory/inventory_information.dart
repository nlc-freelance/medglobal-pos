import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/features/product_management/domain/entities/product/product.dart';
import 'package:medglobal_admin_portal/features/product_management/domain/entities/product/variant.dart';
import 'package:medglobal_admin_portal/features/product_management/presentation/cubit/variant_form_ui/variant_form_ui_cubit.dart';
import 'package:medglobal_admin_portal/features/product_management/presentation/cubit/product_form/product_form_cubit.dart';
import 'package:medglobal_admin_portal/features/product_management/presentation/cubit/variant_form/variant_form_cubit.dart';
import 'package:medglobal_admin_portal/features/product_management/presentation/pages/product_details/widgets/inventory/branch_inventory/inventory_per_branch.dart';
import 'package:medglobal_admin_portal/features/product_management/presentation/pages/product_details/widgets/inventory/suppliers_stock_details/suppliers_stock_details.dart';
import 'package:medglobal_admin_portal/features/product_management/presentation/pages/product_details/widgets/inventory/variations/variant_grid.dart';
import 'package:medglobal_shared/medglobal_shared.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'variations/variant_form.dart';

class InventoryInformation extends StatefulWidget {
  const InventoryInformation({super.key, required this.formKey});

  final GlobalKey<FormState>? formKey;

  @override
  State<InventoryInformation> createState() => _InventoryInformationState();
}

class _InventoryInformationState extends State<InventoryInformation> {
  late ProductFormCubit _productFormCubit;
  late VariantFormCubit _variantFormCubit;
  late VariantFormUiCubit _variantFormUiCubit;

  late TextEditingController _nameController;
  late TextEditingController _skuController;
  late TextEditingController _warningStockController;
  late TextEditingController _idealStockController;

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

    _nameController = TextEditingController(text: currentVariant?.name)
      ..addListener(() => _variantFormCubit.setName(_nameController.text));
    _skuController = TextEditingController(text: currentVariant?.sku)
      ..addListener(() => _variantFormCubit.setSku(_skuController.text));
    _warningStockController = TextEditingController(text: (currentVariant?.warningStock ?? '').toString())
      ..addListener(() => _variantFormCubit.setWarningStockLevel(_warningStockController.text));
    _idealStockController = TextEditingController(text: (currentVariant?.idealStock ?? '').toString())
      ..addListener(() => _variantFormCubit.setIdealStockLevel(_idealStockController.text));
  }

  @override
  void dispose() {
    _nameController.dispose();
    _skuController.dispose();
    _warningStockController.dispose();
    _idealStockController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => BlocSelector<ProductFormCubit, ProductFormState, Product?>(
        selector: (state) => state.product,
        builder: (context, product) {
          return BlocListener<VariantFormCubit, VariantFormState>(
            listenWhen: (previous, current) => previous.variant?.id != current.variant?.id,
            listener: (context, state) {
              final variant = state.variant;

              _nameController.text = variant?.name ?? '';
              _skuController.text = variant?.sku ?? '';
              _warningStockController.text = (variant?.warningStock ?? '').toString();
              _idealStockController.text = (variant?.idealStock ?? '').toString();
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
                  )
                else ...[
                  UIButton.secondary(
                    'Add Variant',
                    iconBuilder: (_) => Assets.icons.add.svg(colorFilter: UIColors.primary.toColorFilter),
                    onClick: () => _variantFormUiCubit.showVariantFormUi(),
                  ),
                  const UIVerticalSpace(30),

                  /// Add Product or If product has no variants
                  if (product?.id == null || (product?.variants ?? []).any((variant) => variant.name == 'default')) ...[
                    SuppliersStockDetails(
                      skuController: _skuController,
                      warningStockController: _warningStockController,
                      idealStockController: _idealStockController,
                    ),
                    const InventoryPerBranch(),
                  ],
                ],
                if (product?.variants?.first.name != 'default' && product?.variants?.isNotEmpty == true)
                  LayoutBuilder(
                    builder: (context, constraints) => Container(
                      width: constraints.maxWidth,
                      height: constraints.maxHeight,
                      constraints: const BoxConstraints(maxHeight: 300),
                      child: VariantGrid(
                        variants: product?.variants ?? [],
                        rows: (product?.variants ?? [])
                            .map<PlutoRow>((variant) => PlutoRow(
                                  cells: {
                                    'id': PlutoCell(value: variant.id),
                                    'variant_name': PlutoCell(value: variant.name),
                                    'sku': PlutoCell(value: variant.sku),
                                    'branches': PlutoCell(
                                      value: variant
                                          .getAllBranches()
                                          .map((branch) => branch.name)
                                          .toList()
                                          .toString()
                                          .replaceAll(RegExp(r'[\[\]]'), ''),
                                    ),
                                    'suppliers': PlutoCell(
                                      value: (variant.suppliers ?? [])
                                          .map((branch) => branch.name)
                                          .toList()
                                          .toString()
                                          .replaceAll(
                                            RegExp(r'[\[\]]'),
                                            '',
                                          ),
                                    ),
                                    'action': PlutoCell(value: variant.id),
                                  },
                                ))
                            .toList(),
                      ),
                    ),
                  ),
                const UIVerticalSpace(60),
              ],
            ),
          );
        },
      );
}
