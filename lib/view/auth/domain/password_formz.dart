import 'package:formz/formz.dart';
import 'package:neofit_app/utils/string_validator.dart';

enum PasswordValidationError {
  empty,
  short,
  invalid,
}

extension PasswordValidationErrorX on PasswordValidationError {
  String get message {
    switch (this) {
      case PasswordValidationError.empty:
        return "Password can't be empty";
      case PasswordValidationError.short:
        return "Password is too short";
      case PasswordValidationError.invalid:
        return "Password must contain at least 1 character and 1 number";
    }
  }
}

class PasswordFormz extends FormzInput<String, PasswordValidationError> {
  const PasswordFormz.pure() : super.pure("");

  const PasswordFormz.dirty(String value) : super.dirty(value);

  @override
  PasswordValidationError? validator(String value) {
    if (!NonEmptyStringValidator().isValid(value)) {
      return PasswordValidationError.empty;
    }

    if (!MinLengthStringValidator(8).isValid(value)) {
      return PasswordValidationError.short;
    }

    if (!PasswordRegexValidator().isValid(value)) {
      return PasswordValidationError.invalid;
    }

    return null;
  }
}
