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

class StockKeepingUnitDetails extends StatelessWidget {
  const StockKeepingUnitDetails({
    super.key,
    required this.skuController,
    required this.warningStockController,
    required this.idealStockController,
  });

  final TextEditingController skuController;
  final TextEditingController warningStockController;
  final TextEditingController idealStockController;

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
