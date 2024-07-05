import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/widgets/dropdowns/search_dropdown/search_dropdown.dart';
import 'package:medglobal_admin_portal/features/product_management/presentation/cubit/product_form/variant_form/variant_form_cubit.dart';
import 'package:medglobal_admin_portal/features/supplier_management/domain/entities/supplier.dart';
import 'package:medglobal_admin_portal/features/supplier_management/domain/repositories/supplier_repository.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class SuppliersStockDetails extends StatelessWidget {
  const SuppliersStockDetails({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => VariantFormCubit(),
        child: Column(
          children: [
            PageSectionTitle.subsection('Suppliers and Stock Details'),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: UITextField.topLabel(
                    label: 'SKU',
                    hint: 'Enter SKU',
                    controller: TextEditingController(),
                    onChanged: (value) => context.read<VariantFormCubit>().setSku(value),
                    showRequired: true,
                  ),
                ),
                const UIHorizontalSpace(16),
                Expanded(
                  child: UITextField.topLabel(
                    label: 'Warning Stock Level',
                    hint: 'Enter warning stock',
                    controller: TextEditingController(),
                    onChanged: (value) => context.read<VariantFormCubit>().setWarningStockLevel(int.parse(value)),
                  ),
                ),
                const UIHorizontalSpace(16),
                Expanded(
                  child: UITextField.topLabel(
                    label: 'Ideal Stock level',
                    hint: 'Enter ideal stock level',
                    controller: TextEditingController(),
                    onChanged: (value) => context.read<VariantFormCubit>().setIdealStockLevel(int.parse(value)),
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
                    ),
                  ),
                ),
                const Spacer(flex: 2),
              ],
            ),
            const UIVerticalSpace(40),
          ],
        ),
      );
}
