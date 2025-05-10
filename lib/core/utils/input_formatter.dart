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

class NewCurrencyInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String newText = newValue.text;

    // Allow empty input
    if (newText.isEmpty) {
      return newValue;
    }

    // If only a period is typed, clear the input
    if (newText == '.') {
      return const TextEditingValue(
        text: '',
        selection: TextSelection.collapsed(offset: 0),
      );
    }

    // Allow digits + optional single decimal with up to 2 digits after
    final regex = RegExp(r'^(\d+)?(\.\d{0,' + 2.toString() + r'})?$');

    if (regex.hasMatch(newText)) {
      return newValue;
    }

    return oldValue;
  }
}
