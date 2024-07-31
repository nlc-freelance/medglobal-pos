import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/authentication/presentation/bloc/auth_bloc.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController newPasswordController = TextEditingController();

    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthLoadingState) UIPageLoader.show(context);
        if (state is FirstTimeLoginState) {
          UIPageLoader.close(context);
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) {
                return AlertDialog(
                  scrollable: false,
                  content: Row(
                    children: [
                      Expanded(flex: 3, child: Assets.images.confirmLogin.svg()),
                      Expanded(
                        flex: 2,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('Confirm Sign In', style: UIStyleText.heading1),
                            Text('Create a new password to confirm sign in', style: UIStyleText.bodyRegular),
                            const UIVerticalSpace(60.0),
                            UITextField.noLabel(
                              obscureText: true,
                              hint: 'Enter new password',
                              controller: newPasswordController,
                            ),
                            const UIVerticalSpace(30.0),
                            UIButton.filled(
                              'Continue',
                              onClick: () =>
                                  context.read<AuthBloc>().add(ConfirmFirstTimeLoginEvent(newPasswordController.text)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              });
        }
        if (state is AuthErrorState) UIPageLoader.close(context);
      },
      builder: (context, state) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Assets.images.medglobalLogo.image(),
          const UIVerticalSpace(60.0),
          UIText.heading1(Strings.welcome),
          const UIVerticalSpace(20.0),
          UIText.heading2(Strings.loginToYourAccount),
          const UIVerticalSpace(60.0),
          if (state is AuthErrorState) ...[
            SizedBox(
                width: 330,
                child: UIText.labelSemiBold(
                  state.message,
                  color: UIColors.buttonDanger,
                )),
            const UIVerticalSpace(20.0),
          ],
          UITextField.noLabel(
            width: 345.0,
            hint: Strings.emailAddress,
            controller: emailController,
          ),
          const UIVerticalSpace(20.0),
          UITextField.noLabel(
            width: 345.0,
            hint: Strings.password,
            controller: passwordController,
            obscureText: true,
          ),
          const UIVerticalSpace(36.0),
          SizedBox(
            width: 345.0,
            child: UIButton.filled(
              icon: Assets.icons.arrowRight1.setSize(12.0),
              iconAlign: IconAlignment.end,
              Strings.login,
              onClick: () {
                context.read<AuthBloc>().add(LoginEvent(emailController.text, passwordController.text));
              },
            ),
          ),
        ],
      ),
    );
  }
}
