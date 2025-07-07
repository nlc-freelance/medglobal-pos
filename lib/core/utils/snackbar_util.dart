import 'package:flutter/material.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

/// A utility class for displaying various types of snackbars.
/// It provides static methods for different toast types (success, error, invalid, duplicate)
class SnackbarUtil {
  SnackbarUtil._();

  /// Displays an error snackbar with a red theme.
  static void error(
    BuildContext context,
    String message,
  ) =>
      _show(
        context,
        type: ToastType.ERROR,
        message: message,
      );

  /// Displays a success snackbar with a green theme.
  static void success(
    BuildContext context,
    String message, {
    Widget? action,
  }) =>
      _show(
        context,
        type: ToastType.SUCCESS,
        message: message,
        action: action,
      );

  /// Displays an invalid input snackbar with a warning theme.
  static void invalid(
    BuildContext context,
    String message,
  ) =>
      _show(
        context,
        type: ToastType.INVALID,
        message: message,
      );

  /// Displays a duplicate entry snackbar with a warning theme.
  static void duplicate(
    BuildContext context,
    String message,
  ) =>
      _show(
        context,
        type: ToastType.DUPLICATE,
        message: message,
      );

  static void _show(BuildContext context, {required ToastType type, required String message, Widget? action}) {
    const duration = Duration(milliseconds: 5000);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: UIColors.transparent,
        margin: EdgeInsets.only(
          bottom: 16,
          right: 16,
          left: MediaQuery.of(context).size.width * 0.6,
        ),
        duration: duration,
        elevation: 0,
        content: Align(
          alignment: Alignment.bottomRight,
          child: Container(
            constraints: const BoxConstraints(maxWidth: 500),
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: UIColors.background,
              border: Border.fromBorderSide(BorderSide(color: UIColors.borderRegular)),
              borderRadius: BorderRadius.all(Radius.circular(12)),
              boxShadow: [
                BoxShadow(
                  color: UIColors.borderRegular,
                  blurRadius: 8,
                  offset: Offset(1, 1),
                ),
              ],
            ),
            child: _buildSnackbarContent(context, type, message, action),
          ),
        ),
      ),
    );
  }

  static Widget _buildSnackbarContent(BuildContext context, ToastType type, String message, Widget? action) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8, top: 4),
          child: type == ToastType.SUCCESS
              ? Assets.icons.checkCircle.svg(
                  width: 18,
                  colorFilter: _color(type).toColorFilter,
                )
              : Assets.icons.infoCircle.svg(
                  width: 18,
                  colorFilter: _color(type).toColorFilter,
                ),
        ),
        const UIHorizontalSpace(30),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(type.title, style: UIStyleText.heading6.copyWith(fontSize: 15)),
              UIText.bodyRegular(message, color: UIColors.textMuted),
              if (action != null)
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: action,
                ),
            ],
          ),
        ),
        Material(
          color: UIColors.transparent,
          child: InkWell(
            onTap: () => ScaffoldMessenger.of(context).hideCurrentSnackBar(),
            borderRadius: BorderRadius.circular(16),
            child: Assets.icons.close.svg(colorFilter: UIColors.textLight.toColorFilter),
          ),
        ),
      ],
    );
  }

  static Color _color(ToastType type) {
    return switch (type) {
      ToastType.SUCCESS => UIColors.success,
      ToastType.ERROR => UIColors.error,
      ToastType.INVALID || ToastType.DUPLICATE => UIColors.warning,
    };
  }
}
