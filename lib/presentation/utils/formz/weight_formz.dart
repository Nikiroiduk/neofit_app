import 'package:formz/formz.dart';
import 'package:neofit_app/presentation/utils/string_validator.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

enum WeightValidationError {
  empty,
  invalid,
}

extension WeightValidationErrorX on WeightValidationError {
  String message(AppLocalizations loc) {
    switch (this) {
      case WeightValidationError.empty:
        return loc.weightCantBeEmpty;
      case WeightValidationError.invalid:
        return loc.invalidWeight;
    }
  }
}

class WeightFormz extends FormzInput<String, WeightValidationError> {
  const WeightFormz.pure() : super.pure("");

  const WeightFormz.dirty(String value) : super.dirty(value);

  @override
  WeightValidationError? validator(String value) {
    if (!NonEmptyStringValidator().isValid(value)) {
      return WeightValidationError.empty;
    }

    if (!WeightRegexValidator().isValid(value)) {
      return WeightValidationError.invalid;
    }

    return null;
  }
}
