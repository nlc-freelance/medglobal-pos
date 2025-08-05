import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medglobal_admin_portal/core/core.dart';
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
            const CupertinoActivityIndicator(),
          ],
        ),
      ),
    );
  }
}
