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
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: type == ToastType.SUCCESS ? UIColors.completedBg : UIColors.cancelledBg,
                border: Border.all(color: type == ToastType.SUCCESS ? UIColors.completedBg : UIColors.cancelledBg),
                borderRadius: const BorderRadius.all(Radius.circular(12.0)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      type == ToastType.SUCCESS
                          ? Assets.icons.checkCircle.svg(width: 18)
                          : Assets.icons.infoCircle.svg(width: 18),
                      const UIHorizontalSpace(8),
                      UIText.heading6(type.title),
                      const UIHorizontalSpace(16),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 28.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(child: UIText.bodyRegular(message)),
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
