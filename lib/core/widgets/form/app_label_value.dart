import 'package:flutter/material.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class AppLabelValue extends StatelessWidget {
  const AppLabelValue({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // UIText.labelMedium('Label', color: UIColors.textMuted),
        // UIText.label('This is the value'),
        Expanded(
            flex: 2,
            child: Text(
              'Assigned Branch',
              style: UIStyleText.labelMedium.copyWith(color: UIColors.textGray, fontWeight: FontWeight.w400),
            )),
        Expanded(flex: 4, child: UIText.labelMedium('Correctional')),
      ],
    );
  }
}
