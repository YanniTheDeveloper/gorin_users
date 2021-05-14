import 'package:gorin_users/domain/entities/user_entity.dart';
import 'package:meta/meta.dart';

abstract class UserRepository {
  Stream<List<UserEntity>> getUsers();
  Future<void> createUser({@required UserEntity userEntity});
}
