part of 'users_bloc.dart';

abstract class UsersEvent extends Equatable {
  const UsersEvent();
  @override
  List<Object> get props => [];
}

class LoadUsers extends UsersEvent {
}
class _UpdateUsersState extends UsersEvent {
  final UsersState usersState;

  _UpdateUsersState(this.usersState);
  @override
  List<Object> get props => [usersState];
}