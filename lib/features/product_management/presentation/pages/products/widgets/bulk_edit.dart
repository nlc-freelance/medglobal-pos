import 'package:flutter/material.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/utils/dialog_handler.dart';
import 'package:medglobal_admin_portal/features/product_management/presentation/pages/widgets/category_dropdown.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class BulkEdit extends StatelessWidget with DialogMixin {
  const BulkEdit({super.key});

  @override
  Widget build(BuildContext context) {
    return UIButton.text(
      'Edit',
      iconBuilder: (isHover) => Assets.icons.edit2.setColorOnHover(isHover),
      onClick: () => BulkEditDialog().showSidePeek(context),
    );
  }
}

class BulkEditDialog extends DialogHandler {
  BulkEditDialog();

  @override
  Widget create(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const PageHeader(
              title: 'Bulk Edit',
              subtitle: 'The following actions will replace the existing value of the selected products.'),
          const UIVerticalSpace(8.0),
          const CategoryDropdown(),
          const Spacer(),
          CancelActionButton(
            onCancel: () => Navigator.pop(context),
            onAction: () {},
          ),
        ],
      );
}
