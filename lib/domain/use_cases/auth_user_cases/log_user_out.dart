import 'package:gorin_users/domain/repositories/auth_repository.dart';

class LogUserOut {
  final AuthRepository _authRepository;
  LogUserOut(this._authRepository);

  Future<void> execute() => _authRepository.logoutUser();
}
