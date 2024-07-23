import 'package:flutter/material.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/authentication/presentation/pages/widgets/login_form.dart';
import 'package:medglobal_admin_portal/portal/authentication/presentation/pages/widgets/login_vector.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class LoginPage extends StatelessWidget {
  static const route = '/login';

  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}
