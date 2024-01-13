import 'package:formz/formz.dart';
import 'package:neofit_app/presentation/utils/string_validator.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

enum UsernameValidationError {
  empty,
  short,
  invalid,
}

extension UsernameValidationErrorX on UsernameValidationError {
  String message(AppLocalizations loc) {
    switch (this) {
      case UsernameValidationError.empty:
        return loc.usernameCantBeEmpty;
      case UsernameValidationError.short:
        return loc.usernameIsTooShort;
      case UsernameValidationError.invalid:
        return loc.invalidUsername;
    }
  }
}

class UsernameFormz extends FormzInput<String, UsernameValidationError> {
  const UsernameFormz.pure() : super.pure("");

  const UsernameFormz.dirty(String value) : super.dirty(value);

  @override
  UsernameValidationError? validator(String value) {
    if (!NonEmptyStringValidator().isValid(value)) {
      return UsernameValidationError.empty;
    }

    if (!UsernameRegexValidator().isValid(value)) {
      return UsernameValidationError.invalid;
    }

    if (!MinLengthStringValidator(4).isValid(value)) {
      return UsernameValidationError.short;
    }

    return null;
  }
}
