import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/authentication/presentation/pages/widgets/login_form.dart';
import 'package:medglobal_admin_portal/portal/authentication/presentation/pages/widgets/login_vector.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class LoginPage extends StatefulWidget {
  static const route = '/login';

  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  List<LogicalKeyboardKey> _keys = [];

  @override
  Widget build(BuildContext context) {
    return KeyboardListener(
      focusNode: FocusNode(),
      onKeyEvent: (event) {
        final key = event.logicalKey;

        if (event is KeyDownEvent) {
          if (_keys.contains(key)) return;

          setState(() => _keys.add(key));

          if (_keys.contains(LogicalKeyboardKey.shiftLeft) &&
              _keys.contains(LogicalKeyboardKey.controlLeft) &&
              _keys.contains(LogicalKeyboardKey.digit0)) {
            _showDialog(
              context,
              onClose: () {
                setState(() => _keys = []);
                Navigator.pop(context);
              },
            );
          }
        } else {
          setState(() => _keys.remove(key));
        }
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
    );
  }

  void _showDialog(BuildContext context, {required VoidCallback onClose}) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: UIColors.whiteBg,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              UIText.heading6('Team Credits'),
              const UIVerticalSpace(20),
              UIText.heading6('Wilmarc Lopez'),
              UIText.heading6('Ken Layug'),
              UIText.heading6('Natalia Canada'),
              const UIVerticalSpace(20),
              UIButton.outlined('Close', onClick: onClose),
            ],
          ),
        );
      },
    );
  }
}
