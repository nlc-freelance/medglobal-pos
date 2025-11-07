import 'package:flutter/material.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class SidePeekModal extends StatelessWidget {
  final Widget child;
  final BuildContext context;

  const SidePeekModal(this.context, {super.key, required this.child});

  @override
  Widget build(_) {
    return Align(
      alignment: Alignment.centerRight,
      child: Material(
        type: MaterialType.transparency,
        child: Container(
          margin: const EdgeInsets.all(16),
          width: MediaQuery.sizeOf(context).width * 0.45,
          decoration: BoxDecoration(
            color: UIColors.background,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 10),
                child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Assets.icons.arrowRight1.svg(colorFilter: UIColors.textRegular.toColorFilter),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(30, 10, 30, 20),
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
