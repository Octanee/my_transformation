import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_transformation/src/models/models.dart';
import 'package:my_transformation/src/repository/authentication.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthenticationRepository _authenticationRepository;
  late final StreamSubscription<User> _userSubscription;

  AuthBloc({
    required AuthenticationRepository authenticationRepository,
  })  : _authenticationRepository = authenticationRepository,
        super(
          authenticationRepository.currentUser.isNotEmpty
              ? AuthState.authenticated(
                  user: authenticationRepository.currentUser)
              : const AuthState.unauthenticated(),
        ) {
    on<UserChanged>(_onUserChanged);
    on<LogoutRequested>(_onLogoutRequested);

    _userSubscription = _authenticationRepository.user.listen(
      (user) => add(
        UserChanged(user: user),
      ),
    );
  }

  void _onUserChanged(UserChanged event, Emitter<AuthState> emit) {
    emit(
      event.user.isNotEmpty
          ? AuthState.authenticated(user: event.user)
          : const AuthState.unauthenticated(),
    );
  }

  void _onLogoutRequested(LogoutRequested event, Emitter<AuthState> emit) {
    unawaited(_authenticationRepository.logOut());
  }

  @override
  Future<void> close() {
    _userSubscription.cancel();
    return super.close();
  }
}
