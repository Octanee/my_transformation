import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:my_transformation/src/input/input.dart';
import 'package:my_transformation/src/models/models.dart';
import 'package:my_transformation/src/repository/repository.dart';

part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  final DatabaseRepository _databaseRepository;
  OnboardingCubit({required DatabaseRepository databaseRepository})
      : _databaseRepository = databaseRepository,
        super(const OnboardingState());

  void nameChanged({required String value}) {
    final name = Name.dirty(value);
    emit(
      state.copyWith(
        name: name,
        status: Formz.validate(
          [name, state.age],
        ),
      ),
    );
  }

  void ageChanged({required int value}) {
    final age = Age.dirty(value);
    emit(
      state.copyWith(
        age: age,
        status: Formz.validate(
          [state.name, age],
        ),
      ),
    );
  }

  Future<void> completeOnboarding() async {
    if (!state.status.isValidated) return;

    emit(state.copyWith(status: FormzStatus.submissionInProgress));

    final userData = UserData(
      isNew: false,
      age: state.age.value,
      name: state.name.value,
    );

    await _databaseRepository.updateUserData(userData: userData);

    //emit(state.copyWith(status: FormzStatus.submissionSuccess));
  }
}
