import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/widgets/dropdowns/search_dropdown/search_dropdown.dart';
import 'package:medglobal_admin_portal/features/product_management/presentation/pages/widgets/category_dropdown.dart';
import 'package:medglobal_admin_portal/features/supplier_management/domain/entities/supplier.dart';
import 'package:medglobal_admin_portal/features/supplier_management/domain/usecases/get_all_suppliers.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class GeneralInformation extends StatelessWidget {
  const GeneralInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        UIText.heading5('General Information'),
        const UIVerticalSpace(4.0),
        const Divider(color: UIColors.borderMuted),
        const UIVerticalSpace(16.0),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                children: [
                  UITextField.topLabel(
                    label: 'Name',
                    hint: 'Enter product name',
                    controller: TextEditingController(),
                    showRequired: true,
                  ),
                  const UIVerticalSpace(16),
                  SearchDropdown<Supplier>.multi(
                    label: 'Suppliers',
                    hint: 'Select suppliers',
                    itemAsString: (item) => item.name,
                    asyncItemsCallback: GetIt.I<GetAllSuppliersUseCase>().call(),
                  ),
                ],
              ),
            ),
            const UIHorizontalSpace(16),
            const Expanded(child: CategoryDropdown()),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UIText.labelRegular('Product Image'),
                  const UIVerticalSpace(4.0),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                    decoration: BoxDecoration(
                      border: Border.all(color: UIColors.borderRegular),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Assets.icons.addProductImage.svg(width: 120.0),
                        const UIHorizontalSpace(40.0),
                        Column(
                          children: [
                            UIText.bodyRegular(
                              'Drag and drop file here to upload',
                              color: UIColors.textGray,
                              align: TextAlign.center,
                            ),
                            const UIVerticalSpace(4.0),
                            UIText.bodyRegular('or'),
                            const UIVerticalSpace(8.0),
                            UIButton.secondary(
                              'Select new image',
                              onClick: () {
                                // TODO: Upload Image
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const UIVerticalSpace(40.0),
      ],
    );
  }
}
