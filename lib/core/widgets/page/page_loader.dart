import 'package:flutter/material.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class PageLoader {
  PageLoader._();

  static OverlayEntry? _overlayEntry;

  static void show(BuildContext context) {
    if (_overlayEntry != null) return; // Prevent duplicates

    _overlayEntry = OverlayEntry(
      builder: (_) => const _FullScreenLoader(),
    );

    final overlay = Overlay.of(context, rootOverlay: true);
    overlay.insert(_overlayEntry!);
  }

  static void close() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }
}

class _FullScreenLoader extends StatelessWidget {
  const _FullScreenLoader();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black.withOpacity(0.2),
      child: const Center(
        child: CircularProgressIndicator(
          color: UIColors.primary,
          strokeWidth: 2,
        ),
      ),
    );
  }
}
