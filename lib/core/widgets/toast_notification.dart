import 'package:flutter/material.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class ToastNotification {
  ToastNotification._();

  static void error(BuildContext context, String message) => _show(
        context,
        type: ToastType.error,
        message: message,
      );

  static void success(BuildContext context, String message) => _show(
        context,
        type: ToastType.success,
        message: message,
      );

  static void _show(BuildContext context, {required ToastType type, required String message}) =>
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: UIColors.transparent,
          duration: const Duration(milliseconds: 5000),
          elevation: 0,
          content: Align(
            alignment: Alignment.bottomRight,
            child: Container(
              constraints: const BoxConstraints(minWidth: 300),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: UIColors.background,
                border: Border.all(color: UIColors.borderMuted, width: 2),
                borderRadius: const BorderRadius.all(Radius.circular(12.0)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      type == ToastType.success ? Assets.icons.checkCircle.svg() : Assets.icons.infoCircle.svg(),
                      const UIHorizontalSpace(8),
                      UIText.labelSemiBold(type.title),
                      const UIHorizontalSpace(16),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        UIText.labelRegular(message),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
