import 'package:formz/formz.dart';
import 'package:neofit_app/presentation/utils/string_validator.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

enum HeightValidationError {
  empty,
  invalid,
}

extension HeightValidationErrorX on HeightValidationError {
  String message(AppLocalizations loc) {
    switch (this) {
      case HeightValidationError.empty:
        return loc.heightCantBeEmpty;
      case HeightValidationError.invalid:
        return loc.invalidHeight;
    }
  }
}

class HeightFormz extends FormzInput<String, HeightValidationError> {
  const HeightFormz.pure() : super.pure("");

  const HeightFormz.dirty(String value) : super.dirty(value);

  @override
  HeightValidationError? validator(String value) {
    if (!NonEmptyStringValidator().isValid(value)) {
      return HeightValidationError.empty;
    }

    if (!HeightRegexValidator().isValid(value)) {
      return HeightValidationError.invalid;
    }

    return null;
  }
}
