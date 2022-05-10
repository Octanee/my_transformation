import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:my_transformation/src/exception/authentication/authentication.dart';
import 'package:my_transformation/src/input/input.dart';
import 'package:my_transformation/src/repository/authentication.dart';
import 'package:my_transformation/src/repository/repository.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final AuthenticationRepository _authenticationRepository;

  SignUpCubit({required AuthenticationRepository authenticationRepository})
      : _authenticationRepository = authenticationRepository,
        super(const SignUpState());

  void emailChanged({required String value}) {
    final email = Email.dirty(value);
    emit(
      state.copyWith(
        email: email,
        status: Formz.validate(
          [
            email,
            state.password,
            state.confirmedPassword,
          ],
        ),
      ),
    );
  }

  void passwordChanged({required String value}) {
    final password = Password.dirty(value);
    final confirmedPassword = ConfirmedPassword.dirty(
      password: password.value,
      value: state.confirmedPassword.value,
    );

    emit(
      state.copyWith(
        password: password,
        confirmedPassword: confirmedPassword,
        status: Formz.validate(
          [
            state.email,
            password,
            confirmedPassword,
          ],
        ),
      ),
    );
  }

  void confirmedPasswordChanged({required String value}) {
    final confirmedPassword = ConfirmedPassword.dirty(
      password: state.password.value,
      value: value,
    );

    emit(
      state.copyWith(
        confirmedPassword: confirmedPassword,
        status: Formz.validate(
          [
            state.email,
            state.password,
            confirmedPassword,
          ],
        ),
      ),
    );
  }

  Future<bool> signUp() async {
    if (!state.status.isValidated) return false;
    emit(state.copyWith(status: FormzStatus.submissionInProgress));

    try {
      final userId = await _authenticationRepository.signUp(
        email: state.email.value,
        password: state.password.value,
      );

      if (userId != null) DatabaseRepository(id: userId).createUserData();

      emit(state.copyWith(status: FormzStatus.submissionSuccess));
      return true;
    } on SignUpWithEmailAndPasswordException catch (e) {
      emit(
        state.copyWith(
          errorMessage: e.message,
          status: FormzStatus.submissionFailure,
        ),
      );
    } catch (_) {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
    return false;
  }
}
