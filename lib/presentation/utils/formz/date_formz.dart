import 'package:formz/formz.dart';
import 'package:neofit_app/presentation/utils/string_validator.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

enum DateValidationError {
  empty,
  invalid,
}

extension DateValidationErrorX on DateValidationError {
  String message(AppLocalizations loc) {
    switch (this) {
      case DateValidationError.empty:
        return loc.dateCantBeEmpty;
      case DateValidationError.invalid:
        return loc.invalidDate;
    }
  }
}

class DateFormz extends FormzInput<String, DateValidationError> {
  const DateFormz.pure() : super.pure("");

  const DateFormz.dirty(String value) : super.dirty(value);

  @override
  DateValidationError? validator(String value) {
    if (!NonEmptyStringValidator().isValid(value)) {
      return DateValidationError.empty;
    }

    if (!DateRegexValidator().isValid(value)) {
      return DateValidationError.invalid;
    }

    return null;
  }
}
