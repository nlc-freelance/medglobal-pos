import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/widgets/page/page.dart';
import 'package:medglobal_admin_portal/portal/authentication/presentation/bloc/auth_bloc.dart';
import 'package:medglobal_admin_portal/portal/authentication/presentation/pages/widgets/confirm_sign_in_dialog.dart';
import 'package:medglobal_admin_portal/pos/syncing/connectivity/connectivity_cubit.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class LoginForm extends StatefulWidget {
  final bool isCentered;

  const LoginForm({super.key, this.isCentered = false});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool obscurePassword = true;

  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController()
      ..addListener(
        () => setState(() {
          if (passwordController.text.isEmpty) obscurePassword = true;
        }),
      );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _login() => context.read<AuthBloc>().add(LoginEvent(emailController.text.trim(), passwordController.text));

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      // listenWhen: (prev, curr) {
      //   if (prev is AuthenticatedState && curr is AuthInitialState) return false;
      //   return true;
      // },
      listener: (context, state) {
        if (state is AuthLoadingState) PageLoader.show(context);
        if (state is FirstTimeLoginState) {
          PageLoader.close();
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return const AlertDialog(
                scrollable: false,
                backgroundColor: UIColors.background,
                content: ConfirmSignInDialog(),
              );
            },
          );
        }
        if (state is AuthenticatedState) {
          PageLoader.close();
          if (AppConfig.isPOSApp) {
            // context.read<SessionBloc>().add(SessionEvent.start(state.user));
            // print('aaa');
            // context.read<DeviceSetupBloc>().add(const DeviceSetupEvent.checkup());
          }
        }
        if (state is AuthErrorState ||
            state is ConfirmLoginErrorState ||
            state is AuthAccessDeniedState ||
            state is UnauthenticatedState) {
          PageLoader.close();
          emailController.clear();
          passwordController.clear();
        }
      },
      builder: (context, state) => SizedBox(
        width: 350,
        child: Column(
          mainAxisAlignment: widget.isCentered ? MainAxisAlignment.center : MainAxisAlignment.start,
          crossAxisAlignment: widget.isCentered ? CrossAxisAlignment.center : CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Assets.images.medglobalLogo.image(),
            const UIVerticalSpace(60.0),
            UIText.heading1(Strings.welcome),
            const UIVerticalSpace(20.0),
            UIText.heading2(Strings.loginToYourAccount),
            if (AppConfig.isPOSApp)
              BlocBuilder<ConnectivityCubit, bool>(
                builder: (context, isOnline) => isOnline
                    ? const UIVerticalSpace(60.0)
                    : const Padding(
                        padding: EdgeInsets.only(top: 24, bottom: 16),
                        child: PageErrorBanner(
                          message:
                              'Looks like you don\'t have an internet connection right now. Please try again later.',
                        ),
                      ),
              )
            else
              const UIVerticalSpace(60.0),
            if (state is AuthErrorState) ...[
              SizedBox(
                width: 330,
                child: UIText.labelSemiBold(
                  state.message,
                  color: UIColors.buttonDanger,
                ),
              ),
              const UIVerticalSpace(20.0),
            ],
            if (state is AuthAccessDeniedState) ...[
              SizedBox(
                width: 330,
                child: UIText.labelSemiBold(
                  state.message,
                  color: UIColors.buttonDanger,
                ),
              ),
              const UIVerticalSpace(20.0),
            ],
            UITextField.noLabel(
              width: 345.0,
              hint: Strings.emailAddress,
              controller: emailController,
              onSubmitted: (_) => _login(),
            ),
            const UIVerticalSpace(20.0),
            UITextField.noLabel(
              width: 345.0,
              hint: Strings.password,
              controller: passwordController,
              obscureText: obscurePassword,
              onSubmitted: (_) => _login(),
              suffixIcon: passwordController.text.isNotEmpty
                  ? InkWell(
                      onTap: () => setState(() => obscurePassword = !obscurePassword),
                      child: (obscurePassword ? Assets.icons.eye : Assets.icons.eyeSlash).setSize(12),
                    )
                  : null,
            ),
            const UIVerticalSpace(36.0),
            SizedBox(
              width: 345.0,
              child: UIButton.filled(
                icon: Assets.icons.arrowRight1.setSize(12.0),
                iconAlign: IconAlignment.end,
                Strings.login,
                onClick: _login,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
