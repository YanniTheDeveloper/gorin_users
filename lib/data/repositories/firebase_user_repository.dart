import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gorin_users/data/models/user_model.dart';
import 'package:gorin_users/domain/entities/user_entity.dart';
import 'package:gorin_users/domain/repositories/user_repository.dart';

class FirebaseUserRepository implements UserRepository {
  CollectionReference usersRef = FirebaseFirestore.instance.collection("users");

  @override
  Future<void> createUser(UserEntity user) async =>
      usersRef.add((UserModel.fromEntity(user).toJson()));

  @override
  Stream<List<UserEntity>> getUsers() =>
      usersRef.snapshots().map((usersSnapshot) => usersSnapshot.docs
          .map((user) => UserModel.fromJson(user.data()))
          .toList());
}
