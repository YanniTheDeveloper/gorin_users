import 'package:gorin_users/domain/repositories/auth_repository.dart';
import 'package:meta/meta.dart';

class RegisterUser {
  final AuthRepository _authRepository;
  RegisterUser(this._authRepository);

  Future<String> execute(
          {@required String email, @required String password}) =>
      _authRepository.registerUser(email: email, password: password);
}
