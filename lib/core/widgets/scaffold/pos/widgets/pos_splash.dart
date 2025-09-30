import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PosSplash extends StatelessWidget {
  static const route = '/splash';

  const PosSplash({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CupertinoActivityIndicator()),
    );
  }
}
