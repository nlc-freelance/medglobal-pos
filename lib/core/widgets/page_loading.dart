import 'package:flutter/material.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class PageLoading {
  static OverlayEntry? _overlayEntry;

  static void show(BuildContext context) {
    _overlayEntry = OverlayEntry(
      builder: (context) => Stack(
        children: [
          Positioned.fill(
            child: Container(
              color: UIColors.transparent,
              child: const Center(
                child: CircularProgressIndicator(color: UIColors.primary, strokeWidth: 2),
              ),
            ),
          ),
        ],
      ),
    );
    Overlay.of(context).insert(_overlayEntry!);
  }

  static void hide() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }
}
