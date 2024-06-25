import 'package:flutter/material.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class PageSectionTitle extends StatelessWidget {
  const PageSectionTitle(
    this.title, {
    super.key,
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

  factory PageSectionTitle.subsection(String title) => PageSectionTitle(title, isSubSection: true);

  factory PageSectionTitle.subsectionWithSubtitleAndAction({
    required String title,
    required String subtitle,
    required Widget action,
  }) =>
      PageSectionTitle(
        title,
        subtitle: subtitle,
        isSubSection: true,
        isSubSectionWithSubtitleAndAction: true,
        action: action,
      );

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          isSubSection ? UIText.heading6(title) : UIText.heading5(title),
          const UIVerticalSpace(4.0),
          if (isSubSectionWithSubtitleAndAction) ...[
            SizedBox(
              height: 16.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  UIText.subtitle(subtitle!),
                  action!,
                ],
              ),
            ),
            const UIVerticalSpace(8.0),
          ],
          const Divider(color: UIColors.borderMuted),
          const UIVerticalSpace(16.0),
        ],
      );
}
