import 'package:flutter/material.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class SidePeekModal extends StatelessWidget {
  final Widget child;

  const SidePeekModal({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Material(
        child: Container(
          width: MediaQuery.sizeOf(context).width * 0.45,
          color: UIColors.background,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 10),
                child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Assets.icons.arrowRight.svg(colorFilter: UIColors.textRegular.toColorFilter),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(30, 0, 30, 20),
                  child: child,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
