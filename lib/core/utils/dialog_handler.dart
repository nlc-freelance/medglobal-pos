import 'package:flutter/material.dart';
import 'package:medglobal_admin_portal/core/widgets/sidepeek_modal.dart';

abstract class DialogHandler {
  Widget create(BuildContext context);

  void dismiss(BuildContext context) => Navigator.pop(context);

  void showSidePeek(BuildContext context) {
    showGeneralDialog(
      barrierLabel: create(context).toString(),
      barrierDismissible: true,
      transitionDuration: const Duration(milliseconds: 300),
      context: context,
      pageBuilder: (context, animation1, animation2) => SidePeekModal(child: create(context)),
      transitionBuilder: (context, animation1, animation2, child1) {
        return SlideTransition(
          position: Tween(begin: const Offset(1, 0), end: const Offset(0, 0)).animate(animation1),
          child: child1,
        );
      },
    );
  }
}
