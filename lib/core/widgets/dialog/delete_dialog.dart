import 'package:flutter/material.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class DeleteDialog extends StatelessWidget {
  const DeleteDialog({
    super.key,
    required this.subject,
    required this.onDelete,
  });

  final String subject;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
      backgroundColor: UIColors.background,
      child: Container(
        constraints: const BoxConstraints(maxWidth: 500),
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(child: UIText.heading5('Confirm Delete')),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  visualDensity: VisualDensity.compact,
                  padding: const EdgeInsets.all(2),
                  icon: Assets.icons.close.svg(),
                ),
              ],
            ),
            const Divider(color: UIColors.borderMuted),
            const UIVerticalSpace(16),
            UIText.heading6('Are you sure you want to delete $subject?'),
            Text('This action cannot be undone.', style: UIStyleText.hint.copyWith(color: UIColors.textGray)),
            const UIVerticalSpace(24),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                UIButton.outlined('Cancel', onClick: () => Navigator.pop(context)),
                const UIHorizontalSpace(8),
                UIButton.filled(
                  'Delete',
                  style: UIStyleButton.danger,
                  onClick: () {
                    onDelete();
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
