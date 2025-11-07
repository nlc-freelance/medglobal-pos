import 'package:flutter/material.dart';
import 'package:medglobal_admin_portal/core/utils/snackbar_util.dart';

class NullCheckUtil {
  NullCheckUtil._();

  /// Checks if [value] is null; if so, shows an error snackbar with [message].
  /// If [value] is non-null, calls [onValid] passing the non-null value.
  static void checkAndCall<T>(
    BuildContext context, {
    required T? value,
    String message = 'The requested data could not be found. It may be missing or invalid.',
    required void Function(T value) onValid,
  }) {
    if (value == null) {
      SnackbarUtil.error(context, message);
    } else {
      onValid(value);
    }
  }
}
