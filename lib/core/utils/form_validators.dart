import 'package:email_validator/email_validator.dart';
import 'package:medglobal_admin_portal/core/core.dart';

typedef FieldValidator = String? Function(String? value);

class FormValidators {
  /// Validates if the value is null or empty
  static FieldValidator required(String message) {
    return (value) {
      if (value == null || value.trim().isEmpty) return message;
      return null;
    };
  }

  /// Validates if the value is greater than zero
  static FieldValidator number(String message) {
    return (value) {
      if (value == null || value.trim().isEmpty) return null;

      final parsed = double.tryParse(value.trim());
      if (parsed != null && parsed.toPesoString() == '0.00') {
        return message;
      }

      return null;
    };
  }

  /// Validates if the value is a valid email
  static FieldValidator email({String? message = 'Please enter a valid email address, e.g., name@example.com'}) {
    return (value) {
      if (value == null || value.trim().isEmpty) return null;

      if (!EmailValidator.validate(value.trim())) return message;
      return null;
    };
  }

  /// Validates if the value is greater than the given max
  static FieldValidator numberReachMaximum({required double max, required String message}) {
    return (value) {
      if (value == null || value.trim().isEmpty) return null;

      final parsed = double.tryParse(value.trim());
      if (parsed != null && parsed >= max) {
        return message;
      }

      return null;
    };
  }

  static String? run(String? value, List<FieldValidator> validators) {
    for (final validator in validators) {
      final result = validator(value);
      if (result != null) return result;
    }
    return null;
  }
}
