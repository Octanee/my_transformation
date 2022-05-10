part of 'onboarding_cubit.dart';

enum OnboardingStatus {
  welcome,
  userData,
  usage,
  complete,
}

class OnboardingState extends Equatable {
  final Name name;
  final Age age;
  final FormzStatus status;
  final String? errorMessage;

  const OnboardingState({
    this.name = const Name.pure(),
    this.age = const Age.pure(),
    this.status = FormzStatus.pure,
    this.errorMessage,
  });

  @override
  List<Object?> get props => [
        name,
        age,
        status,
        errorMessage,
      ];

  OnboardingState copyWith({
    Name? name,
    Age? age,
    FormzStatus? status,
    String? errorMessage,
  }) {
    return OnboardingState(
      name: name ?? this.name,
      age: age ?? this.age,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
