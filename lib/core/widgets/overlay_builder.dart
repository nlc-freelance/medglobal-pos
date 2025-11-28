import 'package:flutter/material.dart';
import 'package:flutter_portal/flutter_portal.dart';

class OverlayBuilder extends StatelessWidget {
  const OverlayBuilder({
    super.key,
    required this.target,
    required this.follower,
    required this.visible,
    required this.onClose,
    this.anchor,
  });

  final Widget target;
  final Widget follower;
  final bool visible;
  final Anchor? anchor;
  final VoidCallback onClose;

  @override
  Widget build(BuildContext context) => Barrier(
        visible: visible,
        onClose: onClose,
        child: PortalTarget(
          visible: visible,
          anchor: anchor ??
              const Aligned(
                follower: Alignment.topLeft,
                target: Alignment.bottomLeft,
              ),
          portalFollower: follower,
          child: target,
        ),
      );
}

class Barrier extends StatelessWidget {
  const Barrier({
    super.key,
    required this.onClose,
    required this.visible,
    required this.child,
  });

  final Widget child;
  final VoidCallback onClose;
  final bool visible;

  @override
  Widget build(BuildContext context) {
    return PortalTarget(
      visible: visible,
      portalFollower: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onClose,
        child: const ColoredBox(color: Colors.transparent),
      ),
      child: child,
    );
  }
}
