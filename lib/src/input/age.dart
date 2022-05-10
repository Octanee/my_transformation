import 'package:formz/formz.dart';

enum AgeValidationError { invalid }

class Age extends FormzInput<int, AgeValidationError> {
  const Age.pure() : super.pure(18);

  const Age.dirty([int value = 18]) : super.dirty(value);

  @override
  AgeValidationError? validator(int? value) {
    if (value == null) return AgeValidationError.invalid;
    return value >= 18 ? null : AgeValidationError.invalid;
  }
}
