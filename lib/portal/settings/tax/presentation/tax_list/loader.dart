import 'package:flutter/material.dart';

class FullLoader {
  FullLoader._();

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
      color: Colors.black.withOpacity(0.4),
      child: const Center(
        child: CircularProgressIndicator(strokeWidth: 2),
      ),
    );
  }
}
