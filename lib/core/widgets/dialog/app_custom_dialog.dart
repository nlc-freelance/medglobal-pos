import 'package:flutter/material.dart';
import 'package:medglobal_admin_portal/gen/assets.gen.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class AppCustomDialog extends StatelessWidget {
  const AppCustomDialog({
    super.key,
    required this.title,
    required this.content,
    required this.actions,
    this.onClose,
  });

  final String title;
  final Widget content;
  final Widget actions;
  final VoidCallback? onClose;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12.0))),
      backgroundColor: UIColors.background,
      child: Container(
        constraints: const BoxConstraints(maxWidth: 500, maxHeight: 600),
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: UIText.heading5(title)),
                InkWell(
                  onTap: () {
                    onClose?.call();
                    Navigator.pop(context);
                  },
                  borderRadius: BorderRadius.circular(16),
                  child: Assets.icons.close.svg(),
                ),
              ],
            ),
            const Divider(color: UIColors.borderMuted),
            const UIVerticalSpace(16),
            content,
            const UIVerticalSpace(16),
            actions,
          ],
        ),
      ),
    );
  }
}
