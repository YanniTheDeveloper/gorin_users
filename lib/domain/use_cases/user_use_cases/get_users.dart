import 'package:gorin_users/domain/entities/user_entity.dart';
import 'package:gorin_users/domain/repositories/user_repository.dart';
import 'package:meta/meta.dart';

class GetUsers {
  final UserRepository _userRepository;
  GetUsers(this._userRepository);

  Stream<List<UserEntity>> execute() => _userRepository.getUsers();
}
