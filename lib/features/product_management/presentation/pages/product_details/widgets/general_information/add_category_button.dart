import 'package:flutter/material.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class AddCategoryButton extends StatelessWidget with DialogMixin {
  const AddCategoryButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => Dialog(
            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12.0))),
            child: Container(
              width: MediaQuery.sizeOf(context).width * 0.35,
              padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      UIText.heading6('Add new category'),
                      InkWell(onTap: () => Navigator.pop(context), child: Assets.icons.close.svg()),
                    ],
                  ),
                  const Divider(color: UIColors.borderMuted),
                  const UIVerticalSpace(16.0),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: UITextField.noLabel(
                          hint: 'Enter category name',
                          width: MediaQuery.sizeOf(context).width * 0.35,
                          controller: TextEditingController(),
                        ),
                      ),
                      const UIHorizontalSpace(8),
                      UIButton.filled('Add', onClick: () {
                        // TODO: Add new category and set it as selected
                        Navigator.pop(context);
                      }),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
      leading: Assets.icons.add.svg(width: 12.0, colorFilter: UIColors.primary.toColorFilter),
      title: UIText.labelSemiBold('Add new category', color: UIColors.primary),
      minLeadingWidth: 2.0,
      dense: true,
      contentPadding: EdgeInsets.zero,
      visualDensity: VisualDensity.compact,
      hoverColor: UIColors.whiteBg,
    );
  }
}
