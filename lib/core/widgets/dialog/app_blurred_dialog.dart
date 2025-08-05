import 'dart:ui';

import 'package:flutter/material.dart';

void showBlurredDialog(BuildContext context, {required bool isLoading, Widget? content}) {
  showGeneralDialog(
    context: context,
    barrierDismissible: false,
    barrierLabel: "BlurredDialog",
    barrierColor: Colors.transparent,
    transitionDuration: const Duration(milliseconds: 200),
    pageBuilder: (context, animation, secondaryAnimation) {
      return Stack(
        children: [
          // Blurred background
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
              child: Container(color: Colors.black12),
            ),
          ),

          // Centered dialog
          Center(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 500),
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: isLoading
                  ? const CircularProgressIndicator()
                  : Material(
                      color: Colors.transparent,
                      child: content ?? const SizedBox(),
                    ),
            ),
          ),
        ],
      );
    },
  );
}
