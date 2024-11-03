import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/authentication/presentation/pages/widgets/login_form.dart';
import 'package:medglobal_admin_portal/portal/authentication/presentation/pages/widgets/login_vector.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class LoginPage extends StatelessWidget {
  static const route = '/login';

  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Shortcuts(
      shortcuts: <LogicalKeySet, Intent>{
        LogicalKeySet(LogicalKeyboardKey.controlLeft, LogicalKeyboardKey.shiftLeft, LogicalKeyboardKey.digit0):
            const ActivateIntent(),
      },
      child: Actions(
        actions: <Type, Action<Intent>>{
          ActivateIntent: CallbackAction<ActivateIntent>(
            onInvoke: (Intent intent) {
              _showDialog(context);
              return null;
            },
          ),
        },
        child: Focus(
          autofocus: true,
          child: Scaffold(
            body: Stack(
              children: [
                Positioned.fill(child: Assets.images.designLines.svg(fit: BoxFit.fill)),
                Align(
                  alignment: Alignment.center,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const LoginForm(),
                      UIHorizontalSpace(MediaQuery.sizeOf(context).width * 0.2),
                      const LoginVector(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: UIColors.whiteBg,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              UIText.labelSemiBold('Team Credits'),
              const UIVerticalSpace(20),
              UIText.heading6('Wilmarc Lopez'),
              UIText.heading6('Ken Layug'),
              UIText.heading6('Natalia Canada'),
            ],
          ),
        );
      },
    );
  }
}
