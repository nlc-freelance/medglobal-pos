import 'package:flutter/material.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

/// A simple widget as placeholder for empty data grid state
/// With button for getting started
///
/// Used inside the data grid footer when rows are empty

class DataGridEmpty extends StatelessWidget {
  const DataGridEmpty({
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
            color: UIColors.textMuted.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(1000),
          ),
          child: Assets.icons.cube.svg(),
        ),
        const UIVerticalSpace(12),
        UIText.labelSemiBold(title, align: TextAlign.center),
        const UIVerticalSpace(4),
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
