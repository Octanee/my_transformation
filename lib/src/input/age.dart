import 'package:formz/formz.dart';

enum AgeValidationError { invalid }

class Age extends FormzInput<int, AgeValidationError> {
  const Age.pure() : super.pure(0);

  const Age.dirty([int value = 0]) : super.dirty(value);

  @override
  AgeValidationError? validator(int? value) {
    if (value == null) return AgeValidationError.invalid;
    return value >= 18 && value < 123 ? null : AgeValidationError.invalid;
  }
}
