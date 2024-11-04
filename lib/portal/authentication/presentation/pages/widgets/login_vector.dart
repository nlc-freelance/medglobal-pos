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
              child: Text.rich(
                textAlign: TextAlign.center,
                TextSpan(
                  text: 'MedGlobal Pharmacy aims is to provide',
                  style: UIStyleText.bodyRegular,
                  children: [
                    TextSpan(
                      text: ' accessible, high-quality healthcare solutions ',
                      style: UIStyleText.bodyRegular.copyWith(fontWeight: FontWeight.w700),
                    ),
                    TextSpan(
                      text: 'to Filipinos, with emphasis on patient care at community level.',
                      style: UIStyleText.bodyRegular,
                    )
                  ],
                ),
              ),
            ),
            Assets.images.loginVector.svg(width: 540.0),
          ],
        ),
      );
}
