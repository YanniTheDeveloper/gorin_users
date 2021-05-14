import 'package:gorin_users/domain/repositories/auth_repository.dart';
import 'package:meta/meta.dart';

class GetUserId {
  final AuthRepository _authRepository;
  GetUserId(this._authRepository);

  Future<String> execute() => _authRepository.getUserId();
}
