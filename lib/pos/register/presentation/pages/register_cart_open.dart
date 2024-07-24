import 'package:flutter/material.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class RegisterCartOpen extends StatelessWidget {
  const RegisterCartOpen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        UIText.labelSemiBold('Order Details'),
        Expanded(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Assets.icons.cube.svg(),
                const UIVerticalSpace(12),
                UIText.labelMedium(
                  'No items added',
                  color: UIColors.textMuted,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
