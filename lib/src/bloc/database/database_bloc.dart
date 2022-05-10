import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_transformation/src/models/models.dart';
import 'package:my_transformation/src/repository/repository.dart';

part 'database_event.dart';
part 'database_state.dart';

class DatabaseBloc extends Bloc<DatabaseEvent, DatabaseState> {
  final DatabaseRepository _databaseRepository;
  late final StreamSubscription<UserData> _userDataSubscription;

  DatabaseBloc({
    required DatabaseRepository databaseRepository,
  })  : _databaseRepository = databaseRepository,
        super(const DatabaseState.loading()) {
    on<UserDataChanged>(_onUserDataChanged);

    _userDataSubscription = _databaseRepository.userData.listen(
      (userData) => add(
        UserDataChanged(userData: userData),
      ),
    );
  }

  void _onUserDataChanged(
    UserDataChanged event,
    Emitter<DatabaseState> emit,
  ) {
    emit(DatabaseState.loaded(userData: event.userData));
  }

  @override
  Future<void> close() {
    _userDataSubscription.cancel();
    return super.close();
  }
}
