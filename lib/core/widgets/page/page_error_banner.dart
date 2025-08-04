import 'package:flutter/material.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class PageErrorBanner extends StatelessWidget {
  const PageErrorBanner({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: UIColors.buttonDanger.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: UIText.labelMedium(message, color: UIColors.buttonDanger),
    );
  }
}
