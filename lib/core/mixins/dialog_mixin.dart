import 'package:flutter/material.dart';
import 'package:medglobal_admin_portal/core/widgets/dialog/delete_dialog.dart';

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

  void showDeleteDialog(
    BuildContext context, {
    required String subject,
    required VoidCallback onDelete,
  }) =>
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => DeleteDialog(subject: subject, onDelete: onDelete),
      );
}
