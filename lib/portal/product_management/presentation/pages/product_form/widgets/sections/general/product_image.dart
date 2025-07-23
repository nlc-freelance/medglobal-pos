import 'package:flutter/material.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({super.key});

  @override
  Widget build(BuildContext context) => Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Product Image', style: UIStyleText.labelRegular.copyWith(fontSize: 11)),
                const UIVerticalSpace(6),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                  decoration: BoxDecoration(
                    border: Border.all(color: UIColors.borderRegular),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Assets.icons.addProductImage.svg(width: 120.0),
                      const UIHorizontalSpace(12),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
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
          // const Spacer(flex: 1),
        ],
      );
}
