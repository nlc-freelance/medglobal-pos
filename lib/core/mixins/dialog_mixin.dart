import 'package:flutter/material.dart';
import 'package:medglobal_admin_portal/core/widgets/dialog/app_alert_dialog.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

mixin DialogMixin {
  void showCustomDialog(
    BuildContext context, {
    required Widget dialog,
  }) =>
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => dialog,
      );

  void showConfirmDialog(
    BuildContext context, {
    required String title,
    required Widget content,
    required VoidCallback onConfirm,
  }) =>
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => AppAlertDialog(
          title: title,
          content: content,
          onConfirm: onConfirm,
        ),
      );

  void showDeleteDialog(
    BuildContext context, {
    required String subject,
    required String item,
    required VoidCallback onDelete,
  }) =>
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => AppAlertDialog(
          title: 'Delete $subject',
          content: Text.rich(
            style: UIStyleText.hintRegular.copyWith(fontSize: 13.5, color: UIColors.textLight),
            TextSpan(
              text: 'Are you sure you want to delete',
              children: [
                TextSpan(
                  text: ' "$item"? ',
                  style: UIStyleText.bodyRegular.copyWith(fontSize: 13.5, fontWeight: FontWeight.w600),
                ),
                const TextSpan(text: '\nThis action cannot be undone.')
              ],
            ),
          ),
          onConfirm: onDelete,
          confirmLabel: 'Delete',
          confirmButtonStyle: UIStyleButton.danger,
        ),
      );
}
