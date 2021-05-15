import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:gorin_users/domain/entities/user_entity.dart';
import 'package:gorin_users/domain/repositories/user_repository.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:gorin_users/domain/use_cases/user_use_cases/get_users.dart';

part 'users_event.dart';
part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  final GetUsers _getUsers;

  UsersBloc({@required UserRepository userRepository})
      : assert(userRepository != null),
        _getUsers = GetUsers(userRepository),
        super(UsersInitial());

  StreamSubscription _getUsersStream;
  @override
  Stream<UsersState> mapEventToState(
    UsersEvent event,
  ) async* {
    if (event is LoadUsers) {
      yield* mapLoadUsersToState();
    }
  }

  Stream<UsersState> mapLoadUsersToState() async* {
    try {
      yield UsersLoading();
      _getUsersStream?.cancel();
      _getUsersStream = _getUsers.execute().listen((users) {
        users.isEmpty
            ? updateUsersState(UsersEmpty())
            : updateUsersState(UsersLoaded(users));
      }, onError: (err) => updateUsersState(FailedToLoad()));
    } catch (_) {
      yield FailedToLoad();
    }
  }

  Stream<UsersState> updateUsersState(UsersState state) async* {
    yield state;
  }

  @override
  Future<Function> close() {
    _getUsersStream.cancel();
  }
}
