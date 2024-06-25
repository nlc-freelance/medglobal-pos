import 'package:flutter/material.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class LoginVector extends StatelessWidget {
  const LoginVector({super.key});

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 480.0,
              child: Text(
                Strings.loginPlaceholder,
                textAlign: TextAlign.center,
                style: UIStyleText.bodyRegular.copyWith(fontSize: 14.0, height: 1.6),
              ),
            ),
            Assets.images.loginVector.svg(width: 540.0),
          ],
        ),
      );
}
