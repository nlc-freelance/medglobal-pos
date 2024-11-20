import 'package:flutter/material.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

mixin DialogMixin {
  void showConfirmationDialog(
    BuildContext context, {
    required String title,
    required String message,
    required String actionLabel,
    required VoidCallback onAction,
    required bool isLoading,
  }) =>
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => Dialog(
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12.0))),
          backgroundColor: UIColors.background,
          child: Container(
            width: MediaQuery.sizeOf(context).width * 0.35,
            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UIText.heading5(title),
                const Divider(color: UIColors.borderMuted),
                const UIVerticalSpace(16.0),
                UIText.bodyRegular(message),
                const UIVerticalSpace(30.0),
                CancelActionButton(
                  isLoading: isLoading,
                  actionLabel: actionLabel,
                  actionStyle: UIStyleButton.danger,
                  onCancel: () => Navigator.pop(context),
                  onAction: () {
                    onAction.call();
                    // Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ),
      );
}
