import 'package:gorin_users/domain/entities/user_entity.dart';
import 'package:gorin_users/domain/repositories/user_repository.dart';
import 'package:meta/meta.dart';

class CreateUser {
  final UserRepository _userRepository;
  CreateUser(this._userRepository);

  Future<void> execute(
      {@required UserEntity userEntity}) =>
      _userRepository.createUser(userEntity: userEntity);
}
