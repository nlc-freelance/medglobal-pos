import 'package:flutter/material.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class PageHeader extends StatelessWidget {
  final String title;
  final String? subtitle;
  final List<Widget>? actions;
  final List<Widget>? titleTrailings;

  const PageHeader({
    required this.title,
    this.subtitle,
    this.actions,
    this.titleTrailings,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    UIText.heading4(title),
                    if (titleTrailings != null) ...[
                      const UIHorizontalSpace(16),
                      ...?titleTrailings,
                    ],
                  ],
                ),
                if (subtitle != null) ...[
                  const UIVerticalSpace(4),
                  Text(subtitle!, style: UIStyleText.hint.copyWith(color: UIColors.textGray)),
                ],
              ],
            ),
          ),
          if (actions?.isNotEmpty == true)
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [...?actions],
              ),
            ),
        ],
      ),
    );
  }
}
