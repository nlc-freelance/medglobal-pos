import 'package:flutter/material.dart';
import 'package:medglobal_admin_portal/gen/assets.gen.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class TransactionPlaceholderView extends StatelessWidget {
  const TransactionPlaceholderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Assets.icons.cube.svg(width: 48, height: 48),
        const UIVerticalSpace(16),
        UIText.bodyRegular(
          'Select a transaction from the list on the left \n to view details or issue a refund.',
          color: UIColors.textMuted,
          align: TextAlign.center,
        ),
      ],
    );
  }
}
