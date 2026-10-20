import 'app_strings.dart';

abstract final class Validators {
  static final RegExp _emailRegex = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );

  static final RegExp _phoneRegex = RegExp(
    r'^\+?[0-9]{10,15}$',
  );

  /// Validates that a field is not null, empty, or purely whitespace.
  static String? validateRequired(String? value, [String? customMessage]) {
    if (value == null || value.trim().isEmpty) {
      return customMessage ?? AppStrings.fieldRequired;
    }
    return null;
  }

  /// Alias for [validateRequired].
  static String? requiredField(String? value) => validateRequired(value);

  /// Validates an email address.
  static String? validateEmail(String? value) {
    final requiredError = validateRequired(value);
    if (requiredError != null) return requiredError;

    if (!_emailRegex.hasMatch(value!.trim())) {
      return AppStrings.invalidEmail;
    }
    return null;
  }

  /// Alias for [validateEmail].
  static String? emailValidator(String? value) => validateEmail(value);

  /// Validates a password with configurable security constraints.
  static String? validatePassword(
    String? value, {
    int minLength = 8,
    bool requireNumber = false,
    bool requireUppercase = false,
    bool requireSpecialChar = false,
  }) {
    final requiredError = validateRequired(value);
    if (requiredError != null) return requiredError;

    final trimmed = value!.trim();

    if (trimmed.length < minLength) {
      return minLength == 8 ? AppStrings.passwordTooShort : AppStrings.minLength('Password', minLength);
    }
    if (requireNumber && !trimmed.contains(RegExp(r'[0-9]'))) {
      return AppStrings.passwordNeedsNumber;
    }
    if (requireUppercase && !trimmed.contains(RegExp(r'[A-Z]'))) {
      return AppStrings.passwordNeedsUppercase;
    }
    if (requireSpecialChar && !trimmed.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return AppStrings.passwordNeedsSpecialChar;
    }
    return null;
  }

  /// Alias for [validatePassword].
  static String? passwordValidator(String? value) => validatePassword(value);

  /// Validates that confirm password matches [originalPassword].
  static String? validateConfirmPassword(String? value, String? originalPassword) {
    final requiredError = validateRequired(value);
    if (requiredError != null) return requiredError;

    if (value != originalPassword) {
      return AppStrings.passwordsDontMatch;
    }
    return null;
  }

  /// Validates phone numbers (supports optional leading `+` and 10 to 15 digits).
  static String? validatePhone(String? value) {
    final requiredError = validateRequired(value);
    if (requiredError != null) return requiredError;

    final cleanPhone = value!.replaceAll(RegExp(r'[\s\-()]'), '');
    if (!_phoneRegex.hasMatch(cleanPhone)) {
      return AppStrings.invalidPhone;
    }
    return null;
  }

  /// Validates a full name with minimum length check.
  static String? validateName(String? value, {int minLength = 3}) {
    final requiredError = validateRequired(value);
    if (requiredError != null) return requiredError;

    if (value!.trim().length < minLength) {
      return AppStrings.nameTooShort;
    }
    return null;
  }
}
