import 'package:flutter/material.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

/// A widget that displays an empty SizedBox.
class InitialView extends StatelessWidget {
  const InitialView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox();
  }
}

/// A widget that displays a loading indicator.
class LoadingView extends StatelessWidget {
  const LoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: UIColors.primary,
        strokeWidth: 2,
      ),
    );
  }
}

/// A widget that displays a failure message.
/// It takes a [message] parameter to display the error message.
class FailureView extends StatelessWidget {
  const FailureView(this.message, {super.key});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Text(message);
  }
}
