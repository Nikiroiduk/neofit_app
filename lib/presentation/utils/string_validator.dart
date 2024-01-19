abstract class StringValidator {
  bool isValid(String value);
}

class RegexValidator implements StringValidator {
  RegexValidator({required this.regexSource});

  final String regexSource;

  @override
  bool isValid(String value) {
    try {
      final RegExp regex = RegExp(regexSource);
      final Iterable<Match> matches = regex.allMatches(value);

      for (final match in matches) {
        if (match.start == 0 && match.end == value.length) {
          return true;
        }
      }
      return false;
    } catch (e) {
      assert(false, e.toString());
      return true;
    }
  }
}

class EmailRegexValidator extends RegexValidator {
  EmailRegexValidator()
      : super(
            regexSource: r'(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)');
}

class PasswordRegexValidator extends RegexValidator {
  PasswordRegexValidator()
      : super(
            regexSource:
                r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*();:,."-_/#?&])[A-Za-z\d@$!%*();:,."-_/#?&]{8,30}$');
}

class UsernameRegexValidator extends RegexValidator {
  UsernameRegexValidator()
      : super(regexSource: r'^[a-zA-Z_][a-zA-Z0-9_]{0,29}$');
}

class DateRegexValidator extends RegexValidator {
  DateRegexValidator() : super(regexSource: r'[0-9]{2}\D[0-9]{2}\D[0-9]{4}');
}

class HeightRegexValidator extends RegexValidator {
  HeightRegexValidator() : super(regexSource: r"[0-9]{2,3}|[0-9]['][0-9]{1,2}");
}

class WeightRegexValidator extends RegexValidator {
  WeightRegexValidator() : super(regexSource: r'[0-9]{2,3}');
}

class NonEmptyStringValidator extends StringValidator {
  @override
  bool isValid(String? value) {
    if (value == null) return false;
    return value.isNotEmpty;
  }
}

class MinLengthStringValidator extends StringValidator {
  MinLengthStringValidator(this.minValueLength);
  final int minValueLength;

  @override
  bool isValid(String value) {
    return value.length >= minValueLength;
  }
}