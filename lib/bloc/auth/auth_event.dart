part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
  @override
  List<Object> get props => [];
}

class AppStarted extends AuthEvent {
}

class LogInRequest extends AuthEvent {
  final CredentialEntity credentialEntity;

  LogInRequest(this.credentialEntity);

  @override
  List<Object> get props => [credentialEntity];
}

class RegisterRequest extends AuthEvent {
  final UserEntity userEntity;
  final String password;

  RegisterRequest(this.userEntity, this.password);

  @override
  List<Object> get props => [userEntity, password];
}
class LogOutRequest extends AuthEvent {}
