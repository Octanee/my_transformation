part of 'database_bloc.dart';

enum DatabaseStatus {
  loading,
  loaded,
}

class DatabaseState extends Equatable {
  final DatabaseStatus status;
  final UserData userData;

  const DatabaseState._({
    required this.status,
    this.userData = UserData.empty,
  });

  const DatabaseState.loading()
      : this._(
          status: DatabaseStatus.loading,
        );

  const DatabaseState.loaded({required UserData userData})
      : this._(
          status: DatabaseStatus.loaded,
          userData: userData,
        );

  @override
  List<Object> get props => [status, userData];
}
