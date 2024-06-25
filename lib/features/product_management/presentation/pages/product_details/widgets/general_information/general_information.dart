import 'package:flutter/material.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/features/product_management/domain/entities/category.dart';
import 'package:medglobal_admin_portal/features/product_management/presentation/pages/product_details/widgets/general_information/add_category_button.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class GeneralInformation extends StatefulWidget {
  const GeneralInformation({super.key});

  @override
  State<GeneralInformation> createState() => _GeneralInformationState();
}

class _GeneralInformationState extends State<GeneralInformation> {
  @override
  Widget build(BuildContext context) {
    final List<Category> items = [Category(id: 1, name: 'Food Supplement'), Category(id: 2, name: 'Medical Supplies')];

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
              child: UITextField.topLabel(
                label: 'Name',
                hint: 'Enter product name',
                controller: TextEditingController(),
                showRequired: true,
              ),
            ),
            const UIHorizontalSpace(16.0),
            Expanded(
              child: UIDropdownButton<Category>.topLabel(
                controller: TextEditingController(),
                hint: 'Select category',
                label: 'Category',
                isRequired: true,
                onSelect: (category) => print(category.name),
                value: null,
                items: items,
                itemBuilder: (item) => item.name,
                itemActionButton: const AddCategoryButton(),
              ),
            ),
          ],
        ),
        const UIVerticalSpace(16.0),
        Column(
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
        const UIVerticalSpace(40.0),
      ],
    );
  }
}
