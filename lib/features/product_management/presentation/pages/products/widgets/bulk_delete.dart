import 'package:flutter/material.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class BulkDelete extends StatelessWidget with DialogMixin {
  const BulkDelete({super.key});

  @override
  Widget build(BuildContext context) {
    return UIButton.text(
      'Delete',
      iconBuilder: (isHover) => Assets.icons.trash.setColorOnHover(isHover),
      onClick: () => showConfirmationDialog(
        context,
        title: 'Delete products',
        message:
            'Are you sure you want to delete all selected products? This action is permanent and cannot be undone.',
        actionLabel: 'Delete',
        onAction: () {
          // TODO: Delete all selected products
        },
      ),
    );
  }
}
