import 'package:flutter/material.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class PageHeader extends StatelessWidget {
  final String title;
  final String subtitle;
  final List<Widget>? actions;
  final List<Widget>? titleTrailings;

  const PageHeader({
    required this.title,
    required this.subtitle,
    this.actions,
    this.titleTrailings,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const UIVerticalSpace(12.0),
              Row(
                children: [
                  UIText.heading4(title),
                  if (titleTrailings != null) ...[
                    const UIHorizontalSpace(16),
                    ...?titleTrailings,
                  ],
                ],
              ),
              const UIVerticalSpace(4.0),
              UIText.subtitle(subtitle)
            ],
          ),
          Row(
            children: [...?actions],
          ),
        ],
      ),
    );
  }
}
