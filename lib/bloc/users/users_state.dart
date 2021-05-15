part of 'users_bloc.dart';

abstract class UsersState extends Equatable {
  const UsersState();
  @override
  List<Object> get props => [];
}

class UsersInitial extends UsersState {}

class UsersLoading extends UsersState {}

class UsersEmpty extends UsersState {}

class UsersLoaded extends UsersState {
  final List<UserEntity> users;

  const UsersLoaded(this.users);

  @override
  List<Object> get props => [users];

  @override
  String toString() => 'UsersLoaded => users length: ${users.length}';
}

class FailedToLoad extends UsersState {}
