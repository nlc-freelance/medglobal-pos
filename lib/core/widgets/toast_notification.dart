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
          margin: EdgeInsets.only(
            bottom: 16,
            right: 16,
            left: MediaQuery.of(context).size.width * 0.7,
          ),
          duration: Duration(milliseconds: duration!),
          elevation: 0,
          content: Align(
            alignment: Alignment.bottomRight,
            child: Container(
              constraints: const BoxConstraints(maxWidth: 500),
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: UIColors.background,
                border: Border.fromBorderSide(BorderSide(color: UIColors.borderRegular)),
                boxShadow: [
                  BoxShadow(
                    color: UIColors.borderRegular,
                    blurRadius: 8,
                    offset: Offset(1, 1),
                  ),
                ],
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      type == ToastType.SUCCESS
                          ? Assets.icons.checkCircle.svg(width: 18, colorFilter: _color(type).toColorFilter)
                          : Assets.icons.infoCircle.svg(width: 18, colorFilter: _color(type).toColorFilter),
                      const UIHorizontalSpace(16),
                      Expanded(child: Text(type.title, style: UIStyleText.heading6.copyWith(fontSize: 15))),
                      Material(
                        color: UIColors.transparent,
                        child: InkWell(
                          onTap: () => ScaffoldMessenger.of(context).hideCurrentSnackBar(),
                          borderRadius: BorderRadius.circular(16),
                          child: Assets.icons.close.svg(colorFilter: UIColors.textLight.toColorFilter),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 34, top: 2),
                    child: UIText.bodyRegular(message, color: UIColors.textMuted),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
