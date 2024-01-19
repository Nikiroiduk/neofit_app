import 'package:formz/formz.dart';
import 'package:neofit_app/presentation/utils/string_validator.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

enum EmailValidationError {
  empty,
  short,
  invalid,
}

extension EmailValidationErrorX on EmailValidationError {
  String message(AppLocalizations loc) {
    switch (this) {
      case EmailValidationError.empty:
        return loc.emailCantBeEmpty;
      case EmailValidationError.short:
        return loc.emailIsTooShort;
      case EmailValidationError.invalid:
        return loc.invalidEmail;
    }
  }
}

class EmailFormz extends FormzInput<String, EmailValidationError> {
  const EmailFormz.pure() : super.pure("");

  const EmailFormz.dirty(String value) : super.dirty(value);

  @override
  EmailValidationError? validator(String value) {
    if (!NonEmptyStringValidator().isValid(value)) {
      return EmailValidationError.empty;
    }

    if (!MinLengthStringValidator(4).isValid(value)) {
      return EmailValidationError.short;
    }

    if (!EmailRegexValidator().isValid(value)) {
      return EmailValidationError.invalid;
    }

    return null;
  }
}
