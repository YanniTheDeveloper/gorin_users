import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gorin_users/domain/repositories/auth_repository.dart';
import 'package:gorin_users/domain/repositories/user_repository.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;

  AuthBloc({@required AuthRepository authRepository})
      : assert(authRepository != null),
        _authRepository = authRepository,
        super(AppLoading());

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    if (event is AppStarted) {
      yield* _mapAppStartedToState();
    }
  }

  Stream<AuthState> _mapAppStartedToState() async* {
    try {
      final userId = await _authRepository.getUserId();
      if (userId!=null) {
        yield Authenticated(userId);
      }
      yield Unauthenticated();
    } catch (_) {
      yield Unauthenticated();
    }
  }
}
