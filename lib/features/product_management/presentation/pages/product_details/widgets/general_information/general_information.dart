import 'package:flutter/material.dart';
import '../../../../../../../core/core.dart';
import 'category_dropdown.dart';
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
                  CategoryDropdown(
                    onItemSelect: (value) {},
                  ),
                ],
              ),
            ),
            const UIHorizontalSpace(16),
            // TODO: Replace with SupplierDropdown
            // const Expanded(child: CategoryDropdown()),
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
