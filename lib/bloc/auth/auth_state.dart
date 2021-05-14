part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AppLoading extends AuthState {
}

class Authenticated extends AuthState {
  final String userId;

  const Authenticated(this.userId);

  @override
  List<Object> get props => [userId];

  @override
  String toString() => 'Authenticated => userId: $userId';
}

class Unauthenticated extends AuthState {}
