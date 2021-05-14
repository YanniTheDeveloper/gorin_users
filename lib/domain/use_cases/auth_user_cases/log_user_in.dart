import 'package:gorin_users/domain/repositories/auth_repository.dart';
import 'package:meta/meta.dart';

class LogUserIn {
  final AuthRepository _authRepository;
  LogUserIn(this._authRepository);

  Future<String> execute(
          {@required String email, @required String password}) =>
      _authRepository.loginUser(email: email, password: password);
}
