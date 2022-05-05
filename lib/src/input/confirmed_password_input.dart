import 'package:formz/formz.dart';

enum ConfirmedPasswordValidationError { invalid }

class ConfirmedPasswordInput
    extends FormzInput<String, ConfirmedPasswordValidationError> {
  final String password;

  const ConfirmedPasswordInput.pure({this.password = ''}) : super.pure('');

  const ConfirmedPasswordInput.dirty(
      {required this.password, String value = ''})
      : super.dirty(value);

  @override
  ConfirmedPasswordValidationError? validator(String? value) {
    return password == value ? null : ConfirmedPasswordValidationError.invalid;
  }
}
