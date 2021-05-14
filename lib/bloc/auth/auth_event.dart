part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
  @override
  List<Object> get props => [];
}

class AppStarted extends AuthEvent {
}

class LogInRequest extends AuthEvent {
  final String email;
  final String password;

  LogInRequest(this.email, this.password);

  @override
  List<Object> get props => [email, password];
}

class RegisterRequest extends AuthEvent {
  final UserEntity userEntity;
  final String password;

  RegisterRequest(this.userEntity, this.password);

  @override
  List<Object> get props => [userEntity, password];
}
class LogOutRequest extends AuthEvent {}
