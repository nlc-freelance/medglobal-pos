import 'package:flutter/material.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class EmptyGridWidget extends StatelessWidget {
  const EmptyGridWidget({
    super.key,
    required this.title,
    required this.subtitle,
    this.action,
  });

  final String title;
  final String subtitle;
  final Widget? action;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: UIColors.textMuted.withOpacity(0.1),
            borderRadius: BorderRadius.circular(1000),
          ),
          child: Assets.icons.cube.svg(),
        ),
        const UIVerticalSpace(12),
        UIText.heading6(title),
        const UIVerticalSpace(6),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 380),
          child: Text(
            subtitle,
            style: UIStyleText.hint.copyWith(color: UIColors.textGray),
            textAlign: TextAlign.center,
          ),
        ),
        const UIVerticalSpace(24),
        if (action != null) action!,
      ],
    );
  }
}
