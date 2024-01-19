import 'package:formz/formz.dart';
import 'package:neofit_app/presentation/utils/string_validator.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

enum PasswordValidationError {
  empty,
  short,
  invalid,
}

extension PasswordValidationErrorX on PasswordValidationError {
  String message(AppLocalizations loc) {
    switch (this) {
      case PasswordValidationError.empty:
        return loc.passwordCantBeEmpty;
      case PasswordValidationError.short:
        return loc.passwordIsTooShort;
      case PasswordValidationError.invalid:
        return loc.invalidPassword;
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
