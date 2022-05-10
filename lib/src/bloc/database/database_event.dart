part of 'database_bloc.dart';

abstract class DatabaseEvent extends Equatable {
  const DatabaseEvent();

  @override
  List<Object> get props => [];
}

class UserDataChanged extends DatabaseEvent {
  final UserData userData;

  const UserDataChanged({required this.userData});

  @override
  List<Object> get props => [userData];
}
