import 'package:formz/formz.dart';
import 'package:neofit_app/utils/string_validator.dart';

enum EmailValidationError {
  empty,
  short,
  invalid,
}

extension EmailValidationErrorX on EmailValidationError {
  String get message {
    switch (this) {
      case EmailValidationError.empty:
        return "Email can't be empty";
      case EmailValidationError.short:
        return "Email is too short";
      case EmailValidationError.invalid:
        return "Invalid email";
    }
  }
}

class EmailFormz extends FormzInput<String, EmailValidationError> {
  const EmailFormz.pure() : super.pure("");

  const EmailFormz.dirty(String value) : super.dirty(value);

  @override
  EmailValidationError? validator(String value) {
    if (value.length < 4) return EmailValidationError.short;

    if (!EmailRegexValidator().isValid(value)) {
      return EmailValidationError.invalid;
    }

    return null;
  }
}
