import 'package:flutter/material.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class PageErrorBanner extends StatelessWidget {
  const PageErrorBanner({super.key, required this.message, this.isInline = false});

  final String message;
  final bool? isInline;

  const PageErrorBanner.inline({super.key, required this.message}) : isInline = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: isInline == true ? EdgeInsets.zero : const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: UIColors.buttonDanger.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: UIText.labelMedium(message, color: UIColors.buttonDanger),
    );
  }
}
