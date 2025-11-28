import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/pos/device_setup/presentation/blocs/device_setup/device_setup_bloc.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class SettingUpScreen extends StatelessWidget {
  const SettingUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Assets.icons.cube.setSize(30),
            const UIVerticalSpace(16),
            UIText.heading6('Setting Up Your Device'),
            const UIVerticalSpace(8),
            UIText.bodyRegular('We\'re loading device register details and preparing your device for use.'),
            UIText.bodyRegular('Please wait a moment.'),
            const UIVerticalSpace(16),
            BlocBuilder<DeviceSetupBloc, DeviceSetupState>(
              builder: (context, state) {
                return state.maybeWhen(
                  loading: () => const CupertinoActivityIndicator(),
                  failure: (message) => Column(
                    children: [
                      UIText.labelMedium(message, color: UIColors.error),
                      UIButton.text(
                        'Retry',
                        onClick: () => context.read<DeviceSetupBloc>().add(const DeviceSetupEvent.rebind()),
                      ),
                    ],
                  ),
                  orElse: () => const SizedBox.shrink(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
