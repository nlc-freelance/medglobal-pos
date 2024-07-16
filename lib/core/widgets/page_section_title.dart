import 'package:flutter/material.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class PageSectionTitle extends StatelessWidget {
  const PageSectionTitle({
    super.key,
    required this.title,
    this.isSubSection = false,
    this.isSubSectionWithSubtitleAndAction = false,
    this.action,
    this.subtitle,
  });

  final String title;
  final bool isSubSection;
  final bool isSubSectionWithSubtitleAndAction;
  final String? subtitle;
  final Widget? action;

  factory PageSectionTitle.subsection({
    required String title,
    String? subtitle,
    Widget? action,
  }) =>
      PageSectionTitle(
        title: title,
        isSubSection: true,
        subtitle: subtitle,
        action: action,
      );

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              isSubSection ? UIText.labelSemiBold(title) : UIText.heading5(title),
              if (subtitle == null && action != null) action!,
            ],
          ),
          if (subtitle != null) ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                UIText.subtitle(subtitle!),
                if (action != null) action!,
              ],
            ),
            const UIVerticalSpace(4),
          ],
          const Divider(color: UIColors.borderMuted),
          const UIVerticalSpace(8),
        ],
      );
}
