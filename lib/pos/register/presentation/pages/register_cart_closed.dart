import 'package:flutter/material.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/utils/shared_preferences_service.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class RegisterCartClosed extends StatelessWidget {
  const RegisterCartClosed({super.key, required this.onOpenShift});

  final VoidCallback onOpenShift;

  bool isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year && date1.month == date2.month && date1.day == date2.day;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Assets.icons.infoCircle.svg(width: 40, colorFilter: UIColors.borderRegular.toColorFilter),
        const UIVerticalSpace(8),
        Text('CLOSED', style: UIStyleText.headline.copyWith(fontSize: 48)),
        const UIVerticalSpace(30),
        FutureBuilder(
            future: SharedPreferencesService.isMaxShiftOpenReached(),
            builder: (context, snapshot) => Column(
                  children: [
                    if (snapshot.data == true) ...[
                      Text('Opening shift can only be done once a day',
                          style: UIStyleText.bodyRegular.copyWith(fontSize: 14)),
                      const UIVerticalSpace(4),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: Text(
                          'This register is now closed as you might have already opened and closed a shift today',
                          style: UIStyleText.hint.copyWith(fontSize: 12.8),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ] else ...[
                      Text('Open register shift', style: UIStyleText.bodyRegular.copyWith(fontSize: 14)),
                      const UIVerticalSpace(4),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 60),
                        child: Text(
                          'To start making transactions, open shift and input the initial register cash.',
                          style: UIStyleText.hint.copyWith(fontSize: 12.8),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const UIVerticalSpace(24),
                      UIButton.filled(
                        'Open Shift',
                        onClick: onOpenShift,
                      ),
                    ],
                  ],
                )),
      ],
    );
  }
}
