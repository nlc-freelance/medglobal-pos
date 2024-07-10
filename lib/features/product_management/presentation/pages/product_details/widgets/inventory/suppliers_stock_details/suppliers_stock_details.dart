import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/widgets/dropdowns/search_dropdown/search_dropdown.dart';
import 'package:medglobal_admin_portal/features/product_management/domain/entities/product/variant.dart';
import 'package:medglobal_admin_portal/features/product_management/presentation/cubit/variant_form/variant_form_cubit.dart';
import 'package:medglobal_admin_portal/features/supplier_management/domain/entities/supplier.dart';
import 'package:medglobal_admin_portal/features/supplier_management/domain/repositories/supplier_repository.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class SuppliersStockDetails extends StatelessWidget {
  const SuppliersStockDetails({
    super.key,
    this.skuController,
    this.warningStockController,
    this.idealStockController,
  });

  final TextEditingController? skuController;
  final TextEditingController? warningStockController;
  final TextEditingController? idealStockController;

  /// To display the existing data on init
  // variant = widget.variant;

  /// Set the variant to the state, so when we edit some data, the variant in state is the variant we received here
  /// And we can view the Inventory per Branch as well using the variant in state that was set here.
  /// Then we append it to the product onSave action in the ProductDetailsPage
  // _variantFormCubit.setVariant(widget.variant!);
  // }
  // else {
  //   variant = const Variant();
  // }

  // _skuController = TextEditingController(text: variant?.sku)
  //   ..addListener(() => _variantFormCubit.setSku(_skuController.text));
  // _warningStockController = TextEditingController(text: (variant?.warningStock ?? '').toString())
  //   ..addListener(() => _variantFormCubit.setWarningStockLevel(_warningStockController.text));
  // _idealStockController = TextEditingController(text: (variant?.idealStock ?? '').toString())
  //   ..addListener(() => _variantFormCubit.setIdealStockLevel(_idealStockController.text));

  // _skuController = TextEditingController(text: _hasDefaultVariantOnly ? _variants?.first.sku : null)
  //   ..addListener(() => _variantFormCubit.setSku(_skuController.text));
  // _warningStockController =
  //     TextEditingController(text: _hasDefaultVariantOnly ? _variants?.first.warningStock.toString() : null)
  //       ..addListener(() => _variantFormCubit.setWarningStockLevel(int.parse(_warningStockController.text)));
  // _idealStockController =
  //     TextEditingController(text: _hasDefaultVariantOnly ? _variants?.first.idealStock.toString() : null)
  //       ..addListener(() => _variantFormCubit.setIdealStockLevel(int.parse(_idealStockController.text)));
  // }

  // Variant? get _variants => _variantFormCubit.state.variant;

  // bool get _hasDefaultVariantOnly => _variants?.length == 1 && _variants?.first.name == 'default';

  // @override
  // void didUpdateWidget(covariant SuppliersStockDetails oldWidget) {
  //   _skuController.text = widget.variant?.sku ?? '';
  //   _warningStockController.text = (widget.variant?.warningStock ?? '').toString();
  //   _idealStockController.text = (widget.variant?.idealStock ?? '').toString();
  //   super.didUpdateWidget(oldWidget);
  // }

  // @override
  // void dispose() {
  //   _skuController.dispose();
  //   _warningStockController.dispose();
  //   _idealStockController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) => BlocSelector<VariantFormCubit, VariantFormState, Variant?>(
        selector: (state) => state.variant,
        builder: (context, variant) {
          return Column(
            children: [
              PageSectionTitle.subsection('Suppliers and Stock Details'),
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
                      child: SearchDropdown<Supplier>.multi(
                        label: 'Suppliers',
                        hint: 'Select suppliers',
                        isRequired: true,
                        itemAsString: (supplier) => supplier.name,
                        asyncItemsCallback: GetIt.I<SupplierRepository>().getAllSuppliers(),
                        onSelectItems: (suppliers) => context.read<VariantFormCubit>().setSuppliers(suppliers),
                        selectedItems: variant?.suppliers ?? [],
                        validator: (_) {
                          if (variant?.suppliers?.isEmpty == true) return 'Please select atleast one supplier.';
                          return null;
                        },
                      ),
                    ),
                  ),
                  const Spacer(flex: 2),
                ],
              ),
              const UIVerticalSpace(40),
            ],
          );
        },
      );
}
