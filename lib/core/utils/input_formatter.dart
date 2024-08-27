import 'package:flutter/services.dart';

class CurrencyInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    // Regular expression to match only digits, commas, and periods
    final regex = RegExp(r'^[\d,.]*$');

    // If the new value matches the regex, allow it; otherwise, reject it
    if (regex.hasMatch(newValue.text)) {
      return newValue;
    }

    // If the new value does not match, return the old value to reject the input
    return oldValue;
  }
}
