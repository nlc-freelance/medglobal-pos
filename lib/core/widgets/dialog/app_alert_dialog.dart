import 'package:flutter/material.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class AppAlertDialog extends StatelessWidget {
  const AppAlertDialog({
    super.key,
    required this.title,
    required this.content,
    required this.onConfirm,
    this.confirmLabel,
    this.confirmButtonStyle,
  });

  final String title;
  final Widget content;
  final VoidCallback onConfirm;
  final String? confirmLabel;
  final ButtonStyle? confirmButtonStyle;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
      backgroundColor: UIColors.background,
      child: Container(
        constraints: const BoxConstraints(maxWidth: 420),
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: UIStyleText.heading5.copyWith(fontSize: 16, fontWeight: FontWeight.w700),
            ),
            const UIVerticalSpace(16),
            content,
            const UIVerticalSpace(24),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                UIButton.outlined('Cancel', onClick: () => Navigator.pop(context)),
                const UIHorizontalSpace(8),
                UIButton.filled(
                  confirmLabel ?? 'Confirm',
                  style: confirmButtonStyle,
                  onClick: () {
                    onConfirm();
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
