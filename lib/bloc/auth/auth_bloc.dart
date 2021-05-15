import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gorin_users/domain/entities/credential_entity.dart';
import 'package:gorin_users/domain/entities/user_entity.dart';
import 'package:gorin_users/domain/repositories/auth_repository.dart';
import 'package:gorin_users/domain/repositories/storage_repository.dart';
import 'package:gorin_users/domain/repositories/user_repository.dart';
import 'package:gorin_users/domain/use_cases/auth_user_cases/log_user_in.dart';
import 'package:gorin_users/domain/use_cases/auth_user_cases/log_user_out.dart';
import 'package:gorin_users/domain/use_cases/auth_user_cases/register_user.dart';
import 'package:gorin_users/domain/use_cases/storage_use_cases/upload_file.dart';
import 'package:gorin_users/domain/use_cases/user_use_cases/create_user.dart';
import 'package:gorin_users/domain/use_cases/user_use_cases/get_user_id.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final GetUserId _getUserId;
  final RegisterUser _registerUser;
  final LogUserIn _logUserIn;
  final LogUserOut _logUserOut;
  final CreateUser _createUser;
  final UploadFile _uploadFile;

  AuthBloc(
      {@required AuthRepository authRepository,
      @required UserRepository userRepository,
      @required StorageRepository storageRepository})
      : assert(authRepository != null),
        _getUserId = GetUserId(authRepository),
        _registerUser = RegisterUser(authRepository),
        _logUserIn = LogUserIn(authRepository),
        _logUserOut = LogUserOut(authRepository),
        assert(userRepository != null),
        _createUser = CreateUser(userRepository),
        assert(storageRepository != null),
        _uploadFile = UploadFile(storageRepository),
        super(AppLoading());

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    if (event is AppStarted) {
      yield* _mapAppStartedToState();
    } else if (event is LogInRequest) {
      yield* _mapLogInRequestToState(event.credentialEntity);
    } else if (event is RegisterRequest) {
      yield* _mapRegisterRequestToState(
          event.image, event.userEntity, event.password);
    } else if (event is LogOutRequest) {
      yield* _mapLogOutRequestToState();
    }
  }

  Stream<AuthState> _mapAppStartedToState() async* {
    try {
      final userId = await _getUserId.execute();
      if (userId != null) {
        yield Authenticated(userId);
      } else
        yield Unauthenticated();
    } catch (_) {
      yield Unauthenticated();
    }
  }

  Stream<AuthState> _mapLogInRequestToState(
      CredentialEntity credentialEntity) async* {
    yield Authenticating();
    final userId = await _logUserIn.execute(
        email: credentialEntity.email, password: credentialEntity.password);
    if (userId != null) {
      yield Authenticated(userId);
    } else
      yield FailedToAuthenticate();
  }

  Stream<AuthState> _mapRegisterRequestToState(
      File image, UserEntity userEntity, String password) async* {
    yield Authenticating();
    final imageUrl = await _uploadFile.execute(
        file: image, userName: userEntity.name, extension: "png");
    if (imageUrl != null) {
      userEntity.imageUrl = imageUrl;
      final userId = await _registerUser.execute(
          email: userEntity.email, password: password);
      if (userId != null) {
        await _createUser.execute(userEntity: userEntity..id = userId);
        yield Authenticated(userId);
      } else
        yield FailedToAuthenticate();
    } else {
      yield FailedToAuthenticate();
    }
  }

  Stream<AuthState> _mapLogOutRequestToState() async* {
    await _logUserOut.execute();
    yield Unauthenticated();
  }
}
