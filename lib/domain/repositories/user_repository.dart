import 'package:gorin_users/domain/entities/user_entity.dart';

abstract class UserRepository {
  Stream<List<UserEntity>> getUsers();
  Future<void> createUser(UserEntity user);
}
