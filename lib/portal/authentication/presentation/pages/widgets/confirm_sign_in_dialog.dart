import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/authentication/presentation/bloc/auth_bloc.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class ConfirmSignInDialog extends StatefulWidget {
  const ConfirmSignInDialog({super.key});

  @override
  State<ConfirmSignInDialog> createState() => _ConfirmSignInDialogState();
}

class _ConfirmSignInDialogState extends State<ConfirmSignInDialog> {
  late TextEditingController newPasswordController;
  bool obscureNewPassword = true;

  @override
  void initState() {
    super.initState();
    newPasswordController = TextEditingController()
      ..addListener(
        () => setState(() {
          if (newPasswordController.text.isEmpty) obscureNewPassword = true;
        }),
      );
  }

  @override
  void dispose() {
    newPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return Row(
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
                  if (state is ConfirmLoginErrorState) ...[
                    SizedBox(
                        width: 330,
                        child: UIText.labelSemiBold(
                          state.message,
                          color: UIColors.buttonDanger,
                        )),
                    const UIVerticalSpace(20.0),
                  ],
                  UITextField.noLabel(
                    obscureText: obscureNewPassword,
                    hint: 'Enter new password',
                    controller: newPasswordController,
                    suffixIcon: newPasswordController.text.isNotEmpty
                        ? InkWell(
                            onTap: () => setState(() => obscureNewPassword = !obscureNewPassword),
                            child: (obscureNewPassword ? Assets.icons.eye : Assets.icons.eyeSlash).setSize(12),
                          )
                        : null,
                  ),
                  const UIVerticalSpace(30.0),
                  UIButton.filled(
                    'Continue',
                    onClick: () => context.read<AuthBloc>().add(ConfirmFirstTimeLoginEvent(newPasswordController.text)),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
