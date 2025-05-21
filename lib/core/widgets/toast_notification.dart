import 'package:flutter/material.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class ToastNotification {
  ToastNotification._();

  static void error(BuildContext context, String message) => _show(
        context,
        type: ToastType.ERROR,
        message: message,
      );

  static void success(BuildContext context, String message, {int? duration = 5000}) => _show(
        context,
        type: ToastType.SUCCESS,
        message: message,
        duration: duration,
      );

  static void invalid(BuildContext context, String message) => _show(
        context,
        type: ToastType.INVALID,
        message: message,
      );

  static void duplicate(BuildContext context, String message) => _show(
        context,
        type: ToastType.DUPLICATE,
        message: message,
        duration: 3000,
      );

  static Color _color(ToastType type) {
    return switch (type) {
      ToastType.SUCCESS => UIColors.success,
      ToastType.ERROR => UIColors.error,
      ToastType.INVALID || ToastType.DUPLICATE => UIColors.warning,
    };
  }

  static void _show(BuildContext context, {required ToastType type, required String message, int? duration = 5000}) =>
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: UIColors.transparent,
          duration: Duration(milliseconds: duration!),
          elevation: 0,
          content: Align(
            alignment: Alignment.bottomRight,
            child: Container(
              constraints: const BoxConstraints(maxWidth: 500),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: UIColors.background,
                border: Border(left: BorderSide(color: _color(type), width: 5)),
                boxShadow: const [
                  BoxShadow(
                    color: UIColors.borderRegular,
                    blurRadius: 8.0,
                    offset: Offset(1, 1),
                  ),
                ],
                borderRadius: const BorderRadius.all(Radius.circular(12)),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: _color(type).withOpacity(0.1),
                      borderRadius: const BorderRadius.all(Radius.circular(50)),
                    ),
                    child: type == ToastType.SUCCESS
                        ? Assets.icons.checkCircle.svg(width: 18, colorFilter: _color(type).toColorFilter)
                        : Assets.icons.infoCircle.svg(width: 18, colorFilter: _color(type).toColorFilter),
                  ),
                  const UIHorizontalSpace(20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        UIText.heading6(type.title),
                        const UIVerticalSpace(2),
                        UIText.bodyRegular(message),
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
